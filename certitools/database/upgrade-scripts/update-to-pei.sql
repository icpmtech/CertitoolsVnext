update company set showfulllistpei = true;
update users set seenpei = false;

ALTER TABLE users ALTER externaluser TYPE character varying(255);
ALTER TABLE users ALTER COLUMN externaluser DROP NOT NULL;
update users set externaluser = null;

/* New configurations*/
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.pei.template.max.file.size', 1048576, 'java.lang.Long', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.pei.template.max.clickable.areas', 50, 'java.lang.Long', false);

/* Updated configuration*/
UPDATE configuration SET value='dd-MM-yyyy HH:mm' where key='certitools.date.hour.pattern';
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.users.list.default', 'all', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.companies.list.default', 'all', 'java.lang.String', true);

/* Insert role */ 
INSERT INTO "role"("role", description, iscertitecna) VALUES ('clientpeimanager', 'role.clientpeimanager', false);
