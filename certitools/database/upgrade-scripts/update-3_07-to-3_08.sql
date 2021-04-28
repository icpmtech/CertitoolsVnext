ALTER TABLE legaldocument ADD COLUMN legalComplianceValidation varchar(5000) NULL;
ALTER TABLE legaldocument ADD COLUMN referenceArticles varchar(5000) NULL;

ALTER TABLE contract ADD COLUMN firstInactivityMessageTemplateSubject varchar(200) NULL;
ALTER TABLE contract ADD COLUMN firstInactivityMessageTemplateBody varchar(500) NULL;

ALTER TABLE contract ADD COLUMN secondInactivityMessageTemplateSubject varchar(200) NULL;
ALTER TABLE contract ADD COLUMN secondInactivityMessageTemplateBody varchar(500) NULL;

ALTER TABLE contract ADD COLUMN firstInactivityMessageTerm bigint NULL;
UPDATE contract SET firstInactivityMessageTerm=0;
ALTER TABLE contract ALTER COLUMN firstinactivitymessageterm SET NOT NULL;

ALTER TABLE contract ADD COLUMN secondInactivityMessageTerm bigint NULL;
UPDATE contract SET secondInactivityMessageTerm=0;
ALTER TABLE contract ALTER COLUMN secondInactivityMessageTerm SET NOT NULL;

ALTER TABLE contract ADD COLUMN deleteUserTerm bigint NULL;
UPDATE contract SET deleteUserTerm=0;
ALTER TABLE contract ALTER COLUMN deleteUserTerm SET NOT NULL;

/* Users */
ALTER TABLE users ADD COLUMN lastPlanOrLegislationView timestamp without time zone NULL;
UPDATE users set lastPlanOrLegislationView=(SELECT LOCALTIMESTAMP);
ALTER TABLE users ALTER COLUMN lastPlanOrLegislationView SET NOT NULL;

/* user register */
update permission set userRegisterBasePermission = false;

insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Configura��es de inactividade', to_ascii(convert_to('configura��es de inactividade', 'latin1'), 'latin1'),'contract-inactivity', 'contractmanager', to_ascii(convert_to('configura��es de inactividade  o mecanismo de inactividade do certitools permite o envio de avisos, via email, a utilizadores inactivos,  bem como a sua remo��o do contrato de forma autom�tica.  o utilizador recebe 2 mensagens de aviso, ap�s os quais � removido do contrato.  caso o utilizador n�o esteja associado a nenhum outro contrato ser� removido do certitools.  o formul�rio de configura��o do mecanismo de inactividade permite definir os prazos para que se determine se um  utilizador est� inactivo, bem como o texto das mensagens enviadas ao utilizador.  ap�s o primeiro prazo de inactividade o utilizador recebe a primeira mensagem de aviso no seu email.  nesse dia come�a tamb�m a contar o tempo para o segundo prazo definido, ap�s o qual � enviada a segunda mensagem  de aviso. no final do terceiro prazo o utilizador � removido do contrato.  de real�ar que os prazos s�o cumulativos, por exemplo, caso a configura��o seja 60d + 30d + 5d o utilizador  ser� removido do contrato quando perfizer 95 dias de inactividade.  quando um contrato � criado o mecanismo encontra-se desligado por omiss�o. quando o mecanismo � ligado,  � feito o reset � data de �ltima actividade dos utilizadores associados ao contrato. cada vez que as  configura��es de inactividade s�o alteradas, � feito o reset. tamb�m quando um utilizador � associado a um  contrato � feito o reset.  notas:  caso algum dos prazos definidos sejam 0, o mecanismo de inactividade n�o est� a funcionar para o respectivo  contrato.  a data de �ltima actividade no sistema � contada apenas nas p�ginas capa de um plano e na pesquisa da  legisla��o (as p�ginas de entrada dos respectivos m�dulos).  os utilizadores com perfis de acesso especiais (gestores, administradores, etc) nunca s�o contemplados no  mecanismo de inactividade.  caso um utilizador esteja associado a v�rios contratos com o mecanismo ligado, ir� receber os respectivos  avisos de cada contrato.','latin1'), 'latin1'));

update users set language = 'PT';