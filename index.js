import { generateDatabase } from './src/tablegen.js';
import schemas from "spacedatastandards.org/lib/json/index.json" assert {type: "json"};
import packageJSON from "spacedatastandards.org/package.json" assert {type: "json"};

const { STANDARDS } = schemas;

// Generate the database
generateDatabase(Object.values(STANDARDS), `./sql/${packageJSON.version}.sql`)
    .then(() => {
        console.log('Database schema generated successfully.');
    })
    .catch(err => {
        console.error('Error generating database schema:', err);
    });