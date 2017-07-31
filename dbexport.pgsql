--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: jtcy
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO jtcy;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: jtcy
--

CREATE TABLE contents (
    id bigint NOT NULL,
    subject character varying,
    description character varying,
    link character varying,
    photos character varying,
    mood_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category character varying
);


ALTER TABLE contents OWNER TO jtcy;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: jtcy
--

CREATE SEQUENCE contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contents_id_seq OWNER TO jtcy;

--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jtcy
--

ALTER SEQUENCE contents_id_seq OWNED BY contents.id;


--
-- Name: moods; Type: TABLE; Schema: public; Owner: jtcy
--

CREATE TABLE moods (
    id bigint NOT NULL,
    emotion character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE moods OWNER TO jtcy;

--
-- Name: moods_id_seq; Type: SEQUENCE; Schema: public; Owner: jtcy
--

CREATE SEQUENCE moods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moods_id_seq OWNER TO jtcy;

--
-- Name: moods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jtcy
--

ALTER SEQUENCE moods_id_seq OWNED BY moods.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jtcy
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jtcy;

--
-- Name: users; Type: TABLE; Schema: public; Owner: jtcy
--

CREATE TABLE users (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    email character varying NOT NULL,
    encrypted_password character varying(128) NOT NULL,
    confirmation_token character varying(128),
    remember_token character varying(128) NOT NULL
);


ALTER TABLE users OWNER TO jtcy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jtcy
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jtcy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jtcy
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY contents ALTER COLUMN id SET DEFAULT nextval('contents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY moods ALTER COLUMN id SET DEFAULT nextval('moods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jtcy
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-07-23 12:04:54.589628	2017-07-23 12:04:54.589628
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: jtcy
--

COPY contents (id, subject, description, link, photos, mood_id, created_at, updated_at, category) FROM stdin;
1	Read This When You’re Feeling Sad And Don’t Know Why	This is for you on the days when you feel like giving up; on the days when you wish you could hide away in your bed and never return.	https://thoughtcatalog.com/colleen-george/2016/03/read-this-when-youre-feeling-sad-and-dont-know-why/	\N	2	2017-07-23 12:17:23.498382	2017-07-23 12:20:11.494885	article
2	IMDb: What to watch when you're sad or angry - a list by Iulia Elena	\N	http://www.imdb.com/list/ls053456706/	\N	\N	2017-07-23 13:28:26.063808	2017-07-23 13:28:26.063808	\N
3	IMDb: What to watch when you're sad or angry - a list by Iulia Elena	\N	http://www.imdb.com/list/ls053456706/	\N	\N	2017-07-23 13:29:57.873328	2017-07-23 13:29:57.873328	\N
4	IMDb: What to watch when you're sad or angry - a list by Iulia Elena	\N	http://www.imdb.com/list/ls053456706/	\N	3	2017-07-23 13:36:10.351748	2017-07-23 13:36:10.351748	\N
5	Resident Evil 7: The Kotaku Review	\N	http://kotaku.com/resident-evil-7-the-kotaku-review-1791658385	\N	4	2017-07-23 13:37:13.552297	2017-07-23 13:37:13.552297	\N
6	Kristen Ulmer book: How athletes cope with fear | SI.com	\N	https://www.si.com/edge/2017/07/05/kristen-ulmer-book-art-of-fear	\N	4	2017-07-24 01:15:03.921363	2017-07-24 01:15:03.921363	\N
\.


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jtcy
--

SELECT pg_catalog.setval('contents_id_seq', 6, true);


--
-- Data for Name: moods; Type: TABLE DATA; Schema: public; Owner: jtcy
--

COPY moods (id, emotion, created_at, updated_at) FROM stdin;
1	happy	2017-07-23 12:05:31.025924	2017-07-23 12:05:31.025924
2	sad	2017-07-23 12:05:38.445703	2017-07-23 12:05:38.445703
4	fear	2017-07-23 12:05:46.465062	2017-07-23 12:05:46.465062
3	anger	2017-07-23 12:05:43.080722	2017-07-23 13:28:05.534778
\.


--
-- Name: moods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jtcy
--

SELECT pg_catalog.setval('moods_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jtcy
--

COPY schema_migrations (version) FROM stdin;
20170723120329
20170723120923
20170724022600
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jtcy
--

COPY users (id, created_at, updated_at, username, email, encrypted_password, confirmation_token, remember_token) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jtcy
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contents_pkey; Type: CONSTRAINT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: moods_pkey; Type: CONSTRAINT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY moods
    ADD CONSTRAINT moods_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jtcy
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_contents_on_mood_id; Type: INDEX; Schema: public; Owner: jtcy
--

CREATE INDEX index_contents_on_mood_id ON contents USING btree (mood_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jtcy
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: jtcy
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

