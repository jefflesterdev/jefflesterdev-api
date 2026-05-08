-- Migration: 0001_initial_schema.sql

-- ============================================================
-- PROFILE
-- ============================================================
CREATE TABLE profile (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    tagline     TEXT,
    bio         TEXT,
    email       TEXT,
    linkedin_url TEXT,
    github_url  TEXT,
    location    TEXT,
    available   INTEGER NOT NULL DEFAULT 1, -- 1 = open to work
    photo_url   TEXT,
    updated_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================
-- EXPERIENCE
-- ============================================================
CREATE TABLE experience (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    company         TEXT NOT NULL,
    title           TEXT NOT NULL,
    location        TEXT,
    employment_type TEXT CHECK(employment_type IN (
                        'permanent', 'contract', 'casual', 'volunteer'
                    )),
    start_date      TEXT NOT NULL,  -- ISO format: YYYY-MM
    end_date        TEXT,           -- NULL = current role
    summary         TEXT,
    display_order   INTEGER NOT NULL DEFAULT 0,
    created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================
-- EXPERIENCE ITEMS
-- (responsibilities and achievements per role)
-- ============================================================
CREATE TABLE experience_items (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    experience_id INTEGER NOT NULL REFERENCES experience(id) ON DELETE CASCADE,
    type          TEXT NOT NULL CHECK(type IN ('responsibility', 'achievement')),
    content       TEXT NOT NULL,
    is_pinned     INTEGER NOT NULL DEFAULT 0, -- 1 = show on overview
    pin_order     INTEGER,                    -- order among pinned items (1-5)
    display_order INTEGER NOT NULL DEFAULT 0, -- order within the role
    created_at    TEXT NOT NULL DEFAULT (datetime('now')),

    -- enforce max 5 pinned items at DB level where possible
    CHECK(pin_order IS NULL OR (pin_order >= 1 AND pin_order <= 5))
);

-- ============================================================
-- ACHIEVEMENTS
-- (career-level, not tied to a specific role)
-- ============================================================
CREATE TABLE achievements (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    title         TEXT NOT NULL,
    description   TEXT,
    year          TEXT,           -- e.g. '2019' or '2019-2021'
    display_order INTEGER NOT NULL DEFAULT 0,
    created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================
-- PROJECTS
-- ============================================================
CREATE TABLE projects (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    name          TEXT NOT NULL,
    description   TEXT,
    tech_stack    TEXT,           -- JSON array: ["C#", "Vue", "PostgreSQL"]
    github_url    TEXT,
    live_url      TEXT,
    is_featured   INTEGER NOT NULL DEFAULT 0,
    display_order INTEGER NOT NULL DEFAULT 0,
    start_date    TEXT,
    end_date      TEXT,           -- NULL = ongoing
    created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

-- ============================================================
-- SKILLS
-- ============================================================
CREATE TABLE skill_groups (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    name          TEXT NOT NULL,  -- e.g. 'Backend', 'Frontend', 'Cloud'
    display_order INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE skills (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    skill_group_id INTEGER NOT NULL REFERENCES skill_groups(id) ON DELETE CASCADE,
    name           TEXT NOT NULL,
    proficiency    TEXT CHECK(proficiency IN (
                       'familiar', 'proficient', 'expert'
                   )),
    display_order  INTEGER NOT NULL DEFAULT 0
);

-- ============================================================
-- INDEXES
-- ============================================================
CREATE INDEX idx_experience_items_experience_id 
    ON experience_items(experience_id);

CREATE INDEX idx_experience_items_pinned 
    ON experience_items(is_pinned, pin_order) 
    WHERE is_pinned = 1;

CREATE INDEX idx_skills_group 
    ON skills(skill_group_id);

CREATE INDEX idx_projects_featured 
    ON projects(is_featured, display_order);