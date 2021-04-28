/**
 *	Add Security Managment labels to companys
 **/
ALTER TABLE company ADD COLUMN gsclabelpt character varying(64);
ALTER TABLE company ADD COLUMN gsclabelen character varying(64);

/**
 *	Add Security Management Module to Module Table
 **/
INSERT INTO module(moduletype) VALUES ('GSC');

/**
 *	Add Front Office Upcoming Events Date Format
 **/
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.security.upcomingEvent.date.hour.pattern', 'd MMMM yyyy', 'java.lang.String', false);

-- Contract Permissions

INSERT INTO configuration(key, value, classname, editable) VALUES ('certitools.sm.basic', 'Básico', 'java.lang.String', false);
INSERT INTO configuration(key, value, classname, editable) VALUES ('certitools.sm.intermediate', 'Intermediário', 'java.lang.String', false);
INSERT INTO configuration(key, value, classname, editable) VALUES ('certitools.sm.expert', 'Expert', 'java.lang.String', false);


CREATE SEQUENCE sm_codesequence_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_codesequence ( 
	id bigint DEFAULT nextval(('codesequence_id_seq'::text)::regclass) NOT NULL,
	code varchar(50) NOT NULL,
	year integer,
	value integer DEFAULT 0 NOT NULL,
	contract_id bigint
);

