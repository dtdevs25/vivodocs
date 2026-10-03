const { Client } = require('pg');
const fs = require('fs');

const client = new Client({
  connectionString: process.env.DATABASE_URL || 'postgresql://postgres:a622e0d57488ec94@srv-captain--postgres:5432/db_vivodocs'
});

async function run() {
  try {
    await client.connect();
    const sql = fs.readFileSync('import_faturamento.sql', 'utf8');
    await client.query(sql);
    console.log("SQL executed successfully!");
  } catch (e) {
    console.error("Error executing SQL:", e);
  } finally {
    await client.end();
  }
}

run();
