--
-- PostgreSQL database dump
--

\restrict MP5srMygrv7xznudDgRHkUmJFJawMHqj7jPx60VbGMGisPVXgcDK5hcFh4yREpN

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
-- Name: custom_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.custom_type AS ENUM (
    'imported',
    'exported'
);


ALTER TYPE public.custom_type OWNER TO postgres;

--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'M',
    'F'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- Name: add_jobs_list_sp(smallint, character, character varying, numeric, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_jobs_list_sp(IN id smallint, IN jcode character, IN description character varying, IN sgrade numeric, INOUT count_rec integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    counter integer := 0;
    line record;
BEGIN
    RAISE NOTICE 'inserting job record';

    INSERT INTO jobs
    VALUES (id, jcode, description, sgrade);

    RAISE NOTICE 'listing of records';

    FOR line IN
        SELECT * FROM jobs
    LOOP
        RAISE NOTICE '% % % %',
            line.id, line.job_code, line.description, line.salary_grade;
        counter := counter + 1;
    END LOOP;

    RAISE NOTICE 'listing of records done';
    count_rec := counter;
END;
$$;


ALTER PROCEDURE public.add_jobs_list_sp(IN id smallint, IN jcode character, IN description character varying, IN sgrade numeric, INOUT count_rec integer) OWNER TO postgres;

--
-- Name: helloworld_sp(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.helloworld_sp()
    LANGUAGE plpgsql
    AS $$
DECLARE
    greeting varchar(50);
BEGIN
    greeting := 'Welcome to PL/pgSQL programming';
    RAISE NOTICE '%', greeting;
END;
$$;


ALTER PROCEDURE public.helloworld_sp() OWNER TO postgres;

--
-- Name: summation_sp(smallint, smallint, smallint); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.summation_sp(INOUT initval smallint, INOUT reps smallint, INOUT output_total smallint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    output_total := initval + reps;
    RAISE NOTICE 'Total: %', output_total;
END;
$$;


ALTER PROCEDURE public.summation_sp(INOUT initval smallint, INOUT reps smallint, INOUT output_total smallint) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character(4) NOT NULL,
    dept_name character varying(40) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    emp_no integer NOT NULL,
    dept_no character(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- Name: employee_mgr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_mgr (
    emp_no integer NOT NULL,
    mgr_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.employee_mgr OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(14) NOT NULL,
    last_name character varying(16) NOT NULL,
    gender public.gender NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    name character varying(100) NOT NULL,
    price numeric(10,3) NOT NULL,
    inv_type public.custom_type NOT NULL,
    id integer DEFAULT nextval('public.inventory_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id smallint NOT NULL,
    job_code character(4),
    description character varying(255),
    salary_grade numeric(20,5)
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_requirement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_requirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_requirement_id_seq OWNER TO postgres;

--
-- Name: jobs_requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs_requirement (
    job_code character(4) NOT NULL,
    count integer NOT NULL,
    dept_name character varying(60) NOT NULL,
    id integer DEFAULT nextval('public.jobs_requirement_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.jobs_requirement OWNER TO postgres;

--
-- Name: jobs_code_name_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.jobs_code_name_view AS
 SELECT job_code,
    dept_name,
    count
   FROM public.jobs_requirement;


ALTER VIEW public.jobs_code_name_view OWNER TO postgres;

--
-- Name: jobs_jobs_reqt_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.jobs_jobs_reqt_view AS
 SELECT a.id,
    a.job_code,
    a.description,
    b.count,
    b.dept_name
   FROM (public.jobs a
     JOIN public.jobs_requirement b ON ((a.job_code = b.job_code)));


ALTER VIEW public.jobs_jobs_reqt_view OWNER TO postgres;

--
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    id smallint NOT NULL,
    fname character varying(50) NOT NULL,
    lname character varying(50) NOT NULL,
    gender character(1) NOT NULL,
    bday date NOT NULL,
    age smallint NOT NULL,
    salary numeric NOT NULL
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(20,5) NOT NULL,
    date_delivered date NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary numeric(10,2) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dept_no, dept_name) FROM stdin;
d001	Sales
d002	IT
d003	HR
d004	Marketing
\.


--
-- Data for Name: dept_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept_emp (emp_no, dept_no, from_date, to_date) FROM stdin;
1	d001	2026-03-31	2026-03-31
2	d002	2026-03-31	2026-03-31
\.


--
-- Data for Name: dept_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept_manager (emp_no, dept_no, from_date, to_date) FROM stdin;
\.


--
-- Data for Name: employee_mgr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_mgr (emp_no, mgr_no, from_date, to_date) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) FROM stdin;
1	1995-01-10	Juan	Dela Cruz	M	2024-01-15
2	1996-02-20	Maria	Santos	F	2024-02-01
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (name, price, inv_type, id) FROM stdin;
apple	500.500	imported	1
apple	500.500	imported	2
apple	500.500	imported	3
apple	500.500	imported	4
papaya	200.500	exported	5
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, job_code, description, salary_grade) FROM stdin;
1	JANT	Janitor	15000.00000
2	CLRK	Clerk	20000.00000
3	CEO 	Chief Executive Officer	100000.00000
4	PDEV	Software Dev	60000.00000
7	HMGR	HR Manager	50000.00000
8	SYSA	Systems Analyst	100000.00000
\.


--
-- Data for Name: jobs_requirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs_requirement (job_code, count, dept_name, id) FROM stdin;
JANT	400	IT Dept	9
CEO 	1	Mktg Dept	10
CLRK	1	Inventory Dept	11
JANT	2	PMO Dept	12
JANT	1000	Sales Dept	13
\.


--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manager (id, fname, lname, gender, bday, age, salary) FROM stdin;
1	Juan	Luna	M	1900-05-10	35	25000.00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, tag_id, name, price, date_delivered) FROM stdin;
\.


--
-- Data for Name: salaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salaries (emp_no, salary, from_date, to_date) FROM stdin;
\.


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 5, true);


--
-- Name: jobs_requirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_requirement_id_seq', 13, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: departments departments_dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_dept_name_key UNIQUE (dept_name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- Name: dept_emp dept_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);


--
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no);


--
-- Name: employee_mgr employee_mgr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_mgr
    ADD CONSTRAINT employee_mgr_pkey PRIMARY KEY (emp_no, mgr_no);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_job_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_job_code_key UNIQUE (job_code);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: jobs_requirement jobs_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_requirement
    ADD CONSTRAINT jobs_requirement_pkey PRIMARY KEY (id);


--
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_tag_id_key UNIQUE (tag_id);


--
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no, from_date);


--
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no) ON DELETE CASCADE;


--
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) ON DELETE CASCADE;


--
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no) ON DELETE CASCADE;


--
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) ON DELETE CASCADE;


--
-- Name: employee_mgr employee_mgr_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_mgr
    ADD CONSTRAINT employee_mgr_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) ON DELETE CASCADE;


--
-- Name: employee_mgr employee_mgr_mgr_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_mgr
    ADD CONSTRAINT employee_mgr_mgr_no_fkey FOREIGN KEY (mgr_no) REFERENCES public.employees(emp_no) ON DELETE CASCADE;


--
-- Name: jobs_requirement jobs_requirement_job_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs_requirement
    ADD CONSTRAINT jobs_requirement_job_code_fkey FOREIGN KEY (job_code) REFERENCES public.jobs(job_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict MP5srMygrv7xznudDgRHkUmJFJawMHqj7jPx60VbGMGisPVXgcDK5hcFh4yREpN

