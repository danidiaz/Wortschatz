# How to run

Before running the server for the first time:

    sqlite3 db.sqlite < schema.sql
    sqlite3 db.sqlite 

# Links

## Sqlite

- [sqlite text encoding](https://sqlite.org/forum/forumpost/19a55c4b13d0725d). [more](https://sqlite.org/forum/info/81664396e46b915c).

- [strict tables](https://www.sqlite.org/stricttables.html)

- [ROWIDs and the INTEGER PRIMARY KEY](https://www.sqlite.org/lang_createtable.html#rowid). [autoincrement](https://www.sqlite.org/autoinc.html)

> With one exception noted below, if a rowid table has a primary key that consists of a single column and the declared type of that column is "INTEGER" in any mixture of upper and lower case, then the column becomes an alias for the rowid. Such a column is usually referred to as an "integer primary key". A PRIMARY KEY column only becomes an integer primary key if the declared type name is exactly "INTEGER". Other integer type names like "INT" or "BIGINT" or "SHORT INTEGER" or "UNSIGNED INTEGER" causes the primary key column to behave as an ordinary table column with integer affinity and a unique index, not as an alias for the rowid.

- [foreign keys](https://www.sqlite.org/foreignkeys.html)

- [Date And Time Functions](https://www.sqlite.org/lang_datefunc.html)

    ```
    sqlite> select unixepoch('now');                                                                                                                                           1743960558
    sqlite> select datetime(1743960449,'unixepoch');                                                                                                                           2025-04-06 17:27:29
    sqlite> select datetime(1743960449);

    sqlite>                                 
    ```

## Other

- [comments-project](https://github.com/danidiaz/comments-project)

