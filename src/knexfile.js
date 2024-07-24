import dotenv from 'dotenv';
dotenv.config();

const environment = process.env.NODE_ENV || 'development';
const validClients = ['better-sqlite3', 'mysql', 'mysql2', 'pg', 'pg-native', 'cockroachdb', 'redshift', 'oracledb', 'mssql'];
const dbClient = process.env.DB_CLIENT || 'better-sqlite3';

if (!validClients.includes(dbClient)) {
    throw new Error(`Invalid DB_CLIENT: ${dbClient}. Valid options are ${validClients.join(', ')}`);
}

const config = {
    client: dbClient,
    connection: dbClient === 'mysql' || dbClient === 'mysql2' || dbClient === 'pg' || dbClient === 'pg-native' || dbClient === 'cockroachdb' || dbClient === 'redshift' || dbClient === 'oracledb' || dbClient === 'mssql' ? {
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'spaceaware'
    } : {
        filename: process.env.DB_FILENAME || 'space-db'
    },
    useNullAsDefault: dbClient === 'better-sqlite3'
};

const knexConfig = {
    [environment]: config
};

export default knexConfig;