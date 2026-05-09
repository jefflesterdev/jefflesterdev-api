-- Seed data from Jeff Lester's resume (Jeff_Lester_Resume_v3.pdf)

-- ============================================================
-- PROFILE
-- ============================================================
INSERT INTO profile (id, name, tagline, bio, email, location, available, photo_url)
VALUES (
    1,
    'Jeff Lester',
    'Senior-level Full Stack Developer',
    'I''m a Canadian developer, born in BC and raised between Edmonton and Edson, Alberta. I spent 25 years living and working in Australia before returning home to continue my career here, bringing with me a perspective shaped by two very different countries, multiple industries, and two decades of production software experience.

Before I ever wrote professional code, I worked the Alberta oilfields and spent years in hospitality, running point-of-sale systems and the ordering tools that kitchen staff depend on mid-service. Those experiences gave me something most developers never get: genuine insight into what it means to be the end user of software that has to work under pressure, every time, with no room for friction. It changed how I design solutions and how I communicate with the people who have to live with them every day.

My technical background spans the full stack: C#, REST APIs, Vue/Nuxt, and PostgreSQL, with CI/CD delivery through Azure DevOps. Most recently I was embedded in a large-scale national booking platform at Greyhound Australia, working on systems where reliability wasn''t optional. I also bring a strong business analysis background, which means I can bridge the gap between technical teams and stakeholders without losing meaning in either direction.

After 25 years I wrapped up my time in Australia at the end of March 2026, spent a month packing up a life on the other side of the world, and landed back in Alberta in late April. I''m now rooted, focused, and looking for a remote role where the work actually matters. If you want a developer who understands the full picture, from schema to screen, and who''s lived enough of real working life to know why that matters, let''s connect.',
    'jeffery.a.lester@gmail.com',
    'Edson, Alberta, Canada',
    1,
    'https://media.licdn.com/dms/image/v2/D5635AQHNokTe2WI23A/profile-framedphoto-shrink_200_200/B56Z03fMi6HwAY-/0/1774752418194?e=1778882400&v=beta&t=aQp0QBaOzyZdLxkZiQQEBxFV6qec7HSNGAWNiUXUV9g'
);

-- ============================================================
-- SKILL GROUPS
-- ============================================================
INSERT INTO skill_groups (id, name, display_order) VALUES
    (1, 'Languages', 1),
    (2, 'Frontend',  2),
    (3, 'Backend',   3),
    (4, 'Mobile',    4),
    (5, 'Data',      5),
    (6, 'DevOps',    6),
    (7, 'Practices', 7);

-- ============================================================
-- SKILLS
-- Proficiency: familiar | proficient | expert
-- ============================================================

-- Languages
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (1, 'C#',         'expert',     1),
    (1, 'JavaScript', 'expert',     2),
    (1, 'TypeScript', 'expert',     3),
    (1, 'PHP',        'proficient', 4),
    (1, 'Python',     'familiar',   5);

-- Frontend
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (2, 'React',   'expert',     1),
    (2, 'Vue',     'expert',     2),
    (2, 'Angular', 'proficient', 3),
    (2, 'Nuxt',    'proficient', 4),
    (2, 'Next.js', 'proficient', 5),
    (2, 'HTML5',   'expert',     6),
    (2, 'CSS',     'expert',     7),
    (2, 'SCSS',    'proficient', 8),
    (2, 'Vuetify', 'proficient', 9);

-- Backend
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (3, '.NET / ASP.NET', 'expert',     1),
    (3, 'Node.js',        'proficient', 2),
    (3, 'Laravel',        'proficient', 3),
    (3, 'WCF',            'proficient', 4),
    (3, 'SOAP',           'proficient', 5),
    (3, 'Stripe',         'proficient', 6),
    (3, 'Ruby on Rails',  'proficient', 7);

-- Mobile
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (4, 'React Native', 'expert',     1),
    (4, 'Flutter',      'familiar',   2);

-- Data
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (5, 'MSSQL',      'expert',     1),
    (5, 'JSON',       'expert',     2),
    (5, 'PostgreSQL', 'proficient', 3),
    (5, 'MySQL',      'proficient', 4),
    (5, 'SQLite',     'proficient', 5),
    (5, 'XML',        'proficient', 6),
    (5, 'MongoDB',    'familiar',   7),
    (5, 'Power BI',  'familiar',   8);

-- DevOps
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (6, 'Git',          'expert',     1),
    (6, 'Azure DevOps', 'proficient', 2),
    (6, 'CI/CD',        'proficient', 3);

