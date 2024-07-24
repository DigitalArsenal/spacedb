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

### Getting Started

To run the tests for this project, you'll need to have Docker and Docker Compose installed on your system. Follow the instructions below to set up your environment and run the tests.

### Prerequisites

1. **Docker**: Docker is a platform that enables you to create, deploy, and run applications in containers. Install Docker by following the instructions for your operating system:

   - [Docker for Windows](https://docs.docker.com/desktop/windows/install/)
   - [Docker for Mac](https://docs.docker.com/desktop/mac/install/)
   - [Docker for Linux](https://docs.docker.com/engine/install/)

2. **Docker Compose**: Docker Compose is a tool for defining and running multi-container Docker applications. Install Docker Compose by following the instructions for your operating system:
   - Docker Compose is included with Docker Desktop for Windows and Mac.
   - For Linux, follow the installation instructions [here](https://docs.docker.com/compose/install/).

### Cloning the Repository

First, clone the repository to your local machine:

```sh
git clone <https://github.com/your-repo/your-project.git>
cd your-project
```

### Installing Node.js Dependencies

Install the required Node.js dependencies using npm:

```sh
npm install
```

### Running the Tests

The tests are configured to use a Docker container for MySQL. The test setup will automatically start and stop the Docker container as needed.

To run the tests, use the following command:

```sh
npm test
```

This command will:

1. Start a MySQL Docker container using Docker Compose.
2. Run the test suite.
3. Tear down the Docker container after the tests complete.

### Docker Compose Configuration

The Docker Compose configuration for the MySQL container is defined in `test/docker-compose.yml`:

```sh
version: '3.1'

services:
  mysqldb:
    build: .
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: ""
      MYSQL_DATABASE: "testdb"
```

### Dockerfile for MySQL Setup

The `test/Dockerfile` sets up the MySQL container:

```docker
# Dockerfile for MySQL
FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=
ENV MYSQL_DATABASE=testdb
EXPOSE 3306
```

### Running the Tests Manually

If you need to run the tests manually, you can start the MySQL container and then run the tests:

1. Start the MySQL container:

   ```sh
   docker-compose -f test/docker-compose.yml up -d
   ```

2. Run the tests:

   ```sh
   npm test
   ```

3. Tear down the MySQL container after the tests complete:

   ````sh
   docker-compose -f test/docker-compose.yml down
   ```sh
   ````

## License

This project is licensed under the terms of the [license](LICENSE.md) file included in this repository.

## Contact

[spacedb@digitalarsenal.io](mailto:spacedb@digitalarsenal.io)