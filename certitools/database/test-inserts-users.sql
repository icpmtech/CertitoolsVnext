-- create contracts in the application and set the variables correctly
\set peicontractid 1
\set prvcontractid 2
\set companyid -1

--INSERT INTO contract (id, number, contractdesignation, licenses, validitystartdate, validityenddate, value, contractdesignationmaintenance, valuemaintenance, contractfile, contactname, contactposition, contactemail, contactphone, active, deleted, company_id, module_id) VALUES (100, '988/12', 'pei teste', 20, '2009-03-01 00:00:00', '2011-03-24 00:00:00', NULL, NULL, NULL, NULL, 'Marques José', NULL, NULL, NULL, true, false, -1, 2);
--INSERT INTO contract (id, number, contractdesignation, licenses, validitystartdate, validityenddate, value, contractdesignationmaintenance, valuemaintenance, contractfile, contactname, contactposition, contactemail, contactphone, active, deleted, company_id, module_id) VALUES (101, '5093/2008', 'prv teste', 1000, '2009-03-03 00:00:00', '2011-03-31 00:00:00', 1500, 'Lorem ipsum dolor sit amet, consectetur .', 500, NULL, 'António Marques', 'Engº Sénior', 'antonio@marques.cm', '2398754000', true, false, -1, 3);
INSERT INTO contract (id, number, contractdesignation, licenses, validitystartdate, validityenddate, value, contractdesignationmaintenance, valuemaintenance, contractfile, contactname, contactposition, contactemail, contactphone, active, deleted, company_id, module_id) VALUES (102, '5193/2008', 'leg teste', 1000, '2009-03-03 00:00:00', '2011-03-31 00:00:00', 1500, 'Lorem ipsum dolor sit amet, consectetur .', 500, NULL, 'António Marques', 'Engº Sénior', 'antonio@marques.cm', '2398754000', true, false, -1, 1);

-- permissions
INSERT INTO permission (id, name, contract_id) VALUES (-10, 'Gestor do PEI', :peicontractid);
INSERT INTO permission (id, name, contract_id) VALUES (-11, 'Gestor do PEI', :prvcontractid);

-- users
INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-10, false, 'cprv@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-10, 'user');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:prvcontractid, -10, '2009-01-01 00:00:00','2011-01-01 00:00:00');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-11, false, 'cpei@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-11, 'user');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:peicontractid, -11, '2009-01-01 00:00:00','2011-01-01 00:00:00');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-12, false, 'cleg@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-12, 'user');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (102, -12, '2009-01-01 00:00:00','2011-01-01 00:00:00');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-13, false, 'cuser@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-13, 'user');

-- users with special roles
INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-14, false, 'clegm@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-14, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-14, 'legislationmanager');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-15, false, 'cpm@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-15, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-15, 'clientpeimanager');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-16, false, 'cpm1@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-16, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-16, 'clientpeimanager');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:peicontractid, -16, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:peicontractid,-16,-10);

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-17, false, 'cpm2@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-17, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-17, 'clientpeimanager');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:prvcontractid, -17, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:prvcontractid,-17,-11);

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-18, false, 'cpm3@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-18, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-18, 'clientpeimanager');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:peicontractid, -18, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:prvcontractid, -18, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:peicontractid,-18,-10);
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:prvcontractid,-18,-11);

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-19, false, 'call@a.com', 'a', :companyid, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-19, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-19, 'clientpeimanager');
INSERT INTO users_role(users_id, roles_role) VALUES (-19, 'legislationmanager');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:peicontractid, -19, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (:prvcontractid, -19, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract(contract_id, user_id, validitystartdate, validityenddate) VALUES (102, -19, '2009-01-01 00:00:00','2011-01-01 00:00:00');
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:peicontractid,-19,-10);
INSERT INTO user_contract_permission (usercontracts_contract_id, usercontracts_user_id, permissions_id) VALUES (:prvcontractid,-19,-11);

-- add certitecna users
INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-20, false, 'legm@a.com', 'a', 1, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-20, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-20, 'legislationmanager');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-21, false, 'peim@a.com', 'a', 1, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-21, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-21, 'peimanager');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-23, false, 'cm@a.com', 'a', 1, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-23, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-23, 'contractmanager');

INSERT INTO "users"(id, deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI) VALUES (-24, false, 'all@a.com', 'a', 1, MD5('p'), 123, false, false, true, 0, false);
INSERT INTO users_role(users_id, roles_role) VALUES (-24, 'user');
INSERT INTO users_role(users_id, roles_role) VALUES (-24, 'contractmanager');
INSERT INTO users_role(users_id, roles_role) VALUES (-24, 'peimanager');
INSERT INTO users_role(users_id, roles_role) VALUES (-24, 'legislationmanager');