-- Practices
INSERT INTO skills (skill_group_id, name, proficiency, display_order) VALUES
    (7, 'System Architecture', 'expert',     1),
    (7, 'API Design',          'expert',     2),
    (7, 'Agile',               'proficient', 3),
    (7, 'Accessibility',       'proficient', 4);

-- ============================================================
-- ACHIEVEMENTS
-- Achievements are now derived from experience_items where type='achievement'
-- and title IS NOT NULL. The achievements table is no longer used.
-- ============================================================

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
-- type:      responsibility | achievement
-- title:     required for achievements (drives achievements section), NULL for responsibilities
-- pinned:    1 = show in achievements section, 0 = hide (achievements only)
-- is_pinned: 1 = show in overview highlights (top 5), controls pin_order
-- ============================================================

-- Greyhound Australia (2020–2026) — experience_id = 1
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (1, 'responsibility', NULL,                                       'Solely responsible for development, maintenance, and enhancement of the public-facing booking website driving primary business revenue.',                                                                                                                               0, 1, 1, 1),
    (1, 'achievement',    '6x Booking Flow Performance Improvement',  'Migrated primary booking workflow from AngularJS 1 to a C#-driven solution within an existing Umbraco/Angular environment, reducing load times from ~30 seconds to under 5 seconds.',                                                                                1, 1, 2, 2),
    (1, 'responsibility', NULL,                                       'Implemented payment integrations, updated live tracking, and delivered ongoing feature development.',                                                                                                                                                                   0, 0, NULL, 3),
    (1, 'achievement',    'Frontend Architecture and Standards',       'Designed and implemented frontend architecture and standards using Nuxt, Vue, and Vuetify.',                                                                                                                                                                           1, 1, 3, 4),
    (1, 'responsibility', NULL,                                       'Built APIs, backend services, and mobile solutions using React Native.',                                                                                                                                                                                               0, 0, NULL, 5),
    (1, 'achievement',    'Security Risk Remediation',                 'Identified and remediated security risks in application code, guiding other developers on secure practices.',                                                                                                                                                          1, 0, NULL, 6),
    (1, 'achievement',    'Flutter to React Native Migration',         'Migrated driver app for roadside booking and loading from Flutter to React Native and implemented credit card payments through Stripe.',                                                                                                                               1, 1, 4, 7),
    (1, 'responsibility', NULL,                                       'Supported development team and management with knowledge and experience to achieve goals and targets.',                                                                                                                                                                 0, 0, NULL, 8),
    (1, 'achievement',    'Availability Engine Rebuild',               'Rebuilt the legacy availability engine from C and SOAP-based MSSQL stored procedures into a single comprehensive MSSQL stored procedure, eliminating the SOAP layer entirely. Response times dropped from 15 to 30 seconds down to under 5 seconds regardless of route distance or number of services.',    1, 0, NULL, 9);

-- Russell Mineral Equipment (2018–2020) — experience_id = 2
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (2, 'responsibility', NULL,                                  'Defined business requirements and supported development of enterprise systems.',                                                                                                                        0, 0, NULL, 1),
    (2, 'achievement',    'Requirements Documentation Framework', 'Created documentation frameworks and tooling to enable the business to quickly and efficiently identify requirements and map relationships between bespoke software packages.',                          1, 0, NULL, 2),
    (2, 'achievement',    'BA Methodology Training',              'Trained staff on requirements gathering methods including MoSCoW, functional and non-functional requirements, RACI matrices, and traceability matrices.',                                               1, 0, NULL, 3),
    (2, 'responsibility', NULL,                                  'Completed a Business Intelligence training course and took responsibility for creating and modifying Power BI reports and data cubes to support organisational reporting needs.',                         0, 0, NULL, 4);

-- Wideland Group (2018) — experience_id = 3
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (3, 'responsibility', NULL,                          'Managed telecommunications and IT infrastructure across all east coast Australia offices for Wideland Group and AVIS, supporting approximately 150 users across network, connectivity, and systems administration.',                                            0, 0, NULL, 2),
    (3, 'achievement',    'National Network Modernisation', 'Led a full network modernisation across all east coast offices, upgrading to fibre internet and replacing legacy phone systems with VoIP, while keeping total costs flat for the year including implementation by personally managing rollout where possible.', 1, 0, NULL, 3),
    (3, 'responsibility', NULL,                          'Responsible for Cap-ex and Op-ex reporting for telecommunications and internet across all east coast offices, including working with the telecoms account manager to review, optimise, and reduce expenditure.',                                              0, 0, NULL, 4);

