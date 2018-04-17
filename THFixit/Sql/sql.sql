--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.1

-- Started on 2018-04-17 16:43:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 202 (class 1259 OID 17089)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE branch_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 17091)
-- Name: branchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE branchs (
    id integer DEFAULT nextval('branch_id_seq'::regclass) NOT NULL,
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


ALTER TABLE branchs OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17125)
-- Name: building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE building_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17127)
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE buildings (
    id integer DEFAULT nextval('building_id_seq'::regclass) NOT NULL,
    branch_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE buildings OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17140)
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE class_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17142)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE class (
    id integer DEFAULT nextval('class_id_seq'::regclass) NOT NULL,
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


ALTER TABLE class OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17111)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE department_id_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17113)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departments (
    id integer DEFAULT nextval('department_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE departments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17239)
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE equipment_id_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17265)
-- Name: equipment_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipment_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE equipment_serial_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17274)
-- Name: equipment_serials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE equipment_serials (
    id integer DEFAULT nextval('equipment_serial_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    eq_id integer,
    serial_number character varying(50) DEFAULT ''::character varying NOT NULL,
    branch_id integer,
    active boolean DEFAULT false NOT NULL,
    regis_at timestamp(6) with time zone,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE equipment_serials OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17241)
-- Name: equipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE equipments (
    id integer DEFAULT nextval('equipment_id_seq'::regclass) NOT NULL,
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


ALTER TABLE equipments OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17205)
-- Name: priority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE priority_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17207)
-- Name: prioritys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prioritys (
    id integer DEFAULT nextval('priority_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(500) DEFAULT ''::character varying NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE prioritys OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17079)
-- Name: role_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE role_access_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17081)
-- Name: role_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role_access (
    id integer DEFAULT nextval('role_access_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    role_id integer,
    menu_id integer,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE role_access OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17062)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17064)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer DEFAULT nextval('role_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(500) DEFAULT ''::character varying NOT NULL,
    is_technical boolean DEFAULT false NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17159)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE rooms_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17161)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rooms (
    id integer DEFAULT nextval('rooms_id_seq'::regclass) NOT NULL,
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


ALTER TABLE rooms OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17185)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE status_id_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17196)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status (
    id integer DEFAULT nextval('status_id_seq'::regclass) NOT NULL,
    is_lock boolean DEFAULT false NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE status OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17228)
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE ticket_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17230)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tickets (
    id integer DEFAULT nextval('ticket_id_seq'::regclass) NOT NULL,
    no integer,
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
    serial_number character varying(50),
    equipment_code character varying(50),
    equipment_name character varying(50),
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE tickets OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17176)
-- Name: user_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE user_branch_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17178)
-- Name: user_branchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_branchs (
    id integer DEFAULT nextval('user_branch_id_seq'::regclass) NOT NULL,
    branch_id integer,
    user_id integer,
    is_lock boolean DEFAULT false NOT NULL,
    creator_id integer,
    created_at timestamp(6) with time zone NOT NULL,
    editor_id integer,
    edited_at timestamp(6) with time zone
);


