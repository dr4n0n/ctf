const Database = require('better-sqlite3');
const path = require('path');
const flag = require("./flag.js");

const dbPath = path.resolve(__dirname, 'santas-list.db');

const db = new Database(dbPath, { 
    verbose: console.log,
});

const createTableStmt = db.prepare(`
    CREATE TABLE IF NOT EXISTS santas_list (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        nice BOOLEAN NOT NULL,
        naughty BOOLEAN NOT NULL
    )
`);
createTableStmt.run();

function seedDatabase() {
    const flag_string = flag.readFlag();
    const seedData = [
        { first_name: 'nick', last_name: 'kringle', nice: true, naughty: false },
        { first_name: 'holly', last_name: 'wreath', nice: true, naughty: false },
        { first_name: 'jingle', last_name: 'bell', nice: true, naughty: false },
        { first_name: 'noelle', last_name: 'winterberry', nice: true, naughty: false },
        { first_name: 'buddy', last_name: 'elf', nice: true, naughty: false },
        { first_name: 'tinsel', last_name: 'sparkle', nice: true, naughty: false },
        { first_name: 'grinch', last_name: 'whoville', nice: false, naughty: true },
        { first_name: 'krampus', last_name: 'claus', nice: false, naughty: true },
        { first_name: 'ebenezer', last_name: 'scrooge', nice: false, naughty: true },
        { first_name: 'jack', last_name: 'frost', nice: false, naughty: true },
        { first_name: 'randolf', last_name: 'renegade', nice: false, naughty: true },
        { first_name: 'coal', last_name: 'stuffer', nice: false, naughty: true },
        { first_name: 'rudolph', last_name: 'reindeer', nice: true, naughty: true },
        { first_name: 'frosty', last_name: 'snowman', nice: true, naughty: true },
        { first_name: 'mrs', last_name: 'claus', nice: true, naughty: false },
        { first_name: 'alabaster', last_name: 'snowball', nice: true, naughty: false },
        { first_name: flag_string.slice(0,14), last_name: flag_string.slice(14), nice: true, naughty: false }
    ];

    flag.deleteFlag();


  const insertStmt = db.prepare(`
    INSERT OR IGNORE INTO santas_list (first_name, last_name, nice, naughty) 
    VALUES (@first_name, @last_name, @nice, @naughty)
  `);

  const insertMany = db.transaction((people) => {
    for (const person of people) {
      insertStmt.run({
        first_name: person.first_name,
        last_name: person.last_name,
        nice: person.nice ? 1 : 0,
        naughty: person.naughty ? 1 : 0
      });
    }
  });
  insertMany(seedData);
}

try {
  seedDatabase();
} catch (error) {
  console.log('Database already seeded or seeding error:', error);
}

function checkNiceStatus(firstName, lastName) {
  const stmt = db.prepare(`
    SELECT nice, naughty 
    FROM santas_list 
    WHERE first_name = ? AND last_name = ?
  `);

  const row = stmt.get(firstName, lastName);

  if (!row) {
    return {
      found: false,
      nice: null,
      naughty: null,
    };
  }

  return {
    found: true,
    nice: !!row.nice,
    naughty: !!row.naughty,
  };
}

function addToList(firstName, lastName, nice, naughty) {
  const stmt = db.prepare(`
    INSERT INTO santas_list (first_name, last_name, nice, naughty) 
    VALUES (?, ?, ?, ?)
  `);

  const info = stmt.run(
    firstName, 
    lastName, 
    nice ? 1 : 0, 
    naughty ? 1 : 0
  );

  return {
    nice,
    naughty
  };
}

function queryDb(query) {
  const stmt = db.prepare(query);
  return stmt.all();
}

function closeDatabase() {
  db.close();
}

module.exports = {
  checkNiceStatus,
  addToList,
  queryDb,
  closeDatabase
};
