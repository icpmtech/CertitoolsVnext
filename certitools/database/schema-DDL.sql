--
-- PostgreSQL database dump
--

-- Started on 2013-08-07 11:14:57

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 128 (class 1259 OID 16782)
-- Dependencies: 3
-- Name: company; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE company (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255),
    phone character varying(32),
    fiscalnumber bigint,
    active boolean NOT NULL,
    language character varying(5),
    peilabelpt character varying(64),
    prvlabelpt character varying(64),
    psilabelpt character varying(64),
    peilabelen character varying(64),
    prvlabelen character varying(64),
    psilabelen character varying(64),
    showfulllistpei boolean NOT NULL,
    deleted boolean NOT NULL,
    country_iso character varying(2)
);


ALTER TABLE public.company OWNER TO certitools_dev02;

--
-- TOC entry 127 (class 1259 OID 16780)
-- Dependencies: 128 3
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 127
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE company_id_seq OWNED BY company.id;


--
-- TOC entry 129 (class 1259 OID 16791)
-- Dependencies: 3
-- Name: configuration; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE configuration (
    key character varying(255) NOT NULL,
    value character varying(2048) NOT NULL,
    classname character varying(100) NOT NULL,
    editable boolean NOT NULL
);


ALTER TABLE public.configuration OWNER TO certitools_dev02;

--
-- TOC entry 131 (class 1259 OID 16801)
-- Dependencies: 3
-- Name: contract; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE contract (
    id bigint NOT NULL,
    number character varying(128) NOT NULL,
    filename character varying(255),
    contractdesignation character varying(255) NOT NULL,
    licenses integer NOT NULL,
    validitystartdate timestamp without time zone NOT NULL,
    validityenddate timestamp without time zone NOT NULL,
    value double precision,
    contractdesignationmaintenance character varying(255),
    valuemaintenance double precision,
    contractfile character varying(255),
    contactname character varying(128),
    contactposition character varying(128),
    contactemail character varying(255),
    contactphone character varying(32),
    active boolean NOT NULL,
    deleted boolean NOT NULL,
    firstinactivitymessagetemplatesubject character varying(200),
    firstinactivitymessagetemplatebody character varying(500),
    firstinactivitymessageterm integer NOT NULL,
    secondinactivitymessagetemplatesubject character varying(200),
    secondinactivitymessagetemplatebody character varying(500),
    secondinactivitymessageterm integer NOT NULL,
    deleteuserterm integer NOT NULL,
    userregistercode character varying(128),
    userregisterdomains character varying(256),
    menulabel character varying(64),
    module_id bigint NOT NULL,
    company_id bigint NOT NULL
);


ALTER TABLE public.contract OWNER TO certitools_dev02;

--
-- TOC entry 130 (class 1259 OID 16799)
-- Dependencies: 131 3
-- Name: contract_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contract_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 130
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE contract_id_seq OWNED BY contract.id;


