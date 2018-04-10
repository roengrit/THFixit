--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-04-10 23:21:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 196 (class 1259 OID 16550)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.branch_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16552)
-- Name: branchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branchs (
    id integer DEFAULT nextval('public.branch_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    code character varying(50) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    address character varying(255) DEFAULT ''::character varying NOT NULL,
    tel character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    image character varying(255) DEFAULT ''::character varying NOT NULL,
    user_limit integer,
    token_line character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone,
    ticket_prefix1 character varying(30),
    ticket_prefix2 character varying(30),
    ticket_prefix3 character varying(30),
    ticket_prefix4 character varying(30),
    ticket_prefix5 character varying(30),
    ticket_prefix6 character varying(30)
);


ALTER TABLE public.branchs OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16568)
-- Name: building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.building_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16570)
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buildings (
    id integer DEFAULT nextval('public.building_id_seq'::regclass) NOT NULL,
    branch_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.buildings OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16577)
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.class_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16579)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id integer DEFAULT nextval('public.class_id_seq'::regclass) NOT NULL,
    branch_id integer,
    building_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16586)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16588)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer DEFAULT nextval('public.department_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16708)
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.equipment_id_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16758)
-- Name: equipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipments (
    id integer DEFAULT nextval('public.equipment_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    code character varying(50) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    model character varying(255) DEFAULT ''::character varying NOT NULL,
    supplier_name character varying(255) DEFAULT ''::character varying NOT NULL,
    supplier_contact character varying(300) DEFAULT ''::character varying NOT NULL,
    branch_id integer,
    depart_id integer,
    building_id integer,
    class_id integer,
    room_id integer,
    system_id integer,
    equipment_group_id integer,
    equipment_type_id integer,
    image1 character varying(255) DEFAULT ''::character varying NOT NULL,
    image2 character varying(255) DEFAULT ''::character varying NOT NULL,
    image3 character varying(255) DEFAULT ''::character varying NOT NULL,
    image4 character varying(255) DEFAULT ''::character varying NOT NULL,
    image5 character varying(255) DEFAULT ''::character varying NOT NULL,
    image6 character varying(255) DEFAULT ''::character varying NOT NULL,
    image7 character varying(255) DEFAULT ''::character varying NOT NULL,
    image8 character varying(255) DEFAULT ''::character varying NOT NULL,
    image9 character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    status_id integer,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.equipments OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16595)
-- Name: priority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.priority_id_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16597)
-- Name: prioritys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prioritys (
    id integer DEFAULT nextval('public.priority_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(500) DEFAULT ''::character varying NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.prioritys OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16607)
-- Name: role_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.role_access_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16609)
-- Name: role_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_access (
    id integer DEFAULT nextval('public.role_access_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    role_id integer,
    menu_id integer,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.role_access OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16615)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16617)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(500) DEFAULT ''::character varying NOT NULL,
    is_technical boolean DEFAULT false NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16628)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16630)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer DEFAULT nextval('public.rooms_id_seq'::regclass) NOT NULL,
    branch_id integer,
    building_id integer,
    class_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16637)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16639)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16646)
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ticket_id_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16648)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id integer DEFAULT nextval('public.ticket_id_seq'::regclass) NOT NULL,
    no integer,
    no_ref integer,
    title character varying(255),
    description character varying(1000),
    requestor_id integer,
    branch_id integer,
    depart_id integer,
    building_id integer,
    class_id integer,
    room_id integer,
    priority_id integer,
    status_id integer,
    contact character varying(255),
    creator_id integer,
    created_at timestamp(6) without time zone,
    doc_no character varying(50),
    serial_number bit varying(50)
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16655)
-- Name: user_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.user_branch_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16657)
-- Name: user_branchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_branchs (
    id integer DEFAULT nextval('public.user_branch_id_seq'::regclass) NOT NULL,
    branch_id integer,
    user_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE public.user_branchs OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16662)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16664)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    username character varying(50) DEFAULT ''::character varying NOT NULL,
    password character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(500) DEFAULT ''::character varying NOT NULL,
    tel character varying(255) DEFAULT ''::character varying NOT NULL,
    line character varying(255) DEFAULT ''::character varying NOT NULL,
    role_id integer,
    branch_id integer,
    depart_id integer,
    building_id integer,
    room_id integer,
    class_id integer,
    is_technical boolean DEFAULT false NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    edited_at timestamp(6) with time zone,
    editor_id integer,
    image_avatar character varying(300),
    email character varying(255),
    contact character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2327 (class 0 OID 16552)
