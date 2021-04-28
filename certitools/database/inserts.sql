CREATE LANGUAGE plpgsql;

-- CREATE FUNCTION to_ascii(bytea, name) RETURNS text STRICT AS 'to_ascii_encname' LANGUAGE internal;
CREATE FUNCTION to_ascii(bytea, name) 
RETURNS text STRICT AS 
$$
declare
    str varchar;
    return_str varchar;
begin
    str = convert_from($1, 'latin1');
    
    SELECT translate(str,'ÀÁÂÃÄÅĀĂĄÈÉÊËĒĔĖĘĚÌÍÎÏĨĪĮİÒÓÔÕÖØŌŎŐÙÚÛÜŨŪŬŮŰŲàáâãäåāăąèéêëēĕėęěìíîïĩīĭįòóôõöøōŏőùúûüũūŭůųÇçÑñÝýÿĆćĈĉĊċČčĎďĐđĜĝĞğĠġĢģĤĥĦħ', 
           'AAAAAAAAAEEEEEEEEEIIIIIIIIOOOOOOOOOUUUUUUUUUUaaaaaaaaaeeeeeeeeeiiiiiiiiooooooooouuuuuuuuuCcNnYyyCcCcCcCcDdDdGgGgGgGgHhHh') into return_str; 
           
    return return_str;
end;
$$ 
LANGUAGE 'plpgsql';


-- certitecna company
INSERT INTO company(deleted, "name", address, phone, fiscalnumber, "language", active, showFullListPEI) VALUES (false, 'CertiTecna', 'Rua de Moçambique, n.º 7 1170-242 Lisboa Portugal', '+351 218 148 011', '123456789', 'PT', true, false);

-- person
INSERT INTO "users"(deleted, "email", "name", "company_id", "password", "fiscalnumber", "externaluser", "uniquesession", "active", "sessionsactive", seenPEI, lastPlanOrLegislationView, "language","activatepassnotificationsend" ) VALUES (false, 'admin', 'Administrador', 1 , MD5('admin'),'123456789', false, false, true, 0, false, (SELECT LOCALTIMESTAMP), 'EN', true);

-- role
INSERT INTO "role"("role", description, iscertitecna) VALUES ('user', 'role.user', false);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('administrator', 'role.administrator', true);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('contractmanager', 'role.contractmanager', true);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('legislationmanager', 'role.legislationmanager', true);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('peimanager', 'role.peimanager', true);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('clientcontractmanager', 'role.clientcontractmanager', false);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('clientpeimanager', 'role.clientpeimanager', false);
INSERT INTO "role"("role", description, iscertitecna) VALUES ('userguest', 'role.userguest', false);

-- person_role
INSERT INTO users_role(users_id, roles_role) VALUES (1, 'administrator');
INSERT INTO users_role(users_id, roles_role) VALUES (1, 'user');

--configurations
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.newsletter.timer.hour', 6, 'java.lang.Integer', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.newsletter.year.pattern', 'yy', 'java.lang.String', false);                                                     
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.application.domain', 'http://localhost', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.newsletter.date.pattern', 'dd-MMMMM', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.date.pattern', 'dd-MM-yyyy', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.date.pattern.news', 'dd MMM. yyyy', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.date.pattern.calendar', 'dd-mm-yy', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.date.hour.pattern', 'dd-MM-yyyy HH:mm', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.info.email', 'info@certitecna.com', 'javax.mail.internet.InternetAddress', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.legal.document.newsletter.header', 'this is the header', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.legal.document.newsletter.footer', 'this is the footer', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.legal.document.newsletter.subject', 'this is the subject', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.legal.document.summary.truncate', 25, 'java.lang.Integer', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.session.timeout', 30, 'java.lang.Integer', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.statistics.filter.max.days', 90, 'java.lang.Integer', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.defaultLanguage', 'PT', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.pagelistsize', '10', 'java.lang.Integer', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.licensefilename', 'license.properties', 'java.lang.String', false);
/* Note: Full path in user disk*/
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.licensefiledirectory', '/opt/jboss/', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.certitecnaId', '1', 'java.lang.Integer', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.userrole', 'user', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.adminId', '1', 'java.lang.Integer', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.activationEmail.subject', 'Activação da sua conta no Certitools', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.activationEmail.messageHeader', 'Bem vindo ao Certitools, \n\nPara activar a sua conta visite o seguinte link: ', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.activationEmail.messageFooter', '\n--\nCertitools', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.search.example1', 'Decreto-Lei', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.search.example2', 'Texto a Definir', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.pei.template.max.file.size', 1048576, 'java.lang.Long', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.pei.template.max.clickable.areas', 50, 'java.lang.Long', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.users.list.default', 'all', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.companies.list.default', 'all', 'java.lang.String', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.masterpassword', md5('asdasd123'), 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.masterpassword.expiryDate', '1230768000', 'java.lang.Long', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.masterpassword.author', 'admin', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.asposelicensefile', '/opt/jboss/Aspose.Words.lic', 'java.lang.String', false);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.maxImageWidth', 545, 'java.lang.Long', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.removeStyles', 0, 'java.lang.Long', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.centerTables', 1, 'java.lang.Long', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.repeatHeaderTables', 1, 'java.lang.Long', true);

-- news categories
INSERT INTO newscategory("name") VALUES ('Notícias');
INSERT INTO newscategory("name") VALUES ('Novidades');

-- modules
INSERT INTO module(moduletype) VALUES ('LEGISLATION');
INSERT INTO module(moduletype) VALUES ('PEI');
INSERT INTO module(moduletype) VALUES ('PRV');

--legal document types
INSERT INTO legaldocumenttype("name") VALUES ('Acórdão');
INSERT INTO legaldocumenttype("name") VALUES ('Acórdão (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Acordo');
INSERT INTO legaldocumenttype("name") VALUES ('Alvará');
INSERT INTO legaldocumenttype("name") VALUES ('Anúncio');
INSERT INTO legaldocumenttype("name") VALUES ('Anúncio (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Anúncio de concurso urgente');
INSERT INTO legaldocumenttype("name") VALUES ('Anúncio de procedimento');
INSERT INTO legaldocumenttype("name") VALUES ('Assento');
INSERT INTO legaldocumenttype("name") VALUES ('Aviso');
INSERT INTO legaldocumenttype("name") VALUES ('Aviso (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Aviso de contumácia');
INSERT INTO legaldocumenttype("name") VALUES ('Aviso de prorrogação de prazo');
INSERT INTO legaldocumenttype("name") VALUES ('Aviso do Banco de Portugal');
INSERT INTO legaldocumenttype("name") VALUES ('Balancete');
INSERT INTO legaldocumenttype("name") VALUES ('Contrato');
INSERT INTO legaldocumenttype("name") VALUES ('Contrato (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Decisão');
INSERT INTO legaldocumenttype("name") VALUES ('Decisão (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Declaração');
INSERT INTO legaldocumenttype("name") VALUES ('Declaração (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Declaração de Rectificação');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto do Governo');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto do Ministro da República');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto do Ministro da República para a Região Autónoma da Madeira');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto do Ministro da República para a Região Autónoma dos Açores');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto do Presidente da República');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto Legislativo Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto Regulamentar');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto Regulamentar Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Decreto-Lei');
INSERT INTO legaldocumenttype("name") VALUES ('Deliberação');
INSERT INTO legaldocumenttype("name") VALUES ('Deliberação (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Deliberação da Assembleia da República');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho conjunto');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho do Ministro da Economia');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho normativo');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho Regulamentar');
INSERT INTO legaldocumenttype("name") VALUES ('Despacho Regulamentar Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Directiva');
INSERT INTO legaldocumenttype("name") VALUES ('Directiva da AACS');
INSERT INTO legaldocumenttype("name") VALUES ('Edital');
INSERT INTO legaldocumenttype("name") VALUES ('Edital (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Édito');
INSERT INTO legaldocumenttype("name") VALUES ('Instrução');
INSERT INTO legaldocumenttype("name") VALUES ('Instruções');
INSERT INTO legaldocumenttype("name") VALUES ('Jurisprudência');
INSERT INTO legaldocumenttype("name") VALUES ('Lei');
INSERT INTO legaldocumenttype("name") VALUES ('Lei Constitucional');
INSERT INTO legaldocumenttype("name") VALUES ('Lei Orgânica');
INSERT INTO legaldocumenttype("name") VALUES ('Listagem');
INSERT INTO legaldocumenttype("name") VALUES ('Listagem (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Louvor');
INSERT INTO legaldocumenttype("name") VALUES ('Louvor (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Mapa');
INSERT INTO legaldocumenttype("name") VALUES ('Mapa (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Mapa Oficial');
INSERT INTO legaldocumenttype("name") VALUES ('Moção');
INSERT INTO legaldocumenttype("name") VALUES ('Moção de Confiança');
INSERT INTO legaldocumenttype("name") VALUES ('Parecer');
INSERT INTO legaldocumenttype("name") VALUES ('Parecer do Conselho de Estado');
INSERT INTO legaldocumenttype("name") VALUES ('Portaria');
INSERT INTO legaldocumenttype("name") VALUES ('Portaria (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Preâmbulo Decreto Lei');
INSERT INTO legaldocumenttype("name") VALUES ('Protocolo');
INSERT INTO legaldocumenttype("name") VALUES ('Recomendação');
INSERT INTO legaldocumenttype("name") VALUES ('Recomendação do Conselho');
INSERT INTO legaldocumenttype("name") VALUES ('Rectificação');
INSERT INTO legaldocumenttype("name") VALUES ('Rectificação (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Rectificação de contumácia');
INSERT INTO legaldocumenttype("name") VALUES ('Recurso');
INSERT INTO legaldocumenttype("name") VALUES ('Regimento');
INSERT INTO legaldocumenttype("name") VALUES ('Regimento da Assembleia da República');
INSERT INTO legaldocumenttype("name") VALUES ('Regimento do Conselho de Estado');
INSERT INTO legaldocumenttype("name") VALUES ('Regulamento');
INSERT INTO legaldocumenttype("name") VALUES ('Regulamento CE');
INSERT INTO legaldocumenttype("name") VALUES ('Regulamento da CMVM');
INSERT INTO legaldocumenttype("name") VALUES ('Regulamento interno');
INSERT INTO legaldocumenttype("name") VALUES ('Relatório');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução (extracto)');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução da Assembleia da República');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução da Assembleia Legislativa Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução da Assembleia Legislativa Regional dos Açores');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução da Assembleia Regional');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução do Conselho de Ministros');
INSERT INTO legaldocumenttype("name") VALUES ('Resolução do Tribunal de Contas');