--
-- TOC entry 132 (class 1259 OID 16810)
-- Dependencies: 3
-- Name: country; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE country (
    iso character varying(2) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.country OWNER TO certitools_dev02;

--
-- TOC entry 134 (class 1259 OID 16817)
-- Dependencies: 3
-- Name: faq; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE faq (
    id bigint NOT NULL,
    question character varying(4096) NOT NULL,
    answer character varying(4096) NOT NULL,
    changeddate timestamp without time zone NOT NULL,
    faqcategory_id bigint NOT NULL
);


ALTER TABLE public.faq OWNER TO certitools_dev02;

--
-- TOC entry 133 (class 1259 OID 16815)
-- Dependencies: 3 134
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faq_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 133
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE faq_id_seq OWNED BY faq.id;


--
-- TOC entry 136 (class 1259 OID 16828)
-- Dependencies: 3
-- Name: faqcategory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE faqcategory (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    module_id bigint NOT NULL
);


ALTER TABLE public.faqcategory OWNER TO certitools_dev02;

--
-- TOC entry 135 (class 1259 OID 16826)
-- Dependencies: 136 3
-- Name: faqcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE faqcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faqcategory_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 135
-- Name: faqcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE faqcategory_id_seq OWNED BY faqcategory.id;


--
-- TOC entry 138 (class 1259 OID 16836)
-- Dependencies: 3
-- Name: helpsearchablecontent; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE helpsearchablecontent (
    id bigint NOT NULL,
    searchcontent character varying(30000) NOT NULL,
    titletosearch character varying(255) NOT NULL,
    titletoshow character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    permissions character varying(255)
);


ALTER TABLE public.helpsearchablecontent OWNER TO certitools_dev02;

--
-- TOC entry 137 (class 1259 OID 16834)
-- Dependencies: 3 138
-- Name: helpsearchablecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE helpsearchablecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.helpsearchablecontent_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 137
-- Name: helpsearchablecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE helpsearchablecontent_id_seq OWNED BY helpsearchablecontent.id;


--
-- TOC entry 174 (class 1259 OID 17155)
-- Dependencies: 3
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO certitools_dev02;

--
-- TOC entry 140 (class 1259 OID 16847)
-- Dependencies: 3
-- Name: legaldocument; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocument (
    id bigint NOT NULL,
    customtitle character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    number character varying(255) NOT NULL,
    year character varying(4) NOT NULL,
    publicationdate date NOT NULL,
    keywords character varying(512),
    summary character varying(4096) NOT NULL,
    customabstract character varying(10000),
    legalcompliancevalidation character varying(5000),
    referencearticles character varying(5000),
    transitoryprovisions character varying(4096),
    creationdate timestamp without time zone NOT NULL,
    statechangeddate timestamp without time zone,
    sendnotificationnew boolean NOT NULL,
    sendnotificationchange boolean NOT NULL,
    published boolean NOT NULL,
    changedby_id bigint,
    documentstate_id bigint NOT NULL,
    documenttype_id bigint NOT NULL
);


ALTER TABLE public.legaldocument OWNER TO certitools_dev02;

--
-- TOC entry 139 (class 1259 OID 16845)
-- Dependencies: 3 140
-- Name: legaldocument_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE legaldocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.legaldocument_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 139
-- Name: legaldocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE legaldocument_id_seq OWNED BY legaldocument.id;


--
-- TOC entry 150 (class 1259 OID 16896)
-- Dependencies: 3
-- Name: legaldocument_legaldocument; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocument_legaldocument (
    legaldocument_id bigint NOT NULL,
    associatedlegaldocuments_id bigint NOT NULL
);


ALTER TABLE public.legaldocument_legaldocument OWNER TO certitools_dev02;

--
-- TOC entry 151 (class 1259 OID 16899)
-- Dependencies: 3
-- Name: legaldocument_legaldocumentcategory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocument_legaldocumentcategory (
    legaldocuments_id bigint NOT NULL,
    legaldocumentcategories_id bigint NOT NULL
);


ALTER TABLE public.legaldocument_legaldocumentcategory OWNER TO certitools_dev02;

--
-- TOC entry 142 (class 1259 OID 16858)
-- Dependencies: 3
-- Name: legaldocumentcategory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocumentcategory (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    depth bigint NOT NULL,
    allassociateddocumentscounter bigint NOT NULL,
    activeassociateddocumentscounter bigint NOT NULL,
    parentcategory_id bigint
);


ALTER TABLE public.legaldocumentcategory OWNER TO certitools_dev02;

--
-- TOC entry 141 (class 1259 OID 16856)
-- Dependencies: 3 142
-- Name: legaldocumentcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE legaldocumentcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.legaldocumentcategory_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 141
-- Name: legaldocumentcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE legaldocumentcategory_id_seq OWNED BY legaldocumentcategory.id;


--
-- TOC entry 144 (class 1259 OID 16866)
-- Dependencies: 3
-- Name: legaldocumenthistory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocumenthistory (
    id bigint NOT NULL,
    "timestamp" timestamp without time zone,
    user_id bigint NOT NULL,
    legaldocument_id bigint NOT NULL
);


ALTER TABLE public.legaldocumenthistory OWNER TO certitools_dev02;

--
-- TOC entry 143 (class 1259 OID 16864)
-- Dependencies: 144 3
-- Name: legaldocumenthistory_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE legaldocumenthistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.legaldocumenthistory_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 143
-- Name: legaldocumenthistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE legaldocumenthistory_id_seq OWNED BY legaldocumenthistory.id;


--
-- TOC entry 146 (class 1259 OID 16874)
-- Dependencies: 3
-- Name: legaldocumentstate; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocumentstate (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.legaldocumentstate OWNER TO certitools_dev02;

--
-- TOC entry 145 (class 1259 OID 16872)
-- Dependencies: 3 146
-- Name: legaldocumentstate_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE legaldocumentstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.legaldocumentstate_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 145
-- Name: legaldocumentstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE legaldocumentstate_id_seq OWNED BY legaldocumentstate.id;


--
-- TOC entry 147 (class 1259 OID 16880)
-- Dependencies: 3
-- Name: legaldocumentstatistics; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocumentstatistics (
    id bigint NOT NULL,
    reporttype character varying(255) NOT NULL,
    date timestamp without time zone NOT NULL,
    text character varying(255),
    documentid bigint
);


ALTER TABLE public.legaldocumentstatistics OWNER TO certitools_dev02;

--
-- TOC entry 149 (class 1259 OID 16890)
-- Dependencies: 3
-- Name: legaldocumenttype; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE legaldocumenttype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.legaldocumenttype OWNER TO certitools_dev02;

--
-- TOC entry 148 (class 1259 OID 16888)
-- Dependencies: 149 3
-- Name: legaldocumenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE legaldocumenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.legaldocumenttype_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 148
-- Name: legaldocumenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE legaldocumenttype_id_seq OWNED BY legaldocumenttype.id;


--
-- TOC entry 153 (class 1259 OID 16904)
-- Dependencies: 3
-- Name: license; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE license (
    id bigint NOT NULL,
    licensekey character varying(255) NOT NULL,
    creationdate date NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    companyid bigint
);


ALTER TABLE public.license OWNER TO certitools_dev02;

--
-- TOC entry 152 (class 1259 OID 16902)
-- Dependencies: 3 153
-- Name: license_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 152
-- Name: license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE license_id_seq OWNED BY license.id;


--
-- TOC entry 155 (class 1259 OID 16912)
-- Dependencies: 3
-- Name: module; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE module (
    id bigint NOT NULL,
    moduletype character varying(255)
);


ALTER TABLE public.module OWNER TO certitools_dev02;

--
-- TOC entry 154 (class 1259 OID 16910)
-- Dependencies: 155 3
-- Name: module_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.module_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 154
-- Name: module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE module_id_seq OWNED BY module.id;


--
-- TOC entry 157 (class 1259 OID 16922)
-- Dependencies: 3
-- Name: news; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE news (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    content character varying(4096) NOT NULL,
    published boolean NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.news OWNER TO certitools_dev02;

--
-- TOC entry 156 (class 1259 OID 16920)
-- Dependencies: 3 157
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 156
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- TOC entry 159 (class 1259 OID 16933)
-- Dependencies: 3
-- Name: newscategory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE newscategory (
    id bigint NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.newscategory OWNER TO certitools_dev02;

--
-- TOC entry 158 (class 1259 OID 16931)
-- Dependencies: 159 3
-- Name: newscategory_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE newscategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.newscategory_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 158
-- Name: newscategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE newscategory_id_seq OWNED BY newscategory.id;


--
-- TOC entry 161 (class 1259 OID 16941)
-- Dependencies: 3
-- Name: permission; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE permission (
    id bigint NOT NULL,
    name character varying(255),
    userregisterbasepermission boolean NOT NULL,
    contract_id bigint NOT NULL
);


ALTER TABLE public.permission OWNER TO certitools_dev02;

--
-- TOC entry 160 (class 1259 OID 16939)
-- Dependencies: 161 3
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 160
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE permission_id_seq OWNED BY permission.id;


--
-- TOC entry 162 (class 1259 OID 16947)
-- Dependencies: 3
-- Name: role; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE role (
    role character varying(100) NOT NULL,
    description character varying(255),
    iscertitecna boolean NOT NULL
);


ALTER TABLE public.role OWNER TO certitools_dev02;

--
-- TOC entry 164 (class 1259 OID 16954)
-- Dependencies: 3
-- Name: searchstatistic; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE searchstatistic (
    id bigint NOT NULL,
    searchphrase character varying(512) NOT NULL,
    count bigint NOT NULL
);


ALTER TABLE public.searchstatistic OWNER TO certitools_dev02;

--
-- TOC entry 163 (class 1259 OID 16952)
-- Dependencies: 164 3
-- Name: searchstatistic_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE searchstatistic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.searchstatistic_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2010 (class 0 OID 0)
-- Dependencies: 163
-- Name: searchstatistic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE searchstatistic_id_seq OWNED BY searchstatistic.id;


--
-- TOC entry 166 (class 1259 OID 16965)
-- Dependencies: 3
-- Name: templatedocx; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE templatedocx (
    id bigint NOT NULL,
    observations character varying(2048),
    title character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    module_id bigint NOT NULL
);


ALTER TABLE public.templatedocx OWNER TO certitools_dev02;

--
-- TOC entry 167 (class 1259 OID 16974)
-- Dependencies: 3
-- Name: templatedocx_contract; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE templatedocx_contract (
    templatesdocx_id bigint NOT NULL,
    contracts_id bigint NOT NULL
);


ALTER TABLE public.templatedocx_contract OWNER TO certitools_dev02;

--
-- TOC entry 165 (class 1259 OID 16963)
-- Dependencies: 166 3
-- Name: templatedocx_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE templatedocx_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.templatedocx_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2011 (class 0 OID 0)
-- Dependencies: 165
-- Name: templatedocx_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE templatedocx_id_seq OWNED BY templatedocx.id;


--
-- TOC entry 168 (class 1259 OID 16977)
-- Dependencies: 3
-- Name: user_contract; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE user_contract (
    contract_id bigint NOT NULL,
    user_id bigint NOT NULL,
    validitystartdate timestamp without time zone,
    validityenddate timestamp without time zone
);


ALTER TABLE public.user_contract OWNER TO certitools_dev02;

--
-- TOC entry 169 (class 1259 OID 16982)
-- Dependencies: 3
-- Name: user_contract_permission; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE user_contract_permission (
    usercontracts_contract_id bigint NOT NULL,
    usercontracts_user_id bigint NOT NULL,
    permissions_id bigint NOT NULL
);


ALTER TABLE public.user_contract_permission OWNER TO certitools_dev02;

--
-- TOC entry 171 (class 1259 OID 16987)
-- Dependencies: 1910 3
-- Name: users; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255) NOT NULL,
    phone character varying(32),
    fiscalnumber bigint NOT NULL,
    externaluser character varying(255),
    uniquesession boolean NOT NULL,
    active boolean NOT NULL,
    deleted boolean NOT NULL,
    password character varying(128),
    activationkey character varying(36),
    lastlogindate date,
    numberlogins bigint DEFAULT 0::bigint,
    lastplanorlegislationview timestamp without time zone NOT NULL,
    language character varying(5) NOT NULL,
    activatepassnotificationsend boolean NOT NULL,
    sessionsactive integer NOT NULL,
    seenpei boolean NOT NULL,
    company_id bigint NOT NULL
);


ALTER TABLE public.users OWNER TO certitools_dev02;

--
-- TOC entry 170 (class 1259 OID 16985)
-- Dependencies: 3 171
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: certitools_dev02
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO certitools_dev02;

--
-- TOC entry 2012 (class 0 OID 0)
-- Dependencies: 170
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: certitools_dev02
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 172 (class 1259 OID 16999)
-- Dependencies: 3
-- Name: users_legaldocumentcategory; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE users_legaldocumentcategory (
    users_id bigint NOT NULL,
    subscriptionslegaldocuments_id bigint NOT NULL
);


ALTER TABLE public.users_legaldocumentcategory OWNER TO certitools_dev02;

--
-- TOC entry 173 (class 1259 OID 17002)
-- Dependencies: 3
-- Name: users_role; Type: TABLE; Schema: public; Owner: certitools_dev02; Tablespace: 
--

CREATE TABLE users_role (
    users_id bigint NOT NULL,
    roles_role character varying(100) NOT NULL
);


ALTER TABLE public.users_role OWNER TO certitools_dev02;

--
-- TOC entry 1892 (class 2604 OID 16785)
-- Dependencies: 128 127 128
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY company ALTER COLUMN id SET DEFAULT nextval('company_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 16804)
-- Dependencies: 130 131 131
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY contract ALTER COLUMN id SET DEFAULT nextval('contract_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 16820)
-- Dependencies: 134 133 134
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY faq ALTER COLUMN id SET DEFAULT nextval('faq_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 16831)
-- Dependencies: 136 135 136
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY faqcategory ALTER COLUMN id SET DEFAULT nextval('faqcategory_id_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 16839)
-- Dependencies: 137 138 138
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY helpsearchablecontent ALTER COLUMN id SET DEFAULT nextval('helpsearchablecontent_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 16850)
-- Dependencies: 139 140 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument ALTER COLUMN id SET DEFAULT nextval('legaldocument_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 16861)
-- Dependencies: 142 141 142
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumentcategory ALTER COLUMN id SET DEFAULT nextval('legaldocumentcategory_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 16869)
-- Dependencies: 144 143 144
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumenthistory ALTER COLUMN id SET DEFAULT nextval('legaldocumenthistory_id_seq'::regclass);


--
-- TOC entry 1900 (class 2604 OID 16877)
-- Dependencies: 146 145 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumentstate ALTER COLUMN id SET DEFAULT nextval('legaldocumentstate_id_seq'::regclass);


--
-- TOC entry 1901 (class 2604 OID 16893)
-- Dependencies: 149 148 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumenttype ALTER COLUMN id SET DEFAULT nextval('legaldocumenttype_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 16907)
-- Dependencies: 153 152 153
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY license ALTER COLUMN id SET DEFAULT nextval('license_id_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 16915)
-- Dependencies: 155 154 155
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY module ALTER COLUMN id SET DEFAULT nextval('module_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16925)
-- Dependencies: 157 156 157
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 16936)
-- Dependencies: 158 159 159
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY newscategory ALTER COLUMN id SET DEFAULT nextval('newscategory_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 16944)
-- Dependencies: 160 161 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY permission ALTER COLUMN id SET DEFAULT nextval('permission_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 16957)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY searchstatistic ALTER COLUMN id SET DEFAULT nextval('searchstatistic_id_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 16968)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY templatedocx ALTER COLUMN id SET DEFAULT nextval('templatedocx_id_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 16990)
-- Dependencies: 171 170 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1912 (class 2606 OID 16790)
-- Dependencies: 128 128
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- TOC entry 1914 (class 2606 OID 16798)
-- Dependencies: 129 129
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (key);


--
-- TOC entry 1916 (class 2606 OID 16809)
-- Dependencies: 131 131
-- Name: contract_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- TOC entry 1918 (class 2606 OID 16814)
-- Dependencies: 132 132
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (iso);


--
-- TOC entry 1920 (class 2606 OID 16825)
-- Dependencies: 134 134
-- Name: faq_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 16833)
-- Dependencies: 136 136
-- Name: faqcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY faqcategory
    ADD CONSTRAINT faqcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 1924 (class 2606 OID 16844)
-- Dependencies: 138 138
-- Name: helpsearchablecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY helpsearchablecontent
    ADD CONSTRAINT helpsearchablecontent_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 16855)
-- Dependencies: 140 140
-- Name: legaldocument_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocument
    ADD CONSTRAINT legaldocument_pkey PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 16863)
-- Dependencies: 142 142
-- Name: legaldocumentcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocumentcategory
    ADD CONSTRAINT legaldocumentcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 16871)
-- Dependencies: 144 144
-- Name: legaldocumenthistory_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocumenthistory
    ADD CONSTRAINT legaldocumenthistory_pkey PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 16879)
-- Dependencies: 146 146
-- Name: legaldocumentstate_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocumentstate
    ADD CONSTRAINT legaldocumentstate_pkey PRIMARY KEY (id);


--
-- TOC entry 1934 (class 2606 OID 16887)
-- Dependencies: 147 147
-- Name: legaldocumentstatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocumentstatistics
    ADD CONSTRAINT legaldocumentstatistics_pkey PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 16895)
-- Dependencies: 149 149
-- Name: legaldocumenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY legaldocumenttype
    ADD CONSTRAINT legaldocumenttype_pkey PRIMARY KEY (id);


--
-- TOC entry 1938 (class 2606 OID 16909)
-- Dependencies: 153 153
-- Name: license_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY license
    ADD CONSTRAINT license_pkey PRIMARY KEY (id);


--
-- TOC entry 1940 (class 2606 OID 16919)
-- Dependencies: 155 155
-- Name: module_moduletype_key; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_moduletype_key UNIQUE (moduletype);


--
-- TOC entry 1942 (class 2606 OID 16917)
-- Dependencies: 155 155
-- Name: module_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (id);


--
-- TOC entry 1944 (class 2606 OID 16930)
-- Dependencies: 157 157
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 1946 (class 2606 OID 16938)
-- Dependencies: 159 159
-- Name: newscategory_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY newscategory
    ADD CONSTRAINT newscategory_pkey PRIMARY KEY (id);


--
-- TOC entry 1948 (class 2606 OID 16946)
-- Dependencies: 161 161
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1950 (class 2606 OID 16951)
-- Dependencies: 162 162
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role);


--
-- TOC entry 1952 (class 2606 OID 16962)
-- Dependencies: 164 164
-- Name: searchstatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY searchstatistic
    ADD CONSTRAINT searchstatistic_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 16973)
-- Dependencies: 166 166
-- Name: templatedocx_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY templatedocx
    ADD CONSTRAINT templatedocx_pkey PRIMARY KEY (id);


--
-- TOC entry 1956 (class 2606 OID 16981)
-- Dependencies: 168 168 168
-- Name: user_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY user_contract
    ADD CONSTRAINT user_contract_pkey PRIMARY KEY (contract_id, user_id);


--
-- TOC entry 1958 (class 2606 OID 16998)
-- Dependencies: 171 171
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 1960 (class 2606 OID 16996)
-- Dependencies: 171 171
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: certitools_dev02; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 17020)
-- Dependencies: 136 134 1921
-- Name: fk10ef6e4671c6a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY faq
    ADD CONSTRAINT fk10ef6e4671c6a FOREIGN KEY (faqcategory_id) REFERENCES faqcategory(id);


--
-- TOC entry 1966 (class 2606 OID 17030)
-- Dependencies: 1931 140 146
-- Name: fk13e9fed45185d691; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument
    ADD CONSTRAINT fk13e9fed45185d691 FOREIGN KEY (documentstate_id) REFERENCES legaldocumentstate(id);


--
-- TOC entry 1967 (class 2606 OID 17035)
-- Dependencies: 149 1935 140
-- Name: fk13e9fed4cd3fca23; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument
    ADD CONSTRAINT fk13e9fed4cd3fca23 FOREIGN KEY (documenttype_id) REFERENCES legaldocumenttype(id);


--
-- TOC entry 1968 (class 2606 OID 17040)
-- Dependencies: 140 171 1959
-- Name: fk13e9fed4e03b6a8a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument
    ADD CONSTRAINT fk13e9fed4e03b6a8a FOREIGN KEY (changedby_id) REFERENCES users(id);


--
-- TOC entry 1981 (class 2606 OID 17105)
-- Dependencies: 1915 131 167
-- Name: fk196b55d77bc0e87b; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY templatedocx_contract
    ADD CONSTRAINT fk196b55d77bc0e87b FOREIGN KEY (contracts_id) REFERENCES contract(id);


--
-- TOC entry 1980 (class 2606 OID 17100)
-- Dependencies: 1953 167 166
-- Name: fk196b55d7cb2a86eb; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY templatedocx_contract
    ADD CONSTRAINT fk196b55d7cb2a86eb FOREIGN KEY (templatesdocx_id) REFERENCES templatedocx(id);


--
-- TOC entry 1977 (class 2606 OID 17085)
-- Dependencies: 159 1945 157
-- Name: fk24fef37dddc3dd; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY news
    ADD CONSTRAINT fk24fef37dddc3dd FOREIGN KEY (category_id) REFERENCES newscategory(id);


--
-- TOC entry 1978 (class 2606 OID 17090)
-- Dependencies: 161 131 1915
-- Name: fk57f7a1ef50b7e76a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT fk57f7a1ef50b7e76a FOREIGN KEY (contract_id) REFERENCES contract(id);


--
-- TOC entry 1986 (class 2606 OID 17130)
-- Dependencies: 171 1911 128
-- Name: fk6a68e08607c3faa; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk6a68e08607c3faa FOREIGN KEY (company_id) REFERENCES company(id);


--
-- TOC entry 1976 (class 2606 OID 17080)
-- Dependencies: 153 128 1911
-- Name: fk6d291c213eccd5e5; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY license
    ADD CONSTRAINT fk6d291c213eccd5e5 FOREIGN KEY (companyid) REFERENCES company(id);


--
-- TOC entry 1970 (class 2606 OID 17050)
-- Dependencies: 144 171 1959
-- Name: fk6f6de720c0eeb8ca; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumenthistory
    ADD CONSTRAINT fk6f6de720c0eeb8ca FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 1971 (class 2606 OID 17055)
-- Dependencies: 140 1925 144
-- Name: fk6f6de720f562e46a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumenthistory
    ADD CONSTRAINT fk6f6de720f562e46a FOREIGN KEY (legaldocument_id) REFERENCES legaldocument(id);


--
-- TOC entry 1988 (class 2606 OID 17140)
-- Dependencies: 171 1959 172
-- Name: fk76ea24fbb9df916d; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users_legaldocumentcategory
    ADD CONSTRAINT fk76ea24fbb9df916d FOREIGN KEY (users_id) REFERENCES users(id);


--
-- TOC entry 1987 (class 2606 OID 17135)
-- Dependencies: 1927 172 142
-- Name: fk76ea24fbd746f427; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users_legaldocumentcategory
    ADD CONSTRAINT fk76ea24fbd746f427 FOREIGN KEY (subscriptionslegaldocuments_id) REFERENCES legaldocumentcategory(id);


--
-- TOC entry 1972 (class 2606 OID 17060)
-- Dependencies: 150 140 1925
-- Name: fk8a814ca97e8c6ef9; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument_legaldocument
    ADD CONSTRAINT fk8a814ca97e8c6ef9 FOREIGN KEY (associatedlegaldocuments_id) REFERENCES legaldocument(id);


--
-- TOC entry 1973 (class 2606 OID 17065)
-- Dependencies: 140 150 1925
-- Name: fk8a814ca9f562e46a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument_legaldocument
    ADD CONSTRAINT fk8a814ca9f562e46a FOREIGN KEY (legaldocument_id) REFERENCES legaldocument(id);


--
-- TOC entry 1990 (class 2606 OID 17150)
-- Dependencies: 1949 173 162
-- Name: fk944aa46d5794b81e; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users_role
    ADD CONSTRAINT fk944aa46d5794b81e FOREIGN KEY (roles_role) REFERENCES role(role);


--
-- TOC entry 1989 (class 2606 OID 17145)
-- Dependencies: 1959 171 173
-- Name: fk944aa46db9df916d; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY users_role
    ADD CONSTRAINT fk944aa46db9df916d FOREIGN KEY (users_id) REFERENCES users(id);


--
-- TOC entry 1961 (class 2606 OID 17005)
-- Dependencies: 1917 132 128
-- Name: fk9bdfd45d3b753702; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk9bdfd45d3b753702 FOREIGN KEY (country_iso) REFERENCES country(iso);


--
-- TOC entry 1965 (class 2606 OID 17025)
-- Dependencies: 155 1941 136
-- Name: fkadb2da14c189ad2a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY faqcategory
    ADD CONSTRAINT fkadb2da14c189ad2a FOREIGN KEY (module_id) REFERENCES module(id);


--
-- TOC entry 1975 (class 2606 OID 17075)
-- Dependencies: 142 1927 151
-- Name: fkb27fb4c73c828eec; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument_legaldocumentcategory
    ADD CONSTRAINT fkb27fb4c73c828eec FOREIGN KEY (legaldocumentcategories_id) REFERENCES legaldocumentcategory(id);


--
-- TOC entry 1974 (class 2606 OID 17070)
-- Dependencies: 151 1925 140
-- Name: fkb27fb4c7c54e573f; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocument_legaldocumentcategory
    ADD CONSTRAINT fkb27fb4c7c54e573f FOREIGN KEY (legaldocuments_id) REFERENCES legaldocument(id);


--
-- TOC entry 1984 (class 2606 OID 17120)
-- Dependencies: 169 1955 169 168 168
-- Name: fkb2e68cc815c474d2; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY user_contract_permission
    ADD CONSTRAINT fkb2e68cc815c474d2 FOREIGN KEY (usercontracts_contract_id, usercontracts_user_id) REFERENCES user_contract(contract_id, user_id);


--
-- TOC entry 1985 (class 2606 OID 17125)
-- Dependencies: 169 1947 161
-- Name: fkb2e68cc88731af75; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY user_contract_permission
    ADD CONSTRAINT fkb2e68cc88731af75 FOREIGN KEY (permissions_id) REFERENCES permission(id);


--
-- TOC entry 1979 (class 2606 OID 17095)
-- Dependencies: 166 1941 155
-- Name: fkcf97e9fac189ad2a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY templatedocx
    ADD CONSTRAINT fkcf97e9fac189ad2a FOREIGN KEY (module_id) REFERENCES module(id);


--
-- TOC entry 1969 (class 2606 OID 17045)
-- Dependencies: 142 1927 142
-- Name: fkd0950bf243d31034; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY legaldocumentcategory
    ADD CONSTRAINT fkd0950bf243d31034 FOREIGN KEY (parentcategory_id) REFERENCES legaldocumentcategory(id);


--
-- TOC entry 1982 (class 2606 OID 17110)
-- Dependencies: 168 1915 131
-- Name: fke1386b0650b7e76a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY user_contract
    ADD CONSTRAINT fke1386b0650b7e76a FOREIGN KEY (contract_id) REFERENCES contract(id);


--
-- TOC entry 1983 (class 2606 OID 17115)
-- Dependencies: 171 168 1959
-- Name: fke1386b06c0eeb8ca; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY user_contract
    ADD CONSTRAINT fke1386b06c0eeb8ca FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 1962 (class 2606 OID 17010)
-- Dependencies: 128 1911 131
-- Name: fke20f7532607c3faa; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT fke20f7532607c3faa FOREIGN KEY (company_id) REFERENCES company(id);


--
-- TOC entry 1963 (class 2606 OID 17015)
-- Dependencies: 1941 155 131
-- Name: fke20f7532c189ad2a; Type: FK CONSTRAINT; Schema: public; Owner: certitools_dev02
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT fke20f7532c189ad2a FOREIGN KEY (module_id) REFERENCES module(id);


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-08-07 11:14:57

--
-- PostgreSQL database dump complete
--

