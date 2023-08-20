--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-0ubuntu0.23.04.1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-0ubuntu0.23.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cat; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.cat (
    id integer NOT NULL,
    user_id character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    image_url character varying(50)
);


ALTER TABLE public.cat OWNER TO username;

--
-- Name: cat_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat_id_seq OWNER TO username;

--
-- Name: cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.cat_id_seq OWNED BY public.cat.id;


--
-- Name: cat_user; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.cat_user (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.cat_user OWNER TO username;

--
-- Name: cat_user_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.cat_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cat_user_id_seq OWNER TO username;

--
-- Name: cat_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.cat_user_id_seq OWNED BY public.cat_user.id;


--
-- Name: incident; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.incident (
    id integer NOT NULL,
    cat_id integer NOT NULL,
    user_id character varying(50) NOT NULL,
    date_created timestamp without time zone NOT NULL
);


ALTER TABLE public.incident OWNER TO username;

--
-- Name: incident_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.incident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_id_seq OWNER TO username;

--
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.incident_id_seq OWNED BY public.incident.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.session (
    id integer NOT NULL,
    userid character varying(50) NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_used timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expires_on timestamp without time zone DEFAULT (CURRENT_TIMESTAMP + '00:30:00'::interval)
);


ALTER TABLE public.session OWNER TO username;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO username;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: cat id; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cat ALTER COLUMN id SET DEFAULT nextval('public.cat_id_seq'::regclass);


--
-- Name: cat_user id; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cat_user ALTER COLUMN id SET DEFAULT nextval('public.cat_user_id_seq'::regclass);


--
-- Name: incident id; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.incident ALTER COLUMN id SET DEFAULT nextval('public.incident_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Data for Name: cat; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.cat (id, user_id, name, image_url) FROM stdin;
1	asdf	bob	64daf5e275125c03341f1b45
9	asdf	good name	64dc411e5dbf986d81ad4fc1
11	mom	cat	64dc411e5dbf986d81ad4fc1
16	asdf	catName	64dd8852126c146b3163caa5
17	asdf	anything	64dfeea467eb360235400063
\.


--
-- Data for Name: cat_user; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.cat_user (id, username, password) FROM stdin;
1	asdf	password
2	mom	password
\.


--
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.incident (id, cat_id, user_id, date_created) FROM stdin;
1	1	asdf	2023-07-18 00:00:00
2	11	mom	2021-05-09 00:00:00
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.session (id, userid, created_on, last_used, expires_on) FROM stdin;
2	asdf	2023-08-17 21:56:28.502772	2023-08-17 21:56:28.502772	2023-08-17 22:26:28.502772
9	asdf	2023-08-17 22:38:15.568	2023-08-17 22:38:17.174	2023-08-17 23:08:15.568
10	asdf	2023-08-17 22:41:57.397	2023-08-17 22:43:29.294	2023-08-17 23:13:29.293
11	asdf	2023-08-17 22:44:36.222	2023-08-17 22:44:37.03	2023-08-17 22:45:37.03
12	asdf	2023-08-18 17:19:51.528	2023-08-18 17:20:19.807	2023-08-18 17:21:19.806
13	asdf	2023-08-18 17:20:31.761	2023-08-18 17:20:32.27	2023-08-18 17:21:32.269
\.


--
-- Name: cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.cat_id_seq', 17, true);


--
-- Name: cat_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.cat_user_id_seq', 1, false);


--
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.incident_id_seq', 2, true);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.session_id_seq', 13, true);


--
-- Name: cat cat_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT cat_pkey PRIMARY KEY (id);


--
-- Name: cat_user cat_user_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cat_user
    ADD CONSTRAINT cat_user_pkey PRIMARY KEY (id);


--
-- Name: cat_user cat_user_username_key; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cat_user
    ADD CONSTRAINT cat_user_username_key UNIQUE (username);


--
-- Name: incident incident_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: incident incident_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.cat(id);


--
-- PostgreSQL database dump complete
--