-- country
INSERT INTO country (iso, name) VALUES
('AD', 'Andorra'),
('AE', 'Emiratos Árabes Unidos'),
('AF', 'Afeganistão'),
('AG', 'Antigua e Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albânia'),
('AM', 'Arménia'),
('AN', 'Antilhas Holandesas'),
('AO', 'Angola'),
('AQ', 'Antárctida'),
('AR', 'Argentina'),
('AS', 'Samoa Americana'),
('AT', 'Áustria'),
('AU', 'Austrália'),
('AW', 'Aruba'),
('AX', 'Åland, Ilhas'),
('AZ', 'Azerbeijão'),
('BA', 'Bósnia-Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Bélgica'),
('BF', 'Burkina Faso'),
('BG', 'Bulgária'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BM', 'Bermuda'),
('BN', 'Brunei'),
('BO', 'Bolívia'),
('BR', 'Brasil'),
('BS', 'Bahamas'),
('BT', 'Butão'),
('BV', 'Bouvet, Ilha'),
('BW', 'Botswana'),
('BY', 'Bielo-Rússia'),
('BZ', 'Belize'),
('CA', 'Canadá'),
('CC', 'Cocos, Ilhas'),
('CD', 'Congo, República Democrática do (antigo Zaire)'),
('CF', 'Centro-africana, República'),
('CG', 'Congo, República do'),
('CH', 'Suíça'),
('CI', 'Costa do Marfim'),
('CK', 'Cook, Ilhas'),
('CL', 'Chile'),
('CM', 'Camarões'),
('CN', 'China'),
('CO', 'Colômbia'),
('CR', 'Costa Rica'),
('CU', 'Cuba'),
('CV', 'Cabo Verde'),
('CX', 'Christmas, Ilha'),
('CY', 'Chipre'),
('CZ', 'Checa, República'),
('DE', 'Alemanha'),
('DJ', 'Djibouti'),
('DK', 'Dinamarca'),
('DM', 'Dominica'),
('DO', 'Dominicana, República'),
('DZ', 'Argélia'),
('EC', 'Equador'),
('EE', 'Estónia'),
('EG', 'Egipto'),
('EH', 'Saara Ocidental'),
('ER', 'Eritreia'),
('ES', 'Espanha'),
('ET', 'Etiópia'),
('FI', 'Finlândia'),
('FJ', 'Fiji'),
('FK', 'Malvinas, Ilhas (Falkland)'),
('FM', 'Micronésia, Estados Federados da'),
('FO', 'Faroe, Ilhas'),
('FR', 'França'),
('GA', 'Gabão'),
('GB', 'Reino Unido da Grã-Bretanha e Irlanda do Norte'),
('GD', 'Grenada'),
('GE', 'Geórgia'),
('GF', 'Guiana Francesa'),
('GG', 'Guernsey'),
('GH', 'Gana'),
('GI', 'Gibraltar'),
('GL', 'Gronelândia'),
('GM', 'Gâmbia'),
('GN', 'Guiné-Conacri'),
('GP', 'Guadeloupe'),
('GQ', 'Guiné Equatorial'),
('GR', 'Grécia'),
('GS', 'Geórgia do Sul e Sandwich do Sul, Ilhas'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guiné-Bissau'),
('GY', 'Guiana'),
('HK', 'Hong Kong'),
('HM', 'Heard e Ilhas McDonald, Ilha'),
('HN', 'Honduras'),
('HR', 'Croácia'),
('HT', 'Haiti'),
('HU', 'Hungria'),
('ID', 'Indonésia'),
('IE', 'Irlanda'),
('IL', 'Israel'),
('IM', 'Man, Ilha de'),
('IN', 'Índia'),
('IO', 'Território Britânico do Oceano Índico'),
('IQ', 'Iraque'),
('IR', 'Irão'),
('IS', 'Islândia'),
('IT', 'Itália'),
('JE', 'Jersey'),
('JM', 'Jamaica'),
('JO', 'Jordânia'),
('JP', 'Japão'),
('KE', 'Quénia'),
('KG', 'Quirguistão'),
('KH', 'Cambodja'),
('KI', 'Kiribati'),
('KM', 'Comores'),
('KN', 'São Cristóvão e Névis (Saint Kitts e Nevis)'),
('KP', 'Coreia, República Democrática da (Coreia do Norte)'),
('KR', 'Coreia do Sul'),
('KW', 'Kuwait'),
('KY', 'Cayman, Ilhas'),
('KZ', 'Cazaquistão'),
('LA', 'Laos'),
('LB', 'Líbano'),
('LC', 'Santa Lúcia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Libéria'),
('LS', 'Lesoto'),
('LT', 'Lituânia'),
('LU', 'Luxemburgo'),
('LV', 'Letónia'),
('LY', 'Líbia'),
('MA', 'Marrocos'),
('MC', 'Mónaco'),
('MD', 'Moldávia'),
('ME', 'Montenegro'),
('MG', 'Madagáscar'),
('MH', 'Marshall, Ilhas'),
('MK', 'Macedónia, República da'),
('ML', 'Mali'),
('MM', 'Myanmar (antiga Birmânia)'),
('MN', 'Mongólia'),
('MO', 'Macau'),
('MP', 'Marianas Setentrionais'),
('MQ', 'Martinica'),
('MR', 'Mauritânia'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Maurícia'),
('MV', 'Maldivas'),
('MW', 'Malawi'),
('MX', 'México'),
('MY', 'Malásia'),
('MZ', 'Moçambique'),
('NA', 'Namíbia'),
('NC', 'Nova Caledónia'),
('NE', 'Níger'),
('NF', 'Norfolk, Ilha'),
('NG', 'Nigéria'),
('NI', 'Nicarágua'),
('NL', 'Países Baixos (Holanda)'),
('NO', 'Noruega'),
('NP', 'Nepal'),
('NR', 'Nauru'),
('NU', 'Niue'),
('NZ', 'Nova Zelândia (Aotearoa)'),
('OM', 'Oman'),
('PA', 'Panamá'),
('PE', 'Peru'),
('PF', 'Polinésia Francesa'),
('PG', 'Papua-Nova Guiné'),
('PH', 'Filipinas'),
('PK', 'Paquistão'),
('PL', 'Polónia'),
('PM', 'Saint Pierre et Miquelon'),
('PN', 'Pitcairn'),
('PR', 'Porto Rico'),
('PS', 'Palestina'),
('PT', 'Portugal'),
('PW', 'Palau'),
('PY', 'Paraguai'),
('QA', 'Qatar'),
('RE', 'Reunião'),
('RO', 'Roménia'),
('RS', 'Sérvia'),
('RU', 'Rússia'),
('RW', 'Ruanda'),
('SA', 'Arábia Saudita'),
('SB', 'Salomão, Ilhas'),
('SC', 'Seychelles'),
('SD', 'Sudão'),
('SE', 'Suécia'),
('SG', 'Singapura'),
('SH', 'Santa Helena'),
('SI', 'Eslovénia'),
('SJ', 'Svalbard e Jan Mayen'),
('SK', 'Eslováquia'),
('SL', 'Serra Leoa'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somália'),
('SR', 'Suriname'),
('ST', 'São Tomé e Príncipe'),
('SV', 'El Salvador'),
('SY', 'Síria'),
('SZ', 'Suazilândia'),
('TC', 'Turks e Caicos'),
('TD', 'Chade'),
('TF', 'Terras Austrais e Antárticas Francesas (TAAF)'),
('TG', 'Togo'),
('TH', 'Tailândia'),
('TJ', 'Tajiquistão'),
('TK', 'Toquelau'),
('TL', 'Timor-Leste'),
('TM', 'Turquemenistão'),
('TN', 'Tunísia'),
('TO', 'Tonga'),
('TR', 'Turquia'),
('TT', 'Trindade e Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan'),
('TZ', 'Tanzânia'),
('UA', 'Ucrânia'),
('UG', 'Uganda'),
('UM', 'Menores Distantes dos Estados Unidos, Ilhas'),
('US', 'Estados Unidos da América'),
('UY', 'Uruguai'),
('UZ', 'Usbequistão'),
('VA', 'Vaticano'),
('VC', 'São Vicente e Granadinas'),
('VE', 'Venezuela'),
('VG', 'Virgens Britânicas, Ilhas'),
('VI', 'Virgens Americanas, Ilhas'),
('VN', 'Vietname'),
('VU', 'Vanuatu'),
('WF', 'Wallis e Futuna'),
('WS', 'Samoa (Samoa Ocidental)'),
('YE', 'Iémen'),
('YT', 'Mayotte'),
('ZA', 'África do Sul'),
('ZM', 'Zâmbia'),
('ZW', 'Zimbabwe');

INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter)
      VALUES (1, 'Safety', 1, 0, 0);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter)
      VALUES (2, 'Ambiente', 1, 0, 0);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter)
      VALUES (3, 'Security', 1, 0, 0);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter)
      VALUES (4, 'Protecção Civil', 1, 0, 0);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (5, 'SHT', 2, 0, 0, 1);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (6, 'Ar', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (7, 'Armas e Munições', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (8, 'Jornalistas', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (9, 'Geral', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (10, 'Entidades Públicas', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (11, 'Segurança Privada', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (12, 'Canídeos', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (13, 'Transporte de Valores', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (14, 'Estabelecimentos e Actividades', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (15, 'Desporto', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (16, 'Alarmes', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (17, 'Videovigilância', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (18, 'Protecção de Dados', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (19, 'Códigos', 2, 0, 0, 3);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (20, 'Licenciamento Industrial', 2, 0, 0, 1);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (21, 'Substâncias Perigosas', 2, 0, 0, 1);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (22, 'Segurança de Pessoas', 2, 0, 0, 1);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (23, 'Municipal', 2, 0, 0, 4);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (24, 'Nacional', 2, 0, 0, 4);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (25, 'Distrital', 2, 0, 0, 4);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (26, 'Protecção Civil', 2, 0, 0, 4);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (27, 'Ruído', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (28, 'Resíduos', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (29, 'Estudos Impacte Ambiental', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (30, 'Prevenção e controlo integrados da poluição (PCIP)', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (31, 'Legislação de base', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (32, 'Água', 2, 0, 0, 2);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (33, 'Máquinas e equipamentos', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (34, 'Emissão de poluentes gasosos', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (35, 'Geral', 3, 0, 0, 7);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (36, 'Estatuto Jornalista', 3, 0, 0, 8);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (37, 'Ilícitos', 3, 0, 0, 9);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (38, 'PSP', 3, 0, 0, 10);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (39, 'Uniformes', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (40, 'Secretaria-Geral MAI', 3, 0, 0, 10);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (41, 'Inspecção Geral MAI', 3, 0, 0, 10);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (42, 'GNR', 3, 0, 0, 10);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (43, 'Formação', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (44, 'Licenciamento', 3, 0, 0, 12);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (45, 'Vigilância Sanitária', 3, 0, 0, 12);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (46, 'Identificação Eletrónica', 3, 0, 0, 12);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (47, 'Segurança Privada', 3, 0, 0, 12);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (48, 'Canídeos', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (49, 'Transporte de Valores', 3, 0, 0, 13);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (50, 'Segurança Portuária', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (51, 'Aviação Civil', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (52, 'Bares, Discotecas e Boîtes', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (53, 'Recintos Desportivos', 3, 0, 0, 15);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (54, 'Assistentes desportivos', 3, 0, 0, 15);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (55, 'Desporto', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (56, 'Taxas instalação', 3, 0, 0, 16);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (57, 'Ligação a Centrais', 3, 0, 0, 16);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (58, 'Requisitos Centrais Recepção', 3, 0, 0, 16);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (59, 'Rodoviária', 3, 0, 0, 17);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (60, 'Gravações Videovigilância', 3, 0, 0, 18);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (61, 'Forças de Segurança', 3, 0, 0, 17);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (62, 'Videovigilância', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (63, 'Comunicações Electrónicas', 3, 0, 0, 18);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (64, 'Base Dados Pessoais', 3, 0, 0, 18);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (65, 'Código do Processo Penal', 3, 0, 0, 19);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (66, 'Exercício Actividade', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (67, 'Instalações Eléctricas', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (68, 'Equipamentos Sob Pressão', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (69, 'Movimentação Manual de Cargas', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (70, 'Segurança Contra Incêndios', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (71, 'Movimentação Mecânica de Cargas', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (72, 'Classificação de Actividades Económicas', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (73, 'Instalações do Sistema Eléctrico nacional (SEM), do Sistema Nacional de Gás Natural (SNGN e do Sistema Petrolífero Nacional (SPN)', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (74, 'Gás Natural', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (75, 'Postos Abastecimento Combustíveis', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (76, 'Instalações de armazenamento de  produtos derivados do petróleo (Gases de petróleo liquefeitos, Combustíveis líquidos e outros produtos derivados do petróleo)', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (77, 'Instalações das áreas de localização empresarial (ALE)', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (78, 'Suínos', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (79, 'Agentes Biológicos', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (80, 'Sinalização', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (81, 'EPI', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (82, 'Tabaco', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (83, 'Parques aquáticos', 3, 0, 0, 22);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (84, 'Comissão Nacional de Protecção Civil', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (85, 'Comissão Distrital de Protecção Civil', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (86, 'Comissão Municipal de Protecção Civil', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (87, 'SIOPS', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (88, 'Comissão Nacional Protecção Civil', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (89, 'Segurança de Barragens', 3, 0, 0, 23);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (90, 'Centros de Coordenação Operacional', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (91, 'Lei da Segurança Interna', 3, 0, 0, 9);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (92, 'Geral - ACT', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (93, 'Trabalho Temporário', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (94, 'Ficha de Aptidão', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (95, 'Código do Trabalho', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (96, 'Relatório Anual SHT', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (97, 'Serviços Externos', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (98, 'Técnicos SHT', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (99, 'Notificação Serviços SHT', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (100, 'Silicose', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (101, 'Acidentes de Trabalho e Doenças Profissionais', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (102, 'Ruído', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (103, 'Vibrações', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (104, 'Radiações', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (105, 'Estabelecimentos Industriais', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (106, 'Estabelecimentos Industrias', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (107, 'Laboratórios', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (108, 'Certificação Energética e Ar Interior de Edifícios', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (109, 'Navios / Actividades Marítimas e Portuárias', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (110, 'Comerciais', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (111, 'Estabelecimentos de Restauração e Bebidas', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (112, 'Administração Pública', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (113, 'Administrativos', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (114, 'Serviços', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (115, 'Mergulho', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (116, 'Biocidas', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (117, 'Acidentes Graves - SEVESO', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (118, 'PCBs', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (119, 'Aerossóis', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (120, 'Amianto', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (121, 'Cancerígenos e Mutagénicos', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (122, 'Chumbo / Cádmio / Mercúrio', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (123, 'Pilhas e Acumuladores', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (124, 'Atmosferas Explosivas', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (125, 'Explosivos', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (126, 'Combustíveis', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (127, 'Transporte', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (128, 'Acidentes graves - Seveso', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (129, 'Segurança em obra', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (130, 'Emissão de gases com efeito de estufa', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (131, 'Especificações técnicas aplicáveis a combustíveis', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (132, 'Substâncias que empobrecem a camada do Ozono', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (133, 'Prevenção de poluição por navio (MARPOL)', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (134, 'Emissão de poluentes atmosféricos', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (135, 'Ozono no ar ambiente', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (136, 'Emissão de poluentes atmosféricos - COV', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (137, 'Registo Europeu das Emissões  e Transferências de Poluentes', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (138, 'Biocombustíveis e outros combustíveis renováveis', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (139, 'Especificações técnicas aplicáveis a combustíveis - Fuelóleos', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (140, 'Acesso à Infomação sobre ambiente', 3, 0, 0, 31);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (141, 'Recursos / Domínio Hídrico', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (142, 'Poluição', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (143, 'Normas, critérios e objectivos de qualidade', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (144, 'Águas Residuais', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (145, 'Sistemas multimunicipais e municipais de captação, tratamento e abastecimento de água para consumo público', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (146, 'Sistemas multimunicipais de captação, tratamento e abastecimento de água para consumo público', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (147, 'Gestão de Resíduos - Obras e demolições', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (148, 'Gestão de veículos em fim de vida', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (149, 'Gestão de resíduos - Geral', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (150, 'Gestão de Resíduos - Resíduos Industriais', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (151, 'Transferência de Resíduos', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (152, 'Gestão de resíduos - Resíduos industriais', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (153, 'Gestão de resíduos - Óleos novos e usados', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (154, 'Gestão de resíduos - Aterros', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (155, 'Transporte de resíduos', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (156, 'Depósitos de minerais', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (157, 'Pedreiras', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (158, 'Gestão de resíduos - Embalagens e resíduos de embalagens', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (159, 'Gestão de resíduos - Pneus usados', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (160, 'Navios', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (161, 'Gestão de resíduos - Equipamentos eléctricos e electrónicos (REEE)', 3, 0, 0, 28);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (162, 'Código Penal', 3, 0, 0, 19);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (163, 'Geral', 3, 0, 0, 32);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (164, 'Geral', 3, 0, 0, 31);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (165, 'Geral', 3, 0, 0, 30);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (166, 'Geral', 3, 0, 0, 29);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (167, 'Geral', 3, 0, 0, 6);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (168, 'Geral', 3, 0, 0, 27);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (169, 'Geral', 3, 0, 0, 21);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (170, 'Geral', 3, 0, 0, 5);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (171, 'Geral', 3, 0, 0, 24);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (172, 'Geral', 3, 0, 0, 26);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (173, 'Geral', 3, 0, 0, 23);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (174, 'Geral', 3, 0, 0, 20);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (175, 'Geral', 3, 0, 0, 15);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (176, 'Transporte de Valores', 3, 0, 0, 14);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (177, 'Recintos Desportivos', 3, 0, 0, 11);
INSERT INTO legaldocumentcategory(
      id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (178, 'Estabelecimentos e Actividades', 2, 0, 0, 1);
SELECT setval('public.legaldocumentcategory_id_seq', 179, true);

/*
Categorias adicionadas em 18.08.2009 a certitools.pt

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (216, 'Instalações desportivas', 3, 0, 0, 22);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (217, 'Instalações desportivas', 3, 0, 0, 178);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (218, 'Radioactivas', 3, 0, 0, 21);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (219, 'Protecção de materiais nucleares', 2, 0, 0, 3);
	  
Categorias adicionadas a 10.02.2011 a certitools.pt por pedido da Isabel	
INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (220, 'Hospitalares', 3, 0, 0, 28);

Categorias adicionadas a 12.05.2011 a certitools.pt por pedido da Isabel
INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (221, 'Segurança Alimentar', 2, 0, 0, 1);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (222, 'Geral', 3, 0, 0, 221);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (223, 'Brinquedos', 3, 0, 0, 22);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (224, 'Fauna e Flora', 2, 0, 0, 2);

INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (225, 'Infra-estruturas críticas', 3, 0, 0, 14);
	  
Categorias adicionadas a 15.09.2011 a certitools.pt por pedido da Isabel
INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (226, 'Escolas e Creches', 3, 0, 0, 178);
INSERT INTO legaldocumentcategory(
       id, "name", depth, allassociateddocumentscounter, activeassociateddocumentscounter,parentcategory_id)
      VALUES (227, 'Protecção Sísmica', 2, 0, 0, 1);  
*/

/* Legal Documents State*/
INSERT INTO legaldocumentstate("name") VALUES ('Em Vigor');
INSERT INTO legaldocumentstate("name") VALUES ('Alterado');
INSERT INTO legaldocumentstate("name") VALUES ('Parcialmente Revogado');
INSERT INTO legaldocumentstate("name") VALUES ('Revogado');
INSERT INTO legaldocumentstate("name") VALUES ('Republicado');

/* Help Searchable Content*/

/* legislation */
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Legislação', to_ascii(convert_to('adicionar legislação', 'latin1'), 'latin1'),'legislation-add-legislation', 'legislationmanager', to_ascii(convert_to('adicionar legislação após clicar na funcionalidade que permite adicionar uma legislação, é devolvida uma página com um formulário para preenchimento dos dados de uma nova legislação. adicionar legislação ao adicionar uma legislação o utilizador deverá levar em conta as seguintes situações: não é possível inserir documentos legais com o mesmo : tipo / numero / ano; quando associamos um documento legal a uma categoria pai, as categorias filhas ficam automaticamente associadas; as palavras-chave do documento legal devem estar separadas por virgulas ou ponto e virgula ou espaço; o documento legal associado em pdf, não deve exceder 20 mb (e tem que ser pdf); quando adicionamos um documento legal a outro, o campo nº tem autocomplete (aparecem valores existentes), ou seja são apresentados todos os documentos do módulo previamente inseridos na aplicação. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Detalhe de Legislação', to_ascii(convert_to('detalhe de legislação', 'latin1'), 'latin1'),'legislation-detail', 'legislationmanager', to_ascii(convert_to('detalhe de legislação após clicar na funcionalidade que permite aceder ao detalhe de uma legislação, é devolvida uma página com a informação relativa à legislação seleccionada. detalhe de legislação notas: apenas se poderá remover um documento legal, se a este não estiverem associados outros documentos legais. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Detalhe de Legislação', to_ascii(convert_to('detalhe de legislação', 'latin1'), 'latin1'),'legislation-detail', 'userguest', to_ascii(convert_to('detalhe de legislação após clicar na funcionalidade que permite aceder ao detalhe de uma legislação, é devolvida uma página com a informação relativa à legislação seleccionada. detalhe de legislação ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Detalhe de Legislação', to_ascii(convert_to('detalhe de legislação', 'latin1'), 'latin1'),'legislation-detail', 'user', to_ascii(convert_to('detalhe de legislação após clicar na funcionalidade que permite aceder ao detalhe de uma legislação, é devolvida uma página com a informação relativa à legislação seleccionada. detalhe de legislação ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Legislação', to_ascii(convert_to('editar legislação', 'latin1'), 'latin1'),'legislation-edit-legislation', 'legislationmanager', to_ascii(convert_to('editar legislação após clicar na funcionalidade que permite editar uma legislação, é devolvida uma página com um formulário preenchido com os dados da legislação. editar legislação ao editar uma legislação o utilizador deverá levar em conta as seguintes situações: não é possível inserir documentos legais com o mesmo : tipo / numero / ano; quando associamos um documento legal a uma categoria pai, as categorias filhas ficam automaticamente associadas; as palavras-chave do documento legal devem estar separadas por virgulas ou ponto e virgula ou espaço; ficheiro associado em pdf, não deve exceder 20 mb (e tem que ser pdf); na edição, caso não seja adicionado um novo ficheiro em pdf, o ficheiro inserido anteriormente é mantido; quando adicionamos um documento legal a outro, o campo nº tem autocomplete (aparecem valores existentes), ou seja são apresentados todos os documentos do módulo previamente inseridos na aplicação; na edição de uma legislação quando o estado é alterado o campo enviar notificação (alteração) fica activo. no entanto este campo não é de preenchimento obrigatório, existindo sempre a possibilidade de activar o campo enviar notificação (criação) (apenas um deles poderá ser seleccionado). ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Subscrição de Newsletter', to_ascii(convert_to('editar subscrição de newsletter', 'latin1'), 'latin1'),'legislation-edit-subscrition', 'administrator,legislationmanager', to_ascii(convert_to('editar subscrição de newsletter após clicar na funcionalidade que permite aceder à edição do template de envio da subscrição de newsletter, é devolvida uma página com um formulário preenchido com os dados da subscrição: assunto do e-mail; cabeçalho do e-mail; rodapé do e-mail ; logótipo do e-mail. editar subscrição de newsletter notas: o tamanho máximo do logótipo do e-mail é de 50 mb. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Pesquisar Legislação por Categoria', to_ascii(convert_to('pesquisar legislação por categoria', 'latin1'), 'latin1'),'legislation-search-category', 'user', to_ascii(convert_to('pesquisar legislação por categoria após clicar na funcionalidade que permite aceder à pesquisa por categorias, é devolvida uma página com a listagem de todas as categorias de primeiro nível disponíveis. pesquisar legislação por categoria - 1 notas: os números de documentos associados às diferentes categorias consideram os documentos activos e inactivos na aplicação. ao subscrever de uma categoria, todas as categorias filhas (hierarquicamente abaixo) são automaticamente subscritas. significa que após a subscrição da categoria pai (no topo da hierarquia), a funcionalidade de subscrição deixa de estar disponível para as suas categorias filhas. após clicar na funcionalidade que permite aceder à categoria ambiente, é devolvida uma página com a listagem das sub-categorias associadas e a funcionalidade que permite listar a legislação associada a esta categoria. pesquisar legislação por categoria - 2 ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Pesquisar Legislação por Texto Livre', to_ascii(convert_to('pesquisar legislação por texto livre', 'latin1'), 'latin1'),'legislation-search', 'legislationmanager', to_ascii(convert_to('pesquisar legislação por texto livre após clicar na funcionalidade que permite aceder à pesquisa de legislação por texto livre,é devolvida uma página com as seguintes funcionalidades: pesquisa texto livre, pesquisa categorias, adicionar legislação, histórico de nova legislação, histórico de visualização de legislação. pesquisar legislação por texto livre a pesquisa é executada sobre os seguintes campos constantes na ficha do diploma legal, por ordem decrescente de importância: identificador do diploma; título do diploma; palavras-chave; sumário do diploma legal; caracterização técnica; diploma legal em formato pdf(a pesquisa sobre documentos em formato pdf só é possível para documentos desprotegidos e conteúdos em texto). nota: os resultados da pesquisa apresentam os documentos activos e inactivos na aplicação; nas tabelas correspondentes ao histórico e à nova legislação, apenas são apresentados os documentos activos na aplicação. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Pesquisar Legislação por Texto Livre', to_ascii(convert_to('pesquisar legislação por texto livre', 'latin1'), 'latin1'),'legislation-search', 'user', to_ascii(convert_to('pesquisar legislação por texto livre após clicar na funcionalidade que permite aceder à pesquisa de legislação por texto livre,é devolvida uma página com as seguintes funcionalidades: pesquisa texto livre, pesquisa categorias, histórico de nova legislação, histórico de visualização de legislação. pesquisar legislação por texto livre notas: os resultados da pesquisa apenas apresentam os documentos activos na aplicação; nas tabelas correspondentes ao histórico e à nova legislação, apenas são apresentados os documentos activos na aplicação. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Resultado de Estatística', to_ascii(convert_to('resultado de estatística', 'latin1'), 'latin1'),'legislation-stats-result', 'administrator,legislationmanager,contractmanager', to_ascii(convert_to('resultado de estatística após executar a acção de estatística correspondente ao intervalo de tempo inserido anteriormente, é devolvida uma página com as listagens de estatísticas relativas aos documentos legais e aos termos de pesquisa. resultados de estatística ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Estatística', to_ascii(convert_to('estatística', 'latin1'), 'latin1'),'legislation-stats', 'administrator,legislationmanager,contractmanager', to_ascii(convert_to('estatística após clicar na funcionalidade que permite visualizar estatísticas relativas a documentos legais e termos de pesquisa, é devolvida uma página com um formulário para inserção de um intervalo de tempo (data início/data fim), relativo aos documentos legais e aos dados de pesquisa. estatística ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Subscrição de Newsletter', to_ascii(convert_to('subscrição de newsletter', 'latin1'), 'latin1'),'legislation-subscrition', 'administrator,legislationmanager', to_ascii(convert_to('subscrição de newsletter após clicar na funcionalidade que permite aceder às subscrições, é devolvida uma página com as seguintes funcionalidades: editar subscrição de newsletter, listagem do conteúdo da subscrição de newsletter. subscrição de newsletter ','latin1'), 'latin1'));

/* certitools*/
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Contrato', to_ascii(convert_to('adicionar contrato', 'latin1'), 'latin1'), 'add-contract', 'contractmanager', to_ascii(convert_to('após clicar numa entidade seleccionar a funcionalidade que permite adicionar um novo contrato à entidade. é devolvida uma página com um formulário para preenchimento dos dados de um novo contrato. adicionar contrato','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Entidade', to_ascii(convert_to('adicionar entidade','latin1'), 'latin1'), 'add-entity', 'contractmanager', to_ascii(convert_to('após aceder à funcionalidade que permite adicionar uma nova entidade, é devolvida uma página com um formulário para preenchimento dos dados de uma nova entidade. adicionar entidade','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Pergunta Frequente', to_ascii(convert_to('adicionar pergunta frequente', 'latin1'), 'latin1'),'add-faq', 'administrator,legislationmanager,peimanager', to_ascii(convert_to('após clicar na funcionalidade que permite adicionar uma pergunta frequente, é devolvida uma página com um formulário para preenchimento dos dados de uma nova pergunta frequente. quando adicionamos uma pergunta frequente e a associamos a uma categoria, o campo categoria tem autocomplete (aparecem valores existentes), ou seja são apresentadas todas a categorias do módulo previamente escolhidas que têm perguntas frequentes associadas.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Notícia', to_ascii(convert_to('adicionar notícia', 'latin1'), 'latin1'),'add-news', 'administrator', to_ascii(convert_to('após clicar na funcionalidade que permite adicionar uma notícia, é devolvida uma página com um formulário para preenchimento dos dados de uma nova notícia. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Utilizador', to_ascii(convert_to('adicionar utilizador', 'latin1'), 'latin1'),'add-user', 'administrator', to_ascii(convert_to('adicionar utilizador após aceder à funcionalidade que permite adicionar um novo utilizador à entidade, é devolvida uma página com um formulário para preenchimento dos dados de um novo utilizador adicionar utilizador notas: se ao inserir um novo utilizador for devolvido o erro já existe um utilizador com esse email, deverá ser levado em conta que também são considerados os utilizadores que foram removidos. este comportamento verifica-se porque os utilizadores removidos são de facto desactivados ficando assim as suas informações armazenadas na base de dados. caso a entidade tenha contratos do módulo pei, é possível associar permissões pei ao utilizador. adicionar utilizador - detalhe permissões pei nota: a permissão gestor do pei é uma permissão especial, disponível para todos os contratos do módulo pei. para que um utilizador de uma entidade cliente possa gerir o pei de um contrato, é necessário ter o perfil de acesso gestor módulo pei e a permissão gestor do pei para esse contrato.na escolha dos perfis associados ao utilizador deverá ser levado em conta quais são as diferentes acções associadas a um perfil (reflectidas na matriz abaixo). matriz de perfis ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Utilizador', to_ascii(convert_to('adicionar utilizador','latin1'), 'latin1'), 'add-user', 'contractmanager', to_ascii(convert_to('adicionar utilizador após aceder à funcionalidade que permite adicionar um novo utilizador à entidade, é devolvida uma página com um formulário para preenchimento dos dados de um novo utilizador adicionar utilizador nota: se ao inserir um novo utilizador for devolvido o erro já existe um utilizador com esse email, deverá ser levado em conta que também são considerados os utilizadores que foram removidos. este comportamento verifica-se porque os utilizadores removidos são de facto desactivados ficando assim as suas informações armazenadas na base de dados. caso a entidade tenha contratos do módulo pei, é possível associar permissões pei ao utilizador. adicionar utilizador - detalhe permissões pei nota: a permissão gestor do pei é uma permissão especial, disponível para todos os contratos do módulo pei. para que um utilizador de uma entidade cliente possa gerir o pei de um contrato, é necessário ter o perfil de acesso gestor módulo pei e a permissão gestor do pei para esse contrato.na escolha dos perfis associados ao utilizador deverá ser levado em conta quais são as diferentes acções associadas a um perfil (reflectidas na matriz abaixo). matriz de perfis ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Adicionar Utilizador', to_ascii(convert_to('adicionar utilizador', 'latin1'), 'latin1'),'add-user', 'clientcontractmanager',to_ascii(convert_to( 'adicionar utilizador após aceder à funcionalidade que permite adicionar um novo utilizador à entidade, é devolvida uma página com um formulário para preenchimento dos dados de um novo utilizador adicionar utilizador nota: se ao inserir um novo utilizador for devolvido o erro já existe um utilizador com esse email, deverá ser levado em conta que também são considerados os utilizadores que foram removidos. este comportamento verifica-se porque os utilizadores removidos são de facto desactivados ficando assim as suas informações armazenadas na base de dados. na escolha dos perfis associados ao utilizador deverá ser levado em conta quais são as diferentes acções associadas a um perfil (reflectidas na matriz abaixo). matriz de perfis ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Administração', to_ascii(convert_to('administração', 'latin1'), 'latin1'),'administration', 'administrator', to_ascii(convert_to('a aplicação para gerir as licenças do certitools está disponível no endereço:','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Configurações', to_ascii(convert_to('configurações', 'latin1'), 'latin1'),'configuration', 'administrator', to_ascii(convert_to('após clicar na funcionalidade que permite aceder às configurações é devolvida uma página com uma listagem das configurações da aplicação.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Configurações', to_ascii(convert_to('editar configurações', 'latin1'), 'latin1'),'edit-configuration', 'administrator', to_ascii(convert_to('após clicar na funcionalidade que permite editar as configurações da aplicação é devolvida uma página com um formulário preenchido com os dados das configurações da aplicação.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Contrato', to_ascii(convert_to('editar contrato', 'latin1'), 'latin1'),'edit-contract', 'contractmanager', to_ascii(convert_to('após clicar numa entidade seleccionar a funcionalidade que permite editar um contrato. é devolvida uma página com um formulário preenchido com os dados do contrato seleccionado.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Entidade', to_ascii(convert_to('editar entidade','latin1'), 'latin1'), 'edit-entity', 'contractmanager', to_ascii(convert_to('após clicar numa entidade seleccionar a funcionalidade que permite editar esta mesma entidade, é devolvida uma página com um formulário preenchido com os dados da entidade.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Pergunta Frequente', to_ascii(convert_to('editar pergunta frequente','latin1'), 'latin1'), 'edit-faq', 'administrator,legislationmanager,peimanager', to_ascii(convert_to('editar pergunta frequente após clicar na funcionalidade que permite editar uma pergunta frequente, é devolvida uma página com um formulário preenchido com os dados da pergunta frequente. editar pergunta frequente notas: quando editamos uma pergunta frequente e a associamos a uma nova categoria, o campo categoria tem autocomplete (aparecem valores existentes), ou seja são apresentadas todas a categorias do módulo previamente escolhidas que têm perguntas frequentes associadas.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Categorias de Notícias', to_ascii(convert_to('editar categorias de notícias', 'latin1'), 'latin1'),'edit-news-category', 'administrator', to_ascii(convert_to('após clicar na funcionalidade que permite editar categorias de notícias, é devolvida uma página com um formulário preenchido com os nomes das categorias de notícias.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Notícia', to_ascii(convert_to('editar notícia', 'latin1'), 'latin1'),'edit-news', 'administrator', to_ascii(convert_to('editar notícia após clicar na funcionalidade que permite editar uma notícia, é devolvida uma página com um formulário preenchido com os dados da notícia seleccionada. editar notícia notas: quando se adiciona uma notícia, esta só fica publicada se activarmos o campo publicado.','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Utilizador', to_ascii(convert_to('editar utilizador', 'latin1'), 'latin1'),'edit-user', 'administrator', to_ascii(convert_to('editar utilizador após clicar num utilizador seleccionar a funcionalidade que permite editar este mesmo utilizador. é devolvida uma página com um formulário preenchido com os dados do utilizador. editar utilizador notas: a alteração de perfis de acesso apenas é aplicada efectivamente quando o utilizador inicia uma nova sessão. não é possível editar o administrador. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Utilizador', to_ascii(convert_to('editar utilizador', 'latin1'), 'latin1'),'edit-user', 'contractmanager', to_ascii(convert_to('editar utilizador após clicar num utilizador seleccionar a funcionalidade que permite editar este mesmo utilizador. é devolvida uma página com um formulário preenchido com os dados do utilizador. editar utilizador ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Editar Utilizador', to_ascii(convert_to('editar utilizador','latin1'), 'latin1'), 'edit-user', 'clientcontractmanager', to_ascii(convert_to('editar utilizador após clicar num utilizador seleccionar a funcionalidade que permite editar este mesmo utilizador. é devolvida uma página com um formulário preenchido com os dados do utilizador. editar utilizador ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Entidades', to_ascii(convert_to('gestão de entidades','latin1'), 'latin1'), 'entities-management', 'administrator',to_ascii(convert_to( 'gestão de entidades após clicar na funcionalidade que permite aceder à gestão de entidades é devolvida uma página que permite pesquisar entidades. após efectuar uma pesquisa, clicar numa entidade e as seguintes funcionalidades serão devolvidas: adicionar utilizador, listar utilizadores. gestão de entidades ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Entidades', to_ascii(convert_to('gestão de entidades', 'latin1'), 'latin1'),'entities-management', 'contractmanager,clientcontractmanager', to_ascii(convert_to('gestão de entidades após clicar na funcionalidade que permite aceder à gestão de entidades é devolvida uma página com a seguintes funcionalidades: adicionar entidade, pesquisar entidades. após efectuar uma pesquisa, clicar numa entidade e as seguintes funcionalidades serão devolvidas: adicionar entidade, editar entidade, eliminar entidade, adicionar contrato, adicionar utilizador, listar utilizadores, importar utilizadores. gestão de entidades notas: não se pode eliminar uma entidade se esta tiver utilizadores ou contratos associados; não se pode eliminar um contrato se este tiver utilizadores associados; a lista de contratos é ordenada pelo número e designação. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Perguntas Frequentes', to_ascii(convert_to('gestão de perguntas frequentes','latin1'), 'latin1'), 'faq-management', 'administrator,legislationmanager,peimanager', to_ascii(convert_to('gestão de perguntas frequentes após clicar na funcionalidade que permite aceder à gestão de perguntas frequentes, é devolvida uma página com as seguintes funcionalidades: listagem de perguntas frequentes, adicionar de perguntas frequentes. gestão de perguntas frequentes ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Listagem de Perguntas Frequentes', to_ascii(convert_to('listagem de perguntas frequentes','latin1'), 'latin1'), 'faq', 'legislationmanager,peimanager', to_ascii(convert_to('listagem de perguntas frequentes após clicar na funcionalidade que permite aceder à listagem de perguntas frequentes, é devolvida uma página com as seguintes funcionalidades: gestão de perguntas frequentes, detalhes de perguntas frequentes. perguntas frequentes após clicar numa pergunta frequente, os seus detalhes são devolvidos. detalhes de pergunta frequente ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Listagem de Perguntas Frequentes', to_ascii(convert_to('listagem de perguntas frequentes','latin1'), 'latin1'), 'faq', 'user', to_ascii(convert_to('listagem de perguntas frequentes após clicar na funcionalidade que permite aceder à listagem de perguntas frequentes,é devolvida uma página com as seguintes funcionalidades: detalhes de perguntas frequentes. perguntas frequentes após clicar numa pergunta frequente, os seus detalhes são devolvidos. detalhes de pergunta frequente ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Importar Utilizadores', to_ascii(convert_to('importar utilizadores','latin1'), 'latin1'), 'import-users', 'contractmanager,clientcontractmanager,administrator', to_ascii(convert_to('importar utilizadores a importação de utilizadores é realizada a partir de um ficheiro csv (separador: ;) com um formato definido. de forma a garantir que o ficheiro segue o formato correcto devem-se utilizar os ficheiros csv exportados no certitools. um ficheiro de exemplo (com um cabeçalho descrevendo as várias colunas) pode ser descarregado aqui (este ficheiro não é válido para importação, dado não estar em formato csv e dado ter uma linha com o cabeçalho). notas: o processo de importação é atómico, i.e. caso haja erro de importação de um dos utilizadores é abortado o processo, e indicada a origem e natureza do erro; caso se verifique, durante a execução do processo de importação, que os dados de utilizadores a importar correspondem a utilizadores previamente registados na aplicação então os dados existentes serão substituídos pelos dados a importar. para efeito de identificação unívoca de utilizadores será utilizado o campo de endereço de e-mail. formato do ficheiro o formato definido para cada linha do ficheiro csv é: nome;email;nif;telefone;entidade externa;activo;sessão única;removido;#perfis de acesso#;#dados do contrato 1#;....;# dados do contrato n# nome - campo obrigatório email - campo obrigatório nif - campo obrigatório do tipo numérico telefone - campo facultativo (pode ser deixado em branco, mas a coluna nunca pode ser apagada) entidade externa - campo facultativo (pode ser deixado em branco, mas a coluna nunca pode ser apagada) activo - campo obrigatório; valores aceites: true, false sessão única - campo obrigatório; valores aceites: true, false removido - campo obrigatório; valores aceites: true, false perfis de acesso - este é um campo com colunas variáveis dado que um utilizador pode ter 0 ou mais perfis associados. este campo deve começar por # e acabar em #. os vários perfis de acesso devem ser separados por ; (colunas diferentes). aquando da importação o perfil utilizador é automaticamente adicionado ao utilizador. exemplos: utilizador sem perfis associados: ## utilizador com 1 perfil associado: #peimanager# utilizador com vários perfis: #contractmanager;legislationmanager;administrator;peimanager# (o ponto e vírgula assinala uma nova coluna no excel). valores permitidos para este campo (entre parêntesis a descrição do valor): administrator (administrador), contractmanager (gestor de contrato - certitecna), legislationmanager (gestor do módulo legislação - certitecna), peimanager (gestor módulo pei - certitecna), clientcontractmanager (gestor de utilizadores - cliente), clientpeimanager (gestor módulo pei - cliente), userguest (convidado) dados do contrato - este é um campo composto por vários sub-campos e com colunas variáveis. cada contrato deve começar por # e acabar em #. um contrato é composto pelos seguintes campos: identificador - campo obrigatório do tipo numérico data de início - campo facultativo do tipo data (dd-mm-yyyy), pode ser deixado em branco, mas a coluna nunca pode ser apagada data de fim - campo facultativo do tipo data (dd-mm-yyyy), pode ser deixado em branco, mas a coluna nunca pode ser apagada permissões pei - campo facultativo, quando o utilizador não tem permissões esta coluna não deve existir. quando existir mais que uma permissão devem ser separadas por ; (colunas diferentes) exemplos: utilizador associado ao contrato nº1: #1;;# utilizador associado ao contrato nº1 e nº2: #1;;#;#2;;# utilizador associado ao contrato nº1, com datas de validade definidas: #1;06-08-2009;19-08-2009# utilizador associado ao contrato nº1, com datas de validade definidas e permissões pei: #1;06-08-2009;19-08-2009;chefe de segurança;vigilante# utilizador associado ao contrato nº1 e com permissões pei: #1;;;chefe de segurança;vigilante# exemplo de um ficheiro de importação linha do ficheiro explicação a;a@a.com;123;;;true;false;false;#contractmanager;legislationmanager;administrator;peimanager#;#1;06-08-2009;19-08-2009;chefe de segurança;vigilante#; utilizador com perfil de acesso gestor de contrato, gestor de legislação, administrador e gestor de pei. associado ao contrato com identificador 1, com data de validade para esse contrato de 06-08-2009 até 19-08-2009 e com permissões pei de chefe de segurança e vigilante. administrador;admin@a.com;123456789;91555;;true;false;false;#administrator#;## utilizador com perfil de administrador, sem associação a contratos e número de telefone 91555. b;b@a.com;12345;;entidade externa;true;true;false;#legislationmanager#;#1;;#;#2;03-03-2009;31-03-2009#;#3;;#; utilizador com perfil de gestor de legislação, limitado a sessão única e associado a 3 contratos. nos contratos com identificador 1 e 3 não foi definida a data de validade ou permissões pei. p;p@a.com;1234;;;false;false;false;##;## utilizador sem perfis de acesso definidos nem associações a contratos. abrir o ficheiro csv no excel para manipulação do ficheiro csv, recomenda-se o uso do microsoft excel. de forma a garantir a correcta manipulação do ficheiro devem-se seguir as seguintes instruções para importar os dados para uma folha do excel (versão 2003): num livro novo, ir ao menu dados > importar dados externos > importar dados, seleccionar o ficheiro csv e carregar em abrir na nova caixa de opções que aparece, seleccionar delimitado e na origem do ficheiro escolher 65001 : unicode (utf-8). avançar para o próximo passo. escolher como delimitador o ponto e vírgula e carregar em terminar. ficheiro csv de exemplo no excel ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Notícias', to_ascii(convert_to('gestão de notícias', 'latin1'), 'latin1'),'news-administration', 'administrator', to_ascii(convert_to('gestão de notícias após clicar na funcionalidade que permite aceder à gestão de notícias, é devolvida uma página com as seguintes funcionalidades: listagem de notícias, adicionar notícia, editar notícia, eliminar notícia, desactivar notícia, editar categorias de notícias. gestão de notícias ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Utilizadores', to_ascii(convert_to('gestão de utilizadores', 'latin1'), 'latin1'),'user-management', 'contractmanager,clientcontractmanager,administrator', to_ascii(convert_to('gestão de utilizadores após clicar na funcionalidade que permite aceder à gestão de utilizadores é devolvida uma página com a seguintes funcionalidades: adicionar utilizador, pesquisar utilizadores, editar utilizador, eliminar utilizador, reset palavra-chave. gestão de utilizadores ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Perfil do Utilizador', to_ascii(convert_to('perfil do utilizador', 'latin1'), 'latin1'),'user-profile', 'user', to_ascii(convert_to('após clicar na funcionalidade que permite aceder ao perfil do utilizador, é devolvida uma página com um formulário para preenchimento da sua nova palavra-chave.','latin1'), 'latin1'));

/* pei */
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão Plano de Emergência', to_ascii(convert_to('gestão plano de emergência', 'latin1'), 'latin1'),'pei-cm', 'peimanager,clientpeimanager', to_ascii(convert_to('gestão plano de emergência ao seleccionar a opção do menu gestão tem acesso a toda a gestão de conteúdos do plano de emergência seleccionado. o plano de emergência segue uma estrutura hierárquica (estrutura em árvore) de pastas. para cada pasta deve ser seleccionado o seu tipo de conteúdo (template), que serve de base à introdução do conteúdo da pasta. a tabela seguinte descreve algumas das operações mais comuns. funcionalidade explicação notas publicar permite copiar da versão de trabalho (offline) para a versão publicada (online). o botão publicar encontra-se disponível apenas quando a pasta principal do pei se encontra seleccionada ou a pasta correspondente a uma secção (isto é, a pasta do 1º nível e as pastas do 2º nível da árvore). quando está seleccionada a pasta principal (capa do pei), a publicação será total. quando se selecciona uma secção, a publicação abrange apenas a secção seleccionada. o botão publicar apenas está disponível após o preenchimento dos dados gerais do pei (capa). a primeira publicação de um pei tem de ser total. exportar publicado esta funcionalidade exporta sempre a totalidade de um plano de emergência para os formatos suportados. após clicar no botão respectivo será enviado um ficheiro comprimido em formato zip, contendo a exportação nos formatos suportados e documentos anexos. esta operação poderá demorar alguns segundos consoante o tamanho do plano de emergência. o botão exportar publicado apenas está disponível quando o pei já foi publicado. exportar não publicado semelhante ao exportar publicado mas abrange a versão de trabalho (offline). pré-visualizar navega para o frontoffice da pasta seleccionada, activando o modo de pré-visualização, que permite consultar a versão de trabalho (offline) do plano de emergência no frontoffice, tal como os utilizadores comuns o vão consultar. caso a pasta seleccionada tenha um tipo de conteúdo sem visualização (contacto, documento ou pergunta frequente), aparecerá um aviso. visualizar navega para a versão publicada da pasta seleccionada. caso o nome da pasta seja diferente na versão de trabalho e na versão publicada este botão poderá apontar para uma pasta não existente. guardar guarda os dados preenchidos no formulário (os dados constantes das várias tabs). em seguida apresentam-se exemplos da página de gestão, consoante a pasta seleccionada corresponde à capa do pei ou a outra pasta. gestão plano de emergência - capa do pei seleccionada gestão plano de emergência - pasta seleccionada notas: caso esteja seleccionada uma secção (pasta de 2º nível) a opção de eliminar não estará disponível. caso esteja seleccionada uma secção (pasta de 2º nível), uma nova caixa de texto encontra-se disponível: ajuda. este campo permite a introdução de um texto de ajuda para a secção seleccionada. ao editar uma pasta existente, se alterar o tipo de conteúdo, os conteúdos anteriores serão removidos quando efectuar a gravação. gestão plano de emergência - tab texto adicional permissões o processo de gestão de acessos a pastas de um plano de emergência deve iniciar-se pela criação de permissões para o contrato. para tal, está disponível a opção permissões no módulo pei. após a criação de permissões é possível limitar o acesso a uma pasta apenas aos utilizadores que tenham essa permissão. por omissão todas as pastas de um plano de emergência são visíveis a todos os utilizadores que tenham autorização de consulta desse pei. na zona de gestão do pei, deve-se seleccionar a pasta a limitar e seleccionar as permissões necessárias para lhe aceder. as permissões são aplicadas de forma hierárquica, isto é, ao limitar-se uma pasta limita-se também o acesso às suas filhas (pastas de nível inferior). caso sejam seleccionadas várias permissões, o utilizador necessita de ter todas as permissões seleccionadas para poder aceder à pasta. as permissões não se aplicam a utilizadores com o perfil de acesso gestor do pei. estes utilizadores podem sempre consultar todas as pastas dos peis a que têm acesso de gestão. após a definição das permissões necessárias para aceder às pastas, deve-se proceder à atribuição de permissões aos utilizadores na gestão de utilizadores. tipos de conteúdo (templates) a gestão do plano de emergência funciona como um gestor de conteúdos, cada pasta tem um tipo de conteúdo (template) diferente. alguns dos templates são considerados auxiliares, não sendo visíveis directamente no frontoffice, mas sendo indexados noutras pastas. em seguida descrevem-se os vários templates disponíveis. índice navegável este é o template definido por omissão para todas as pastas. ao consultar páginas com este tipo de conteúdo é apresentada uma listagem (com link) das páginas em níveis inferiores (suas filhas). este template não necessita de inserção de dados na tab conteúdos. plano de emergência - detalhe do frontoffice do índice imagem/anexo este tipo de pastas permite guardar imagens ou ficheiros anexos utilizados em outras pastas, especialmente em pastas do tipo texto formatável. ao enviar o ficheiro é detectado automaticamente se o ficheiro é uma imagem ou um anexo. recomenda-se que o nome da pasta corresponda ao nome do ficheiro enviado, incluindo a extensão, ex: imagem.jpg. análise de riscos permite o envio de um ficheiro csv contendo a tabela de análise de riscos. cada linha do ficheiro deve ter, pelo menos, 7 colunas: produto; condições de libertação; meteorologia; inflamação; radiação; sobrepressão; toxicidade. para além dessas colunas é possível adicionar ficheiros anexos. para tal devem ser criadas pastas do tipo imagem/anexo no nível inferior da pasta com a análise de riscos (suas filhas). no ficheiro csv, após as colunas obrigatórias, devem-se adicionar colunas com o nome da pasta contendo o anexo. desta forma é possível adicionar vários ficheiros anexos, por linha na tabela de análise de riscos. por exemplo: análise de riscos cenario_1.jpg planta.dwg neste caso, se uma linha do csv tiver as 7 colunas obrigatórias mais 2 colunas com o texto cenario_1.jpg e planta.dwg, a linha vai ficar com os 2 anexos. ao consultar a tabela da análise de riscos o utilizador pode efectuar o download dos anexos. plano de emergência - detalhe do frontoffice da análise de riscos plano de emergência - exemplo de um ficheiro csv com anexos diagrama com áreas clicáveis este template permite criar uma página com uma imagem contendo informação adicional em algumas áreas da imagem. consulte aqui a descrição detalhada do seu frontoffice. na tab conteúdos deve-se indicar o ficheiro com a imagem e guardar a pasta. após guardar a pasta, é apresentado um formulário permitindo a escrita de texto formatável bem como a definição das áreas clicáveis da imagem. para definir as áreas, seleccione a imagem e clique no 1º icon disponível no formulário ou pressione o botão direito sobre a imagem e seleccione a última opção editor de áreas interactivas. plano de emergência - diagrama com áreas clicáveis no editor de áreas clicáveis pode definir as áreas clicáveis, bem como a sua legenda. de realçar que a primeira linha da legenda é sempre o título da área. o título não é visível no frontoffice, sendo usado apenas na exportação do pei. o título deve estar sempre presente. plano de emergência - editor de áreas clicáveis diagrama de navegação por imagens este template é semelhante ao diagrama com áreas clicáveis, sendo a diferença o comportamento das áreas definidas para a imagem. neste template essas áreas são links o que permite a navegação para páginas internas do pei ou websites externos, bem como o descarregamento de ficheiros anexos. o editor de áreas apresenta algumas diferenças: plano de emergência - editor de áreas clicáveis no diagrama de navegação por imagens ao clicar no botão procurar é apresentada uma listagem contendo as pastas filhas e irmãs (no mesmo nível) da pasta actual e que têm como template imagem/anexo ou diagrama de navegação por imagens. ao clicar em algum elemento dessa lista, o url/endereço da área é automaticamente preenchido. nota: caso se altere o nome de alguma das pastas referenciadas é previsível que os links das áreas, para essas pastas, deixem de funcionar, necessitando o link de ser actualizado com o novo nome das pastas. texto formatável este tipo de conteúdo permite a introdução e formatação de texto com imagens e links. a sua interface é semelhante aos programas de edição de texto (microsoft word) e permite uma grande liberdade na formatação de estilos do texto introduzido. este template permite a inserção de imagens em websites externos ou o uso de imagens inseridas através do template imagem/anexo. neste último caso, deve-se clicar no botão de inserção de imagem e clicar em procurar. será mostrada uma listagem com as pastas do tipo imagem/anexo que se encontram ao mesmo nível da pasta com o texto formatável ou em níveis inferiores (pastas irmãs ou filhas). ao seleccionar a imagem pretendida da listagem, o campo url (endereço) é preenchido automaticamente. ao clicar em ok, a imagem será incluída no texto. de realçar que apenas as pastas imagem/anexo que contêm uma imagem (e não um anexo como um ficheiro zip, pdf, etc) serão mostradas na listagem. o funcionamento para inserir uma hiperligação (link) é semelhante mas a listagem apresentada inclui todas as pastas do tipo imagem/anexo quer sejam realmente imagens ou anexos. plano de emergência - texto formatável notas: recomenda-se a leitura do manual de utilizador em que este componente se baseia, disponível aqui. o formulário permite efectuar operações de copiar/colar directamente do word. no entanto recomenda-se que se use o botão colar como texto não formatado para retirar a formatação proveniente do word. texto formatável com anexos este template é semelhante ao texto formatável mas apresenta automaticamente uma lista das pastas do tipo imagem/anexo que se encontram abaixo da pasta (suas filhas). plano de emergência - frontoffice de texto formatável com anexos índice de contactos este template permite indexar as pastas do tipo contacto que se encontram em níveis abaixo da pasta, apresentando-os em tabelas, com possibilidade de pesquisa e filtragem. este template não necessita de inserção de dados na tab conteúdos. o conteúdo desta pasta vem do conteúdo das suas filhas do tipo contacto. nota: esta pasta indexa os conteúdos de forma recursiva pelo que é possível ter vários níveis de pastas do tipo contacto, abaixo do índice de contactos. contacto representa um contacto que é indexado no índice de contactos. este é um template auxiliar, não sendo visível directamente no frontoffice, apenas é usado pelo índice de contactos. um contacto corresponde a um conjunto de informação de comunicação habitual: telefone, email, nome, etc. um exemplo de uma estrutura completa de índice e contactos é: índice de contactos contacto 1 contacto 2 contacto 3 contacto 4 índice de documentos este template permite indexar as pastas do tipo documento que se encontram em níveis abaixo do índice de documentos. a consulta desta pasta apresenta uma tabela com os dados dos documentos indexados, permitindo ainda filtrar os dados a apresentar na tabela. este template não necessita de inserção de dados na tab conteúdos. o conteúdo desta pasta vem do conteúdo das suas filhas do tipo documento. documento representa um documento permitindo anexar zero ou mais ficheiros por documento. as pastas deste tipo são indexadas pelo índice de documentos, sendo um template auxiliar, não visível directamente no frontoffice (não aparece no menu de navegação). plano de emergência - template documento índice perguntas frequentes este template permite indexar as pastas do tipo pergunta frequente, mostrando uma listagem com todas as perguntas frequentes que se encontram em níveis abaixo desta. este template não necessita de inserção de dados na tab conteúdos. o conteúdo desta pasta vem do conteúdo das suas filhas do tipo pergunta frequente. é ainda possível criar categorias de perguntas frequentes: sempre que uma pasta deste tipo tenha uma filha que seja do tipo índice perguntas frequentes ela é considerada uma subcategoria. esta funcionalidade permite uma melhor organização das perguntas frequentes. exemplo da organização de perguntas frequentes com categorias: faq (pasta do tipo índice de perguntas frequentes) sismos (pasta do tipo índice de perguntas frequentes) o que fazer em caso de sismo? (pasta do tipo pergunta frequente) o que fazer após o sismo? (pasta do tipo pergunta frequente) incêndios (pasta do tipo índice de perguntas frequentes) o que fazer se ocorrer um incêndio? (pasta do tipo pergunta frequente) como utilizar um extintor? (pasta do tipo pergunta frequente) plano de emergência - exemplo do frontoffice de um índice de perguntas frequentes, organizado por categorias pergunta frequente é o elemento usado no índice perguntas frequentes, é constituído por uma pergunta e uma resposta, em texto formatável. as pastas deste tipo são indexadas pelo índice perguntas frequentes, sendo um template auxiliar, não visível directamente no frontoffice (não aparece no menu de navegação). índice procedimentos este tipo de pastas indexa os seus filhos do tipo texto formatável, permitindo a navegação para essas páginas através de filtros dinâmicos até ao máximo de 3 níveis. as pastas abaixo desta não ficam visíveis no menu de navegação, apenas é possível aceder-lhes usando os filtros apresentados. quando uma das pastas indexadas não possui filhos, é apresentado o seu conteúdo (texto formatável). caso a pasta tenha filhos, eles são carregados na caixa de selecção (filtro) seguinte. exemplo da organização correcta para o índice de procedimentos: procedimentos (pasta do tipo índice de procedimentos) instrução geral de actuação (pasta do tipo texto formatável - o seu conteúdo não é apresentado, serve apenas como categoria de filtragem) incêndio (pasta do tipo texto formatável) sismo (pasta do tipo texto formatável - o seu conteúdo não é apresentado, serve apenas como categoria de filtragem) vigilante (pasta do tipo texto formatável) central de segurança (pasta do tipo texto formatável) equipa de manutenção (pasta do tipo texto formatável) plano de emergência - exemplo do frontoffice de um índice de procedimentos ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Cópia Plano de Emergência', to_ascii(convert_to('cópia plano de emergência', 'latin1'), 'latin1'),'pei-copy', 'peimanager', to_ascii(convert_to('cópia plano de emergência após clicar na opção do menu cópia, é apresentada uma página que lhe permite copiar um plano de emergência para outro contrato. a cópia inclui todas as pastas e conteúdos do plano de emergência de origem (versão de trabalho e versão publicada), bem como as suas permissões. cópia plano de emergência ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Capa Plano de Emergência', to_ascii(convert_to('capa plano de emergência', 'latin1'), 'latin1'),'pei-cover', 'user', to_ascii(convert_to('capa plano de emergência após seleccionar um plano de emergência é apresentada a página com a respectiva capa onde pode consultar dados genéricos do pei, bem como ter acesso ao seu menu de navegação. no menu de navegação, a presença de pequenas setas indica que o item tem um submenu. passe o rato sobre o item para abrir o respectivo submenu. capa plano de emergência ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Detalhes Plano de Emergência', to_ascii(convert_to('detalhes plano de emergência', 'latin1'), 'latin1'),'pei-details', 'user', to_ascii(convert_to('detalhes plano de emergência após seleccionar uma página no menu de navegação do plano de emergência é apresentada uma página com conteúdos. o tipo de conteúdos apresentado varia consoante o tipo da página consultada. alguns conteúdos habituais são: texto formatável com imagens, lista de contactos, diagramas, plantas, organogramas, tabelas de análise de riscos, perguntas frequentes e tabelas de documentos e registos. em seguida apresentamos a explicação de alguns conteúdos habituais de encontrar no plano de emergência. tabela de análise de riscos página com tabela de análise de riscos quando a secção actual tem definido um texto de ajuda, é possível consultá-lo, clicando no ícone correspondente. detalhe da ajuda da secção organograma este tipo de conteúdo apresenta uma imagem dinâmica, com informação adicional sobre algumas áreas da imagem. ao passar o rato pela imagem as áreas com informação adicional aparecem realçadas. ao clicar nessas áreas é apresentada a informação adicional. para além da informação textual, algumas áreas podem permitir a navegação para outras páginas ou o descarregamento de ficheiros anexos. página com organograma lista de contactos este tipo de conteúdo apresenta uma listagem de contactos, divididos consoante o seu tipo. permite ainda filtrar pelo tipo de contacto e/ou efectuar uma pesquisa de texto livre pelo contacto pretendido. página com lista de contactos ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Gestão de Permissões', to_ascii(convert_to('gestão de permissões', 'latin1'), 'latin1'),'pei-permissions', 'peimanager,clientpeimanager', to_ascii(convert_to('gestão de permissões ao clicar na opção do menu permissões é apresentada uma página que lhe permite adicionar novas permissões a um contrato e visualizar todas as permissões desse contrato. ao clicar numa permissão, é aberta a árvore de todas as pastas de um pei de forma a consultar facilmente quais as pastas que esta permissão permite aceder. gestão de permissões detalhe de uma permissão com a árvore de pastas aberta gestão de permissões nota: apenas é possível apagar uma permissão que não esteja associada a utilizadores ou em uso em alguma pasta do plano de emergência. exemplos: pretende-se permitir o acesso ao pei a todos os utilizadores excepto um utilizador que não pode consultar a secção organograma. neste caso, deve-se criar a permissão para o pei: utilizador organograma (na gestão de permissões). na gestão do pei, seleccionar a pasta organograma, seleccionar a permissão utilizador organograma e guardar as alterações. desta forma só os utilizadores com esta permissão podem aceder à secção organograma. em seguida, na gestão de utilizadores deve-se atribuir esta permissão a todos os utilizadores, excepto ao utilizador que se pretende restringir. num pei contendo a secção organograma e, dentro dessa, duas pastas chamadas descritivo e descritivo restrito, pretende-se limitar o acesso à secção organograma a um grupo de utilizadores e limitar o acesso à pasta descritivo restrito a apenas um utilizador. para esta situação devem ser criadas duas permissões: utilizador organograma e utilizador organograma acesso total. na secção organograma deve-se limitar o seu acesso com a permissão utilizador organograma. depois desta operação, seleccionar a pasta descritivo restrito, seleccionar a permissão utilizador organograma acesso total e guardar as alterações. atribuir, aos utilizadores que podem aceder ao organograma, a permissão utilizador organograma (gestão de utilizadores). ao único utilizador que pode aceder à pasta descritivo restrito (e seus filhos) deve-se ser atribuido a permissão utilizador organograma e utilizador organograma acesso total. ','latin1'), 'latin1'));
insert into helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) values ('Selecção Plano de Emergência', to_ascii(convert_to('selecção plano de emergência', 'latin1'), 'latin1'),'pei-select', 'user', to_ascii(convert_to('selecção plano de emergência após clicar na opção do menu plano de emergência é devolvida uma página para selecção do plano de emergência que pretende consultar. caso o utilizador tenha acesso apenas a um plano de emergência ele será seleccionado automaticamente. escolher plano de emergência ','latin1'), 'latin1'));

/* 3_09 to 3_10 */
INSERT INTO helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) VALUES ('Enviar Alertas', to_ascii(convert_to('enviar alertas', 'latin1'), 'latin1'),'alert-entity', 'contractmanager,clientcontractmanager,administrator', to_ascii(convert_to('esta funcionalidade permite o envio de alertas (e-mail) para os utilizadores activos nos contratos.este formulário é dividido em duas partes contratos da entidade onde é possível seleccionar, por contrato, as permissões dos utilizadores para os quais desejamos enviar o alerta. existe também a opção todos que no caso de ser seleccionada, enviará a notificação a todos os utilizadores activos do contrato;definição do alerta a enviar onde introduzimos os dados referentes ao alerta','latin1'), 'latin1'));
UPDATE helpsearchablecontent SET searchcontent = to_ascii(convert_to('gestão de permissões ao clicar na opção do menu permissões é apresentada uma página que lhe permite adicionar novas permissões a um contrato e visualizar todas as permissões desse contrato de duas formas: por permissão e por pasta do plano. Detalhe de uma permissão por pasta. Para aceder a uma pasta o utilizador necessita de conter todas as permissões indicadas entre parêntesis. ao clicar numa permissão, é aberta a árvore de todas as pastas de um pei de forma a consultar facilmente quais as pastas que esta permissão permite aceder. gestão de permissões detalhe de uma permissão com a árvore de pastas aberta gestão de permissões nota: apenas é possível apagar uma permissão que não esteja associada a utilizadores ou em uso em alguma pasta do plano de emergência. exemplos: pretende-se permitir o acesso ao pei a todos os utilizadores excepto um utilizador que não pode consultar a secção organograma. neste caso, deve-se criar a permissão para o pei: utilizador organograma (na gestão de permissões). na gestão do pei, seleccionar a pasta organograma, seleccionar a permissão utilizador organograma e guardar as alterações. desta forma só os utilizadores com esta permissão podem aceder à secção organograma. em seguida, na gestão de utilizadores deve-se atribuir esta permissão a todos os utilizadores, excepto ao utilizador que se pretende restringir. num pei contendo a secção organograma e, dentro dessa, duas pastas chamadas descritivo e descritivo restrito, pretende-se limitar o acesso à secção organograma a um grupo de utilizadores e limitar o acesso à pasta descritivo restrito a apenas um utilizador. para esta situação devem ser criadas duas permissões: utilizador organograma e utilizador organograma acesso total. na secção organograma deve-se limitar o seu acesso com a permissão utilizador organograma. depois desta operação, seleccionar a pasta descritivo restrito, seleccionar a permissão utilizador organograma acesso total e guardar as alterações. atribuir, aos utilizadores que podem aceder ao organograma, a permissão utilizador organograma (gestão de utilizadores). ao único utilizador que pode aceder à pasta descritivo restrito (e seus filhos) deve-se ser atribuido a permissão utilizador organograma e utilizador organograma acesso total. Gestão de Permissões - Por Pasta do Plano','latin1'), 'latin1') WHERE filename = 'pei-permissions';
INSERT INTO helpsearchablecontent(titleToShow, titleToSearch, filename, permissions, searchcontent) VALUES ('Exportação Docx', to_ascii(convert_to('exportacao docx', 'latin1'), 'latin1'),'pei-exportdocx', 'peimanager', to_ascii(convert_to('introdução  a exportação para o formato docx word 2007 tem por base um template de exportação também docx o qual contém  marcadores especiais bookmarks permitindo a sua substituição automática por conteúdos do plano  os marcadores especiais bookmarks contêm o "link" para as pastas respectivas do plano estes links  podem ser consultados na gestão do plano nas propriedades de cada pasta sendo que alguns dos links permitem  o uso de opções de forma a configurar a exportação  para elaborar um template de exportação deve-se começar por configurar o word 2007 de forma a mostrar  "bookmarks" para tal siga os seguintes passos  clique no "botão do office" e em seguida em "opções do word"  escolha a opção "avançadas"  na zona "mostrar conteúdo do documento" seleccionar a opção "mostrar marcadores"  para adicionar um bookmark siga os seguintes passos  introduza o texto do link exemplo /organograma seguido de um espaço no final  seleccione o texto do link sem o espaço no final exemplo  pressione ctr + shift + f5 ou clique na tab inserir > marcador  introduza um nome único para o marcador não é relevante o nome apenas não pode ser igual a outro marcador  exemplo organograma  clique em adicionar o resultado final deverá ser este  gestão de templates  na zona de gestão de templates é possível adicionar editar remover e associar o template a um plano o template  deve estar no formato docx word 2007  após a inserção de um novo template fica disponível a opção de "associar a contratos" de realçar que é necessário  clicar em "guardar" para que as alterações de associações sejam efectuadas  notas  para que um template esteja disponível para ser usado na exportação de um plano é necessário a sua associação  ao plano  durante a exportação do plano o utilizador irá ver o título do template  na cópia de um plano também são copiadas as associações entre plano e templates  um template fica apenas disponível para ser associado aos planos do mesmo módulo  capa  os links disponíveis para os elementos da capa de um plano são descritos na próxima tabela  link  descrição  coverdesignation  designação  coverauthor  autor  coverversion  versão  coverversion_date  data da versão  coverlast_simulation  data do último simulacro  coverphoto coverphoto300300  fotografia da instalação  é possível definir a largura e altura máxima da imagem para tal acrescentar ao link  as dimensões máximas no formato "larguraaltura" por exemplo coverphoto300400 significa  que a imagem nunca excederá os 300 pixeis de largura e 400 de altura  coverlogo coverlogo15050  logótipo da empresa permite usar as mesmas opções de limitação do tamanho da  imagem  texto formatável  o texto formatável incluido neste tipo de pastas é exportado suportando-se formas simplificadas de listas tabelas  e imagens incluídas  dentro do texto formatável é possível marcar texto como "não exportável" usando o botão de "eliminar da exportação"   para tal seleccione o texto a excluir e clique no botão  note-se que a visualização do texto na web não será afectada  a exportação remove ainda os links no texto conservando o texto do link linhas horizontais bem como as  tags html span a e font conversando o texto dentro destas tags  as pastas do tipo texto formatável com anexos são exportadas de forma igual  imagem/anexo  inclui o ficheiro anexo do template no zip exportado o nome do ficheiro exportado  tem por base o nome do anexo e não o nome da pasta do tipo anexo  diagrama com áreas clicáveis  permite dois tipos de links explicados na tabela seguinte  link exemplo  descrição  /organograma  exporta o texto formatável presente na pasta de igual forma a um template do tipo texto formatável  /organogramaareas  exporta a descrição das várias áreas clicáveis com os respectivos títulos para calcular o nível  do heading dos títulos é consultado o nível do último heading antes do link e somado 1 nível  diagrama de navegação por imagens  permite três tipos de links explicados na tabela seguinte  link exemplo  descrição  /plano de evacuação/folders/percursos evacuação  exporta o texto formatável presente na pasta de igual forma a um template do tipo texto formatável  /plano de evacuação/folders/percursos evacuaçãofiles  exporta todos os ficheiros encontrados em todas as pastas filhas do tipo imagem/anexo  /plano de evacuação/folders/percursos evacuaçãofileslist  para além da exportação dos ficheiros  ainda escrita a listagem dos ficheiros exportados  no documento final docx  índice de documentos  este tipo de templates permite dois tipos de links descritos na tabela seguinte  link exemplo  descrição  /documentação  exporta todos os ficheiros encontrados em todas as pastas filhas do tipo documento  /documentaçãolist  usando a opção list para além da exportação é ainda escrita a listagem dos ficheiros exportados  no documento final docx  documento  funciona de forma similar ao índice de documentos mas apenas exporta os ficheiros encontrados na própria pasta  não recursivamente permite ainda usar a opção list e uma nova opção image que faz com que nenhum ficheiro  seja exportado e a primeira imagem encontrada nos ficheiros seja incluída no documento exportado docx  link exemplo  descrição  /documentação/folders/plano de emergência/folders/glossário  exporta todos os ficheiros encontrados em todas as pastas filhas do tipo documento  /documentação/folders/plano de emergência/folders/glossáriolist  usando a opção list para além da exportação é ainda escrita a listagem dos ficheiros exportados  no documento final docx  /documentação/folders/plano de emergência/folders/glossárioimage  usando a opção imagem não são exportados ficheiros o primeiro ficheiro do tipo imagem encontrado  na pasta é escrito no documento final docx  índice de procedimentos  a exportação do índice de procedimentos exporta todas as suas pasta filhas do tipo  texto formatável ou texto formatável com anexos em que cada pasta cria um heading novo  seguindo a mesma estrutura de níveis que a estrutura definida no plano  os ficheiros anexos encontrados são exportados para pastas com o nome da sua secção respectiva  nome da pasta filha de primeiro nível do índice de procedimentos  o link para um índice de procedimentos permite configurar o nível de heading que as pastas  de primeiro nível vão usar por exemplo o link /procedimentosh2 indica que a 1ª pasta filha  do índice vai ficar com o heading de nível 2 são suportados niveis entre h1 e h6 sendo  que por omissão é usado o nível 1  índice de contactos  a exportação de templates do tipo índice de contactos permite uma maior flexibilidade na construção  da sua apresentação nomeadamente o estilo a usar na tabela quais os campos a incluir e a ordem  das colunas  para permitir esta flexibilidade não são usados bookmarks mas a funcionalidade de mail merge do word  para melhor entender esta exportação aconselhamos a consulta  do  ficheiro de  exemplo  template docx que exporta um índice de contactos de forma similar ao apresentado  na visualização web  caso se pretenda criar um novo template docx siga os seguintes passos  crie uma nova tabela dentro do documento  na 1ª coluna da tabela é necessário um merge field especial que indica o início de uma tabela  para tal no word 2007 clique na tab inserir  botão peças rápidas opção campo em alternativa utilize o atalho do teclado alt+w+q+c  na listagem que aparece seleccionar mergefield  no campo nome do campo preencher com tablestart/pasta-do-indice-de-contactos substituindo  pasta-do-indice-de-contactos pelo link correcto para a pasta com o índice de contactos  clicar em ok  na última coluna da tabela é necessário inserir um merge field especial para indicar o fim da tabela  para tal siga as mesmas instruções do ponto anterior mas colocando como nome do field  tableend/pasta-do-indice-de-contactos  para colocar os restantes campos de um contacto devem ser adicionados merge fields entre o tablestart  e o tableend para tal siga as mesmas instruções para adicionar um merge field mas no seu nome indique  o campo a exportar  caixa de diálogo quando se adiciona um merge field  a tabela seguinte enuncia os campos disponíveis para exportação consoante o tipo de contacto  tipo contacto  campos disponíveis  entidades externas  externalentitytype  externalentityname  externalemail  externalphone  externalphoto  entidades internas  internalpersonname  internalentityname  internalemail  internalphone  internalphoto  estrutura operacional de emergência  emergencypersonname  emergencypersonposition  emergencypersonarea  emergencyemail  emergencyphone  emergencyphoto  análise de riscos  a exportação da análise de riscos também utiliza a funcionalidade de mail merge do word pelo que deve consultar  o  ficheiro anexo de exemplo   os ficheiros anexos referenciados na tabela de análise de riscos são também exportados e colocados numa pasta  com o nome da pasta do tipo análise de riscos  para criar de raíz um template docx que exporta uma tabela de análise de riscos deve consultar as instruções  para o índice de contactos sendo que a diferença reside nos campos disponíveis para exportação que no caso  da análise de riscos são enunciados na seguinte tabela  campo  descrição  product  produto  releaseconditions  condições de libertação  weather  meteorologia  ignitionpoint  inflamação  radiation  radiação  pressurized  sobrepressão  toxicity  toxicidade  secções anexas  no template docx de exportação é possível definir secções anexas durante a exportação as secções anexas são  removidas do documento docx principal exportado sendo gerados novos documentos docx para cada secção  para além disso o nome das secções anexas é prefixado aos ficheiros anexos presentes em cada secção anexa  para criar uma nova secção anexa siga os seguintes passos  adicione uma nova quebra de secção no word para isso vá a esquema de página > quebras > quebras de secção página seguinte  na nova secção adicione o link que identifica a secção como uma secção anexa para tal  crie um link novo com o formato annexnome do anexo por exemplo annex anexo a - procedimentos  dentro da secção criada podem-se incluir todos os tipos de links para pastas tal como se faz para o  template principal docx os conteúdos desses links serão exportados para um novo ficheiro docx correspondente à  secção anexa  caso não se pretenda incluir o docx correspondente à secção anexa no ficheiro zip final deve-se utilizar a opção  delete no link por exemplo annex anexo g  lista de abreviaturasdelete desta forma apenas os  ficheiros anexos serão incluídos no zip de exportação esta funcionalidade é interessante quando o conteúdo do  docx está vazio apenas ficheiros anexos são exportados','latin1'), 'latin1'));

/* 3_10 to 3_11 */
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.docxExportEnabled', 1, 'java.lang.Long', true);
INSERT INTO configuration ("key", "value", className, editable) VALUES ('certitools.docxExport.applyAligmnentAllParagraphsFix', 1, 'java.lang.Long', true);

/* 3_15 to 3_16*/
INSERT INTO module (moduletype) VALUES ('PSI');
INSERT INTO configuration values ('home.customers.link','http://certitecna.pt/uploads/Image/Clientes_CertiTools.png','java.lang.String',true);
INSERT INTO configuration values ('home.customers.width','720','java.lang.Long',true);
INSERT INTO configuration values ('home.customers.height','670','java.lang.Long',true);

/* 3_16 to 3_17 */
INSERT INTO configuration values ('certitools.localInstallation','0','java.lang.Long',true);        
INSERT INTO configuration values ('certitools.baseCompanyId','1','java.lang.Long',true);