-- Weis Frozen Foods (2016–2017) — experience_id = 4
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (4, 'achievement',    'Stock and Sales Application Rebuild', 'Converted the primary stock and sales application from MS Access to a modern WCF Windows application, including predictive calculations, historical data analysis, and competitor information.',        1, 1, 5, 2),
    (4, 'responsibility', NULL,                                 'Managed all IT infrastructure for the facility including networking, PCs, internet connectivity, and telecommunications, covering procurement, maintenance, and ongoing updates.',                     0, 0, NULL, 3),
    (4, 'responsibility', NULL,                                 'Maintained software services and updates for food production machinery, ensuring operational continuity in a time-sensitive manufacturing environment.',                                               0, 0, NULL, 4),
    (4, 'responsibility', NULL,                                 'Responsible for Cap-ex and Op-ex reporting for all IT and telecommunications expenditure across the business.',                                                                                       0, 0, NULL, 5);

-- Strategenics (2015–2016) — experience_id = 5
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (5, 'achievement',    'Automated Documentation Generator', 'Built an automated Markdown documentation generator in Ruby on Rails for internal RoR projects, improving developer documentation consistency and reducing manual effort.', 1, 0, NULL, 2),
    (5, 'responsibility', NULL,                               'Supported other developers across Ruby on Rails projects, providing hands-on development assistance and training as required.',                                            0, 0, NULL, 3),
    (5, 'responsibility', NULL,                               'Attended client meetings to provide technical clarity and support for both the client and the business.',                                                                  0, 0, NULL, 4);

-- Greyhound Australia (2012–2015) — experience_id = 6
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (6, 'achievement',    'RESTful API Framework Design',        'Designed and implemented the company''s first RESTful API framework, establishing standards adopted by future development.',                                                                              1, 0, NULL, 1),
    (6, 'achievement',    'Agent Ticketing and Booking System',  'Developed the primary ticketing and booking system used by agents and third parties using jQuery, Mustache, HTML, and CSS, which remains in use today.',                                                 1, 0, NULL, 2),
    (6, 'responsibility', NULL,                                  'Provided mentoring and technical upskilling to other developers within the team.',                                                                                                                       0, 0, NULL, 3),
    (6, 'responsibility', NULL,                                  'Participated in an on-call support rotation providing Level 1 to 3 end-user support, capable of resolving issues at any level without escalation.',                                                     0, 0, NULL, 4);

-- WHK SQLD IT (2009–2011) — experience_id = 7
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (7, 'responsibility', NULL,                                    'Managed accounting systems and infrastructure across multiple offices.',                                                      0, 0, NULL, 1),
    (7, 'achievement',    'Eastern Australia Modernisation Team',  'Selected as part of a specialist team called upon by offices across Eastern Australia to modernise systems and lead disaster recovery efforts.',              1, 0, NULL, 2);

-- Perkins Shipping (2004–2008) — experience_id = 8
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (8, 'responsibility', NULL,                              'Developed internal systems and managed global communications infrastructure.',                                                                               0, 0, NULL, 1),
    (8, 'achievement',    'Company Intranet Development',    'Built the company''s first intranet using ColdFusion.',                                                                                                     1, 0, NULL, 2),
    (8, 'achievement',    'Website Development In-housing',  'Brought development and ongoing management of the business website in-house.',                                                                              1, 0, NULL, 3),
    (8, 'achievement',    'HSE Incident Reporting System',   'Created an end-to-end incident reporting system for the HSE department, covering incident tracking and root cause analysis.',                               1, 0, NULL, 4);

-- Rooney Shipping (2001–2004) — experience_id = 9
INSERT INTO experience_items (experience_id, type, title, content, pinned, is_pinned, pin_order, display_order) VALUES
    (9, 'responsibility', NULL,                              'Managed IT systems and quality assurance processes.',                                                                                                                                                           0, 0, NULL, 1),
    (9, 'achievement',    'ISO Lead Auditor Certification',  'Completed ISO Lead Auditor certification and performed internal audits supporting the company''s ISO 9001:2000 certification.',                                                                                  1, 0, NULL, 2),
    (9, 'responsibility', NULL,                              'Managed all ISO quality assurance manuals including AMSA shipboard manuals for ship operations.',                                                                                                               0, 0, NULL, 3),
    (9, 'achievement',    'Automated QA and Audit System',   'Built an automated QA system on the company intranet enabling digital recording of NCRs and corrective actions, and rapid generation of internal audit checklists.',                                            1, 0, NULL, 4),
    (9, 'achievement',    'Ship-board Maintenance Programme', 'Developed a ship-board maintenance program in VB6 with a secure server/host architecture restricting access to authorised hosts regardless of network.',                                                        1, 0, NULL, 5);

-- ============================================================
-- PROJECTS
-- (empty — add portfolio projects manually as desired)
-- ============================================================
