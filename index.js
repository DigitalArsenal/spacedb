import initializeDatabase from './src/db.js';
import { generateDatabase } from './src/tablegen.js';
import schemas from 'spacedatastandards.org/lib/json/index.json' assert { type: 'json' };
import packageJSON from 'spacedatastandards.org/package.json' assert { type: 'json' };
import fs from 'fs';
import path from 'path';

const { STANDARDS } = schemas;

async function startServer() {
    const sqlFilePath = path.resolve(`./sql/${packageJSON.version}.sql`);

    if (!fs.existsSync(sqlFilePath)) {
        try {
            await generateDatabase(Object.values(STANDARDS), sqlFilePath);
            console.log('Database schema generated successfully.');
        } catch (err) {
            console.error('Error generating database schema:', err);
            process.exit(1);
        }
    } else {
        console.log('SQL file already exists, skipping generation.');
    }

    // Initialize the database
    const db = await initializeDatabase();
    console.log(db);
    // Your server logic here, e.g., setting up routes, etc.
}

startServer();