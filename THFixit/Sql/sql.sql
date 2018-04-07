--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-04-07 17:24:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE fixit;
--
-- TOC entry 2973 (class 1262 OID 17042)
-- Name: fixit; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE fixit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Thai_Thailand.874' LC_CTYPE = 'Thai_Thailand.874';


ALTER DATABASE fixit OWNER TO postgres;

\connect fixit

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 202 (class 1259 OID 17089)
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
-- TOC entry 203 (class 1259 OID 17091)
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
-- TOC entry 206 (class 1259 OID 17125)
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
-- TOC entry 207 (class 1259 OID 17127)
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
-- TOC entry 208 (class 1259 OID 17140)
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
-- TOC entry 209 (class 1259 OID 17142)
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
-- TOC entry 204 (class 1259 OID 17111)
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
-- TOC entry 205 (class 1259 OID 17113)
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
-- TOC entry 216 (class 1259 OID 17205)
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
-- TOC entry 217 (class 1259 OID 17207)
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
-- TOC entry 200 (class 1259 OID 17079)
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
-- TOC entry 201 (class 1259 OID 17081)
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
-- TOC entry 198 (class 1259 OID 17062)
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
-- TOC entry 199 (class 1259 OID 17064)
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
-- TOC entry 210 (class 1259 OID 17159)
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
-- TOC entry 211 (class 1259 OID 17161)
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
-- TOC entry 214 (class 1259 OID 17185)
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
-- TOC entry 215 (class 1259 OID 17196)
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
-- TOC entry 218 (class 1259 OID 17228)
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
-- TOC entry 219 (class 1259 OID 17230)
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
    doc_no character varying(50)
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17176)
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
-- TOC entry 213 (class 1259 OID 17178)
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
-- TOC entry 196 (class 1259 OID 17043)
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
-- TOC entry 197 (class 1259 OID 17045)
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
-- TOC entry 2951 (class 0 OID 17091)
-- Dependencies: 203
-- Data for Name: branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.branchs (id, is_lock, code, name, address, tel, email, image, user_limit, token_line, active, creator_id, created_at, editor_id, edited_at, ticket_prefix1, ticket_prefix2, ticket_prefix3, ticket_prefix4, ticket_prefix5, ticket_prefix6) VALUES (1, false, 'UBN', 'UBN', '-', '-', '-', '-', 0, '-', true, 1, '2018-04-05 11:09:21+07', NULL, NULL, 'WO', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.branchs (id, is_lock, code, name, address, tel, email, image, user_limit, token_line, active, creator_id, created_at, editor_id, edited_at, ticket_prefix1, ticket_prefix2, ticket_prefix3, ticket_prefix4, ticket_prefix5, ticket_prefix6) VALUES (2, false, 'SSK', 'SSK', '-', '-', '-', '-', 0, '-', true, 1, '2018-04-05 11:10:33+07', NULL, NULL, 'WO', NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2955 (class 0 OID 17127)
-- Dependencies: 207
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.buildings (id, branch_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (1, 1, false, 'Head Office', true, 1, '2018-04-05 14:25:39+07', NULL, NULL);
INSERT INTO public.buildings (id, branch_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (2, 1, true, 'Show Room', true, 1, '2018-04-07 09:30:54+07', NULL, NULL);


--
-- TOC entry 2957 (class 0 OID 17142)
-- Dependencies: 209
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class (id, branch_id, building_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (1, NULL, 1, true, 'Class 1', true, 1, '2018-04-05 14:35:54+07', NULL, NULL);
INSERT INTO public.class (id, branch_id, building_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (2, NULL, 2, true, 'Class G', true, 1, '2018-04-07 09:31:20+07', NULL, NULL);


--
-- TOC entry 2953 (class 0 OID 17113)
-- Dependencies: 205
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departments (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (1, false, 'Accounting', true, 1, '2018-04-05 11:42:07+07', NULL, NULL);
INSERT INTO public.departments (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (2, false, 'Sale', true, 1, '2018-04-05 11:42:26+07', NULL, NULL);


--
-- TOC entry 2965 (class 0 OID 17207)
-- Dependencies: 217
-- Data for Name: prioritys; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) VALUES (1, false, 'Low', 1, '2018-04-07 09:13:21+07', NULL, NULL, true);
INSERT INTO public.prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) VALUES (2, false, 'Medium', 1, '2018-04-07 09:14:02+07', NULL, NULL, true);
INSERT INTO public.prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) VALUES (3, false, 'High', 1, '2018-04-07 09:14:25+07', NULL, NULL, true);
INSERT INTO public.prioritys (id, is_lock, name, creator_id, created_at, editor_id, edited_at, active) VALUES (4, false, 'Urgent', 1, '2018-04-07 09:14:48+07', NULL, NULL, true);


--
-- TOC entry 2949 (class 0 OID 17081)
-- Dependencies: 201
-- Data for Name: role_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role_access (id, is_lock, role_id, menu_id, active, creator_id, created_at, editor_id, edited_at) VALUES (1, false, 1, 1, false, 1, '2018-04-05 09:19:25+07', NULL, NULL);


--
-- TOC entry 2947 (class 0 OID 17064)
-- Dependencies: 199
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, is_lock, name, is_technical, active, creator_id, created_at, editor_id, edited_at) VALUES (1, true, 'Administrator', false, true, 1, '2018-04-04 15:39:10+07', 1, '2018-04-04 15:39:13+07');


--
-- TOC entry 2959 (class 0 OID 17161)
-- Dependencies: 211
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rooms (id, branch_id, building_id, class_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (1, NULL, NULL, 1, true, 'MIS', true, 1, '2018-04-05 14:36:22+07', NULL, NULL);
INSERT INTO public.rooms (id, branch_id, building_id, class_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (2, NULL, NULL, 2, true, 'Grand Ballom', true, 1, '2018-04-07 09:31:57+07', NULL, NULL);
INSERT INTO public.rooms (id, branch_id, building_id, class_id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (3, NULL, NULL, 1, true, 'Purchase', true, 1, '2018-04-07 09:32:27+07', NULL, NULL);


--
-- TOC entry 2963 (class 0 OID 17196)
-- Dependencies: 215
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (1, true, 'Open', true, 1, '2018-04-07 09:15:55+07', 1, '2018-04-07 09:16:14+07');
INSERT INTO public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (2, false, 'Pending', true, 1, '2018-04-07 09:18:23+07', NULL, NULL);
INSERT INTO public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (3, false, 'Resolve', true, 1, '2018-04-07 09:18:45+07', NULL, NULL);
INSERT INTO public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (4, false, 'Cancel', true, 1, '2018-04-07 09:19:11+07', NULL, NULL);
INSERT INTO public.status (id, is_lock, name, active, creator_id, created_at, editor_id, edited_at) VALUES (5, false, 'Close', true, 1, '2018-04-07 09:20:06+07', NULL, NULL);


--
-- TOC entry 2967 (class 0 OID 17230)
-- Dependencies: 219
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (2, 2, NULL, 'Ticket Subject *', 'Ticket Description *', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 14:59:23.268351', 'UBN20180004-00002');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (3, 3, NULL, 'Ticket Subject *', 'Ticket Description *', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 15:15:30.093774', 'UBN--20180004-00003');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (4, 1, NULL, 'Ticket Subject *', 'Ticket Subject *', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 15:17:22.352795', 'UBN-WO-20180004-00001');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (1, 1, NULL, 'Ticket Subject *', 'Ticket Description *', 1, 1, 1, 1, 1, 1, 2, 2, '045315480,MIS Depart,555-6', 1, '2018-04-07 14:56:05.775478', 'UBN20180004-00001');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (5, 2, NULL, 'Ticket Subject *', 'Date/Time Functions and Operators', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 16:22:31.549471', 'UBN-WO-20180004-00002');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (6, 3, NULL, 'Ticket Subject *', 'Date/Time Functions and Operators', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 16:22:41.460315', 'UBN-WO-20180004-00003');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (7, 4, NULL, 'C', 'C', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 16:23:34.746788', 'UBN-WO-20180004-00004');
INSERT INTO public.tickets (id, no, no_ref, title, description, requestor_id, branch_id, depart_id, building_id, class_id, room_id, priority_id, status_id, contact, creator_id, created_at, doc_no) VALUES (8, 5, NULL, 'C', 'C', 1, 1, 1, 1, 1, 1, 1, 1, '045315480,MIS Depart,555-6', 1, '2018-04-07 16:26:16.959856', 'UBN-WO-20180004-00005');


--
-- TOC entry 2961 (class 0 OID 17178)
-- Dependencies: 213
-- Data for Name: user_branchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_branchs (id, branch_id, user_id, is_lock, creator_id, created_at, editor_id, edited_at) VALUES (1, 1, 1, true, 1, '2018-04-07 08:18:38+07', NULL, NULL);
INSERT INTO public.user_branchs (id, branch_id, user_id, is_lock, creator_id, created_at, editor_id, edited_at) VALUES (2, 2, 1, true, 1, '2018-04-07 08:18:49+07', NULL, NULL);


--
-- TOC entry 2945 (class 0 OID 17045)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, is_lock, username, password, name, tel, line, role_id, branch_id, depart_id, building_id, room_id, class_id, is_technical, active, creator_id, created_at, edited_at, editor_id, image_avatar, email, contact) VALUES (1, false, 'admin', '$2b$10$c1SFboU78jc6/jAxQ5PRq.B6r7VkXP6enHScXS6srfK8Y1bq7VaZq', 'ROENGRIT MOONCHAI', '0892536161', '', 1, 1, 1, 1, 1, 1, false, true, 1, '2018-04-04 09:19:01+07', '2018-04-04 09:22:54+07', 1, '/image/user/678db456-121b-4bcd-9dc7-593d88960b05.png', 'logon.firstclass@gmail.com', '045315480,MIS Depart,555-6');


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 202
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 1, false);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 206
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_id_seq', 2, true);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 208
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 1, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 204
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 2, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 216
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priority_id_seq', 5, true);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 200
-- Name: role_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_access_id_seq', 1, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, true);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 210
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 2, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 214
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 2, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 218
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_id_seq', 8, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_branch_id_seq', 2, true);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- TOC entry 2804 (class 2606 OID 17108)
-- Name: branchs branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 17110)
-- Name: branchs branchs_unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_unique_code UNIQUE (code);


--
-- TOC entry 2810 (class 2606 OID 17136)
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 17151)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 17122)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 17217)
-- Name: prioritys prioritys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prioritys
    ADD CONSTRAINT prioritys_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 17088)
-- Name: role_access role_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_access
    ADD CONSTRAINT role_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 17076)
-- Name: roles roles_unique_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_unique_name UNIQUE (name);


--
-- TOC entry 2814 (class 2606 OID 17170)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 17204)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 17235)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 17184)
-- Name: user_branchs user_branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branchs
    ADD CONSTRAINT user_branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 17078)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 17061)
-- Name: users users_unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique_username UNIQUE (username);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-04-07 17:24:22

--
-- PostgreSQL database dump complete
--

