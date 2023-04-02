--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: mkleczka
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO mkleczka;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA heroku_ext;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: mkleczka
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    user_id integer NOT NULL,
    address_type character varying(20) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255),
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zip character varying(10) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.address OWNER TO mkleczka;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: mkleczka
--

CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO mkleczka;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mkleczka
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: mkleczka
--

CREATE TABLE public.app_user (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    language_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role_id integer
);


ALTER TABLE public.app_user OWNER TO mkleczka;

--
-- Name: app_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mkleczka
--

CREATE SEQUENCE public.app_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_id_seq OWNER TO mkleczka;

--
-- Name: app_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mkleczka
--

ALTER SEQUENCE public.app_user_user_id_seq OWNED BY public.app_user.user_id;


--
-- Name: language; Type: TABLE; Schema: public; Owner: mkleczka
--

CREATE TABLE public.language (
    language_id integer NOT NULL,
    language_name character varying(50) NOT NULL,
    language_code character varying(10) NOT NULL
);


ALTER TABLE public.language OWNER TO mkleczka;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: mkleczka
--

CREATE SEQUENCE public.language_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO mkleczka;

--
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mkleczka
--

ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: mkleczka
--

CREATE TABLE public.user_role (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.user_role OWNER TO mkleczka;

--
-- Name: user_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: mkleczka
--

CREATE SEQUENCE public.user_role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_role_id_seq OWNER TO mkleczka;

--
-- Name: user_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mkleczka
--

ALTER SEQUENCE public.user_role_role_id_seq OWNED BY public.user_role.role_id;


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: app_user user_id; Type: DEFAULT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.app_user ALTER COLUMN user_id SET DEFAULT nextval('public.app_user_user_id_seq'::regclass);


--
-- Name: language language_id; Type: DEFAULT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);


--
-- Name: user_role role_id; Type: DEFAULT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.user_role ALTER COLUMN role_id SET DEFAULT nextval('public.user_role_role_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: mkleczka
--

COPY public.address (address_id, user_id, address_type, address_1, address_2, city, state, zip, created_at) FROM stdin;
1	1	home	830 Crab Orchard Drive	\N	Roswell	GA	30076	2023-03-10 16:31:30.314577
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: mkleczka
--

COPY public.app_user (user_id, first_name, last_name, email, user_password, language_id, created_at, role_id) FROM stdin;
1	Michael	Kleczka	mkleczkajr@gmail.com	test@1234	1	2023-03-10 16:29:49.69564	\N
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: mkleczka
--

COPY public.language (language_id, language_name, language_code) FROM stdin;
1	English	en-US
2	Spanish	es-US
3	Chinese	zh-US
4	Tagalog	tl-US
5	Vietnamese	vi-US
6	French	fr-US
7	Korean	ko-US
8	German	de-US
9	Arabic	ar-US
10	Russian	ru-US
11	Italian	it-US
12	Hindi	hi-US
13	Portuguese	pt-US
14	Polish	pl-US
15	Japanese	ja-US
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: mkleczka
--

COPY public.user_role (role_id, role_name) FROM stdin;
1	user
2	admin
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mkleczka
--

SELECT pg_catalog.setval('public.address_address_id_seq', 1, true);


--
-- Name: app_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mkleczka
--

SELECT pg_catalog.setval('public.app_user_user_id_seq', 1, true);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mkleczka
--

SELECT pg_catalog.setval('public.language_language_id_seq', 15, true);


--
-- Name: user_role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mkleczka
--

SELECT pg_catalog.setval('public.user_role_role_id_seq', 2, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (role_id);


--
-- Name: address address_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(user_id) ON DELETE CASCADE;


--
-- Name: app_user fk_language_id; Type: FK CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fk_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: app_user fk_role_id; Type: FK CONSTRAINT; Schema: public; Owner: mkleczka
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES public.user_role(role_id);


--
-- PostgreSQL database dump complete
--

