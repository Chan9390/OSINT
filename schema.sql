CREATE TABLE documents (
  did INTEGER PRIMARY KEY autoincrement NOT NULL,
  total_word INTEGER,
  url text UNIQUE,
  path text
);

CREATE TABLE entity_types (
  type text UNIQUE
);

CREATE TABLE keywords (
  type text,
  keyword text UNIQUE,
  FOREIGN KEY(type) REFERENCES entity_type(type)
);

CREATE TABLE entities (
  eid INTEGER PRIMARY KEY autoincrement NOT NULL,
  did INTEGER,
  type text,
  entity text,
  FOREIGN KEY(did) REFERENCES documents(did),
  FOREIGN KEY(type) REFERENCES entity_type(type)
);