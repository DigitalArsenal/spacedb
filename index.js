import { generateDatabase } from './src/tablegen.js';
import { readFileSync } from 'fs';
import path from 'path';
import schemas from "spacedatastandards.org/lib/json/index.json" assert {type: "json"};

const { STANDARDS } = schemas;

// Generate the database
generateDatabase(Object.values(STANDARDS), 'output.sql')
    .then(() => {
        console.log('Database schema generated successfully.');
    })
    .catch(err => {
        console.error('Error generating database schema:', err);
    });