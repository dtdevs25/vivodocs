require('dotenv').config();
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL || 'postgresql://postgres:postgres@localhost:5432/vivodocs',
});

async function run() {
  try {
    console.log("Connecting to the database...");
    const sql = fs.readFileSync(path.join(__dirname, '../update_vivodocs_v2.sql'), 'utf-8');
    await pool.query(sql);
    console.log("Database updated successfully with the reconciliation data!");
  } catch (err) {
    console.error("Error executing SQL:", err);
  } finally {
    await pool.end();
  }
}

run();
