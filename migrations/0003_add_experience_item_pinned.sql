-- Controls whether an achievement appears in the achievements section.
-- Defaults to 1 so all existing achievements remain visible.
ALTER TABLE experience_items ADD COLUMN pinned INTEGER NOT NULL DEFAULT 1;
