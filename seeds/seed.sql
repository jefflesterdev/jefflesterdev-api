-- Seed data from Jeff Lester's resume (Jeff_Lester_Resume_v3.pdf)

-- ============================================================
-- PROFILE
-- ============================================================
INSERT INTO profile (id, name, tagline, bio, email, location, available)
VALUES (
    1,
    'Jeff Lester',
    'Senior-level Full Stack Developer',
    'Senior-level Full Stack Developer with 10+ years of experience designing, building, and owning production systems. Known for creating scalable frameworks, modernising legacy platforms, and delivering measurable improvements to performance and user experience.',
    'jeffery.a.lester@gmail.com',
    'Edson, Alberta, Canada',
    1
);

-- ============================================================
-- SKILL GROUPS
-- ============================================================
INSERT INTO skill_groups (id, name, display_order) VALUES
    (1, 'Frontend',  1),
    (2, 'Mobile',    2),
    (3, 'Backend',   3),
    (4, 'Data',      4),
    (5, 'Tools',     5),
    (6, 'Practices', 6);

-- ============================================================
-- SKILLS
-- Proficiency: familiar | proficient | expert
-- ============================================================

-- Frontend
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (1, 'React',      'proficient', 1),
    (1, 'Vue',        'expert',     2),
    (1, 'Nuxt',       'expert',     3),
    (1, 'Angular',    'proficient', 4),
    (1, 'Vuetify',    'proficient', 5),
    (1, 'Quasar',     'familiar',   6),
    (1, 'HTML5',      'expert',     7),
    (1, 'CSS',        'expert',     8),
    (1, 'SCSS',       'proficient', 9),
    (1, 'SASS',       'proficient', 10),
    (1, 'JavaScript', 'expert',     11);

-- Mobile
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (2, 'React Native', 'proficient', 1),
    (2, 'Flutter',      'familiar',   2);

-- Backend
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (3, 'Node.js',            'proficient', 1),
    (3, 'TypeScript',         'proficient', 2),
    (3, '.NET (C#, ASP.NET)', 'proficient', 3),
    (3, 'PHP',                'familiar',   4),
    (3, 'Python',             'familiar',   5);

-- Data
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (4, 'PostgreSQL', 'proficient', 1),
    (4, 'MSSQL',      'proficient', 2),
    (4, 'MySQL',      'proficient', 3),
    (4, 'MongoDB',    'familiar',   4),
    (4, 'SQLite',     'proficient', 5);

-- Tools
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (5, 'Azure DevOps',  'proficient', 1),
    (5, 'Git',           'expert',     2),
    (5, 'CI/CD',         'proficient', 3),
    (5, 'VSCode',        'expert',     4),
    (5, 'Visual Studio', 'proficient', 5);

-- Practices
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (6, 'System Architecture', 'expert',     1),
    (6, 'API Design',          'expert',     2),
    (6, 'Accessibility',       'proficient', 3),
    (6, 'Agile',               'proficient', 4),
    (6, 'Waterfall',           'proficient', 5);

-- ============================================================
-- ACHIEVEMENTS (career-level, not tied to a specific role)
-- ============================================================
INSERT INTO achievements (title, description, year, display_order) VALUES
    (
        'High-Traffic Booking Website Ownership',
        'Owned and drove development of a high-traffic public booking website responsible for most of the company revenue.',
        '2020–2026', 1
    ),
    (
        '6× Performance Improvement on Booking Flow',
        'Reduced booking flow load time from ~30 seconds to under 5 seconds by migrating AngularJS implementation to a backend-driven C# solution.',
        '2020', 2
    ),
    (
        'RESTful API Framework Design',
        'Designed the original RESTful API framework adopted and expanded by the organisation over the following decade.',
        '2012', 3
    ),
    (
        'Modern Frontend Architecture Definition',
        'Defined modern frontend architecture and standards using Nuxt, Vue, and Vuetify for new platform development.',
        '2020–2026', 4
    ),
    (
        'Flutter to React Native Migration',
        'Independently converted a mobile application from Flutter to React Native.',
        '2021', 5
    ),
    (
        'Scalable System Delivery',
        'Delivered scalable systems handling pricing, integrations, and real-world operational complexity.',
        '2020–2026', 6
    ),
    (
        'Microsoft Dynamics 365 Migration Standards',
        'Developed standards and ran training for collecting business requirements and analysis for a bespoke migration to Microsoft Dynamics 365.',
        '2018–2020', 7
    );

-- ============================================================
-- EXPERIENCE
-- ============================================================
INSERT INTO experience (id, company, title, employment_type, start_date, end_date, display_order) VALUES
    (1, 'Greyhound Australia',       'Full Stack Developer',              'permanent', '2020-07', '2026-03', 1),
    (2, 'Russell Mineral Equipment', 'Business Analyst / Programmer',     'permanent', '2018-09', '2020-07', 2),
    (3, 'Wideland Group',            'Senior IT Systems Analyst',          'permanent', '2018-01', '2018-09', 3),
    (4, 'Weis Frozen Foods',         'ICT Manager',                       'permanent', '2016-07', '2017-10', 4),
    (5, 'Strategenics',              'Technology Consultant',              'contract',  '2015-11', '2016-07', 5),
    (6, 'Greyhound Australia',       'Analyst Programmer',                 'permanent', '2012-01', '2015-10', 6),
    (7, 'WHK SQLD IT',               'Accounting Systems Administrator',   'permanent', '2009-10', '2011-12', 7),
    (8, 'Perkins Shipping',          'IT Developer',                      'permanent', '2004-09', '2008-03', 8),
    (9, 'Rooney Shipping',           'IT Manager / QA Manager',           'permanent', '2001-11', '2004-08', 9);

