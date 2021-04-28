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

insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Configurações de inactividade', to_ascii(convert_to('configurações de inactividade', 'latin1'), 'latin1'),'contract-inactivity', 'contractmanager', to_ascii(convert_to('configurações de inactividade  o mecanismo de inactividade do certitools permite o envio de avisos, via email, a utilizadores inactivos,  bem como a sua remoção do contrato de forma automática.  o utilizador recebe 2 mensagens de aviso, após os quais é removido do contrato.  caso o utilizador não esteja associado a nenhum outro contrato será removido do certitools.  o formulário de configuração do mecanismo de inactividade permite definir os prazos para que se determine se um  utilizador está inactivo, bem como o texto das mensagens enviadas ao utilizador.  após o primeiro prazo de inactividade o utilizador recebe a primeira mensagem de aviso no seu email.  nesse dia começa também a contar o tempo para o segundo prazo definido, após o qual é enviada a segunda mensagem  de aviso. no final do terceiro prazo o utilizador é removido do contrato.  de realçar que os prazos são cumulativos, por exemplo, caso a configuração seja 60d + 30d + 5d o utilizador  será removido do contrato quando perfizer 95 dias de inactividade.  quando um contrato é criado o mecanismo encontra-se desligado por omissão. quando o mecanismo é ligado,  é feito o reset à data de última actividade dos utilizadores associados ao contrato. cada vez que as  configurações de inactividade são alteradas, é feito o reset. também quando um utilizador é associado a um  contrato é feito o reset.  notas:  caso algum dos prazos definidos sejam 0, o mecanismo de inactividade não está a funcionar para o respectivo  contrato.  a data de última actividade no sistema é contada apenas nas páginas capa de um plano e na pesquisa da  legislação (as páginas de entrada dos respectivos módulos).  os utilizadores com perfis de acesso especiais (gestores, administradores, etc) nunca são contemplados no  mecanismo de inactividade.  caso um utilizador esteja associado a vários contratos com o mecanismo ligado, irá receber os respectivos  avisos de cada contrato.','latin1'), 'latin1'));

update users set language = 'PT';