CREATE SEQUENCE sm_activity_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_activity ( 
	id bigint DEFAULT nextval(('sm_activity_id_seq'::text)::regclass) NOT NULL,
	activitytype_id bigint NOT NULL,
	contract_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	name varchar(255) NOT NULL,
	duration varchar(255) NOT NULL,
	internalresponsible varchar(255) NOT NULL,
	externalentity varchar(255),
	datescheduled timestamp NOT NULL,
	closeddate timestamp,
	recurrence_id bigint,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE SEQUENCE sm_activitytype_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_activitytype ( 
	id bigint DEFAULT nextval(('sm_activitytype_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	contract_id bigint
);

CREATE SEQUENCE sm_anomaly_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_anomaly ( 
	id bigint DEFAULT nextval(('sm_anomaly_id_seq'::text)::regclass) NOT NULL,
	anomalytype varchar(255) NOT NULL,
	contract_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	datetime timestamp NOT NULL,
	description text NOT NULL,
	whodetected varchar(255),
	internalactors varchar(255),
	externalactors varchar(255),
	securityimpact_id bigint,
	qualifiedentity varchar(255),
	closeddate timestamp,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE SEQUENCE sm_chat_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_chat ( 
	id bigint DEFAULT nextval(('sm_chat_id_seq'::text)::regclass) NOT NULL,
	user_id bigint,
	emergencyuser_id bigint,
	message varchar(1000) NOT NULL,
	datetime timestamp DEFAULT now() NOT NULL,
	emergencyaction_id bigint,
	activity_id bigint,
	maintenance_id bigint,
	anomaly_id bigint,
	securityimpactwork_id bigint,
	correctiveaction_id bigint
);

CREATE SEQUENCE sm_correctiveaction_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_correctiveaction ( 
	id bigint DEFAULT nextval(('sm_correctiveaction_id_seq'::text)::regclass) NOT NULL,
	contract_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	startdate timestamp NOT NULL,
	description text NOT NULL,
	duration varchar(255) NOT NULL,
	closeddate timestamp,
	executionresponsible varchar(255) NOT NULL,
	notes text,
	activity_id bigint,
	anomaly_id bigint,
	securityimpactwork_id bigint,
	maintenance_id bigint,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE SEQUENCE sm_document_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_document ( 
	id bigint DEFAULT nextval(('sm_document_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	displayname varchar(255) NOT NULL,
	contenttype varchar(255) NOT NULL,
	contentlength integer DEFAULT 0 NOT NULL,
	content bytea NOT NULL,
	contract_id bigint NOT NULL,
	activity_id bigint,
	correctiveaction_id bigint,
	anomaly_id bigint,
	securityimpactwork_id bigint,
	maintenance_id bigint,
	emergencyaction_id bigint,
	equipment_id bigint
);

CREATE SEQUENCE sm_emergencyaction_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_emergencyaction ( 
	id bigint DEFAULT nextval(('sm_emergencyaction_id_seq'::text)::regclass) NOT NULL,
	contract_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	origin varchar(255) NOT NULL,
	description text NOT NULL,
	startdate timestamp NOT NULL,
	closeddate timestamp,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE SEQUENCE sm_emergencyuser_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_emergencyuser ( 
	id bigint DEFAULT nextval(('sm_emergencyuser_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	contract_id bigint NOT NULL
);

CREATE SEQUENCE sm_equipment_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_equipment ( 
	id bigint DEFAULT nextval(('sm_equipment_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	contract_id bigint
);

CREATE SEQUENCE sm_maintenancetype_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_maintenancetype ( 
	id bigint DEFAULT nextval(('sm_maintenancetype_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	contract_id bigint
);

CREATE SEQUENCE sm_maintenance_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_maintenance ( 
	id bigint DEFAULT nextval(('sm_maintenance_id_seq'::text)::regclass) NOT NULL,
	contract_id bigint NOT NULL,
	maintenancetype_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	datescheduled timestamp NOT NULL,
	equipment_id bigint NOT NULL,
	designation varchar(255) NOT NULL,
	description text NOT NULL,
	internalresponsible varchar(255) NOT NULL,
	externalentity varchar(255),
	recurrence_id bigint,
	closeddate timestamp,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE SEQUENCE sm_recurrence_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_recurrence ( 
	id bigint DEFAULT nextval(('sm_recurrence_id_seq'::text)::regclass) NOT NULL,
	recurrencetype_id bigint NOT NULL,
	warningdays integer NOT NULL,
	nextscheduleddate timestamp NOT NULL,
	active boolean DEFAULT true NOT NULL,
	entitytype varchar(50) NOT NULL
);

CREATE SEQUENCE sm_recurrencenotification_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_recurrencenotification ( 
	id bigint DEFAULT nextval(('sm_recurrencenotification_id_seq'::text)::regclass) NOT NULL,
	recurrence_id bigint NOT NULL,
	user_id bigint NOT NULL
);

CREATE SEQUENCE sm_recurrencetype_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_recurrencetype ( 
	id bigint DEFAULT nextval(('sm_recurrencetype_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	warningdays integer NOT NULL,
	intervaldays integer NOT NULL
);

CREATE SEQUENCE sm_risk_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_risk ( 
	id bigint DEFAULT nextval(('sm_risk_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL,
	preventivemeasures text
);

CREATE SEQUENCE sm_securityimpact_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_securityimpact ( 
	id bigint DEFAULT nextval(('sm_securityimpact_id_seq'::text)::regclass) NOT NULL,
	name varchar(255) NOT NULL
);

CREATE SEQUENCE sm_securityimpactwork_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_securityimpactwork ( 
	id bigint DEFAULT nextval(('sm_securityimpactwork_id_seq'::text)::regclass) NOT NULL,
	worktype varchar(255) NOT NULL,
	contract_id bigint NOT NULL,
	code varchar(255) NOT NULL,
	startdate timestamp NOT NULL,
	description text NOT NULL,
	responsible varchar(255) NOT NULL,
	qualifiedentity varchar(255),
	securityimpact_id bigint,
	duration varchar(255),
	closeddate timestamp,
	deleted boolean DEFAULT false NOT NULL,
	creationdate timestamp DEFAULT now() NOT NULL,
	changeddate timestamp DEFAULT now() NOT NULL,
	createdby_id bigint NOT NULL,
	changedby_id bigint NOT NULL
);

CREATE TABLE sm_securityimpactwork_risk ( 
	risk_id bigint NOT NULL,
	securityimpactwork_id bigint NOT NULL
);

CREATE SEQUENCE sm_emergencytoken_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_emergencytoken ( 
	id bigint DEFAULT nextval(('sm_emergencytoken_id_seq'::text)::regclass) NOT NULL,
	emergencyaction_id bigint NOT NULL,
	user_id bigint,
	emergencyuser_id bigint,
	accesstoken varchar(255) NOT NULL
);

CREATE SEQUENCE sm_submodule_id_seq INCREMENT 1 START 1;

CREATE TABLE sm_submodule ( 
	id bigint DEFAULT nextval(('sm_submodule_id_seq'::text)::regclass) NOT NULL,
	contract_id bigint NOT NULL,
	submoduletype varchar(255) NOT NULL
);


ALTER TABLE sm_emergencytoken ADD CONSTRAINT emergencytoken_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_codesequence ADD CONSTRAINT sequence_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_activity ADD CONSTRAINT activity_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_activitytype ADD CONSTRAINT activitytype_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_anomaly ADD CONSTRAINT anomaly_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_chat ADD CONSTRAINT chat_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_correctiveaction ADD CONSTRAINT correctiveaction_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_document ADD CONSTRAINT document_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_emergencyaction ADD CONSTRAINT emergencyaction_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_emergencyuser ADD CONSTRAINT emergencyuser_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_equipment ADD CONSTRAINT equipment_pkey 
	PRIMARY KEY (id);
	

ALTER TABLE sm_maintenancetype ADD CONSTRAINT maintenancetype_pkey 
	PRIMARY KEY (id);
	

ALTER TABLE sm_maintenance ADD CONSTRAINT maintenance_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_recurrence ADD CONSTRAINT recurrence_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_recurrencenotification ADD CONSTRAINT notification_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_recurrencetype ADD CONSTRAINT recurrencetype_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_risk ADD CONSTRAINT risk_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_securityimpact ADD CONSTRAINT securityimpact_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_securityimpactwork ADD CONSTRAINT securityimpactwork_pkey 
	PRIMARY KEY (id);


ALTER TABLE sm_securityimpactwork_risk ADD CONSTRAINT securityimpactwork_risk_pkey 
	PRIMARY KEY (risk_id, securityimpactwork_id);

	
ALTER TABLE sm_submodule ADD CONSTRAINT submodule_pkey 
	PRIMARY KEY (id);
	

ALTER TABLE sm_codesequence ADD CONSTRAINT FK_codesequence_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_activity ADD CONSTRAINT FK_activity_activitytype 
	FOREIGN KEY (activitytype_id) REFERENCES sm_activitytype (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_activity ADD CONSTRAINT FK_activity_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_activity ADD CONSTRAINT FK_activity_recurrence 
	FOREIGN KEY (recurrence_id) REFERENCES sm_recurrence (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_anomaly ADD CONSTRAINT FK_anomaly_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_anomaly ADD CONSTRAINT FK_anomaly_securityimpact 
	FOREIGN KEY (securityimpact_id) REFERENCES sm_securityimpact (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_activity 
	FOREIGN KEY (activity_id) REFERENCES sm_activity (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_anomaly 
	FOREIGN KEY (anomaly_id) REFERENCES sm_anomaly (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_correctiveaction 
	FOREIGN KEY (correctiveaction_id) REFERENCES sm_correctiveaction (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_emergencyaction 
	FOREIGN KEY (emergencyaction_id) REFERENCES sm_emergencyaction (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_emergencyuser 
	FOREIGN KEY (emergencyuser_id) REFERENCES sm_emergencyuser (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_maintenance 
	FOREIGN KEY (maintenance_id) REFERENCES sm_maintenance (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_users 
	FOREIGN KEY (user_id) REFERENCES users (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_chat ADD CONSTRAINT FK_chat_securityimpactwork 
	FOREIGN KEY (securityimpactwork_id) REFERENCES sm_securityimpactwork (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_correctiveaction ADD CONSTRAINT FK_correctiveaction_activity 
	FOREIGN KEY (activity_id) REFERENCES sm_activity (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_correctiveaction ADD CONSTRAINT FK_correctiveaction_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_correctiveaction ADD CONSTRAINT FK_correctiveaction_maintenance 
	FOREIGN KEY (maintenance_id) REFERENCES sm_maintenance (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_correctiveaction ADD CONSTRAINT FK_correctiveaction_anomaly 
	FOREIGN KEY (anomaly_id) REFERENCES sm_anomaly (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_correctiveaction ADD CONSTRAINT FK_correctiveaction_securityimpactwork 
	FOREIGN KEY (securityimpactwork_id) REFERENCES sm_securityimpactwork (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_activity 
	FOREIGN KEY (activity_id) REFERENCES sm_activity (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_emergencyaction 
	FOREIGN KEY (emergencyaction_id) REFERENCES sm_emergencyaction (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_maintenance 
	FOREIGN KEY (maintenance_id) REFERENCES sm_maintenance (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_anomaly 
	FOREIGN KEY (anomaly_id) REFERENCES sm_anomaly (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_correctiveaction 
	FOREIGN KEY (correctiveaction_id) REFERENCES sm_correctiveaction (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_securityimpactwork 
	FOREIGN KEY (securityimpactwork_id) REFERENCES sm_securityimpactwork (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_document ADD CONSTRAINT FK_document_equipment 
	FOREIGN KEY (equipment_id) REFERENCES sm_equipment (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_emergencyaction ADD CONSTRAINT FK_emergencyaction_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_emergencyuser ADD CONSTRAINT FK_emergencyuser_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_maintenance ADD CONSTRAINT FK_maintenance_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_maintenance ADD CONSTRAINT FK_maintenance_maintenancetype
	FOREIGN KEY (maintenancetype_id) REFERENCES sm_maintenancetype (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_maintenance ADD CONSTRAINT FK_maintenance_equipment 
	FOREIGN KEY (equipment_id) REFERENCES sm_equipment (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_maintenance ADD CONSTRAINT FK_maintenance_recurrence 
	FOREIGN KEY (recurrence_id) REFERENCES sm_recurrence (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_recurrence ADD CONSTRAINT FK_recurrence_recurrence_type 
	FOREIGN KEY (recurrencetype_id) REFERENCES sm_recurrencetype (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_recurrencenotification ADD CONSTRAINT FK_notification_recurrence 
	FOREIGN KEY (recurrence_id) REFERENCES sm_recurrence (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_recurrencenotification ADD CONSTRAINT FK_notification_users 
	FOREIGN KEY (user_id) REFERENCES users (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_securityimpactwork ADD CONSTRAINT FK_securityimpactwork_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_securityimpactwork ADD CONSTRAINT FK_securityimpactwork_securityimpact 
	FOREIGN KEY (securityimpact_id) REFERENCES sm_securityimpact (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_securityimpactwork_risk ADD CONSTRAINT FK_securityimpactwork_risk_risk 
	FOREIGN KEY (risk_id) REFERENCES sm_risk (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_securityimpactwork_risk ADD CONSTRAINT FK_securityimpactwork_risk_securityimpactwork 
	FOREIGN KEY (securityimpactwork_id) REFERENCES sm_securityimpactwork (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_emergencytoken ADD CONSTRAINT FK_emergencytoken_sm_emergencyuser 
	FOREIGN KEY (emergencyuser_id) REFERENCES sm_emergencyuser (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_emergencytoken ADD CONSTRAINT FK_emergencytoken_users 
	FOREIGN KEY (user_id) REFERENCES users (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_emergencytoken ADD CONSTRAINT FK_emergencytoken_sm_emergencyaction 
	FOREIGN KEY (emergencyaction_id) REFERENCES sm_emergencyaction (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_submodule ADD CONSTRAINT FK_submodule_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sm_equipment ADD CONSTRAINT FK_equipment_contract 
	FOREIGN KEY (contract_id) REFERENCES contract (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;


/**
 *	Add logo and cover pictures to contracts
 **/
ALTER TABLE contract ADD COLUMN sm_logopicture_id bigint;
ALTER TABLE contract ADD COLUMN sm_coverpicture_id bigint;
ALTER TABLE contract ADD CONSTRAINT FK_contract_sm_logopicture 
	FOREIGN KEY (sm_logopicture_id) REFERENCES sm_document (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE contract ADD CONSTRAINT FK_contract_sm_coverpicture 
	FOREIGN KEY (sm_coverpicture_id) REFERENCES sm_document (id)
ON DELETE NO ACTION ON UPDATE NO ACTION;


/**
 *	Insert recurrence types
 **/
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('Anual', 30, 365);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('Mensal', 7, 30);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('Semanal', 3, 7);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('Trimestral', 7, 90);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('Semestral', 30, 180);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('De 2 em 2 anos', 30, 730);
INSERT INTO public.sm_recurrencetype (name, warningdays, intervaldays) VALUES ('De 3 em 3 anos', 30, 1095);

/**
 *	Insert activity default types
 **/
INSERT INTO public.sm_activitytype (name) VALUES ('Inspeções regulares');
INSERT INTO public.sm_activitytype (name) VALUES ('Inspeções extraordinárias');
INSERT INTO public.sm_activitytype (name) VALUES ('Ações de formação');
INSERT INTO public.sm_activitytype (name) VALUES ('Treinos e simulacros');
INSERT INTO public.sm_activitytype (name) VALUES ('Reexame, revisão, atualização documentos');
INSERT INTO public.sm_activitytype (name) VALUES ('Auditorias');
INSERT INTO public.sm_activitytype (name) VALUES ('Reunião de revisão anual do Sistema de gestão, consulta aos trabalhadores, etc.');

/**
 *	Insert security impact types
 **/
INSERT INTO public.sm_securityimpact (name) VALUES ('Reduzido');
INSERT INTO public.sm_securityimpact (name) VALUES ('Médio');
INSERT INTO public.sm_securityimpact (name) VALUES ('Elevado');

/**
 *	Insert risks
 **/
INSERT INTO public.sm_risk (name, preventivemeasures) VALUES ('Incêndio', 'Afastar ou proteger os materiais combustíveis ou inflamáveis próximos \nGarantir presença de meios 1ª intervenção (extintores ou carretéis), no local onde vai ser desenvolvido o trabalho \nColocação de sinalização de segurança');
INSERT INTO public.sm_risk (name, preventivemeasures) VALUES ('Projecção de partículas incandescentes', 'Utilizar Equipamento de Proteção Individual adequado \nAfastar ou proteger (com materiais incombustíveis, mantas ignífugas, etc.) os materiais combustíveis ou inflamáveis próximos \nGarantir presença de meios 1ª intervenção (extintores ou carretéis), no local onde vai ser desenvolvido o trabalho \nColocação de sinalização de segurança');
INSERT INTO public.sm_risk (name, preventivemeasures) VALUES ('Atmosferas explosivas', 'Utilizar Equipamento de Proteção Individual adequado \nUtilizar máquinas e equipamentos com protecção contra explosões adequada \nUtilizar ferramentas anti-deflagrantes \nSe o trabalho for desenvolvido em espaços fechados, garantir a presença de ventilação forçada \nSe necessário monitorizar a explosividade durante a operação');
INSERT INTO public.sm_risk (name, preventivemeasures) VALUES ('Derrame', 'Utilizar Equipamento de Proteção Individual adequado \nGarantir presença de meios de contenção de derrames em local próximo');

/**
 *	Insert maintenance types
 **/
INSERT INTO public.sm_maintenancetype (name) VALUES ('Manutenção Preventiva');
INSERT INTO public.sm_maintenancetype (name) VALUES ('Verificação');

/**
 *	Insert equipments
 **/
INSERT INTO public.sm_equipment (name) VALUES ('Sem equipamento');

/**
 *	Insert configurations
 **/
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.recurrence.timer.hour', '7', 'java.lang.Integer', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.recurrenceNotificationEmail.subject', 'CertiTools - Aviso automático', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.recurrenceNotificationEmail.body', 'Faltam {0} dias para o evento {1}.\nEntidade: {2}\nInstalação: {3}\n\nAceda através do link:\n {4} \n\nA equipa CertiTools.', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.eventCreatedEmail.subject', 'CertiTools - Nova {0}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.eventCreatedEmail.body', 'Foi criada uma nova {0}.\nEntidade: {1}\nInstalação: {2}\n\nAceda através do link:\n {3} \n\nA equipa CertiTools.', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.eventClosedEmail.subject', 'CertiTools - Foi fechada uma {0}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.eventClosedEmail.body', 'Foi fechada uma {0}.\nEntidade: {1}\nInstalação: {2}\n\nAceda através do link:\n {3} \n\nA equipa CertiTools.', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.chatMessagesNotification.subject', 'CertiTools - Uma {0} tem novas mensagens', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.chatMessagesNotification.body', 'Foram adicionadas mensagens a uma {0}.\nEntidade: {1}\nInstalação: {2}\n\nAceda através do link:\n {3} \n\nA equipa CertiTools.', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.activityCodeSequencePattern', 'ACTV-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.anomalyCodeSequencePattern', 'ANOM-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.occurrenceCodeSequencePattern', 'OCOR-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.modificationCodeSequencePattern', 'MOD-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.workAuthorizationCodeSequencePattern', 'AT-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.correctiveActionCodeSequencePattern', 'APC-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.maintenanceCodeSequencePattern', 'MNT-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);
INSERT INTO public.configuration (key, value, classname, editable) VALUES ('certitools.sm.emergencyActionCodeSequencePattern', 'EMRG-{0,number,#00000}-{1,date,yy}', 'java.lang.String', FALSE);


