--
-- PostgreSQL database dump
--

\restrict lD0rYweZP3nmKtaaHf1EgyeoEiCJuKobkKk0KsFv8moJK0GzVlzraVbHS2gT7bH

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
-- Name: cancel_reservation_sp(date); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.cancel_reservation_sp(IN forcancel date)
    LANGUAGE plpgsql
    AS $$
declare
rec record;
begin
raise notice 'boats for cancellation on %', forcancel;

for rec in
select r.id, r.sid, b.bid, b.name, b.color, r.reserve_date
from reserve r
inner join bid b
on r.bid = b.bid
where r.reserve_date = forcancel
order by r.id
loop
raise notice '% % % % % %',
rec.id, rec.sid, rec.bid, rec.name, rec.color, rec.reserve_date;
end loop;

delete from reserve
where reserve_date = forcancel;

raise notice 'reservations cancelled for %', forcancel;
end;
$$;


ALTER PROCEDURE public.cancel_reservation_sp(IN forcancel date) OWNER TO postgres;

--
-- Name: process_sailor_sp(integer, character varying, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.process_sailor_sp(IN p_sid integer, IN p_name character varying, IN p_rating integer, IN p_age integer)
    LANGUAGE plpgsql
    AS $$
declare
rec record;
avg_rating numeric(10,2);
avg_age numeric(10,2);
begin
insert into sailor(sid, name, rating, age)
values (p_sid, p_name, p_rating, p_age);

raise notice 'listing of sailor records';

for rec in
select id, sid, name, rating, age
from sailor
order by id
loop
raise notice '% % % % %',
rec.id, rec.sid, rec.name, rec.rating, rec.age;
end loop;

select round(avg(rating)::numeric, 2), round(avg(age)::numeric, 2)
into avg_rating, avg_age
from sailor;

raise notice 'average rating: %', avg_rating;
raise notice 'average age: %', avg_age;
end;
$$;


ALTER PROCEDURE public.process_sailor_sp(IN p_sid integer, IN p_name character varying, IN p_rating integer, IN p_age integer) OWNER TO postgres;

--
-- Name: bid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bid_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bid (
    id integer DEFAULT nextval('public.bid_id_seq'::regclass) NOT NULL,
    bid integer NOT NULL,
    name character varying(60) NOT NULL,
    color character varying(30) NOT NULL
);


ALTER TABLE public.bid OWNER TO postgres;

--
-- Name: reserve_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reserve_id_seq OWNER TO postgres;

--
-- Name: reserve; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserve (
    id integer DEFAULT nextval('public.reserve_id_seq'::regclass) NOT NULL,
    sid integer NOT NULL,
    bid integer NOT NULL,
    reserve_date date NOT NULL
);


ALTER TABLE public.reserve OWNER TO postgres;

--
-- Name: sailor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sailor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sailor_id_seq OWNER TO postgres;

--
-- Name: sailor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sailor (
    id integer DEFAULT nextval('public.sailor_id_seq'::regclass) NOT NULL,
    sid integer NOT NULL,
    name character varying(60) NOT NULL,
    rating integer NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.sailor OWNER TO postgres;

--
-- Name: boat_clip_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.boat_clip_view AS
 SELECT DISTINCT name
   FROM public.sailor s
  WHERE (NOT (EXISTS ( SELECT 1
           FROM public.bid b
          WHERE (((b.name)::text ~~ 'Clip%'::text) AND (NOT (EXISTS ( SELECT 1
                   FROM public.reserve r
                  WHERE ((r.sid = s.sid) AND (r.bid = b.bid)))))))));


ALTER VIEW public.boat_clip_view OWNER TO postgres;

--
-- Name: boat_lake_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.boat_lake_view AS
 SELECT DISTINCT name
   FROM public.sailor s
  WHERE (NOT (EXISTS ( SELECT 1
           FROM (public.reserve r
             JOIN public.bid b ON ((r.bid = b.bid)))
          WHERE ((r.sid = s.sid) AND ((b.name)::text ~~ '%lake%'::text)))));


ALTER VIEW public.boat_lake_view OWNER TO postgres;

--
-- Name: sailors_avg_age_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.sailors_avg_age_view AS
 SELECT rating,
    round(avg(age), 2) AS avg_age
   FROM public.sailor
  GROUP BY rating;


ALTER VIEW public.sailors_avg_age_view OWNER TO postgres;

--
-- Data for Name: bid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bid (id, bid, name, color) FROM stdin;
5	101	Interlake	blue
6	102	Interlake	red
7	103	Clipper	green
8	104	Marine	red
\.


--
-- Data for Name: reserve; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserve (id, sid, bid, reserve_date) FROM stdin;
8	22	103	2004-01-02
9	22	105	2004-01-02
10	31	103	2005-05-05
11	32	104	2005-07-04
\.


--
-- Data for Name: sailor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sailor (id, sid, name, rating, age) FROM stdin;
6	22	Dustin	7	45
7	29	Brutus	1	33
8	31	Lubber	79	55
9	32	Andy	25	25
10	58	Rusty	10	35
11	58	Buplb	10	35
12	58	Buplerb	10	35
13	22	Albert	10	35
14	60	Randy	9	40
\.


--
-- Name: bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bid_id_seq', 8, true);


--
-- Name: reserve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserve_id_seq', 11, true);


--
-- Name: sailor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sailor_id_seq', 14, true);


--
-- Name: bid bid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (id);


--
-- Name: reserve reserve_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserve
    ADD CONSTRAINT reserve_pkey PRIMARY KEY (id);


--
-- Name: sailor sailor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sailor
    ADD CONSTRAINT sailor_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict lD0rYweZP3nmKtaaHf1EgyeoEiCJuKobkKk0KsFv8moJK0GzVlzraVbHS2gT7bH

