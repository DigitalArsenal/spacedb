# SpaceDB

This application uses Knex.js for database management and can be configured to connect to different types of databases using environment variables. The application is containerized using Docker to ensure consistent deployment.

## Environment Variables

### `NODE_ENV`

Specifies the environment in which the application is running.

- `development` (default)
- `test`
- `production`

### `DB_CLIENT`

Specifies the database client to be used by Knex.js.

- `better-sqlite3` (default)
- `pg` (PostgreSQL)
- `mysql`
- `mysql2`
- `sqlite3`
- Any other supported Knex client

### `DB_FILENAME`

Specifies the filename for the SQLite database. Only used when `DB_CLIENT` is set to `better-sqlite3` or `sqlite3`.

- `space-db` (default)
- Any valid filename

### `DB_HOST`

Specifies the host of the database.

- `localhost` (default)
- Any valid hostname or IP address

### `DB_USER`

Specifies the username to connect to the database.

- `root` (default)
- Any valid database username

### `DB_PASSWORD`

Specifies the password to connect to the database.

- `` (default, empty string)
- Any valid database password

### `DB_NAME`

Specifies the name of the database.

- `spaceaware` (default)
- Any valid database name

## Getting Started