-- ============================================================
-- EXPERIENCE ITEMS
-- Pinned items (is_pinned=1) are the top 5 highlights shown on overview
-- ============================================================

-- Greyhound Australia (2020–2026) — experience_id = 1
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (1, 'responsibility', 'Solely responsible for development, maintenance, and enhancement of the public-facing booking website driving primary business revenue.',                                                               1, 1, 1),
    (1, 'achievement',    'Migrated primary booking workflow from AngularJS 1 to a C#-driven solution within an existing Umbraco/Angular environment, reducing load times from ~30 seconds to under 5 seconds.',                 1, 2, 2),
    (1, 'responsibility', 'Implemented payment integrations, updated live tracking, and delivered ongoing feature development.',                                                                                                   0, NULL, 3),
    (1, 'achievement',    'Designed and implemented frontend architecture and standards using Nuxt, Vue, and Vuetify.',                                                                                                            1, 3, 4),
    (1, 'responsibility', 'Built APIs, backend services, and mobile solutions using React Native.',                                                                                                                               0, NULL, 5),
    (1, 'achievement',    'Identified and remediated security risks in application code, guiding other developers on secure practices.',                                                                                           0, NULL, 6),
    (1, 'achievement',    'Migrated driver app for roadside booking and loading from Flutter to React Native and implemented credit card payments through Stripe.',                                                                1, 4, 7),
    (1, 'responsibility', 'Supported development team and management with knowledge and experience to achieve goals and targets.',                                                                                                 0, NULL, 8);

-- Russell Mineral Equipment (2018–2020) — experience_id = 2
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (2, 'responsibility', 'Defined business requirements and supported development of enterprise systems.',                                                                                                                        0, NULL, 1),
    (2, 'achievement',    'Created documentation frameworks and tooling to enable the business to quickly and efficiently identify requirements and map relationships between bespoke software packages.',                          0, NULL, 2),
    (2, 'achievement',    'Trained staff on requirements gathering methods including MoSCoW, functional and non-functional requirements, RACI matrices, and traceability matrices.',                                               0, NULL, 3);

-- Wideland Group (2018) — experience_id = 3
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (3, 'achievement', 'Managed infrastructure and led infrastructure migration for ~150 users nationally.', 0, NULL, 1);

-- Weis Frozen Foods (2016–2017) — experience_id = 4
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (4, 'responsibility', 'Managed IT systems and modernisation efforts.',                                                                                                                                                        0, NULL, 1),
    (4, 'achievement',    'Converted the primary stock and sales application from MS Access to a modern WCF Windows application, including predictive calculations, historical data analysis, and competitor information.',        1, 5, 2);

-- Strategenics (2015–2016) — experience_id = 5
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (5, 'responsibility', 'Delivered software solutions and provided development guidance.', 0, NULL, 1);

-- Greyhound Australia (2012–2015) — experience_id = 6
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (6, 'achievement', 'Designed and implemented the company''s first RESTful API framework, establishing standards adopted by future development.',                                                            0, NULL, 1),
    (6, 'achievement', 'Developed the primary ticketing and booking system used by agents and third parties using jQuery, Mustache, HTML, and CSS, which remains in use today.',                               0, NULL, 2);

-- WHK SQLD IT (2009–2011) — experience_id = 7
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (7, 'responsibility', 'Managed accounting systems and infrastructure across multiple offices.',                                                                                      0, NULL, 1),
    (7, 'achievement',    'Selected as part of a specialist team called upon by offices across Eastern Australia to modernise systems and lead disaster recovery efforts.',              0, NULL, 2);

-- Perkins Shipping (2004–2008) — experience_id = 8
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (8, 'responsibility', 'Developed internal systems and managed global communications infrastructure.',                                                                               0, NULL, 1),
    (8, 'achievement',    'Built the company''s first intranet using ColdFusion.',                                                                                                     0, NULL, 2),
    (8, 'achievement',    'Brought development and ongoing management of the business website in-house.',                                                                              0, NULL, 3),
    (8, 'achievement',    'Created an end-to-end incident reporting system for the HSE department, covering incident tracking and root cause analysis.',                               0, NULL, 4);

-- Rooney Shipping (2001–2004) — experience_id = 9
INSERT INTO experience_items (experience_id, type, content, is_pinned, pin_order, display_order) VALUES
    (9, 'responsibility', 'Managed IT systems and quality assurance processes.',                                                                                                                                                           0, NULL, 1),
    (9, 'achievement',    'Completed ISO Lead Auditor certification and performed internal audits supporting the company''s ISO 9001:2000 certification.',                                                                                  0, NULL, 2),
    (9, 'responsibility', 'Managed all ISO quality assurance manuals including AMSA shipboard manuals for ship operations.',                                                                                                               0, NULL, 3),
    (9, 'achievement',    'Built an automated QA system on the company intranet enabling digital recording of NCRs and corrective actions, and rapid generation of internal audit checklists.',                                            0, NULL, 4),
    (9, 'achievement',    'Developed a ship-board maintenance program in VB6 with a secure server/host architecture restricting access to authorised hosts regardless of network.',                                                        0, NULL, 5);

-- ============================================================
-- PROJECTS
-- (empty — add portfolio projects manually as desired)
-- ============================================================
