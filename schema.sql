PRAGMA encoding = "UTF-8";
PRAGMA foreign_keys = ON;

CREATE TABLE word(
    word_id INTEGER NOT NULL,
    word TEXT NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(word_id ASC)
    ) 
    STRICT;

-- A fragment must be in either a book or a kindle book or a youtube video, and only in one.
-- How to formalize this?
CREATE TABLE fragment(
    fragment_id INTEGER NOT NULL,
    fragment TEXT NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(fragment_id ASC)
    ) 
    STRICT;

CREATE TABLE occurrence(
    word_id INTEGER NOT NULL,
    fragment_id INTEGER NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(word_id, fragment_id),
    FOREIGN KEY(word_id) REFERENCES word(word_id) ON DELETE CASCADE,
    FOREIGN KEY(fragment_id) REFERENCES fragment(fragment_id) ON DELETE CASCADE
    ) 
    STRICT;

CREATE TABLE youtube(
    youtube_id INTEGER NOT NULL,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(youtube_id ASC),
    UNIQUE (url) ON CONFLICT ABORT 
    ) 
    STRICT;

CREATE TABLE youtube_location(
    youtube_id INTEGER NOT NULL,
    fragment_id INTEGER NOT NULL,
    second INTEGER NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(youtube_id,fragment_id,second)
    FOREIGN KEY(youtube_id) REFERENCES youtube(youtube_id) ON DELETE CASCADE,
    FOREIGN KEY(fragment_id) REFERENCES fragment(fragment_id) ON DELETE CASCADE
    ) 
    STRICT;

CREATE TABLE kindle(
    kindle_id INTEGER NOT NULL,
    asin TEXT NOT NULL,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(kindle_id ASC),
    UNIQUE (asin) ON CONFLICT ABORT 
    ) 
    STRICT;

CREATE TABLE kindle_location(
    kindle_id INTEGER NOT NULL,
    fragment_id INTEGER NOT NULL,
    location INTEGER NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(kindle_id,fragment_id,location)
    FOREIGN KEY(kindle_id) REFERENCES kindle(kindle_id) ON DELETE CASCADE,
    FOREIGN KEY(fragment_id) REFERENCES fragment(fragment_id) ON DELETE CASCADE
    ) 
    STRICT;

CREATE TABLE book(
    book_id INTEGER NOT NULL,
    -- Might be null
    isbn10 TEXT,
    isbn13 TEXT,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(book_id ASC),
    UNIQUE (isbn10) ON CONFLICT ABORT 
    UNIQUE (isbn13) ON CONFLICT ABORT 
    ) 
    STRICT;

CREATE TABLE book_location(
    book_id INTEGER NOT NULL,
    fragment_id INTEGER NOT NULL,
    page INTEGER NOT NULL,
    -- unixepoch
    created_at INTEGER NOT NULL,
    PRIMARY KEY(book_id,fragment_id,page),
    FOREIGN KEY(book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY(fragment_id) REFERENCES fragment(fragment_id) ON DELETE CASCADE
    ) 
    STRICT;

-- -- some kind of hash?
-- CREATE TABLE text(
--     text_id INTEGER NOT NULL,
--     -- Might be null
--     title TEXT NOT NULL,
--     PRIMARY KEY(text_id ASC),
--     ) 
--     STRICT;

PRAGMA quick_check;
PRAGMA foreign_key_check;
