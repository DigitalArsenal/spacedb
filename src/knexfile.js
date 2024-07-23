import dotenv from 'dotenv';
dotenv.config();

const environment = process.env.NODE_ENV || 'development';

const config = {
    client: process.env.DB_CLIENT || 'better-sqlite3',
    connection: {
        filename: process.env.DB_FILENAME || 'space-db',
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'spaceaware'
    },
    useNullAsDefault: true
};

const knexConfig = {
    [environment]: config
};

export default knexConfig;