-- Dependencies: 197
-- Data for Name: branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branchs (id, is_lock, code, name, address, tel, email, image, user_limit, token_line, active, creator_id, created_at, editor_id, edited_at, ticket_prefix1, ticket_prefix2, ticket_prefix3, ticket_prefix4, ticket_prefix5, ticket_prefix6) FROM stdin;
1	f	UBN	UBN	-	-	-	-	0	-	t	1	2018-04-05 11:09:21+07	\N	\N	WO	\N	\N	\N	\N	\N
2	f	SSK	SSK	-	-	-	-	0	-	t	1	2018-04-05 11:10:33+07	\N	\N	WO	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2329 (class 0 OID 16570)
-- Dependencies: 199
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buildings (id, branch_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	1	f	Head Office	t	1	2018-04-05 14:25:39+07	\N	\N
2	1	t	Show Room	t	1	2018-04-07 09:30:54+07	\N	\N
\.


--
-- TOC entry 2331 (class 0 OID 16579)
-- Dependencies: 201
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (id, branch_id, building_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	\N	1	t	Class 1	t	1	2018-04-05 14:35:54+07	\N	\N
2	\N	2	t	Class G	t	1	2018-04-07 09:31:20+07	\N	\N
\.


--
-- TOC entry 2333 (class 0 OID 16588)
-- Dependencies: 203
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	f	Accounting	t	1	2018-04-05 11:42:07+07	\N	\N
2	f	Sale	t	1	2018-04-05 11:42:26+07	\N	\N
\.


--
-- TOC entry 2351 (class 0 OID 16758)
-- Dependencies: 221
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipments (id, is_lock, code, name, model, supplier_name, supplier_contact, branch_id, depart_id, building_id, class_id, room_id, system_id, equipment_group_id, equipment_type_id, image1, image2, image3, image4, image5, image6, image7, image8, image9, active, status_id, creator_id, created_at, editor_id, edited_at) FROM stdin;
2	f	BCM-3314	BCM-3314				1	\N	\N	\N	\N	\N	\N	\N										f	\N	1	2018-04-10 22:48:59+07	\N	\N
\.


--
-- TOC entry 2335 (class 0 OID 16597)
-- Dependencies: 205
-- Data for Name: prioritys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) FROM stdin;
1	f	Low	1	2018-04-07 09:13:21+07	\N	\N	t
2	f	Medium	1	2018-04-07 09:14:02+07	\N	\N	t
3	f	High	1	2018-04-07 09:14:25+07	\N	\N	t
4	f	Urgent	1	2018-04-07 09:14:48+07	\N	\N	t
\.


--
-- TOC entry 2337 (class 0 OID 16609)
-- Dependencies: 207
-- Data for Name: role_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_access (id, is_lock, role_id, menu_id, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	f	1	1	f	1	2018-04-05 09:19:25+07	\N	\N
\.


--
-- TOC entry 2339 (class 0 OID 16617)
-- Dependencies: 209
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, is_lock, name, is_technical, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	t	Administrator	f	t	1	2018-04-04 15:39:10+07	1	2018-04-04 15:39:13+07
\.


--
-- TOC entry 2341 (class 0 OID 16630)
-- Dependencies: 211
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, branch_id, building_id, class_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	\N	\N	1	t	MIS	t	1	2018-04-05 14:36:22+07	\N	\N
2	\N	\N	2	t	Grand Ballom	t	1	2018-04-07 09:31:57+07	\N	\N
3	\N	\N	1	t	Purchase	t	1	2018-04-07 09:32:27+07	\N	\N
\.


--
-- TOC entry 2343 (class 0 OID 16639)
-- Dependencies: 213
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	t	Open	t	1	2018-04-07 09:15:55+07	1	2018-04-07 09:16:14+07
2	f	Pending	t	1	2018-04-07 09:18:23+07	\N	\N
3	f	Resolve	t	1	2018-04-07 09:18:45+07	\N	\N
4	f	Cancel	t	1	2018-04-07 09:19:11+07	\N	\N
5	f	Close	t	1	2018-04-07 09:20:06+07	\N	\N
\.


--
-- TOC entry 2345 (class 0 OID 16648)
-- Dependencies: 215
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no, serial_number) FROM stdin;
2	2	\N	Ticket Subject *	Ticket Description *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 14:59:23.268351	UBN20180004-00002	\N
3	3	\N	Ticket Subject *	Ticket Description *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 15:15:30.093774	UBN--20180004-00003	\N
4	1	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 15:17:22.352795	UBN-WO-20180004-00001	\N
1	1	\N	Ticket Subject *	Ticket Description *	1	1	1	1	1	1	2	2	045315480,MIS Depart,555-6	1	2018-04-07 14:56:05.775478	UBN20180004-00001	\N
5	2	\N	Ticket Subject *	Date/Time Functions and Operators	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:22:31.549471	UBN-WO-20180004-00002	\N
6	3	\N	Ticket Subject *	Date/Time Functions and Operators	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:22:41.460315	UBN-WO-20180004-00003	\N
7	4	\N	C	C	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:23:34.746788	UBN-WO-20180004-00004	\N
8	5	\N	C	C	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:26:16.959856	UBN-WO-20180004-00005	\N
\.


--
-- TOC entry 2347 (class 0 OID 16657)
-- Dependencies: 217
-- Data for Name: user_branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_branchs (id, branch_id, user_id, is_lock, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	1	1	t	1	2018-04-07 08:18:38+07	\N	\N
2	2	1	t	1	2018-04-07 08:18:49+07	\N	\N
\.


--
-- TOC entry 2349 (class 0 OID 16664)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, is_lock, username, password, name, tel, line, role_id, branch_id, depart_id, building_id, room_id, class_id, is_technical, active, creator_id, created_at, edited_at, editor_id, image_avatar, email, contact) FROM stdin;
1	f	admin	$2b$10$c1SFboU78jc6/jAxQ5PRq.B6r7VkXP6enHScXS6srfK8Y1bq7VaZq	ROENGRIT MOONCHAI	0892536161		1	1	1	1	1	1	f	t	1	2018-04-04 09:19:01+07	2018-04-04 09:22:54+07	1	/image/user/678db456-121b-4bcd-9dc7-593d88960b05.png	logon.firstclass@gmail.com	045315480,MIS Depart,555-6
\.


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 196
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 1, false);


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 198
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_id_seq', 2, true);


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 200
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 1, true);


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 202
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 2, true);


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 220
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_id_seq', 2, true);


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 204
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priority_id_seq', 5, true);


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 206
-- Name: role_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_access_id_seq', 1, true);


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 208
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, true);


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 210
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 2, true);


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 212
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 2, true);


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 214
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_id_seq', 8, true);


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_branch_id_seq', 2, true);


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- TOC entry 2174 (class 2606 OID 16680)
-- Name: branchs branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 16682)
-- Name: branchs branchs_unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_unique_code UNIQUE (code);


--
-- TOC entry 2178 (class 2606 OID 16684)
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 16686)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 16688)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 16782)
-- Name: equipments equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (id);


--
-- TOC entry 2204 (class 2606 OID 16784)
-- Name: equipments equipments_unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_unique_code UNIQUE (code);


--
-- TOC entry 2184 (class 2606 OID 16690)
-- Name: prioritys prioritys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prioritys
    ADD CONSTRAINT prioritys_pkey PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 16692)
-- Name: role_access role_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_access
    ADD CONSTRAINT role_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 16694)
-- Name: roles roles_unique_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_unique_name UNIQUE (name);


--
-- TOC entry 2190 (class 2606 OID 16696)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 16698)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 16700)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 16702)
-- Name: user_branchs user_branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branchs
    ADD CONSTRAINT user_branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 16704)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 16706)
-- Name: users users_unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique_username UNIQUE (username);


-- Completed on 2018-04-10 23:21:15

--
-- PostgreSQL database dump complete
--

