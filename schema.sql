PRAGMA encoding = "UTF-8";
PRAGMA foreign_keys = ON;

CREATE TABLE word(
    word_id INTEGER NOT NULL,
    word TEXT NOT NULL,
    PRIMARY KEY(word_id ASC)
    ) 
    STRICT;

CREATE TABLE fragment(
    fragment_id INTEGER NOT NULL,
    fragment TEXT NOT NULL,
    PRIMARY KEY(fragment_id ASC)
    ) 
    STRICT;

CREATE TABLE occurrence(
    word_id INTEGER NOT NULL,
    fragment_id INTEGER NOT NULL,
    PRIMARY KEY(word_id, fragment_id),
    FOREIGN KEY(word_id) REFERENCES word(word_id) ON DELETE CASCADE,
    FOREIGN KEY(fragment_id) REFERENCES fragment(fragment_id) ON DELETE CASCADE
    ) 
    STRICT;

PRAGMA quick_check;
PRAGMA foreign_key_check;