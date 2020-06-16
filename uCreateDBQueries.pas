unit uCreateDBQueries;

interface

const
  DB_CREATE_SYSTEM =
  'CREATE TABLE "System" (' +
    '"version"	INTEGER NOT NULL' +
  ')';

  DB_CREATE_PROJECTS =
  'CREATE TABLE "Projects" (' +
    '"id"	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,' +
    '"name"	TEXT NOT NULL,' +
    '"startDate"	INTEGER,' +
    '"deadlineDate"	INTEGER,' +
    '"endDate"	INTEGER,' +
    '"description"	INTEGER' +
  ')';

  DB_CREATE_CLIENTS =
  'CREATE TABLE "Clients" (' +
    '"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,' +
    '"name"	TEXT NOT NULL' +
  ')';


implementation

end.
