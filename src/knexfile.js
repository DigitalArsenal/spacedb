export default {
    development: {
        client: 'better-sqlite3',
        connection: {
            filename: 'space-db',
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'spaceaware'
        },
        useNullAsDefault: true
    }
};