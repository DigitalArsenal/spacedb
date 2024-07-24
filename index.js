import initializeDatabase from './src/db.js';
import { generateDatabase } from './src/tablegen.js';
import schemas from 'spacedatastandards.org/lib/json/index.json' assert { type: 'json' };
import packageJSON from 'spacedatastandards.org/package.json' assert { type: 'json' };

const { STANDARDS } = schemas;

async function startServer() {
    // Generate the database schema
    try {
        await generateDatabase(Object.values(STANDARDS), `./sql/${packageJSON.version}.sql`);
        console.log('Database schema generated successfully.');
    } catch (err) {
        console.error('Error generating database schema:', err);
        process.exit(1);
    }

    // Initialize the database
    const db = await initializeDatabase();
    console.log(db);
    // Your server logic here, e.g., setting up routes, etc.
}

startServer();
