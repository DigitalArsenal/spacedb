import { fTCheck, refRootName, resolver } from "../../src/tablegen.js";
import { writeFileSync } from "fs";
import standardsJSON from 'spacedatastandards.org/lib/json/index.json' assert { type: 'json' };
import * as standards from "spacedatastandards.org/lib/js/index.js";
import { faker } from '@faker-js/faker';
import { execSync } from "child_process";
import { writeFB } from "../../src/flatbufferConversion.js";
import { join } from "path";

import ipfsHash from "pure-ipfs-only-hash";

export const generateData = async (total = 10, numFiles = 5, dataPath = `test/output/data`, standardsToGenerate = Object.keys(standards)) => {
    if (!dataPath) return [];
    execSync(`rm -rf ${dataPath}/*.* && mkdir -p ${dataPath}`);

    const buildProp = (prop, propName) => {
        let { type, minimum: min, maximum: max } = prop;
        let fakerValue = null;

        if (type === "integer") {
            fakerValue = faker.number.int({ min, max });
        } else if (type === "number") {
            fakerValue = faker.number.float();
        } else if (type === "boolean") {
            fakerValue = faker.datatype.boolean();
        } else if (type === "string") {
            if (prop.enum) {
                fakerValue = faker.number.int({ min: 0, max: prop.enum.length - 1 });
            } else if (
                ~propName.indexOf("_DATE") ||
                ~propName.indexOf("EPOCH") ||
                propName.indexOf("TIME") > 0 ||
                ~propName.indexOf("TCA")
            ) {
                fakerValue = faker.date.anytime().toISOString();
            } else if (~propName.indexOf("ORIGINATOR") || ~propName.indexOf("MESSAGE_FOR")) {
                fakerValue = faker.company.name();
            } else if (~propName.indexOf("REF_FRAME")) {
                faker.helpers.arrayElement(["ICRF", "ITRF-93", "ITRF-97", "ITRF2000", "TOD", "EME2000", "TDR", "GRC"]);
            } else {
                fakerValue = faker.string.sample();
            }
        }
        return fakerValue;
    }

    const buildObject = (classProperties, parentClass, tableName, jsonSchema) => {
        let newObject = new parentClass[`${tableName}T`];

        for (let x in classProperties) {
            let resolvedProp = resolver(classProperties[x]?.items || classProperties[x], jsonSchema);
            if (!fTCheck(resolvedProp?.type)) {
                newObject[x] = buildProp(resolvedProp, x);
            } else if (resolvedProp?.type === "object" && classProperties[x]?.type !== "array") {
                newObject[x] = buildObject(resolvedProp.properties, parentClass, refRootName(resolvedProp.$$ref), jsonSchema);
            } else if (classProperties[x]?.type === "array") {
                newObject[x] = [];
                for (let i = 0; i < 2; i++) {
                    let aObject = !fTCheck(resolvedProp?.type) ?
                        buildProp(resolvedProp, x) :
                        buildObject(
                            resolvedProp?.items || resolvedProp.properties,
                            parentClass,
                            refRootName(resolvedProp.$$ref),
                            jsonSchema);
                    newObject[x].push(aObject);
                }
            }
        }

        return newObject;
    }

    for (let i = 0; i < numFiles; i++) {
        for (let standard in standards) {
            let currentStandard = standardsJSON.STANDARDS[standard];
            let tableName = refRootName(currentStandard.$ref);
            let pClassName = `${tableName}`;
            let parentClass = standards[pClassName];
            let cClassName = `${tableName}COLLECTIONT`;
            if (!tableName) {
                console.log(cClassName, ": " + parentClass[cClassName])
            }
            let input = new parentClass[cClassName];

            if (!~standardsToGenerate.indexOf(standard)) continue;

            for (let i = 0; i < total; i++) {
                let newObject = buildObject(currentStandard.definitions[tableName].properties, parentClass, tableName, currentStandard);
                input.RECORDS.push(newObject);
            }

            let resultBuffer = writeFB(input);
            let CID = await ipfsHash.of(resultBuffer);

            writeFileSync(join(dataPath, `${CID}.${standard.toLowerCase()}.fbs`), resultBuffer);
        };
    }
}