ALTER TABLE user_branchs OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17043)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17045)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer DEFAULT nextval('user_id_seq'::regclass) NOT NULL,
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


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2985 (class 0 OID 17091)
-- Dependencies: 203
-- Data for Name: branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY branchs (id, is_lock, code, name, address, tel, email, image, user_limit, token_line, active, creator_id, created_at, editor_id, edited_at, ticket_prefix1, ticket_prefix2, ticket_prefix3, ticket_prefix4, ticket_prefix5, ticket_prefix6) FROM stdin;
1	f	UBN	UBN	-	-	-	-	0	-	t	1	2018-04-05 11:09:21+07	\N	\N	WO	\N	\N	\N	\N	\N
2	f	SSK	SSK	-	-	-	-	0	-	t	1	2018-04-05 11:10:33+07	\N	\N	WO	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2989 (class 0 OID 17127)
-- Dependencies: 207
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY buildings (id, branch_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	1	f	Head Office	t	1	2018-04-05 14:25:39+07	\N	\N
2	1	t	Show Room	t	1	2018-04-07 09:30:54+07	\N	\N
\.


--
-- TOC entry 2991 (class 0 OID 17142)
-- Dependencies: 209
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY class (id, branch_id, building_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	\N	1	t	Class 1	t	1	2018-04-05 14:35:54+07	\N	\N
2	\N	2	t	Class G	t	1	2018-04-07 09:31:20+07	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 17113)
-- Dependencies: 205
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departments (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	f	Accounting	t	1	2018-04-05 11:42:07+07	\N	\N
2	f	Sale	t	1	2018-04-05 11:42:26+07	\N	\N
\.


--
-- TOC entry 3005 (class 0 OID 17274)
-- Dependencies: 223
-- Data for Name: equipment_serials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipment_serials (id, is_lock, eq_id, serial_number, branch_id, active, regis_at, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	f	2	444444	1	t	2018-04-17 14:56:39+07	1	2018-04-17 14:56:45+07	\N	\N
\.


--
-- TOC entry 3003 (class 0 OID 17241)
-- Dependencies: 221
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipments (id, is_lock, code, name, model, supplier_name, supplier_contact, branch_id, depart_id, building_id, class_id, room_id, system_id, equipment_group_id, equipment_type_id, image1, image2, image3, image4, image5, image6, image7, image8, image9, active, status_id, creator_id, created_at, editor_id, edited_at) FROM stdin;
2	f	ACN	ACTION MMA	4583			\N	\N	\N	\N	\N	\N	\N	\N										t	\N	1	2018-04-17 14:56:20+07	\N	\N
\.


--
-- TOC entry 2999 (class 0 OID 17207)
-- Dependencies: 217
-- Data for Name: prioritys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) FROM stdin;
1	f	Low	1	2018-04-07 09:13:21+07	\N	\N	t
2	f	Medium	1	2018-04-07 09:14:02+07	\N	\N	t
3	f	High	1	2018-04-07 09:14:25+07	\N	\N	t
4	f	Urgent	1	2018-04-07 09:14:48+07	\N	\N	t
\.


--
-- TOC entry 2983 (class 0 OID 17081)
-- Dependencies: 201
-- Data for Name: role_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role_access (id, is_lock, role_id, menu_id, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	f	1	1	f	1	2018-04-05 09:19:25+07	\N	\N
\.


--
-- TOC entry 2981 (class 0 OID 17064)
-- Dependencies: 199
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, is_lock, name, is_technical, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	t	Administrator	f	t	1	2018-04-04 15:39:10+07	1	2018-04-04 15:39:13+07
\.


--
-- TOC entry 2993 (class 0 OID 17161)
-- Dependencies: 211
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rooms (id, branch_id, building_id, class_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	\N	\N	1	t	MIS	t	1	2018-04-05 14:36:22+07	\N	\N
2	\N	\N	2	t	Grand Ballom	t	1	2018-04-07 09:31:57+07	\N	\N
3	\N	\N	1	t	Purchase	t	1	2018-04-07 09:32:27+07	\N	\N
\.


--
-- TOC entry 2997 (class 0 OID 17196)
-- Dependencies: 215
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	t	Open	t	1	2018-04-07 09:15:55+07	1	2018-04-07 09:16:14+07
2	f	Pending	t	1	2018-04-07 09:18:23+07	\N	\N
3	f	Resolve	t	1	2018-04-07 09:18:45+07	\N	\N
4	f	Cancel	t	1	2018-04-07 09:19:11+07	\N	\N
5	f	Close	t	1	2018-04-07 09:20:06+07	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 17230)
-- Dependencies: 219
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets (id, no, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no, serial_number, equipment_code, equipment_name, editor_id, edited_at) FROM stdin;
2	2	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 14:59:23.268351	UBN20180004-00002	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
3	3	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 15:15:30.093774	UBN--20180004-00003	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
4	1	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 15:17:22.352795	UBN-WO-20180004-00001	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
1	1	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	2	2	045315480,MIS Depart,555-6	1	2018-04-07 14:56:05.775478	UBN20180004-00001	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
5	2	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:22:31.549471	UBN-WO-20180004-00002	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
6	3	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:22:41.460315	UBN-WO-20180004-00003	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
7	4	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:23:34.746788	UBN-WO-20180004-00004	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
8	5	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-07 16:26:16.959856	UBN-WO-20180004-00005	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
9	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-17 14:43:40.704826	WO-20180004-00006	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
10	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-17 15:22:27.256632	WO-20180004-00006	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
11	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-17 15:25:40.523624	WO-20180004-00006	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
12	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-17 15:27:00.460836	WO-20180004-00006	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
13	\N	Ticket Subject *	Ticket Subject *	1	1	1	1	1	1	1	1	045315480,MIS Depart,555-6	1	2018-04-17 15:40:54.313968	WO-20180004-00006	444444	\N	\N	1	2018-04-17 15:41:18.674986+07
\.


--
-- TOC entry 2995 (class 0 OID 17178)
-- Dependencies: 213
-- Data for Name: user_branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_branchs (id, branch_id, user_id, is_lock, creator_id, created_at, editor_id, edited_at) FROM stdin;
1	1	1	t	1	2018-04-07 08:18:38+07	\N	\N
2	2	1	t	1	2018-04-07 08:18:49+07	\N	\N
\.


--
-- TOC entry 2979 (class 0 OID 17045)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, is_lock, username, password, name, tel, line, role_id, branch_id, depart_id, building_id, room_id, class_id, is_technical, active, creator_id, created_at, edited_at, editor_id, image_avatar, email, contact) FROM stdin;
1	f	admin	$2b$10$c1SFboU78jc6/jAxQ5PRq.B6r7VkXP6enHScXS6srfK8Y1bq7VaZq	ROENGRIT MOONCHAI	0892536161		1	1	1	1	1	1	f	t	1	2018-04-04 09:19:01+07	2018-04-04 09:22:54+07	1	/image/user/678db456-121b-4bcd-9dc7-593d88960b05.png	logon.firstclass@gmail.com	045315480,MIS Depart,555-6
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 202
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('branch_id_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 206
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('building_id_seq', 2, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 208
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('class_id_seq', 1, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 204
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('department_id_seq', 2, true);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 220
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipment_id_seq', 2, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 222
-- Name: equipment_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipment_serial_id_seq', 1, true);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 216
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priority_id_seq', 5, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 200
-- Name: role_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_access_id_seq', 1, true);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_id_seq', 1, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 210
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rooms_id_seq', 2, true);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 214
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_id_seq', 2, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 218
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ticket_id_seq', 13, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_branch_id_seq', 2, true);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 3, true);


--
-- TOC entry 2838 (class 2606 OID 17108)
-- Name: branchs branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 17110)
-- Name: branchs branchs_unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branchs
    ADD CONSTRAINT branchs_unique_code UNIQUE (code);


--
-- TOC entry 2844 (class 2606 OID 17136)
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 17151)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 17122)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 17217)
-- Name: prioritys prioritys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prioritys
    ADD CONSTRAINT prioritys_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 17088)
-- Name: role_access role_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_access
    ADD CONSTRAINT role_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 17076)
-- Name: roles roles_unique_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_unique_name UNIQUE (name);


--
-- TOC entry 2848 (class 2606 OID 17170)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 17204)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 17235)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 17184)
-- Name: user_branchs user_branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_branchs
    ADD CONSTRAINT user_branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 17078)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 17061)
-- Name: users users_unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_unique_username UNIQUE (username);


-- Completed on 2018-04-17 16:43:46

--
-- PostgreSQL database dump complete
--

