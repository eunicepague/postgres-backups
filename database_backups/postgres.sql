--
-- PostgreSQL database dump
--

\restrict ugXLmFkeVNTaTEuuqOxlJDvel8ZwTvlnkLKecbxl6YCOwb2l7Wvblhm9CSSvlb2

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_display_actor_name(integer, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_display_actor_name(IN actorid integer, IN firstname character varying, IN lastname character varying)
    LANGUAGE plpgsql
    AS $$
begin
	update actor
	set first_name = firstname,
		last_name = lastname,
		last_update = current_timestamp
	where actor_id = actorid;
end;
$$;


ALTER PROCEDURE public.update_display_actor_name(IN actorid integer, IN firstname character varying, IN lastname character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: banking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banking (
    savings money NOT NULL
);


ALTER TABLE public.banking OWNER TO postgres;

--
-- Name: scheduler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scheduler (
    deliverydate date NOT NULL,
    deliverytime time without time zone NOT NULL,
    dropshipdate timestamp with time zone NOT NULL
);


ALTER TABLE public.scheduler OWNER TO postgres;

--
-- Name: validations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validations (
    isexpired boolean NOT NULL
);


ALTER TABLE public.validations OWNER TO postgres;

--
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor (
    vid smallint NOT NULL,
    yearsinservice integer NOT NULL,
    countheads bigint NOT NULL,
    populationsize numeric(10,0),
    profit numeric(13,5),
    loan real,
    warehousesale double precision
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    companyname character varying(100) NOT NULL,
    whtypes character(7) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- Data for Name: banking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banking (savings) FROM stdin;
\.


--
-- Data for Name: scheduler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scheduler (deliverydate, deliverytime, dropshipdate) FROM stdin;
\.


--
-- Data for Name: validations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.validations (isexpired) FROM stdin;
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor (vid, yearsinservice, countheads, populationsize, profit, loan, warehousesale) FROM stdin;
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (companyname, whtypes, content) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict ugXLmFkeVNTaTEuuqOxlJDvel8ZwTvlnkLKecbxl6YCOwb2l7Wvblhm9CSSvlb2

