--
-- PostgreSQL database dump
--

\restrict IitLNxXeqcteaMgjdWlG72gmlG95peCo28i9TpPrEh1Jiavp7hOmLG3ESAmC1Lx

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dep_id integer NOT NULL,
    dep_name character varying(20) NOT NULL,
    dep_location character varying(15) NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_id integer NOT NULL,
    emp_name character varying(15) NOT NULL,
    job_name character varying(10) NOT NULL,
    manager_id integer,
    hire_date date NOT NULL,
    salary numeric(10,2) NOT NULL,
    commission numeric(7,2),
    dep_id integer NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: salary_grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salary_grade (
    grade integer NOT NULL,
    min_salary integer NOT NULL,
    max_salary integer NOT NULL
);


ALTER TABLE public.salary_grade OWNER TO postgres;

--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (dep_id, dep_name, dep_location) FROM stdin;
1001	FINANCE	SYDNEY
2001	AUDIT	MELBOURNE
3001	MARKETING	PERTH
4001	PRODUCTION	BRISBANE
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id) FROM stdin;
68319	KAYLING	PRESIDENT	\N	1991-11-18	6000.00	\N	1001
66928	BLAZE	MANAGER	68319	1991-05-01	2750.00	\N	3001
67832	CLARE	MANAGER	68319	1991-06-09	2550.00	\N	1001
65646	JONAS	MANAGER	68319	1991-04-02	2957.00	\N	2001
67858	SCARLET	ANALYST	65646	1997-04-19	3100.00	\N	2001
69062	FRANK	ANALYST	65646	1991-12-03	3100.00	\N	2001
63679	SANDRINE	CLERK	69062	1990-12-18	900.00	\N	2001
64989	ADELYN	SALESMAN	66928	1991-02-20	1700.00	400.00	3001
65271	WADE	SALESMAN	66928	1991-02-22	1350.00	600.00	3001
66564	MADDEN	SALESMAN	66928	1991-09-28	1350.00	1500.00	3001
68454	TUCKER	SALESMAN	66928	1991-09-08	1600.00	0.00	3001
68736	ADNRES	CLERK	67858	1997-05-23	1200.00	\N	2001
69000	JULIUS	CLERK	66928	1991-12-03	1050.00	\N	3001
69324	MARKER	CLERK	67832	1992-01-23	1400.00	\N	1001
\.


--
-- Data for Name: salary_grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salary_grade (grade, min_salary, max_salary) FROM stdin;
1	800	1300
2	1301	1500
3	1501	2100
4	2101	3100
5	3101	9999
\.


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dep_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- Name: salary_grade salary_grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary_grade
    ADD CONSTRAINT salary_grade_pkey PRIMARY KEY (grade);


--
-- PostgreSQL database dump complete
--

\unrestrict IitLNxXeqcteaMgjdWlG72gmlG95peCo28i9TpPrEh1Jiavp7hOmLG3ESAmC1Lx

