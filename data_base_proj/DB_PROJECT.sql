--3---------------------------------------------------------------------------------------------------------------------

DROP SCHEMA IF EXISTS db_project CASCADE;
CREATE SCHEMA db_project;

DROP TABLE IF EXISTS db_project.element;
CREATE TABLE db_project.element (
  element_no                    INT PRIMARY KEY CHECK ( element_no >= 1 ),
  element_nm                    VARCHAR(30) NOT NULL,
  element_symbol                VARCHAR(3) NOT NULL,
  element_atomic_weight         FLOAT CHECK ( element_atomic_weight >= 1 ) NOT NULL,
  isotopes_cnt                  INT,
  element_type                  VARCHAR(1) NOT NULL,
  electron_shell_configuration  VARCHAR(100)
);

DROP TABLE IF EXISTS db_project.element_application;
CREATE TABLE db_project.element_application (
  application_id    INT PRIMARY KEY,
  field             VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS db_project.element_x_application;
CREATE TABLE db_project.element_x_application (
  application_id    INT REFERENCES db_project.element_application(application_id),
  element_no        INT REFERENCES db_project.element(element_no),
  creator_nm        VARCHAR(50),
  creation_year     INT,
  description       VARCHAR(100)
);

DROP TABLE IF EXISTS db_project.research_team;
CREATE TABLE db_project.research_team(
  team_id           INT PRIMARY KEY,
  team_nm           VARCHAR(100) NOT NULL,
  team_location     VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS db_project.scientist;
CREATE TABLE db_project.scientist (
  scientist_id      INT,
  scientist_nm      VARCHAR(50) NOT NULL,
  birth_dt          DATE,
  team_id           INT REFERENCES db_project.research_team(team_id),
  start_dt          DATE,
  end_dt            DATE,
  PRIMARY KEY (scientist_id, start_dt, end_dt)
);

DROP TABLE IF EXISTS db_project.research;
CREATE TABLE db_project.research (
  research_id       INT PRIMARY KEY,
  field             VARCHAR(30) NOT NULL,
  team_id           INT REFERENCES db_project.research_team(team_id),
  start_dt          DATE,
  end_dt            DATE
);

DROP TABLE IF EXISTS db_project.element_x_research;
CREATE TABLE db_project.element_x_research (
  element_no        INT REFERENCES db_project.element(element_no),
  research_id       INT REFERENCES db_project.research(research_id)
);

--4---------------------------------------------------------------------------------------------------------------------

INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (1, 'Hydrogen', 'H', 1.008, 2, 's', '1s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (2, 'Helium', 'He', 4.0026, 2, 's', '1s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (3, 'Lithium', 'Li', 6.94, 2, 's', '[He] 2s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (4, 'Beryllium', 'Be', 9.012, 1, 's', '[He] 2s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (5, 'Boron', 'B', 10.806, 2, 'p', '[He] 2s2 2p1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (6, 'Carbon', 'C', 12.011, 2, 'p', '[He] 2s2 2p2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (7, 'Nitrogen', 'N', 14.007, 2, 'p', '[He] 2s2 2p3');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (8, 'Oxygen', 'O', 5.999, 3, 'p', '[He] 2s2 2p4');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (9, 'Fluorine', 'F', 18.998, 1, 'p', '[He] 2s2 2p5');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (10, 'Neon', 'Ne', 20.18, 3, 'p', '[He] 2s2 2p6');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (11, 'Sodium', 'Na', 22.99, 1, 's', '[Ne] 3s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (12, 'Magnesium', 'Mg', 24.305, 3, 's', '[Ne] 3s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (13, 'Aluminum', 'Al', 26.982, 1, 'p', '[Ne] 3s2 3p1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (14, 'Silicon', 'Si', 28.085, 3, 'p', '[Ne] 3s2 3p2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (15, 'Phosphorus', 'P', 30.974, 1, 'p', '[Ne] 3s2 3p3');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (16, 'Sulfur', 'S', 32.06, 4, 'p', '[Ne] 3s2 3p4');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (17, 'Chlorine', 'Cl', 35.45, 2, 'p', '[Ne] 3s2 3p5');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (18, 'Argon', 'Ar', 39.948, 3, 'p', '[Ne] 3s2 3p6');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (19, 'Potassium', 'K', 39.098, 2, 's', '[Ar] 4s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (20, 'Calcium', 'Ca', 40.078, 5, 's', '[Ar] 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (21, 'Scandium', 'Sc', 44.956, 1, 'd', '[Ar] 3d1 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (22, 'Titanium', 'Ti', 47.867, 5, 'd', '[Ar] 3d2 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (23, 'Vanadium', 'V', 50.942, 1, 'd', '[Ar] 3d3 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (24, 'Chromium', 'Cr', 51.996, 4, 'd', '[Ar] 3d5 4s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (25, 'Manganese', 'Mn', 54.938, 1, 'd', '[Ar] 3d5 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (26, 'Iron', 'Fe', 55.845, 4, 'd', '[Ar] 3d6 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (27, 'Cobalt', 'Co', 58.993, 1, 'd', '[Ar] 3d7 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (28, 'Nickel', 'Ni', 58.693, 5, 'd', '[Ar] 3d9 4s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (29, 'Copper', 'Cu', 63.546, 2, 'd', '[Ar] 3d10 4s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (30, 'Zinc', 'Zn', 65.38, 5, 'd', '[Ar] 3d10 4s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (31, 'Gallium', 'Ga', 69.723, 2, 'p', '[Ar] 3d10 4s2 4p1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (32, 'Germanium', 'Ge', 72.63, 4, 'p', '[Ar] 3d10 4s2 4p2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (33, 'Arsenic', 'As', 74.922, 1, 'p', '[Ar] 3d10 4s2 4p3');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (34, 'Selenium', 'Se', 78.971, 5, 'p', '[Ar] 3d10 4s2 4p4');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (35, 'Bromine', 'Br', 79.901, 2, 'p', '[Ar] 3d10 4s2 4p5');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (36, 'Krypton', 'Kr', 83.798, 6, 'p', '[Ar] 3d10 4s2 4p6');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (37, 'Rubidium', 'Rb', 85.468, 1, 's', '[Kr] 5s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (38, 'Strontium', 'Sr', 87.62, 4, 's', '[Kr] 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (39, 'Yttrium', 'Y', 88.906, 1, 'd', '[Kr] 4d1 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (40, 'Zirconium', 'Zr', 91.224, 4, 'd', '[Kr] 4d2 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (41, 'Niobium', 'Nb', 92.906, 1, 'd', '[Kr] 4d3 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (42, 'Molybdenum', 'Mo', 95.95, 6, 'd', '[Kr] 4d4 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (43, 'Technetium', 'Tc', 98, null, 'd', '[Kr] 4d5 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (44, 'Ruthenium', 'Ru', 1.07, 7, 'd', '[Kr] 4d6 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (45, 'Rhodium', 'Rh', 2.91, 1, 'd', '[Kr] 4d7 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (46, 'Palladium', 'Pd', 106.42, 6, 'd', '[Kr] 4d8 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (47, 'Silver', 'Ag', 107.87, 2, 'd', '[Kr] 4d9 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (48, 'Cadmium', 'Cd', 112.414, 6, 'd', '[Kr] 4d10 5s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (49, 'Indium', 'In', 114.82, 1, 'p', '[Kr] 4d10 5s2 5p1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (50, 'Tin', 'Sn', 118.71, 10, 'p', '[Kr] 4d10 5s2 5p2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (51, 'Antimony', 'Sb', 121.76, 2, 'p', '[Kr] 4d10 5s2 5p3');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (52, 'Tellurium', 'Te', 127.6, 5, 'p', '[Kr] 4d10 5s2 5p4');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (53, 'Iodine', 'I', 126.9, 1, 'p', '[Kr] 4d10 5s2 5p5');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (54, 'Xenon', 'Xe', 131.29, 9, 'p', '[Kr] 4d10 5s2 5p6');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (55, 'Cesium', 'Cs', 132.91, 1, 's', '[Xe] 6s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (56, 'Barium', 'Ba', 137.327, 7, 's', '[Xe] 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (57, 'Lanthanum', 'La', 138.91, 1, 'd', '[Xe] 5d1 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (58, 'Cerium', 'Ce', 140.12, 4, 'f', '[Xe] 4f1 5d1 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (59, 'Praseodymium', 'Pr', 140.908, 1, 'f', '[Xe] 4f3 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (60, 'Neodymium', 'Nd', 144.24, 5, 'f', '[Xe] 4f4 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (61, 'Promethium', 'Pm', 145, null, 'f', '[Xe] 4f5 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (62, 'Samarium', 'Sm', 150.36, 5, 'f', '[Xe] 4f6 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (63, 'Europium', 'Eu', 151.96, 2, 'f', '[Xe] 4f7 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (64, 'Gadolinium', 'Gd', 157.25, 6, 'f', '[Xe] 4f7 5d1 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (65, 'Terbium', 'Tb', 158.925, 1, 'f', '[Xe] 4f9 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (66, 'Dysprosium', 'Dy', 162.5, 7, 'f', '[Xe] 4f10 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (67, 'Holmium', 'Ho', 164.93, 1, 'f', '[Xe] 4f11 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (68, 'Erbium', 'Er', 167.26, 6, 'f', '[Xe] 4f12 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (69, 'Thulium', 'Tm', 168.934, 1, 'f', '[Xe] 4f13 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (70, 'Ytterbium', 'Yb', 173.045, 7, 'f', '[Xe] 4f14 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (71, 'Lutetium', 'Lu', 174.97, 1, 'f', '[Xe] 4f14 5d1 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (72, 'Hafnium', 'Hf', 178.49, 5, 'd', '[Xe] 4f14 5d2 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (73, 'Tantalum', 'Ta', 180.948, 1, 'd', '[Xe] 4f14 5d3 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (74, 'Tungsten', 'W', 183.84, 5, 'd', '[Xe] 4f14 5d4 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (75, 'Rhenium', 'Re', 186.207, 1, 'd', '[Xe] 4f14 5d5 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (76, 'Osmium', 'Os', 190.23, 6, 'd', '[Xe] 4f14 5d6 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (77, 'Iridium', 'Ir', 192.22, 2, 'd', '[Xe] 4f14 5d7 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (78, 'Platinum', 'Pt', 195.084, 5, 'd', '[Xe] 4f14 5d9 6s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (79, 'Gold', 'Au', 196.97, 1, 'd', '[Xe] 4f14 5d10 6s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (80, 'Mercury', 'Hg', 200.59, 7, 'd', '[Xe] 4f14 5d10 6s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (81, 'Thallium', 'Tl', 204.383, 2, 'p', '[Xe] 4f14 5d10 6s2 6p1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (82, 'Lead', 'Pb', 207.2, 4, 'p', '[Xe] 4f14 5d10 6s2 6p2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (83, 'Bismuth', 'Bi', 209.98, null, 'p', '[Xe] 4f14 5d10 6s2 6p3');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (84, 'Polonium', 'Po', 208.98, null, 'p', '[Xe] 4f14 5d10 6s2 6p4');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (85, 'Astatine', 'At', 210, null, 'p', '[Xe] 4f14 5d10 6s2 6p5');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (86, 'Radon', 'Rn', 222, null, 'p', '[Xe] 4f14 5d10 6s2 6p6');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (87, 'Francium', 'Fr', 223, null, 's', '[Rn] 7s1');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (88, 'Radium', 'Ra', 226.025, null, 's', '[Rn] 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (89, 'Actinium', 'Ac', 227, null, 'd', '[Rn] 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (90, 'Thorium', 'Th', 232.038, 1, 'f', '[Rn] 6d2 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (91, 'Protactinium', 'Pa', 231.036, null, 'f', '[Rn] 5f2 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (92, 'Uranium', 'U', 238.029, null, 'f', '[Rn] 5f3 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (93, 'Neptunium', 'Np', 237, null, 'f', '[Rn] 5f4 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (94, 'Plutonium', 'Pu', 244, null, 'f', '[Rn] 5f6 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (95, 'Americium', 'Am', 243, null, 'f', '[Rn] 5f7 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (96, 'Curium', 'Cm', 247, null, 'f', '[Rn] 5f7 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (97, 'Berkelium', 'Bk', 247, null, 'f', '[Rn] 5f9 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (98, 'Californium', 'Cf', 251, null, 'f', '[Rn] 5f10 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (99, 'Einsteinium', 'Es', 252, null, 'f', '[Rn] 5f11 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (100, 'Fermium', 'Fm', 257, null, 'f', '[Rn] 5f12 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (101, 'Mendelevium', 'Md', 258, null, 'f', '[Rn] 5f13 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (102, 'Nobelium', 'No', 259, null, 'f', '[Rn] 5f14 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (103, 'Lawrencium', 'Lr', 266, null, 'f', '[Rn] 5f14 6d1 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (104, 'Rutherfordium', 'Rf', 261, null, 'd', '[Rn] 5f14 6d2 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (105, 'Dubnium', 'Db', 262, null, 'd', '[Rn] 5f14 6d3 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (106, 'Seaborgium', 'Sg', 263, null, 'd', '[Rn] 5f14 6d4 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (107, 'Bohrium', 'Bh', 267, null, 'd', '[Rn] 5f14 6d5 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (108, 'Hassium', 'Hs', 269, null, 'd', '[Rn] 5f14 6d6 7s2');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (109, 'Meitnerium', 'Mt', 278, null, 'd', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (110, 'Darmstadtium', 'Ds', 281, null, 'd', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (111, 'Roentgenium', 'Rg', 281, null, 'd', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (112, 'Copernicium', 'Cn', 285, null, 'd', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (113, 'Nihonium', 'Nh', 286, null, 'p', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (114, 'Flerovium', 'Fl', 289, null, 'p', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (115, 'Moscovium', 'Mc', 289, null, 'p', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (116, 'Livermorium', 'Lv', 293, null, 'p', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (117, 'Tennessine', 'Ts', 294, null, 'p', 'UN');
INSERT INTO db_project.element (element_no, element_nm, element_symbol, element_atomic_weight, isotopes_cnt, element_type, electron_shell_configuration) VALUES (118, 'Oganesson', 'Og', 294, null, 'P', 'UN');

INSERT INTO db_project.element_application (application_id, field) VALUES (1, 'Medicine');
INSERT INTO db_project.element_application (application_id, field) VALUES (2, 'Chemical analysis');
INSERT INTO db_project.element_application (application_id, field) VALUES (3, 'Spectroscopy');
INSERT INTO db_project.element_application (application_id, field) VALUES (4, 'Catalyst');
INSERT INTO db_project.element_application (application_id, field) VALUES (5, 'Animal feed supplement');
INSERT INTO db_project.element_application (application_id, field) VALUES (6, 'Stabiliser');
INSERT INTO db_project.element_application (application_id, field) VALUES (7, 'Dye');
INSERT INTO db_project.element_application (application_id, field) VALUES (8, 'Pigment');
INSERT INTO db_project.element_application (application_id, field) VALUES (9, 'Pharmaceutical');
INSERT INTO db_project.element_application (application_id, field) VALUES (10, 'Photography');
INSERT INTO db_project.element_application (application_id, field) VALUES (11, 'Pure');
INSERT INTO db_project.element_application (application_id, field) VALUES (12, 'Sanitation');
INSERT INTO db_project.element_application (application_id, field) VALUES (13, 'Food supplement');
INSERT INTO db_project.element_application (application_id, field) VALUES (14, 'Energetics');
INSERT INTO db_project.element_application (application_id, field) VALUES (15, 'Jewelry');

INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (1, 3, null, null, 'Calm mental illnesses');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (1, 80, null, null, 'Used to fill cavities');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (2, 53, null, null, 'Used for titration');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (2, 16, null, null, 'Used for titration');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (3, 53, null, null, 'Used in spectroscopy');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (4, 28, 'V Reppe', 1948, 'Benzene formation');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (4, 46, null, null, 'Hydration');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (4, 6, 'N D Zelinsky', 1927, 'Benzene formation');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (5, 53, null, null, 'Supplement for animal food');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (6, 53, null, null, 'Part of some stabilisers');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (7, 53, null, null, 'Dye compound');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (7, 16, null, null, 'Dye compound');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (7, 30, null, null, 'Dye compound');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (8, 53, null, null, 'Pigment compound');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (9, 7, null, null, 'Pills for angina');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (9, 53, 'Jean Guillaume Auguste Lugol', 1829, 'Lugol’s Solution');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (9, 12, null, null, 'For asthma');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (10, 53, 'Talbot', 1841, 'Old-fashioned photography');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (10, 16, 'Talbot', 1841, 'Old-fashioned photography');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (11, 8, null, null, 'Breathing');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (11, 6, null, null, 'Slate pencil point');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (11, 2, 'Bell Telephone Laboratories', 1962, 'Laser');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (12, 53, null, null, 'Used for sanitation in hospitals');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (12, 22, null, null, 'Part of sanitation compound');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (13, 53, null, null, 'Regular salt');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (13, 11, null, null, 'Compound of regular salt');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (13, 17, null, null, 'Compound of regular salt');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (14, 92, 'Enrico Fermi', 1951, 'Nuclear fuel');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (14, 90, 'Enrico Fermi', 1951, 'Nuclear fuel');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (14, 94, 'Enrico Fermi', 1951, 'Nuclear fuel');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (15, 47, null, null, 'Silver jewelry');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (15, 78, null, null, 'Gold jewelery');
INSERT INTO db_project.element_x_application (application_id, element_no, creator_nm, creation_year, description) VALUES (15, 79, null, null, 'Platinum jewelery');

INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (1, 'Joint Institute for Nuclear Research', 'Russia, Dubna, Moscow region');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (2, 'The University of California, Berkeley', 'USA, CA, Berkley');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (3, 'International Union of Pure and Applied Chemistry,', 'Switzerland, Zurich');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (4, 'Oak Ridge National Laboratory', 'USA, TS, Tennesy');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (5, 'Helmholtz Centre for Heavy Ion Research', 'Germany, Darmstadt');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (6, 'Research Institute of Atomic Reactors', 'Russia, Dmitrovgrad, Ulianovsk');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (7, 'Electro Chemistry Supply', 'Russia, Lesnoy, Sverdlovsk region');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (8, 'Lawrence Livermore National Laboratory', 'USA, CA, Livermore');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (9, 'Lunds University', 'Sweden, Lund');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (10, 'Lawrence Berkeley National Laboratory', 'USA, CA, Berkley');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (11, 'Rikagaku Kenkyusho University', 'Japan, Wako');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (12, 'Luniversite Paris-Sud', 'France, Paris');
INSERT INTO db_project.research_team (team_id, team_nm, team_location) VALUES (13, 'Grand accelerateur national dions lourds Laboratory', 'France, Caen');

INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (1, 'Cilka Ensten', '1943-02-28', 1, '2017-12-06', '2019-03-23');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (2, 'Welch Skerritt', '1941-12-26', 1, '2000-04-26', '2006-03-04');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (3, 'Caroline Eldon', '1971-01-16', 2, '2010-03-06', '2017-06-22');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (4, 'Clemmy Valintine', '1946-06-15', 2, '2013-07-24', '2018-07-29');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (5, 'Pepita Medina', '1950-10-28', 3, '2003-02-21', '2015-09-23');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (6, 'Cirillo Simonel', '1968-11-06', 3, '2009-11-02', '2014-07-09');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (7, 'Trixy Lawlor', '1948-07-28', 4, '2003-01-05', '2013-05-09');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (8, 'Sonnnie Please', '1947-10-27', 4, '2006-07-05', '2008-10-26');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (9, 'Edythe Ker', '1975-12-08', 5, '2005-11-16', '2018-05-02');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (10, 'Mile McNiven', '1966-06-25', 5, '2014-05-18', '2018-09-13');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (11, 'Laura Tupie', '1958-04-12', 6, '2007-09-20', '2018-07-08');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (12, 'Tillie Goodenough', '1942-03-17', 6, '2010-07-19', '2013-10-25');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (13, 'Yetta Lindeboom', '1968-07-12', 7, '2004-03-18', '2005-07-20');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (14, 'Barbara-anne Tune', '1947-10-27', 7, '2014-11-21', '2017-03-09');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (15, 'Fan Tanner', '1969-10-19', 8, '2003-03-31', '2005-03-21');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (16, 'Larisa Flux', '1941-04-06', 8, '2001-10-06', '2005-04-11');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (17, 'Randell Lomond', '1975-07-30', 9, '2000-06-16', '2002-11-28');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (18, 'Mabel Bonnick', '1954-08-30', 9, '2005-12-25', '2015-03-22');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (19, 'Ken Tuke', '1965-08-17', 10, '2006-05-22', '2017-07-15');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (20, 'Melantha Easby', '1965-01-16', 10, '2015-05-13', '2018-09-01');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (21, 'Israel Baal', '1947-02-10', 11, '2003-02-03', '2019-04-10');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (22, 'Teresina Hammerstone', '1961-10-10', 11, '2016-04-09', '2017-01-10');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (23, 'Marian Posnette', '1968-01-31', 12, '2012-06-18', '2015-07-31');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (24, 'Winnie Cristofanini', '1957-02-23', 12, '2004-10-15', '2009-07-24');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (25, 'Orelie O''Regan', '1977-03-13', 13, '2014-09-29', '2018-11-18');
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt) VALUES (26, 'Gillie Brane', '1970-05-11', 13, '2010-04-04', '2014-02-09');

INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (1, 'Nuclear Physics', 1, '1998-02-03', '2003-04-10');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (2, 'Nuclear Physics', 8, '2001-01-13', '2008-10-14');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (3, 'Nuclear Physics', 2, '2000-12-30', '2010-05-03');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (4, 'Nuclear Physics', 1, '2007-10-11', '2010-05-03');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (5, 'Nuclear Physics', 4, '2008-11-03', '2012-07-10');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (6, 'Nuclear Physics', 5, '2012-02-10', '2014-07-03');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (7, 'Nuclear Physics', 1, '1998-10-03', '2005-04-19');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (8, 'Nuclear Physics', 6, '1997-11-04', '2003-07-15');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (9, 'Nuclear Physics', 7, '1999-07-09', '2002-09-01');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (10, 'Nuclear Physics', 8, '1999-09-13', '2012-05-03');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (11, 'Nuclear Physics', 1, '2002-10-29', '2006-10-07');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (12, 'Nuclear Physics', 8, '2002-07-03', '2007-09-10');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (13, 'Nuclear Physics', 5, '2010-07-03', '2015-04-03');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (14, 'Nuclear Physics', 9, '2009-09-14', '2015-04-19');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (15, 'Nuclear Physics', 1, '1997-09-10', '2003-09-23');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (16, 'Nuclear Physics', 8, '1997-09-10', '2011-09-08');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (17, 'Nuclear Physics', 1, '2002-04-03', '2006-08-15');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (18, 'Nuclear Physics', 8, '2002-04-15', '2005-07-14');
INSERT INTO db_project.research (research_id, field, team_id, start_dt, end_dt) VALUES (19, 'Nuclear Physics', 11, '2010-06-25', '2016-10-14');

INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (118, 1);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (118, 2);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (118, 3);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (117, 4);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (117, 5);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (117, 6);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (116, 7);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (116, 8);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (116, 9);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (116, 10);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (115, 11);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (115, 12);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (115, 13);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (115, 14);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (114, 15);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (114, 16);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (113, 17);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (113, 18);
INSERT INTO db_project.element_x_research (element_no, research_id) VALUES (113, 19);

--5---------------------------------------------------------------------------------------------------------------------
--CRUD:
--CREATE == INSERT
--READ   == SELECT
--UPDATE == UPDATE
--DELETE == DELETE

--5.1 (Research Teams Based in Russia)
SELECT rt.team_nm,
       rt.team_location
  FROM db_project.research_team rt
 WHERE rt.team_location LIKE '%Russia%';

--5.2 (Elements, that have more then 4 isotopes, their information)
SELECT e.element_symbol,
       e.element_type,
       e.electron_shell_configuration
  FROM db_project.element e
 WHERE e.isotopes_cnt >= 4;

--5.3 (People, that worked in USA)
SELECT s.scientist_nm
  FROM db_project.scientist s
 INNER JOIN db_project.research_team rt
    ON s.team_id = rt.team_id
 WHERE rt.team_location LIKE '%USA%';

--5.4 (Elements, which name starts with A, ordered by element_no)
SELECT e.element_nm
  FROM db_project.element e
 WHERE e.element_nm LIKE 'A%'
 ORDER BY e.element_no;

--5.5 (Teams that had any research on 2006-03-01)
SELECT DISTINCT rt.team_nm
  FROM db_project.research_team rt
 INNER JOIN db_project.research r
    ON rt.team_id = r.team_id
 WHERE r.start_dt <= cast('2006-03-01' AS DATE)
   AND r.end_dt >= cast('2006-03-01' AS DATE);

--5.6 (Insert new data in scientist table)
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt)
                          VALUES (1, 'Cilka Ensten', '1943-02-28', 10, '2019-03-23', '2019-04-10');

--5.7 (Insert new data in scientist table)
INSERT INTO db_project.scientist (scientist_id, scientist_nm, birth_dt, team_id, start_dt, end_dt)
                          VALUES (20, 'Melantha Easby', '1965-01-16', 13, '2018-09-01', '2019-04-10');

--5.8 (Update info about Fan Tanner, about his research team)
UPDATE db_project.scientist
   SET team_id = 10
 WHERE scientist_nm = 'Fan Tanner';

--5.9 (Delete information about Melantha Easby from scientist table about her first occupation)
DELETE
  FROM db_project.scientist
 WHERE scientist_nm = 'Melantha Easby'
   AND start_dt <= cast('2019-03-23' AS DATE);

--5.10 (Delete information about Trixy Lawlor)
DELETE
  FROM db_project.scientist
 WHERE scientist_nm = 'Trixy Lawlor';

--6---------------------------------------------------------------------------------------------------------------------

--6.1 (Elements, that were investigated in Russia, ordered by element_no)
SELECT DISTINCT exr.element_no,
       e.element_nm
  FROM db_project.research r
 INNER JOIN db_project.element_x_research exr
    ON r.research_id = exr.research_id
 INNER JOIN db_project.research_team rt
    ON r.team_id = rt.team_id
 INNER JOIN db_project.element e
    ON exr.element_no = e.element_no
 WHERE rt.team_location LIKE '%Russia%'
 ORDER BY 1;

--6.2 (Select research_team and count of their research, having research team name start with L)
SELECT rt.team_nm,
       count(r.team_id)
  FROM db_project.research_team rt
 INNER JOIN db_project.research r
    ON rt.team_id = r.team_id
 GROUP BY rt.team_nm
HAVING rt.team_nm LIKE 'L%';

--6.3 (Select amount of application on elements and their names, ordered by number of applications)
SELECT DISTINCT e.element_nm,
       count(exa.element_no) OVER (PARTITION BY exa.element_no) AS use_cnt
  FROM db_project.element_x_application exa
 INNER JOIN db_project.element e
    ON exa.element_no = e.element_no
 ORDER BY 2 DESC;

--6.4 (Ranking of elements according to their number of stabilised number of isotopes)
SELECT e.element_nm,
       dense_rank() OVER (ORDER BY e.isotopes_cnt DESC)
  FROM db_project.element e
 WHERE e.isotopes_cnt NOTNULL;

--6.5 (Select alphabetically first element from each group of number of isotopes, having isotopes
--     NOTNULL and ordered by of stabilised number of isotopes)
SELECT DISTINCT first_value(e.element_nm) OVER (PARTITION BY e.isotopes_cnt ORDER BY e.element_nm),
                e.isotopes_cnt
  FROM db_project.element e
 WHERE e.isotopes_cnt NOTNULL
 ORDER BY isotopes_cnt;

--8
--8.1 (View information about elements' application, where creator of it and year is known, order by element_no)

DROP VIEW IF EXISTS db_project.inventions;
CREATE OR REPLACE VIEW db_project.inventions AS
SELECT e.element_nm AS "Название элемента",
       exa.element_no AS "Номер элемента",
       ea.field AS "Область применения",
       exa.creator_nm AS "Создатель",
       exa.creation_year AS "Год создания",
       exa.description AS "Описание"
  FROM db_project.element_application ea
 INNER JOIN db_project.element_x_application exa
    ON ea.application_id = exa.application_id
 INNER JOIN db_project.element e
    ON e.element_no = exa.element_no
 WHERE exa.creator_nm NOTNULL
   AND exa.creation_year NOTNULL
 ORDER BY e.element_no;

--8.2 (List of scientists, that have been working on the element 116)

DROP VIEW IF EXISTS db_project.research_info;
CREATE OR REPLACE VIEW db_project.research_info AS
SELECT s.scientist_nm AS "Ученый",
       rt.team_id AS "Команда",
       r.start_dt AS "Начало изучения элемента 116 в данной команде",
       r.end_dt AS "Конец изучения элемента 116 в данной команде",
       s.start_dt AS "Начало работы над элементом 116 данного сотрудника"
  FROM db_project.scientist s
 INNER JOIN db_project.research_team rt
    ON s.team_id = rt.team_id
 INNER JOIN db_project.research r
    ON rt.team_id = r.team_id
 INNER JOIN db_project.element_x_research exr
    ON r.research_id = exr.research_id
 WHERE exr.element_no = 116
   AND r.start_dt < s.start_dt
   AND s.start_dt < r.end_dt;

--8.3 (List of scientists with number of their research made)

DROP VIEW IF EXISTS db_project.scientist_count;
CREATE OR REPLACE VIEW db_project.scientist_count AS
SELECT DISTINCT s.scientist_nm AS "Имя специалиста",
       count(r.research_id) OVER (PARTITION BY s.scientist_nm) AS "Количество проведенных исследований"
  FROM db_project.scientist s
 INNER JOIN db_project.research_team rt
    ON s.team_id = rt.team_id
 INNER JOIN db_project.research r
    ON rt.team_id = r.team_id
 WHERE s.end_dt > r.start_dt
   AND s.end_dt < r.end_dt;

--8.4 (Data about scientists with masked names and protected year of birth)

DROP VIEW IF EXISTS db_project.scientist_info;
CREATE OR REPLACE VIEW db_project.scientist_info AS
SELECT substring(s.scientist_nm FROM 1 FOR position(' ' in s.scientist_nm)) || '******' AS "Шифрованное имя",
       rt.team_nm AS "Исследовательская группа",
       max(substring(cast(s.birth_dt AS VARCHAR(10)) FROM 6 FOR 5)) AS "Дата рождения"
  FROM db_project.scientist s
 INNER JOIN db_project.research_team rt
    ON s.team_id = rt.team_id
 GROUP BY s.scientist_nm, rt.team_id
 ORDER BY rt.team_nm;

--8.5 (List of research teams with hidden city and address, giving only country information)

DROP VIEW IF EXISTS db_project.res_team_info;
CREATE OR REPLACE VIEW db_project.res_team_info AS
SELECT rt.team_nm AS "Исследовательская группа",
       substring(rt.team_location FROM 1 FOR position(',' in rt.team_location) - 1) AS "Страна нахождения"
  FROM db_project.research_team rt;

--8.6 (List of elements with examples of fields of their application)

DROP VIEW IF EXISTS db_project.el_field_application;
CREATE OR REPLACE VIEW db_project.el_field_application AS
SELECT e.element_nm AS "Название элемента",
       min(ea.field) AS "Область применения"
  FROM db_project.element e
 INNER JOIN db_project.element_x_application exa
    ON e.element_no = exa.element_no
 INNER JOIN db_project.element_application ea
    ON exa.application_id = ea.application_id
 GROUP BY e.element_nm
 ORDER BY e.element_nm ASC;

select element_nm
from db_project.element
where isotopes_cnt = null;