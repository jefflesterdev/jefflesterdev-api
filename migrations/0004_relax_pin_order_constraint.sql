-- Remove the arbitrary cap of 5 on pin_order by recreating the table without it.
-- SQLite does not support ALTER TABLE to drop or modify CHECK constraints.

CREATE TABLE experience_items_new (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    experience_id INTEGER NOT NULL REFERENCES experience(id) ON DELETE CASCADE,
    type          TEXT NOT NULL CHECK(type IN ('responsibility', 'achievement')),
    title         TEXT,
    content       TEXT NOT NULL,
    pinned        INTEGER NOT NULL DEFAULT 1,
    is_pinned     INTEGER NOT NULL DEFAULT 0,
    pin_order     INTEGER,
    display_order INTEGER NOT NULL DEFAULT 0,
    created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

INSERT INTO experience_items_new
    (id, experience_id, type, title, content, pinned, is_pinned, pin_order, display_order, created_at)
SELECT id, experience_id, type, title, content, pinned, is_pinned, pin_order, display_order, created_at
FROM experience_items;

DROP TABLE experience_items;

ALTER TABLE experience_items_new RENAME TO experience_items;

CREATE INDEX idx_experience_items_pinned
    ON experience_items(is_pinned, pin_order);
