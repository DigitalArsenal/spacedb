import { expect } from 'chai';
import { generateData } from './utilities/data.generator.js';
import { promises as fs } from 'fs';
import path from 'path';
import { readFB } from '../src/flatbufferConversion.js';
import standardsJSON from 'spacedatastandards.org/lib/json/index.json' assert { type: 'json' };

const dataPath = path.resolve('./.temp');

describe('Data Generation and Verification', () => {
    before(async () => {
        await fs.mkdir(dataPath, { recursive: true });
    });

    after(async () => {
        const files = await fs.readdir(dataPath);
        for (const file of files) {
            await fs.unlink(path.join(dataPath, file));
        }
    });

    it('should generate flatbuffers and verify against JSON schemas', async () => {
        await generateData(10, 5, dataPath);

        const files = await fs.readdir(dataPath);
        for (const file of files) {
            const buffer = await fs.readFile(path.join(dataPath, file));
            const flatbuffer = readFB(buffer);

            const schemaName = file.split('.')[1].toUpperCase();
            const jsonSchema = standardsJSON[schemaName];

            const records = flatbuffer.RECORDS;
            for (const record of records) {
                for (const [key, value] of Object.entries(record)) {
                    if (jsonSchema.definitions[schemaName].properties[key]) {
                        const schemaProp = jsonSchema.definitions[schemaName].properties[key];
                        expect(value).to.be.a(schemaProp.type);
                    }
                }
            }
        }
    });

    it('should handle multiple flatbuffers appended together', async () => {
        await generateData(5, 2, dataPath);

        const files = await fs.readdir(dataPath);
        for (const file of files) {
            const buffer = await fs.readFile(path.join(dataPath, file));
            const flatbuffer = readFB(buffer);

            const schemaName = file.split('.')[1].toUpperCase();
            const jsonSchema = standardsJSON[schemaName];

            const records = flatbuffer.RECORDS;
            for (const record of records) {
                for (const [key, value] of Object.entries(record)) {
                    if (jsonSchema.definitions[schemaName].properties[key]) {
                        const schemaProp = jsonSchema.definitions[schemaName].properties[key];
                        expect(value).to.be.a(schemaProp.type);
                    }
                }
            }
        }
    });
});
