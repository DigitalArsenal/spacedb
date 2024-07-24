import knex from 'knex';

// Hardcoded values for the test database
const dbClient = 'mysql2';
const config = {
    client: dbClient,
    connection: {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'testdb',
    },
};

const db = knex(config);

async function waitForMySQL() {
    const retries = 15;
    const delay = 5000; // 3 seconds

    for (let i = 0; i < retries; i++) {
        try {
            await db.raw('SELECT 1');
            console.log('MySQL is ready');
            await db.destroy();
            return;
        } catch (err) {
            console.log(`MySQL not ready, retrying in ${delay / 1000} seconds...`);
            await new Promise((resolve) => setTimeout(resolve, delay));
        }
    }
    throw new Error('MySQL not ready after multiple attempts');
}

waitForMySQL().catch((err) => {
    console.error(err);
    process.exit(1);
});