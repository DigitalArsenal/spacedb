import { writeFileSync, existsSync } from "fs";
import { resolver } from "./resolver.js";
export { resolver };
import db from "./db.js";
import packageJSON from 'spacedatastandards.org/package.json' assert { type: 'json' };

const foreignTypes = ["object", "array", "union"];

/**
 * Check if the predicate is a foreign type.
 * @param {string} ftPredicate - The predicate to check.
 * @returns {boolean} - True if the predicate is a foreign type, false otherwise.
 */
export const fTCheck = (ftPredicate) => foreignTypes.indexOf(ftPredicate) !== -1;

/**
 * Get the root name from a $ref string.
 * @param {string} [$ref=""] - The $ref string.
 * @returns {string} - The root name.
 */
export const refRootName = ($ref = "") => $ref.split("/").pop();

let tSchema;

let finalJSON = {};
let foreignKeys = {};
let arrayParentReference = {};
let parentPredicates = {};
let tableExistsCheck = {};
const knexNumberTypes = {
    255: "tinyint",
    65535: "smallint",
    16777215: "mediumint",
    4294967295: "integer",
    18446744073709551615: "bigint",
};

/**
 * Build the schema for a given predicate.
 * @param {string} predicateName - The name of the predicate.
 * @param {Object} predicate - The predicate object.
 * @param {Object} jsonSchema - The JSON schema.
 * @param {string} rootPredicate - The root predicate name.
 * @param {string} parentPredicate - The parent predicate name.
 * @returns {Object} - The built predicate object.
 */
const builder = (predicateName, predicate, jsonSchema, rootPredicate, parentPredicate) => {
    let { type, $ref, $$ref, properties, items } = predicate;
    parentPredicates[refRootName($$ref)] = parentPredicate || rootPredicate;
    if ($ref) {
        return builder(
            predicateName,
            resolver(predicate, jsonSchema),
            jsonSchema,
            rootPredicate,
            parentPredicate
        );
    } else if (type === "object") {
        if (predicateName !== rootPredicate) {
            predicateName = refRootName($$ref);
        }
        finalJSON[rootPredicate][predicateName] = {
            ...predicate,
            rootPredicate
        };
        for (let prop in properties) {
            let pprop = builder(prop, properties[prop], jsonSchema, rootPredicate, predicateName);
            if (fTCheck(pprop.type)) {
                if (pprop.type === "object") {
                    foreignKeys[predicateName] = foreignKeys[predicateName] || {};
                    foreignKeys[predicateName][prop] = {
                        type: pprop.type,
                        tableName: refRootName(pprop.$$ref),
                    };
                } else {
                    let pTableName = refRootName(pprop.$$ref);
                    foreignKeys[pTableName] = foreignKeys[pTableName] || {};
                    foreignKeys[pTableName][predicateName] = {
                        type: pprop.type,
                        parentTable: predicateName
                    };
                }
            }
            finalJSON[rootPredicate][predicateName][prop] = pprop;
        }
        return { type, $ref, $$ref };
    } else if (type === "array") {
        let tableName = refRootName((predicate?.items)?.$ref);
        arrayParentReference[tableName] = parentPredicate;
        return builder(predicateName, { ...items }, jsonSchema, rootPredicate, parentPredicate);
    } else {
        return predicate;
    }
};

/**
 * Build the table schema in the database.
 * @param {string} rootTableName - The root table name.
 * @param {Object} tableSchema - The table schema.
 * @param {string} namespace - The namespace.
 */
const buildTable = (rootTableName, tableSchema, namespace) => {
    if (tableExistsCheck[rootTableName]) {
        return
    }
    tableExistsCheck[rootTableName] =
        tSchema.createTable(rootTableName, function (table) {
            if (rootTableName === namespace) {
                table.string("file_id");
                table.index("file_id");
            }
            table.integer("database_id").notNullable().unsigned().primary();
            table.index("database_id");
            table.timestamps(true, true);
            if (parentPredicates[rootTableName]) {
                const fProperty = `${parentPredicates[rootTableName]}_id`;
                table.integer(fProperty).unsigned();
                table.index(fProperty);
                table
                    .foreign(fProperty)
                    .references(`${parentPredicates[rootTableName]}.id`)
                    .onDelete("CASCADE");
            }
            for (let predicate in tableSchema) {
                if (predicate === "properties") continue;
                const _predicate = tableSchema[predicate];
                if (!_predicate) continue;
                const { type, minimum, maximum } = _predicate;
                if (~["integer", "number"].indexOf(type) || _predicate.enum) {
                    let numType = "double";
                    if (!isNaN(minimum) && !isNaN(maximum)) {
                        numType = knexNumberTypes[maximum - minimum];
                    }
                    let column = table[numType](predicate);
                    if (minimum === 0) {
                        column.unsigned();
                    }
                } else if (~["bool", "boolean"].indexOf(type)) {
                    table.boolean(predicate);
                } else if (type === "string") {
                    table.text(predicate);
                }
            }
            if (
                foreignKeys[rootTableName] &&
                Object.keys(foreignKeys[rootTableName]).length
            ) {
                for (let fProperty in foreignKeys[rootTableName]) {
                    let { type, tableName } = foreignKeys[rootTableName][fProperty];
                    if (type === "object"
                        && foreignKeys[rootTableName]
                        && !arrayParentReference[tableName]) {
                        table.integer(fProperty).unsigned();
                        table.index(fProperty);
                    }
                }
            }
        });
};

/**
 * Build the database schema for a given namespace.
 * @param {string} namespace - The namespace.
 */
const buildDatabase = async (namespace) => {
    const nJSONSchema = finalJSON[namespace];
    for (let rootPredicate in nJSONSchema) {
        buildTable(rootPredicate, nJSONSchema[rootPredicate], namespace);
    }
};

/**
 * Generate the database schema from JSON schemas.
 * @param {Object[]} jsonSchemas - The JSON schemas.
 * @param {string} [sqlFilename=""] - The SQL filename.
 * @param {string} [version="NO_VERSION_SPECIFIED"] - The version.
 * @returns {Promise<string>} - The generated SQL schema as a string.
 */
export async function generateDatabaseSchema(
    jsonSchemas,
    sqlFilename = ""
) {

    tSchema = db.schema;
    for (let j = 0; j < jsonSchemas.length; j++) {
        const jsonSchema = jsonSchemas[j];
        let { $ref, definitions } = jsonSchema;
        let rootType = refRootName($ref);

        for (let rootPredicate in definitions) {
            const prop = definitions[rootPredicate];
            if (rootPredicate === rootType) {
                finalJSON[rootPredicate] = {};
                foreignKeys[rootPredicate] = {};
                builder(rootPredicate, prop, jsonSchema, rootPredicate);
                buildDatabase(rootPredicate);
            }
        }
    }

    const finalSQL = `/*
Generated From: 
https://SpaceDataStandards.org 
version: ${packageJSON.version}
*/
` +
        tSchema
            .toString()
            .replaceAll(",", ",\n")
            .replaceAll(";", ";\n\n")
            .replaceAll("(", "(\n ");

    if (sqlFilename) {
        writeFileSync(sqlFilename, finalSQL);
    };

    return Promise.resolve(finalSQL);
};