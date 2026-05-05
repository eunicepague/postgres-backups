--
-- PostgreSQL database dump
--

\restrict r1YsvSDwlGLyoGGRIDAf26CLGT8LTQ3etiYe1CPP7KBpFedg0ZDT3WX3ERHXoRc

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
-- Name: find_order_sp(numeric, numeric); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.find_order_sp(IN amount1 numeric, IN amount2 numeric)
    LANGUAGE plpgsql
    AS $$
declare
rec record;
begin
for rec in
select o.ord_no,
   o.purch_amt,
   o.ord_date,
   o.customer_id,
   o.salesman_id
from orders as o
where o.purch_amt between amount1 and amount2
order by o.purch_amt asc
loop
raise notice '% | % | % | % | %',
rec.ord_no,
rec.purch_amt,
rec.ord_date,
rec.customer_id,
rec.salesman_id;
end loop;
end;
$$;


ALTER PROCEDURE public.find_order_sp(IN amount1 numeric, IN amount2 numeric) OWNER TO postgres;

--
-- Name: insert_customer_sp(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insert_customer_sp()
    LANGUAGE plpgsql
    AS $$
begin
insert into customer(customer_id, cust_name, city, grade, salesman_id)
values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', null, 5005);

raise notice 'customer records inserted...';
end;
$$;


ALTER PROCEDURE public.insert_customer_sp() OWNER TO postgres;

--
-- Name: insert_order_sp(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insert_order_sp()
    LANGUAGE plpgsql
    AS $$
begin
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001);

raise notice 'order records inserted.';
end;
$$;


ALTER PROCEDURE public.insert_order_sp() OWNER TO postgres;

--
-- Name: insert_salesman_sp(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insert_salesman_sp()
    LANGUAGE plpgsql
    AS $$
begin
insert into salesman(salesman_id, name, city, commission)
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

raise notice 'salesman records inserted...';
end;
$$;


ALTER PROCEDURE public.insert_salesman_sp() OWNER TO postgres;

--
-- Name: customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_seq
    START WITH 3001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id numeric(5,0) DEFAULT nextval('public.customer_seq'::regclass) NOT NULL,
    cust_name character varying(30) NOT NULL,
    city character varying(15) NOT NULL,
    grade numeric(3,0),
    salesman_id numeric(5,0)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_seq
    START WITH 70001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_seq OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    ord_no numeric(5,0) DEFAULT nextval('public.order_seq'::regclass) NOT NULL,
    purch_amt numeric(8,2) NOT NULL,
    ord_date date NOT NULL,
    customer_id numeric(5,0),
    salesman_id numeric(5,0)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: salesman_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salesman_seq
    START WITH 5001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salesman_seq OWNER TO postgres;

--
-- Name: salesman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salesman (
    salesman_id numeric(5,0) DEFAULT nextval('public.salesman_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    city character varying(15) NOT NULL,
    commission numeric(5,2) NOT NULL
);


ALTER TABLE public.salesman OWNER TO postgres;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, cust_name, city, grade, salesman_id) FROM stdin;
3002	Nick Rimando	New York	100	5001
3007	Brad Davis	New York	200	5001
3005	Graham Zusi	California	200	5002
3008	Julian Green	London	300	5002
3004	Fabian Johnson	Paris	300	5006
3009	Geoff Cameron	Berlin	100	5003
3003	Jozy Altidor	Moscow	200	5007
3001	Brad Guzan	London	\N	5005
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) FROM stdin;
70001	150.50	2012-10-05	3005	5002
70009	270.65	2012-09-10	3001	5005
70002	65.26	2012-10-05	3002	5001
70004	110.50	2012-08-17	3009	5003
70007	948.50	2012-09-10	3005	5002
70005	2400.60	2012-07-27	3007	5001
70008	5760.00	2012-09-10	3002	5001
70010	1983.43	2012-10-10	3004	5006
70003	2480.40	2012-10-10	3009	5003
70012	250.45	2012-06-27	3008	5002
70011	75.29	2012-08-17	3003	5007
70013	3045.60	2012-04-25	3002	5001
\.


--
-- Data for Name: salesman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salesman (salesman_id, name, city, commission) FROM stdin;
5001	James Hoog	New York	0.15
5002	Nail Knite	Paris	0.13
5005	Pit Alex	London	0.11
5006	Mc Lyon	Paris	0.14
5007	Paul Adam	Rome	0.13
5003	Lauson Hen	San Jose	0.12
\.


--
-- Name: customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_seq', 3001, false);


--
-- Name: order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_seq', 70001, false);


--
-- Name: salesman_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salesman_seq', 5001, false);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_no);


--
-- Name: salesman salesman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesman
    ADD CONSTRAINT salesman_pkey PRIMARY KEY (salesman_id);


--
-- Name: customer fk_customer_salesman; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_salesman FOREIGN KEY (salesman_id) REFERENCES public.salesman(salesman_id);


--
-- Name: orders fk_orders_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: orders fk_orders_salesman; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_salesman FOREIGN KEY (salesman_id) REFERENCES public.salesman(salesman_id);


--
-- PostgreSQL database dump complete
--

\unrestrict r1YsvSDwlGLyoGGRIDAf26CLGT8LTQ3etiYe1CPP7KBpFedg0ZDT3WX3ERHXoRc

