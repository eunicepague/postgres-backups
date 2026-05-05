--
-- PostgreSQL database dump
--

\restrict JX5MP7KWU86dPWktFq9IUOtBsSjYLKdhJPhOAFtitTSu2YBJeKnjJYQqUy5XtM4

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
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    pcode character(4) NOT NULL,
    pname character varying(10),
    color character varying(5),
    price numeric(10,3),
    squantity integer,
    id integer DEFAULT nextval('public.stock_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (pcode, pname, color, price, squantity, id) FROM stdin;
101M	BLOUSE	WHITE	35.000	85	2
201M	POLO SHIRT	WHITE	36.400	29	3
202M	POLO SHIRT	RED	36.400	67	4
302S	SKIRT	WHITE	51.100	65	5
353L	SKIRT	RED	47.600	18	6
353M	SKIRT	GREEN	47.600	56	7
411M	SWEATER	BLUE	84.000	12	8
412M	SWEATER	RED	84.000	22	9
591L	SOCKS	RED	2.500	300	10
591M	SOCKS	BLUE	2.500	90	11
591S	SOCKS	WHITE	2.500	280	12
201 	Test	BLUE	100.000	10	23
202 	Test	WHITE	100.000	10	24
203 	Test	RED	100.000	10	25
204 	Test	GREEN	100.000	10	26
101L	BLOUSE	BLUE	35.000	62	1
\.


--
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 27, true);


--
-- Name: stock stock_pcode; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pcode UNIQUE (pcode);


--
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict JX5MP7KWU86dPWktFq9IUOtBsSjYLKdhJPhOAFtitTSu2YBJeKnjJYQqUy5XtM4

