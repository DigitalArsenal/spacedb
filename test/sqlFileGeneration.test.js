import { expect } from 'chai';
import { generateDatabaseSchema } from '../src/tablegen.js';
import { promises as fs } from 'fs';
import path from 'path';
import packageJSON from 'spacedatastandards.org/package.json' assert { type: 'json' };
import schemas from 'spacedatastandards.org/lib/json/index.json' assert { type: 'json' };
import knex from 'knex';

const { STANDARDS } = schemas;

describe('SQL File Generation', () => {
  afterEach(async () => {
    const dbClient = process.env.DB_CLIENT;

    if (dbClient === 'better-sqlite3') {
      const sqliteDb = knex({
        client: 'better-sqlite3',
        connection: {
          filename: process.env.DB_FILENAME
        },
        useNullAsDefault: true
      });
      await sqliteDb.destroy();
    } else if (['mysql', 'mysql2', 'pg', 'pg-native', 'cockroachdb', 'redshift', 'oracledb', 'mssql'].includes(dbClient)) {
      const db = knex({
        client: dbClient,
        connection: {
          host: process.env.DB_HOST,
          user: process.env.DB_USER,
          password: process.env.DB_PASSWORD,
          database: process.env.DB_NAME
        }
      });
      await db.raw(`DROP DATABASE IF EXISTS ${process.env.DB_NAME}`);
      await db.destroy();
    }
  });

  it('should generate the SQL string if it does not exist for SQLite', async () => {
    process.env.DB_CLIENT = 'better-sqlite3';
    process.env.DB_FILENAME = `./test_spacedatastandards_org_${packageJSON.version}.sqlite`;

    const sqlString = await generateDatabaseSchema(Object.values(STANDARDS));
    expect(sqlString).to.include('Generated From:');
    expect(sqlString).to.include('https://SpaceDataStandards.org');
    expect(sqlString).to.include('version:');
  });

  it('should generate the SQL string if it does not exist for MySQL', async () => {
    process.env.DB_CLIENT = 'mysql2';
    process.env.DB_HOST = 'localhost';
    process.env.DB_USER = 'root';
    process.env.DB_PASSWORD = '';
    process.env.DB_NAME = 'testdb';

    const sqlString = await generateDatabaseSchema(Object.values(STANDARDS));
    expect(sqlString).to.include('Generated From:');
    expect(sqlString).to.include('https://SpaceDataStandards.org');
    expect(sqlString).to.include('version:');
  });

  it('should throw an error for an invalid DB_CLIENT', async () => {
    process.env.DB_CLIENT = 'invalid-db-client';

    try {
      await generateDatabaseSchema(Object.values(STANDARDS));
    } catch (error) {
      expect(error.message).to.include('Invalid DB_CLIENT');
    }
  });
});
