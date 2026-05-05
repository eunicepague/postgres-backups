--
-- PostgreSQL database dump
--

\restrict dAh0QbyTrXY0pllcOFcXD3qDiQpt9CBvwfP1ARnQ06BcQjPANaWlTmXRQtsOlOc

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
-- Name: admissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admissions (
    patient_id integer NOT NULL,
    admission_date date NOT NULL,
    discharge_date date,
    diagnosis character varying(50),
    attending_doctor_id integer
);


ALTER TABLE public.admissions OWNER TO postgres;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    specialty character varying(25)
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_doctor_id_seq OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    gender character(1) NOT NULL,
    birth_date date,
    city character varying(30),
    province_id character(2),
    allergies character varying(80),
    height numeric(3,0),
    weight numeric(4,0),
    CONSTRAINT patients_height_check CHECK ((height > (0)::numeric)),
    CONSTRAINT patients_weight_check CHECK ((weight > (0)::numeric))
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patients_patient_id_seq OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- Name: province_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.province_names (
    province_id character(2) NOT NULL,
    province_name character varying(30) NOT NULL
);


ALTER TABLE public.province_names OWNER TO postgres;

--
-- Name: doctors doctor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);


--
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- Data for Name: admissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, first_name, last_name, specialty) FROM stdin;
1	Claude	Walls	Internist
2	Joshua	Green	Cardiologist
3	Miriam	Tregre	General Surgeon
4	James	Russo	Obstetrician/Gynecologist
5	Scott	Hill	Gastroenterologist
6	Tasha	Phillips	Psychiatrist
7	Hazel	Patterson	Oncologist
8	Mickey	Duval	Pediatrician
9	Jon	Nelson	Neurologist
10	Monica	Singleton	Orthopaedic Surgeon
11	Douglas	Brooks	Respirologist
12	Flora	Moore	Cardiovascular Surgeon
13	Angelica	Noe	Nuclear Medicine
14	Tyrone	Smart	Gerontologist
15	Marie	Brinkman	Urologist
16	Irene	Brooks	Gastroenterologist
17	Mary	Walker	Nuclear Medicine
18	Bobbi	Estrada	Gerontologist
19	Stephanie	Cohen	Oncologist
20	Ralph	Wilson	General Surgeon
21	Lisa	Cuddy	Obstetrician/Gynecologist
22	Simon	Santiago	Cardiologist
23	Heather	Beck	Pediatrician
24	Jenny	Pulaski	Neurologist
25	Jeanette	Sites	Psychiatrist
26	Larry	Miller	Cardiovascular Surgeon
27	Donna	Greenwood	Respirologist
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight) FROM stdin;
2	Mickey	Baasha	M	1981-05-28	Dundas	ON	Sulfa	185	76
5	Charles	Wolfe	M	2017-11-19	Orillia	ON	Penicillin	47	10
14	Rick	Bennett	M	1977-01-27	Ancaster	ON	Penicillin	220	95
25	John	Farley	M	1956-09-12	Hamilton	ON	Gluten	213	104
42	Alice	Donovan	F	1949-06-27	Hamilton	ON	Penicillin	167	54
43	Stone	Cutting	M	2010-09-24	Hamilton	ON	Codeine	110	42
44	Neil	Allan	M	1975-02-02	Cambridge	ON	Penicillin	203	123
57	Woody	Riviera	M	1990-07-10	Kingston	ON	Penicillin	192	109
65	Haiku	Alpert	M	2014-08-05	Paris	ON	Penicillin	69	22
72	Lily	Vargas	F	1923-05-02	Hamilton	ON	Codeine	195	102
85	Phoebe	Bell	F	1975-05-06	Hepworth	ON	Micropore Tape	169	115
95	Gene	Edwards	M	1965-06-06	Hamilton	ON	Sulphate	199	96
107	Gillian	Dyson	F	2000-09-14	Hamilton	ON	Penicillin	164	86
134	Alexandra	Robins	F	1988-10-25	Burlington	ON	Sulfa	179	84
138	Fiz	Ozaki	F	1989-09-16	Hamilton	ON	Penicillin	180	91
140	Amy	Fuhrey	F	1979-11-11	Oshawa	ON	Penicillin	148	49
141	Lou	Vincent	M	2007-01-28	Selkirk	ON	Penicillin	143	56
142	Elvis	Maroni	M	1948-06-22	Hamilton	ON	Codeine	139	66
144	Reginald	Cavor	M	1986-07-24	Red Deer	AB	Penicillin	163	86
149	David	Redfield	M	1982-01-20	Burlington	ON	Dairy Products	166	89
153	Jefferson	Hally	M	1954-10-22	Toronto	ON	Penicillin	155	89
181	Nancy	Costello	F	2000-04-13	Dundas	ON	Penicillin	183	93
184	Hoshi	Johnson	F	1978-03-27	Cambridge	ON	Penicillin	179	106
187	Guido	Lonnegan	M	1950-12-07	Hamilton	ON	ASA	153	79
188	Cary	Henderson	M	1961-07-31	Hamilton	ON	Bee Stings	167	98
189	Joanna	Cooper	F	1972-01-15	Toronto	ON	Codeine	181	107
192	Christine	Lynch	F	1994-08-01	Brantford	ON	Sulphur	181	77
195	Elizabeth	Rivers	F	1950-11-23	Beamsville	ON	Penicillin	134	58
196	Elvis	Kennedy	M	1952-03-01	Hamilton	ON	Hay Fever	163	80
198	Janice	Renault	F	2004-12-10	Hamilton	ON	ASA	177	66
214	Abi	Nesmith	F	1961-04-09	Hamilton	ON	Penicillin	146	59
217	Thomas	Duquesne	M	1992-04-26	Pickering	ON	Sulpha	158	69
219	Jon	Guarnaccia	M	1955-12-02	Burlington	ON	Morphine	189	123
220	Ben	Seldon	M	1953-08-28	Hamilton	ON	Almonds	143	58
233	Kay	Baldwin	F	1951-12-25	Beamsville	ON	Codeine	164	64
238	Padma	Thomas	F	2008-06-29	Brockville	ON	Tylenol	132	39
255	Dame	McCrary	F	2007-06-23	Hamilton	ON	Peanuts	135	43
268	Lora	Shannon	F	1998-11-12	Ancaster	ON	Salicylic Acid	163	105
272	Shirley	Cork	F	2008-01-01	Hamilton	ON	Walnuts	117	44
276	Anna	Arroway	F	1993-02-16	Hamilton	ON	Penicillin	184	104
279	Derek	Nappa	M	1965-09-02	Walnut Grove	AB	Bee Stings	163	66
294	Malma	Burbage	F	2001-12-19	Burlington	ON	Codeine	185	68
314	Otis	Munson	M	1949-12-05	Hamilton	ON	Sulfa	152	77
325	Ben	Stracci	M	1984-05-19	Port Hawkesbury	NS	Wheat	185	85
327	Jane	Mars	F	1984-10-11	Hamilton	ON	Sulfa	171	76
329	Peter	Robert	M	1958-06-04	Hamilton	ON	Penicillin	162	85
337	Frank	Johnson	M	1960-04-05	Hamilton	ON	Codeine	205	126
357	Vance	Weathers	M	2009-06-25	Hamilton	ON	Codeine	130	47
359	Joe	Snyder	M	1993-09-15	Hamilton	ON	Penicillin	224	130
372	Don	Vallance	M	1966-08-26	Hamilton	ON	Penicillin	139	73
383	Narcissa	Shore	F	1978-03-26	Hamilton	ON	Penicillin	133	72
410	Lori	Warner	F	2003-06-24	Hamilton	ON	Penicillin	184	70
416	Janice	John	F	1954-10-08	Troy	ON	Sulfa	163	61
432	Jeff	Powers	M	1984-10-02	Pickering	ON	ASA	150	83
435	Pamela	Belden	F	2011-11-06	Ancaster	ON	Hay Fever	108	31
438	Julie	Bonasera	F	1960-07-06	Burlington	ON	Penicillin	174	77
439	Licio	Lupertazzi	M	1999-11-14	Stoney Creek	ON	Penicillin	127	88
441	Winnie	Clock	F	2009-06-12	Barrie	ON	Penicillin	110	37
452	Vincent	Blackwood	M	1982-06-17	Hamilton	ON	Penicillin	165	71
459	Mickey	Drama	M	1967-07-17	Toronto	ON	Penicillin	190	110
464	Alice	Jones	F	1972-10-09	Dundas	ON	Sulfa Drugs	179	84
466	Trixie	Lockwood	F	1978-02-27	Hamilton	ON	Codeine	169	65
467	Louie	Wong	M	2011-09-16	Delhi	ON	Penicillin	122	46
480	Melinda	Travis	F	1973-05-07	Dunton	ON	Penicillin	175	107
493	Margaret	Nolan	F	1951-12-16	Calgary	ON	Codeine	138	57
494	Amy	McFly	F	2004-05-29	Burlington	ON	Penicillin	156	65
495	Cindy	Randall	F	1965-12-23	Oakville	ON	Honey	144	68
504	Michael	Flood	M	1981-11-07	Hamilton	ON	Codeine	172	101
515	Annie	Cackle	F	2009-03-24	Toronto	ON	Milk	123	39
520	Cy	Kasen	M	1978-08-09	Grimsby	ON	Penicillin	188	128
522	Nancy	Devane	F	1967-08-13	Hamilton	ON	Tylenol	163	68
546	Robert	Daggett	M	1999-09-24	Hamilton	ON	Tetracycline	163	68
547	Avon	Travis	M	1983-07-05	Hamilton	ON	Penicillin	202	103
550	Ashley	Buchanan	F	1997-07-18	Toronto	ON	Ragweed	150	59
555	Constance	Martin	F	1972-06-16	Burlington	ON	Penicillin	134	67
478	Tom	Pike	M	1975-12-03	Dunnville	ON	NKA	142	89
564	Lois	Garcia-Shapiro	F	1951-06-18	Misty	AB	Sulfa	139	63
570	Boris	Krueger	M	1953-03-10	Hamilton	ON	Penicillin	212	131
576	Suzanne	Malvern	F	1963-04-01	Windsor	ON	Penicillin	172	96
577	Christine	Argyros	F	1995-07-14	Hamilton	ON	Morphine	146	52
584	Juan	Davies	M	1994-06-25	Cambridge	ON	Morphine	181	103
597	Annie	Sanderson	F	1982-05-13	Hamilton	ON	Penicillin	161	115
599	Art	Franklin	M	1997-08-25	Hamilton	ON	Penicillin	162	64
627	Andy	Vale	M	1963-02-16	Guelph	ON	Sulfa	200	121
628	Morgan	Garibaldi	M	2012-05-25	Dunton	ON	Penicillin	75	40
637	Clark	Smyth	M	1957-07-26	Hamilton	ON	Penicillin	164	73
646	Frank	Dalma	M	1966-06-13	Port Dover	ON	Peanuts	191	101
647	Robin	Fansler	F	1985-01-19	Hamilton	ON	Penicillin	181	101
682	Carl	Sheldon	M	1967-02-15	Burlington	ON	Erythromycin	165	67
696	Eve	Hughes	F	1974-07-10	Hamilton	ON	Penicillin	176	100
698	Don	Khan	M	1971-08-03	Hamilton	ON	Penicillin	182	118
699	Donald	Crowley	M	1983-03-26	Windsor	ON	Codeine	142	64
700	Giacomo	Waterfield	M	1992-04-10	Montreal	QC	Penicillin	166	78
712	Anna	Hill	F	1961-06-04	Port Dover	ON	Penicillin	173	66
717	Billie	Webber	F	2007-12-07	Hamilton	ON	Penicillin Sulpha Drugs	133	49
720	Ruby	Foreman	F	1977-04-24	Burlington	ON	Penicillin	144	53
724	Alecto	Van	F	2016-03-10	Port Dover	ON	ASA	50	10
735	Carl	Drake	M	2010-04-20	Stoney Creek	ON	Sulfa	120	41
739	Temple	Brennan	F	1963-07-12	Burlington	ON	Strawberries	159	101
742	Paul	Smyth	M	1994-07-26	Hamilton	ON	Peanuts	168	116
745	Walburga	Macdonald	F	1960-07-01	Burlington	ON	Penicillin	142	54
754	Carrie	Jacobs	F	1978-01-22	Hamilton	ON	Penicillin	175	97
758	Deborah	Caspar	F	2017-05-21	Hamilton	ON	Tylenol	39	7
763	Don	Justice	M	1994-08-23	Toronto	ON	Penicillin	196	124
785	Laurel	Boyce	F	1952-03-04	Hamilton	ON	Penicillin	157	60
793	Betty	Hightower	F	2001-02-15	Hamilton	ON	Codeine	193	69
802	Leo	Fowler	M	2001-03-22	Red River	MB	Peanuts	209	93
810	Lily	Space	F	1964-07-05	Milgrove	ON	Penicillin	133	64
819	Harry	Goodspeed	M	2012-03-03	Hamilton	ON	Penicillin	80	41
820	Holt	Reed	M	1994-07-13	Hamilton	ON	Penicillin	167	86
833	Charles	Banks	M	1967-10-14	Stoney Creek	ON	Hay Fever	163	81
843	Tem	Mangel	M	1981-05-12	Port Dover	ON	Codeine	176	73
844	Catherine	Kendall	F	1975-08-16	Hamilton	ON	Tylenol	156	67
868	Kazuki	Patil	M	1977-09-12	Toronto	ON	Sulfa Drugs	209	114
874	Ellen	Hally	F	2005-05-03	Hamilton	ON	Tylenol	167	57
883	Peter	Lane	M	1950-10-06	Hamilton	ON	Tape	208	113
885	Tex	Robert	M	1974-12-04	Victoria	BC	Iodine	181	77
896	Tugg	Travis	M	1983-07-09	Ancaster	ON	Morphine	156	78
905	Shane	Fraser	M	1958-12-23	Hamilton	ON	Penicillin	207	102
909	Richard	Real	M	2013-12-29	Hamilton	ON	Penicillin	73	21
916	Jake	Schrader	M	1969-01-06	Hamilton	ON	Penicillin	167	91
920	Catherine	Masaki	F	1978-03-06	Toronto	ON	Latex	152	60
921	Ethel	Henderson	F	2017-05-17	Hamilton	ON	Penicillin	38	7
923	Billie	Beckett	F	1994-06-02	Oshawa	ON	Hay Fever	184	118
928	Charles	Gonzales	M	1997-12-29	Hamilton	ON	Penicillin	204	110
932	Sally	Balta	F	1981-09-23	Hamilton	ON	Penicillin	163	60
950	Imogen	Jimmy	F	1993-01-12	Ottawa	ON	Penicillin	150	63
952	Haley	Crusher	M	1966-05-20	Hamilton	ON	Sulphur	169	82
968	Jadzia	Vincent	F	1963-11-03	Hamilton	ON	Codeine	166	116
984	Jo	Reed	F	1958-01-15	Toronto	ON	Feathers	183	110
990	Brenda	Shoop	F	1984-10-03	Orangeville	ON	Penicillin	142	71
991	Kate	Skye	F	1997-09-03	Toronto	ON	Penicillin	174	102
1006	Gary	Harkness	M	2003-11-07	Brantford	ON	ASA	189	79
1011	Marid	Vaughn	M	1987-08-13	Toronto	ON	Penicillin	158	61
1016	Harley	Thackeray	F	1993-10-30	Hamilton	ON	Penicillin	167	53
1018	Anna	Clouseau	F	1978-09-09	Guelph	ON	Sulfa Drugs	145	80
1019	Robert	Mars	M	1998-06-20	Burlington	ON	Penicillin	189	108
1022	Wendell	Hunt	M	1952-11-06	Hamilton	ON	Penicillin	157	68
1032	Temperance	Potter	F	2012-05-02	Hamilton	ON	Codeine	86	23
1041	Rita	Wright	F	1962-12-03	Stoney Creek	ON	Penicillin	175	110
1044	Quinn	Dreadful	F	2014-08-12	Burlington	ON	Tylenol	77	21
1052	Seto	Malvern	M	1949-10-01	Hamilton	ON	Codeine	171	124
1093	John	Kojak	M	2009-06-07	Cambridge	ON	Sulfa	111	52
1096	Miyuki	Dayton	F	2018-06-03	Ajax	ON	Valporic Acid	39	5
1100	Roderick	Bottom	M	1995-06-15	Caledonia	ON	Cheese	186	126
1102	Nancy	Akagi	F	1976-08-08	Cambridge	ON	Codeine	158	61
1116	Charlotte	Farrell	F	1958-01-24	Hamilton	ON	Penicillin	167	88
1118	Jefferson	Brockman	M	1967-07-18	Toronto	ON	Valporic Acid	201	114
1121	Sherlock	Sidle	M	1936-08-14	Hamilton	ON	Tylenol	179	101
1124	Jack	Garlick	M	1997-11-02	Brampton	ON	Penicillin	200	98
1132	Angelo	Rosenberg	M	2012-09-17	Hamilton	ON	Salicylic Acid	87	33
1137	Sabrina	Brown	F	1996-06-28	Hamilton	ON	Penicillin	176	110
1149	Valerie	Beaumann	F	2003-06-27	Grimsby	ON	Tylenol	165	62
1150	Celeste	Breaker	F	1964-07-05	Hepworth	ON	Penicillin	165	106
1159	Carmine	Finskter	M	1967-05-14	Simcoe	ON	Tylenol	181	98
1170	Pat	Halliwell	M	1973-08-05	Hamilton	ON	Penicillin	165	68
1182	Vinnie	Fraser	M	1963-02-18	Brantford	ON	Penicillin Sulpha Drugs	152	85
1183	Lester	Nash	M	2008-03-01	Hamilton	ON	Catfood Rubber	131	51
1184	Endora	Trenton	F	2016-09-29	Hamilton	ON	Sulfa Drugs	54	13
1209	Montana	Coltrane	F	1979-10-06	Milgrove	ON	Codeine	136	46
1216	Nancy	Price	F	1988-02-12	Hamilton	ON	Penicillin	165	43
1218	Danny	Troy	M	1958-10-26	Hamilton	ON	Penicillin	168	71
1221	Sam	Carr	M	1960-05-29	Dundas	ON	Penicillin	201	110
1222	Donald	Sisco	M	2011-01-12	Beamsville	ON	Codeine	118	43
1224	Anna	Baker	F	1951-04-09	Hamilton	ON	Sulfa	170	109
1234	Steven	Kent	M	2018-05-02	Hepworth	ON	Lactose Intolerant	25	3
1235	Vic	Kegedi	M	1992-11-02	Burlington	ON	Penicillin	159	58
1241	Bill	Willows	M	2000-06-08	Brantford	ON	Nuts	185	110
1261	Rachel	Warner	F	1981-04-06	Hamilton	ON	Sulfa	173	94
1270	Jimmy	Lewis	M	2007-01-10	Hamilton	ON	Penicillin	150	67
1271	Anubis	Boxer	M	2010-10-05	Halifax	NS	Penicillin	122	40
1273	Stanislaus	Cavanaugh	M	2015-01-20	Beaverton	ON	Penicillin	83	27
1284	Alex	Rosenberg	F	1955-08-14	Hamilton	ON	Penicillin	160	54
1290	John	Cooper	M	1998-10-23	Hamilton	ON	Sulfa	214	108
1293	Lisa	Summers	F	1977-04-02	Hamilton	ON	Penicillin	173	44
1297	Temple	Shapandar	F	2013-06-24	Hamilton	ON	Topical Anaesthesia	73	22
1299	Alice	Provenza	F	1960-04-28	Hamilton	ON	Penicillin	158	57
1302	Marid	Randall	M	1969-12-31	Hamilton	ON	Bee Stings	130	71
1312	Emmett	DiGeorge	M	1960-07-27	Victoria	BC	Peanuts	181	126
1324	Roger	Sears	M	1956-03-22	Cambridge	ON	Penicillin	172	65
1332	Henry	Starr	M	2013-12-08	Hamilton	ON	Codeine	75	28
1336	Darcy	Klump	F	2004-05-09	Hamilton	ON	Sulfa	168	58
1338	Honey	Tyler	F	2009-10-23	Hamilton	ON	Codeine	113	35
1343	Harry	Dalton	M	2008-04-18	Hamilton	ON	Sulfa	143	55
1344	Mallory	Eckhart	F	1949-02-11	Burlington	ON	Cat Hair	166	57
1350	Becky	Kiriakis	F	2004-01-12	Hamilton	ON	Penicillin	165	65
1357	Ottilio	Smirnoff	M	2006-07-07	Stoney Creek	ON	Penicillin	166	57
1366	Paul	Bluenight	M	1969-08-22	Hamilton	ON	Penicillin	160	72
1373	James	Reilly	M	1968-06-12	Hamilton	ON	Fish	223	124
1374	Neville	Porlock	M	1983-03-20	Carlisle	ON	Penicillin	185	128
1375	Norman	Scott	M	1987-05-23	Hamilton	ON	Morphine	176	104
1376	Mary	Sinistra	F	1993-12-07	Hamilton	ON	Salicylic Acid	154	63
1380	Don	Vargas	M	1986-12-12	Hamilton	ON	Peanut Butter	163	89
1385	Irene	Arden	F	1953-08-02	Hamilton	ON	Penicillin	147	52
1388	Fenella	Connolly	F	1962-03-20	Bancroft	ON	Cat Hair	177	91
1392	Peggy	Marvin	F	1968-07-02	Halifax	NS	Codeine	154	63
1397	Eddie	Flynn	M	1955-03-13	Hamilton	ON	ASA	184	122
1416	David	Soprano	M	1993-03-10	Dundas	ON	Wheat	178	124
1436	Allan	Stewart	M	2013-05-18	Saskatoon	SK	Codeine	91	30
1446	Holland	Tam	M	1963-10-28	Ancaster	ON	Penicillin	215	96
1447	Bernard	Goren	M	1988-02-01	Toronto	ON	Penicillin	167	83
1448	Patty	Williams	F	1984-11-23	Hamilton	ON	Penicillin	151	67
1476	Evan	Clearwater	M	2000-03-28	Hamilton	ON	Cheese	168	73
1481	Victoria	Grant	F	1991-08-24	Brantford	ON	Valporic Acid	156	84
1487	Beanie	Frankenstein	F	2015-01-12	Toronto	ON	Penicillin	79	20
1492	Artemus	Scott	M	2013-07-01	Smithville	ON	Penicillin Diazepam	85	29
1498	Peggy	Fraser	F	2011-09-19	Dundas	ON	Sulfa	85	37
1500	Alejandro	Hally	M	2003-12-23	Toronto	ON	Penicillin	180	83
1503	Rocco	Montford	M	1990-07-02	Ancaster	ON	Latex	161	78
1505	Jerry	Heath	M	1984-06-16	Hamilton	ON	Codeine	130	81
1506	Huma	Fansler	F	1974-06-14	Waterford	ON	Codeine	164	66
1512	Peter	Carter	M	1965-05-24	Hamilton	ON	Penicillin	171	82
1535	Bernard	Brown	M	2002-11-29	Saskatoon	SK	Tylenol	194	89
1537	Dayne	Decker	M	1979-01-21	Hamilton	ON	Penicillin	139	76
1551	Enrique	Trudeau	M	1993-05-16	Kingston	ON	Latex	210	88
1570	Alexei	Reardon	M	1958-09-17	St. Catharines	ON	Penicillin	186	118
1571	Dol	Forelli	F	1976-07-27	Hamilton	ON	Penicillin	164	78
1576	Sherlock	Corneo	M	2018-05-16	Brantford	ON	Pork	29	3
1580	Amy	Trapani	F	1983-05-25	Hamilton	ON	Penicillin	159	69
1581	Melvyn	Bergman	M	1952-04-26	Vancouver	BC	Peanuts	188	124
1583	Laura	Peroni	F	1969-07-21	Hamilton	ON	Codeine	159	103
1597	Frank	Tai	M	1979-06-18	Stoney Creek	ON	Penicillin	149	69
1603	Jonathan	Cortez	M	1967-09-12	Montreal	QC	Penicillin	164	76
1620	Jean	Banzai	F	2003-12-02	Dundas	ON	Wheat	190	72
1625	Blanche	Clancy	F	1969-06-10	Smithville	ON	Penicillin	160	72
1639	Jules	Xavier	F	2000-07-24	Hamilton	ON	Penicillin	178	112
1640	Jo	Robbins	F	1955-05-19	Brantford	ON	Bee Stings	146	53
1655	Liz	Owens	F	1982-11-02	Hamilton	ON	Almonds	159	99
1658	Guido	Kirk	M	2014-08-31	Brantford	ON	Codeine	73	21
1659	Billie	Seaton	F	2004-04-21	Hamilton	ON	ASA	155	55
1663	Woody	Granger	M	1955-07-28	Stoney Creek	ON	ASA	207	133
1666	Trevor	Richards	M	1999-04-29	Ancaster	ON	Penicillin	155	80
1667	Raoul	Guarnaccia	M	1965-07-15	Fruitland	ON	Peanut Butter	160	87
1668	Kevin	Vimes	M	1975-01-12	Barrie	ON	Penicillin	197	112
1670	Andy	Sugden	M	1987-01-02	Toronto	ON	Codeine	141	72
1677	Harper	Rabbit	F	2014-06-13	Hamilton	ON	Penicillin	71	18
1685	Boris	Tsuna	M	1966-09-03	Hamilton	ON	Penicillin	158	68
1702	Angelo	Turlough	M	1987-04-16	Hamilton	ON	Valporic Acid	221	118
1715	Billie	Ichi	F	2006-04-26	Burlington	ON	Penicillin	128	57
1724	Rance	Kynes	M	1987-06-09	Guelph	ON	Sulfa	175	112
1728	Ruth	Buckton	F	1988-02-24	Cambridge	ON	Penicillin	137	45
1729	Martin	Huang	M	1961-07-19	Brockville	ON	Penicillin	146	81
1730	Deanna	Shirogane	F	1981-05-03	Toronto	ON	Micropore Tape	165	90
1737	Tiola	Bluenight	F	1971-06-25	Toronto	ON	Penicillin	168	105
1738	Polly	Yurinov	F	2001-03-06	Burlington	ON	Wheat	177	71
1740	Willie	Moorehead	M	1951-12-07	Hamilton	ON	Iodine	174	90
1741	Jackie	Granger	F	2005-09-09	Hamilton	ON	Codeine	145	46
1753	Julie	Hallow	F	1953-09-05	Hamilton	ON	Sulfa	173	58
1788	John	Gently	M	1978-04-29	Hamilton	ON	Penicillin	183	114
1791	Grace	Otley	F	1992-12-01	Hamilton	ON	Penicillin	160	65
1793	Oscar	Snyder	M	1983-03-04	Beamsville	ON	Sulfa	138	72
1796	Fred	Caneili	M	1956-07-22	Hamilton	ON	Nuts	155	63
1799	Narcissa	Zapatti	F	2003-05-04	Hamilton	ON	Peanut Butter	171	61
1810	Ward	Thorne	M	1959-02-12	Hamilton	ON	Penicillin	173	92
1811	Amanda	LoPresti	F	1976-03-06	Hamilton	ON	Penicillin	161	58
1820	BElanna	Rivers	F	2003-03-25	Windsor	ON	Penicillin	179	60
1821	Tiola	Selden	F	2003-04-25	Ajax	ON	Penicillin	170	67
1841	Claire	Van Buren	F	1994-06-14	Hamilton	ON	Penicillin	157	75
1858	Ottilio	Alleyn	M	1968-05-31	Burlington	ON	Peanuts	144	63
1862	Virginia	Next	F	1966-04-20	Carlisle	ON	Codeine	170	116
1877	James	Hamilton	M	1954-02-24	St. Johns	NL	Penicillin Environmental	167	79
1881	Norton	Sanders	M	1970-09-28	Oakville	ON	Bee Stings	185	107
1891	Julian	Tam	M	1993-04-15	Caledonia	ON	Peanut Butter	144	76
1895	Leona	Gray	F	1961-06-11	Cayuga	ON	Penicillin	157	62
1899	Fenella	Languish	F	2015-08-02	Hamilton	ON	Sulpha	56	14
1903	Chris	Dedede	M	2006-09-05	Hamilton	ON	Penicillin	168	58
1905	Jane	Anderson	F	1988-12-31	Toronto	ON	Valporic Acid	157	105
1907	Andy	Tutuola	M	2010-10-14	Burlington	ON	Hay Fever	96	35
1911	Chris	Johnson	F	1985-11-29	Hamilton	ON	Penicillin	178	108
1912	John	McNab	M	1978-03-05	Hamilton	ON	Codeine	160	83
1914	Briareos	Dash	M	1989-03-15	Grimsby	ON	Penicillin	189	108
1921	Kelly	Morton	F	1970-08-24	Hamilton	ON	Latex	155	62
1929	Joey	Brunetti	M	1979-04-27	Hamilton	ON	Salicylic Acid	154	84
1936	Doris	Stillman	F	1974-06-12	Elmira	ON	Peanuts	158	95
1878	Tex	Stein	M	2012-06-19	Grimsby	ON	NKA	95	39
1943	Alphonse	Lockwood	M	2016-11-04	Hamilton	ON	Penicillin	63	14
1947	Fenella	Donnelly	F	1958-10-29	Hamilton	ON	Iodine	145	53
1956	Joe	Halliwell	M	2000-03-16	Simcoe	ON	Penicillin	184	94
1966	Jane	Maclay	F	2000-01-17	Pickering	ON	Codeine	143	52
1970	Walter	Bennett	M	2000-02-23	Hamilton	ON	Penicillin	192	105
1981	Silvio	Mitchell	M	1995-09-13	Brampton	ON	Hay Fever	127	86
1982	Roy	Kojak	M	1952-09-04	Hamilton	ON	Codeine	152	77
1990	Astrid	Fletcher	F	1998-02-05	Brantford	ON	Valporic Acid	181	95
2006	Cedric	Green	M	1992-07-27	Ancaster	ON	Wheat	205	122
2010	Anna	Carr	F	1953-11-17	Brantford	ON	Penicillin	159	70
2031	Amy	Scott	F	1950-11-13	Hamilton	ON	Penicillin	155	53
2033	Charity	Flinstone	F	2002-02-07	Hamilton	ON	Sulfa	169	71
2050	Anita	Haruko	F	1975-01-07	Hamilton	ON	Sulfa	182	87
2056	Artemus	Orwell	M	1957-04-09	Hamilton	ON	Penicillin	149	85
2061	Hyman	Moses	M	1992-01-16	St. Catharines	ON	Honey	209	96
2069	Hildegarde	Channing	F	1951-03-12	Timmins	ON	Penicillin	151	57
2078	Sam	Sprockett	F	1985-04-02	Hamilton	ON	Penicillin	183	110
2086	Trinity	Vecchio	F	2016-10-14	Port Dover	ON	Penicillin	61	13
2102	Dodo	Levinson	F	1968-10-12	Hamilton	ON	Penicillin	178	106
2114	Milo	Fairfax	M	2002-11-10	Brantford	ON	Penicillin	197	92
2115	James	Ogg	M	2013-08-21	Hamilton	ON	Penicillin	79	27
2121	Cedric	De Lena	M	1958-06-04	Hamilton	ON	Latex	157	70
2131	Joe	Weir	M	1955-02-03	Pickering	ON	Iodine	145	84
2137	Sasha	Grace	M	1992-01-02	St. Catharines	ON	Penicillin	193	101
2142	Mickey	Yamamoto	M	1961-05-12	Burlington	ON	Morphine	186	67
2157	Santiago	Urth	M	1988-10-11	Hamilton	ON	ASA	195	114
2171	Pomona	Barclay	F	1956-01-25	Beamsville	ON	Tape	165	96
2191	Matt	Day	M	1957-11-02	Simcoe	ON	ASA	182	116
2200	Leo	Neutron	M	1966-08-13	Burlington	ON	Penicillin	168	61
2203	Eddie	Sawyer	M	1998-11-15	Toronto	ON	Sulfa	134	84
2208	Buckaroo	Baxter	M	2012-09-29	Beamsville	ON	Sulfa Drugs	107	41
2213	Margaret	Allen	F	1986-09-05	Burlington	ON	Penicillin	151	57
2240	Rachel	Boxer	F	1995-10-16	Hamilton	ON	Penicillin	159	71
2246	Stone	Polin	M	1963-08-27	Hamilton	ON	Elastoplast Bondage	147	70
2262	Norton	Suresh	M	1984-10-07	Cambridge	ON	Sulfa	177	89
2278	Cassie	Rockford	F	1951-08-16	Hamilton	ON	Bee Stings	142	76
2280	Andy	Rook	M	1980-08-22	Troy	ON	Penicillin	172	68
2283	Hagbard	Audran	M	2008-06-24	Toronto	ON	ASA	118	57
2286	Marietta	Banzai	F	2008-05-24	Hamilton	ON	Penicillin	137	48
2291	Sabrina	Vajda	F	2010-10-26	Cambridge	ON	Peanut Butter	107	35
2294	Donald	Adams	M	1967-11-17	Ancaster	ON	Penicillin	196	129
2299	Chick	West	M	1986-04-28	Hamilton	ON	Penicillin	188	102
2309	Asa	Burdock	F	2017-09-24	Brantford	ON	Peanuts	48	9
2312	Sam	Gaskell	M	2003-05-20	Hamilton	ON	Penicillin	189	86
2315	Charity	Hana	F	2018-03-18	Toronto	ON	Acetaminophen	30	3
2316	Sam	Atwater	M	2008-09-07	Hamilton	ON	Penicillin	130	56
2318	Sabrina	Goren	F	1988-02-14	Cambridge	ON	ASA	193	112
2359	Peggy	Rivers	F	2006-12-16	Hamilton	ON	Penicillin	147	47
2365	Wendell	Brown	M	1963-07-22	Hamilton	ON	Codeine	156	77
2371	Leslie	Che	F	1978-02-22	Hamilton	ON	Sulfa	177	102
2376	Samantha	Blossom	F	1950-04-20	Thunder Bay	ON	Penicillin	165	104
2378	Stanislaus	Swann	M	1981-11-04	Toronto	ON	Iodine	183	119
2384	Julian	Kaiser	M	1961-12-03	Hamilton	ON	Cat Hair	136	77
2390	Vera	Jeffries	F	1988-10-23	Hamilton	ON	ASA	153	110
2395	Ray	Jackson	M	2016-07-21	North York	ON	ASA	54	11
2401	Eddie	Potts	M	1973-04-06	Hamilton	ON	Penicillin	192	109
2412	Maureen	Mallory	F	1937-05-21	Dundas	ON	Sulfa	165	102
2415	James	McCartney	M	1981-02-04	Milton	ON	Iodine	176	74
2420	Wanda	Boyle	F	1989-11-03	Toronto	ON	Penicillin Environmental	171	92
2430	Laura	Lockwood	F	1953-12-30	Hamilton	ON	Penicillin	166	100
2441	Anna	Talbert	F	2002-11-25	Ancaster	ON	Penicillin	190	75
2447	Ernie	Lane	M	2005-01-19	Hamilton	ON	Penicillin	155	70
2454	Hercule	Hills	M	1958-05-06	Hamilton	ON	Nuts	180	78
2464	Shiro	Thorne	M	2010-08-09	Pickering	ON	Almonds	120	48
2465	Richard	Flinstone	M	1983-07-25	Hamilton	ON	Peanuts	193	105
2467	Dirk	Ozaki	M	2007-10-25	Hamilton	ON	Penicillin	154	52
2471	Kat	Jones	F	1982-04-28	Burlington	ON	Penicillin	146	54
2476	Abe	Hamilton	M	2015-11-11	Ottawa	ON	Sulfa	74	19
2483	Yuri	Provenza	M	2008-04-08	Peterborough	ON	Sulfa	143	58
2484	Faye	Langshaw	F	1927-03-03	Cambridge	ON	Erythromycin	163	104
2490	Edward	Donnelly	M	2005-09-14	Hamilton	ON	Penicillin	177	72
2515	Alan	Kohran	M	2004-10-06	Hamilton	ON	Strawberries	187	81
2530	David	Riviera	M	1995-08-29	Hamilton	ON	Strawberries	184	117
2538	Elizabeth	Del Toro	F	2014-11-26	Hamilton	ON	Tape	67	18
2564	Debra	Seaton	F	1954-04-15	Hamilton	ON	Penicillin	141	64
2567	Antonia	Greenaway	F	1995-09-17	Hamilton	ON	Penicillin	177	114
2571	Tom	Kelso	M	1995-09-11	Carisle	ON	Penicillin	156	67
2605	Stringer	Thirteen	M	1982-05-25	Hamilton	ON	Penicillin	198	104
2607	Wilfred	Sugden	M	2013-06-08	Dunton	ON	Codeine	87	30
2614	Midge	Hope	F	1989-06-06	Hamilton	ON	Penicillin	156	56
2622	Jean	Doyle	F	2015-08-31	Ancaster	ON	ASA	57	14
2627	Mary	Bukater	F	1963-03-02	Hamilton	ON	Bee Stings	174	116
2631	Tom	McNab	M	1959-04-13	Caledonia	ON	ASA	149	68
2644	Sabrina	Mancini-Corleone	F	1965-08-22	Grimsby	ON	Penicillin	155	71
2667	Lisa	Lodge	F	2012-01-18	Toronto	ON	Codeine	94	27
2676	Kaye	Spelvin	F	1981-07-20	Hamilton	ON	Peanut Butter	165	107
2680	Damian	Winslow	M	2012-02-26	Hamilton	ON	Seafood	103	30
2681	Domenico	Glicker	M	1950-10-01	Hamilton	ON	Bee Stings	198	120
2692	Antonio	Oyama	M	1997-11-02	Hamilton	ON	Penicillin	174	84
2696	Peter	Canfield	M	2009-07-21	Toronto	ON	Penicillin	110	50
2705	Simon	Brockway	M	2002-05-04	Oakville	ON	Penicillin	191	83
2711	Shinwell	Brady	M	1959-02-08	Northbay	ON	Strawberries	197	106
2731	Catherine	Bennet	F	1952-03-01	Timmins	ON	Penicillin	138	57
2744	Daniel	Schibetta	M	2016-11-25	Hamilton	ON	ASA	51	11
2746	Daphne	Tsuna	F	1981-07-17	Hamilton	ON	Tylenol	165	107
2749	Karen	Veeteren	F	1997-08-02	Hamilton	ON	Codeine	176	89
2759	Andy	Guarnaccia	M	1970-04-10	Grimsby	ON	Penicillin	168	76
2760	Charles	Barclay	M	1980-05-29	Hamilton	ON	Latex	188	110
2770	Norman	Halliwell	M	2017-11-05	Hamilton	ON	Penicillin	35	6
2783	Ted	Marvin	M	2003-04-16	Cambridge	ON	Penicillin	193	75
2794	Tem	LeStrange	M	1996-11-19	Brantford	ON	Codeine	164	68
2801	Julie	Hawker	F	1975-03-23	Burlington	ON	Sulfa	183	95
2802	Shawn	Brockway	M	1979-03-29	Grimsby	ON	Penicillin	175	119
2804	Roland	Lewis	M	1963-10-19	Toronto	ON	Penicillin	179	110
2814	Theo	Lopez-Fitzgerald	M	1977-04-04	Ancaster	ON	Codeine	160	69
2816	Stella	Owens	F	1989-01-14	Hamilton	ON	Penicillin	172	108
2820	Fleur	Mannheim	F	1987-12-11	Carisle	ON	Peanuts	167	98
2826	Thomas	Larkin	M	1951-11-19	Hamilton	ON	Codeine	144	70
2840	Madeline	Skye	F	1953-10-11	Hamilton	ON	Penicillin	150	62
2844	Haiku	Lang	M	1951-11-09	Toronto	ON	Codeine	147	77
2846	Barbara	Mitchell	F	1975-11-19	Peterborough	ON	Penicillin	166	77
2855	Endora	Raynor	F	1999-03-23	Brantford	ON	ASA	159	55
2868	James	Farley	M	2006-05-11	Hamilton	ON	Shellfish	174	60
2887	Naoto	Martin	F	1965-11-20	Hamilton	ON	Penicillin	159	56
2888	Lilly	Zarkov	F	1964-07-12	Burlington	ON	Cheese	140	67
2894	Delores	French	F	1974-07-26	Hamilton	ON	Penicillin Sulpha Drugs	164	52
2900	Corrado	Capone	M	1983-10-10	Burlington	ON	Iodine	165	73
2904	Lisa	Maraschino	F	1963-07-09	Hamilton	ON	Milk	177	111
2907	Turanga	Meeks	F	1993-11-01	Paris	ON	Codeine	172	107
2913	Michael	Che	M	1971-06-23	Ancaster	ON	Penicillin	154	74
2917	Kima	Chandler	F	2015-05-04	Hamilton	ON	Penicillin	63	17
2918	Neil	Cale	M	2011-06-03	Hamilton	ON	Valporic Acid	113	37
2919	Agnes	Stottlemeyer	F	2017-01-29	Rockford	ON	Penicillin	50	8
2921	Don	Sunen	M	2013-06-01	Carlisle	ON	Penicillin	80	27
2932	Arnold	Clearwater	M	1993-07-23	Brantford	ON	Codeine	175	75
2936	Temple	Valentine	F	1969-02-14	Inverness	NS	Peanuts	160	85
2959	George	Kane	M	1960-10-09	Toronto	ON	Milk	177	110
2967	Roger	Burbank	M	2006-05-24	Orillia	ON	Penicillin	157	68
2973	Kelly	Wylie	F	1979-08-29	Paris	ON	Penicillin	167	89
2979	Nikki	Fox	F	1964-03-24	Hamilton	ON	Micropore Tape	140	59
2984	Will	Chandler	M	1988-04-20	Hamilton	ON	Sulfa	182	116
2985	Hal	Kaiser	M	2011-04-24	Toronto	ON	Penicillin	88	34
2987	Angela	James	F	1954-06-25	Paris	ON	Penicillin	158	72
2994	Loveday	Repulsa	F	1950-07-10	Hamilton	ON	ASA	167	90
2995	Tem	Moreland	M	2008-03-29	London	ON	Penicillin Sulpha Drugs	142	46
3010	Edgar	Vector	M	2001-04-27	Guelph	ON	Codeine	187	94
3022	Leo	Sullivan	M	1987-11-29	Hamilton	ON	Penicillin	204	131
3032	Elisa	Clock	F	1960-06-20	St. Catharines	ON	Penicillin	147	47
3033	Sydney	Stewart	F	1992-03-29	St. Catharines	ON	Iodine	184	115
3039	Malik	Burdock	M	2003-10-13	Brantford	ON	Sulfa	189	81
3042	Basil	Brockman	M	1974-09-09	Hamilton	ON	Codeine	176	112
3053	Andrew	Reilly	M	1978-04-17	Bartonville	ON	ASA	173	70
3063	Frederico	Lerrol	M	1978-04-22	Toronto	ON	Penicillin	143	77
3072	Bruno	Knight	M	2015-01-10	Hamilton	ON	Codeine	66	22
3074	Grant	Hernandez	M	1960-12-22	Hamilton	ON	Penicillin	171	119
3075	Marsellus	Falcone	M	1925-03-14	Smithville	ON	Codeine	202	124
3083	Constance	Dahl	F	1971-05-22	Hamilton	ON	Penicillin	147	66
3094	Arjen	Kent	M	1983-09-01	Whitby	ON	Penicillin	154	62
3101	Henry	Spellman	M	2014-11-29	Hamilton	ON	Penicillin	67	22
3108	Javier	Snout	M	1973-03-21	Hamilton	ON	Penicillin	151	73
3114	Veronica	Stottlemeyer	F	2017-09-20	Milton	ON	Sulfa	35	6
3128	Tristan	Pomfrey	M	1989-07-13	St. Catharines	ON	Codeine	196	126
3135	Malma	Cooper	F	1976-04-27	Hamilton	ON	Penicillin	152	62
3044	John	Waterfield	M	2009-08-17	Grimsby	ON	NKA	119	57
3143	Phoebe	Fraser	F	1958-11-13	Hamilton	ON	Peanuts	133	76
3147	June	Smart	F	1974-06-13	Grimsby	ON	Penicillin	168	52
3157	Peter	Meedhan	M	2013-06-15	Victoria	BC	Codeine	93	30
3174	Sabrina	Preston	F	1970-10-11	Windsor	ON	Penicillin	143	59
3195	Achille	Thomas	M	1994-10-08	Hamilton	ON	Penicillin	157	59
3197	Tara	Anders	F	1955-03-10	Toronto	ON	Valporic Acid	158	63
3202	Mercedes	Jordan	F	2013-07-25	Hamilton	ON	Penicillin	82	25
3215	Shvaughn	Torini	F	1948-04-28	Orangeville	ON	Penicillin	159	75
3223	Christine	Waturs	F	1957-07-22	Cambridge	ON	Penicillin	154	119
3225	Elisa	Molly	F	2000-12-22	Brantford	ON	Penicillin	190	71
3234	Jean-Baptiste	Bass	M	1979-12-12	Windsor	ON	Topical Anaesthesia	143	64
3253	Tom	Freamon	M	1956-08-28	Hamilton	ON	Iodine	173	73
3255	Helen	Breaker	F	1965-06-06	Halifax	NS	Codeine	132	49
3261	Haruhara	Bones	F	1980-07-20	Hamilton	ON	Codeine	139	64
3273	Roman	Claibourne	M	1954-11-17	Victoria	BC	Sulfa	165	86
3276	Jack	Ridolph	M	1958-01-07	Fruitland	ON	Penicillin	213	100
3288	Louie	Capone	M	1958-08-22	Hamilton	ON	Sulfa	180	68
3293	Veronica	Bradley	F	2000-06-10	Hamilton	ON	Penicillin	168	91
3312	Indiana	Peabody	M	1987-07-01	Hamilton	ON	Peanuts	181	118
3314	Joseph	Graham	M	2009-06-08	Hamilton	ON	Latex	146	47
3319	Katie	Matthews	F	1972-04-27	Hamilton	ON	Penicillin	162	59
3323	Robin	Sanchez	M	1980-07-23	Hamilton	ON	ASA	219	125
3339	Maria	Storin	F	1965-10-22	Dundas	ON	Peanuts	133	59
3343	Jack	di Marco	M	2006-05-08	Hamilton	ON	Penicillin	160	57
3347	Trevor	Schwarzburger	M	1982-05-23	Hamilton	ON	Penicillin	179	90
3365	Connie	Vallance	F	1968-05-28	Hamilton	ON	Sulfa	142	75
3368	Vislor	Ichi	M	1975-01-01	Burlington	ON	Penicillin	177	105
3373	Guy	Lodge	M	2006-10-07	Hamilton	ON	Sulfa Drugs	154	73
3384	Molly	Moonshine	F	1951-08-23	Hamilton	ON	Penicillin	163	102
3393	Sarah	Caxton	F	1983-11-01	Waterford	ON	Tylenol	168	69
3394	Angela	Arden	F	2007-10-31	Hamilton	ON	Topical Anaesthesia	126	52
3395	Celeste	Sydnor	F	2006-07-15	Stoney Creek	ON	Penicillin	141	55
3397	Lloyd	Edgecombe	M	1950-03-27	Hamilton	ON	Penicillin	199	104
3398	Jackie	McAllister	F	2011-09-05	Grimsby	ON	Codeine	109	38
3399	Daniel	Scott	M	1963-11-02	Hamilton	ON	Penicillin	173	69
3402	Victoire	Heriot	F	1985-10-07	Burlington	ON	Sulfa	148	69
3414	George	Rockford	M	2014-05-06	Hamilton	ON	Iodine	68	22
3422	Dayne	Lynch	M	2010-05-22	London	ON	Micropore Tape	128	45
3425	Thomas	Ramsey	M	1997-05-13	Hamilton	ON	Peanuts	167	69
3431	Vincent	Ross	M	1996-05-17	Burlington	ON	Valporic Acid	215	108
3433	Peter	Lynley	M	2007-10-26	Hamilton	ON	Penicillin	137	62
3438	Jack	Roberts	M	1965-06-16	Toronto	ON	Strawberries	215	107
3440	Lois	Nutter	F	1993-11-27	Toronto	ON	Penicillin	147	70
3448	Patricia	Newbury	F	1964-03-07	Burlington	ON	Morphine	184	101
3450	Miyuki	Baily	F	1985-12-08	Ottawa	ON	Cyclor	163	105
3452	Kevin	Kent	M	2001-05-19	Hamilton	ON	Penicillin	214	94
3456	Pilar	Cooper	F	2009-05-13	Hamilton	ON	Sulfa Drugs	119	34
3470	Chuck	Strange	M	2002-02-23	Hamilton	ON	Valporic Acid	189	83
3472	Ann	Vargas	F	1961-05-11	Sarnia	ON	Penicillin	132	61
3474	Brenda	Rose	F	1975-08-09	Hamilton	ON	Penicillin	170	96
3476	Endora	Buckton	F	1982-11-04	Waterford	ON	Penicillin	153	61
3479	Kima	Anderson	F	1995-12-02	Vancouver	BC	Codeine	157	67
3489	Troy	Zatara	M	1972-03-16	Halifax	NS	Penicillin	147	81
3490	Knox	Lee	M	2004-11-21	Hamilton	ON	ASA	178	76
3497	Quito	Nash	M	1958-01-20	Brantford	ON	Aspirin	186	122
3499	Cal	Freeman	M	1968-03-12	Hamilton	ON	Tetracycline	190	111
3509	Pepper	March	F	1969-08-05	Dundas	ON	Penicillin	169	95
3513	Hetty	Vaughan	F	1987-05-02	Hamilton	ON	Sulphur	176	52
3517	Dotty	Matthews	F	1994-12-30	Burlington	ON	Penicillin	140	72
3519	Blake	Cutting	F	1995-01-01	Ancaster	ON	Codeine	140	60
3526	Holt	Anders	M	1958-01-04	Hamilton	ON	Penicillin	181	120
3541	Frank	Enrico	M	1986-03-04	Ottawa	ON	Penicillin	181	116
3552	Neil	Verma	M	1989-04-18	Windsor	ON	Codeine	131	68
3557	Polly	Schibetta	F	1988-04-30	Hamilton	ON	Penicillin	175	91
3564	Jill	Heskell	F	1996-12-17	Hamilton	ON	Peanuts	169	61
3566	Bonnie	Crockett	F	1964-10-22	Hamilton	ON	Sulfa Drugs	154	59
3568	Milo	Farrell	M	2011-06-19	Grimsby	ON	Codeine	90	41
3571	Rita	Buck	F	1983-08-19	Hamilton	ON	Bee Stings	179	93
3578	Joel	Taylor	M	1967-06-04	Hamilton	ON	Penicillin	143	75
3580	Midge	Costigan	F	1951-03-11	Timmins	ON	Tape	137	45
3581	Sara	Hamilton	F	2012-11-17	Victoria	BC	Penicillin	100	24
3587	Iris	Travis	F	1984-01-31	Hamilton	ON	Honey	162	94
3597	Jessica	Douglas	F	1968-11-01	Orangeville	ON	Iodine	152	62
3616	Winnie	Weasley	F	1998-03-10	Hamilton	ON	Peanut Butter	157	47
3621	Tom	Yurinov	M	1986-01-13	Brockville	ON	Penicillin	215	106
3629	Otis	McGraw	M	2016-04-13	Hamilton	ON	Codeine	51	13
3633	Sam	Jackson	M	2007-11-16	Hamilton	ON	Penicillin	119	52
3636	Briareos	Larsen	M	1988-08-06	Thunder Bay	ON	ASA	150	65
3638	Celestina	Maxwell	F	1998-12-24	Hamilton	ON	Sulfa Drugs	173	103
3643	Agatha	Spellman	F	2005-12-19	Hamilton	ON	Acetaminophen	167	63
3646	Agnes	Vimes	F	1989-04-20	Hamilton	ON	Salicylic Acid	178	104
3652	Larry	Vance	M	1979-06-11	Simcoe	ON	Penicillin	183	64
3659	Zelda	Mephesto	F	1987-01-08	Ancaster	ON	Penicillin	135	67
3663	Adam	Lopez-Fitzgerald	M	1971-12-29	Hamilton	ON	ASA	193	126
3666	Laurel	Page	F	2003-08-05	Hamilton	ON	Penicillin	175	71
3669	Alberto	Polford	M	1985-12-31	Brantford	ON	Valporic Acid	161	74
3677	Marnie	Harrison	F	1959-03-15	Sarnia	ON	Cheese	156	56
3678	Jake	Morello	M	1988-07-09	Hamilton	ON	Penicillin	169	128
3680	Mohinder	Allen	M	1966-04-13	Toronto	ON	Penicillin	199	125
3687	Anthony	Orville	M	2007-06-06	Cambridge	ON	Penicillin	145	64
3688	Rose	Nona	F	1982-07-04	Tuscorora	ON	Penicillin	176	111
3693	Anita	Mason	F	1994-06-15	Ancaster	ON	Penicillin	164	73
3696	Salvo	Arroway	M	1964-09-01	Milton	ON	Codeine	170	69
3699	Charles	Caine	M	2001-02-26	Stoney Creek	ON	Codeine	192	82
3712	Dirk	Zukovsky	M	1974-11-01	Cambridge	ON	Penicillin	195	112
3717	Emerson	Allen	M	2001-09-05	Hamilton	ON	Iodine	208	83
3722	Zefram	Flute	M	1965-10-31	Brantford	ON	Peanut Butter	196	106
3724	Richard	Sugden	M	1950-05-29	Dundas	ON	Penicillin	189	117
3730	Jack	Quatermass	M	1983-04-19	Toronto	ON	Valporic Acid	160	94
3731	Elisa	Maximoff	F	1983-10-06	Cambridge	ON	Hay Fever	181	93
3744	Marnie	Dingle	F	1989-08-23	Oakville	ON	Peanut Butter	172	64
3750	Don	Patrick	M	1980-09-20	Paris	ON	Penicillin	209	89
3754	Rose	Cool	F	1998-07-22	Hamilton	ON	Codeine	190	89
3760	Anna	De Lesseps	F	1964-01-20	Hamilton	ON	Codeine	188	110
3772	Franz	Vecchio	M	2012-03-22	Toronto	ON	Peanuts	84	26
3778	Didi	MacKenzie	F	1983-10-25	Toronto	ON	Penicillin	164	98
3781	Avon	Magliozzi	M	2001-12-04	Fruitland	ON	Penicillin	203	93
3782	Kit	Spellman	M	1995-06-25	Toronto	ON	Sulfa	192	109
3789	Margaret	Fabray	F	1968-07-13	Ancaster	ON	Valporic Acid	159	70
3791	Wilfred	Boxer	M	1958-02-25	Hamilton	ON	Wheat	164	82
3811	Jeremiah	Yurinov	M	2003-03-20	Hamilton	ON	Wheat	194	86
3824	Karen	Brannigan	F	2008-05-10	Kelowna	BC	Iodine	121	38
3833	Mickey	Tsuna	M	2003-10-05	Hamilton	ON	Penicillin	180	79
3840	Ritsuko	Brown	F	1952-09-27	Brockville	ON	Honey	183	105
3845	Lloyd	Morgan	M	1975-05-10	Hamilton	ON	ASA	182	114
3861	Shaz	Lopez-Fitzgerald	F	1995-10-14	Tyndale	ON	Penicillin	163	98
3869	Tom	Dawson	M	1987-04-10	Hamilton	ON	Cheese	198	97
3887	Jake	Stanfield	M	1986-08-14	Hamilton	ON	ASA Cotton Sheets	223	104
3897	Jason	Olemaun	M	2002-02-09	Brantford	ON	Penicillin	208	82
3904	Melinda	Beckett	F	2007-11-12	Hamilton	ON	Sulfa	130	47
3907	Lily	Spratt	F	2002-12-31	Toronto	ON	Penicillin	187	60
3922	Joe	Franklin	M	1993-05-15	Sarnia	ON	Penicillin	189	112
3923	Dorothy	Ramotswe	F	1965-05-31	Thunder Bay	ON	Tylenol	160	95
3925	Tara	MacGowan	F	1990-01-30	Hamilton	ON	Penicillin	192	93
3928	Joyce	OMalley	F	1996-04-27	Hamilton	ON	Penicillin	141	54
3935	YUko	Anneke	F	1977-08-16	Hamilton	ON	Almonds	150	56
3937	Alan	Webster	M	1960-09-10	Hamilton	ON	Bee Stings	142	78
3941	Miyuki	Salander	F	1960-12-25	Burlington	ON	Hay Fever	174	96
3943	Chloe	Parker	F	1967-04-06	Beaverton	ON	Penicillin	171	119
3946	Dan	Von Doom	M	1992-01-21	Timmins	ON	Cheese	165	88
3948	Douglas	Grissom	M	1981-12-02	Hamilton	ON	Penicillin	215	114
3949	Nicky	Aitoro	M	1962-07-29	Thunder Bay	ON	Codeine	156	72
3958	Christopher	Magliozzi	M	1950-10-06	Brantford	ON	Codeine	194	91
3962	Miyuki	Buxton	F	2017-09-29	Hamilton	ON	Sulfa	52	9
3969	Claire	Wainthropp	F	1983-01-10	Hamilton	ON	Honey	192	69
3972	Victoria	Starr	F	1978-04-04	Hamilton	ON	Salicylic Acid	181	104
3985	Laverne	Duncan	F	1967-05-11	Hamilton	ON	Penicillin	174	95
3989	Luke	Hojo	M	2004-10-05	St. Johns	NL	Ragweed	165	66
3997	Angus	Taylor	M	1949-09-06	Hamilton	ON	Penicillin	179	79
3999	Temple	Boxer	F	1953-01-01	Brantford	ON	Penicillin	178	114
4004	Sophie	Connolly	F	1997-06-15	Hamilton	ON	Sulfa Drugs	179	87
4013	Alan	Brigante	M	1976-11-15	Hamilton	ON	Penicillin	160	86
4028	Montana	Goodwin	F	1948-03-19	Paris	ON	Codeine	168	89
4031	Valerie	Poppins	F	1955-09-25	Toronto	ON	Peanuts	163	100
4040	Piper	Jacobs	F	1966-08-05	Smithville	ON	Tetracycline	182	101
4051	Zachary	Bakshi	M	2012-11-04	Hamilton	ON	Penicillin	81	36
4061	Sandy	Cameron	F	1975-04-06	Grimsby	ON	Salicylic Acid	161	97
4072	Ashley	Ranall	F	2013-07-05	Athens	ON	Penicillin	71	22
4076	Salvatore	Bardo	M	1973-08-15	Halifax	NS	Penicillin	159	77
4098	Katie	Bigelow	F	1999-07-22	Delhi	ON	Milk	175	111
4100	Prue	Owens	F	1976-05-07	Hamilton	ON	Sulfa	152	60
4102	Emma	ONeill	F	2002-12-23	Hamilton	ON	Penicillin	179	62
4117	Lisa	Darrow	F	2015-08-27	Windsor	ON	Tetracycline	66	18
4119	Sally	DeWolff	F	1986-02-15	Hamilton	ON	Penicillin	140	57
4135	Didi	Peabody	F	1951-02-24	Hamilton	ON	Codeine	159	62
4146	Ruby	Bones	F	1993-04-08	Calgary	ON	Penicillin	166	105
4158	Nea	Stape	F	1979-11-16	Whitby	ON	Sulfa	169	111
4177	Kirk	Forelli	M	1957-06-19	Hamilton	ON	Topical Anaesthesia	178	67
4178	Catherine	Craven	F	1988-08-15	Hamilton	ON	Penicillin	161	97
4182	Kat	Holmes	F	1956-11-20	Carlisle	ON	Sulphur	159	100
4197	Mallory	Poppins	F	1985-06-18	Grimsby	ON	Penicillin	155	53
4200	Laverne	Gordon	F	2014-08-14	Brantford	ON	Tylenol	76	22
4202	Martin	McCartney	M	1996-05-01	Hamilton	ON	Penicillin	178	79
4213	Chris	Morris	M	1964-09-09	Brantford	ON	Penicillin	205	110
4214	Harry	Barclay	M	1986-04-12	Brantford	ON	Penicillin	146	64
4218	Clancy	Morgan	M	1994-10-09	Hamilton	ON	Peanut Butter	204	94
4234	Raphael	Van Buren	F	1985-07-25	Hamilton	ON	Sulfa	154	63
4250	Paul	Zaluchi	M	1986-10-27	Smithville	ON	Acetaminophen	211	116
4302	Neil	Yamamoto	M	1958-07-17	Hamilton	ON	Penicillin	142	74
4307	Jack	White	M	2010-12-02	Ancaster	ON	Penicillin	131	42
4309	Penny	Woods	F	2003-11-12	Oakville	ON	ASA	155	58
4328	Brynn	Takata	F	1954-02-27	Cambridge	ON	Penicillin	168	95
4354	Jesse	Lowe	M	1998-06-23	Halifax	NS	Penicillin	159	61
4368	Leslie	Espinosa	M	1985-07-18	Paris	ON	Valporic Acid	207	108
4375	Agnes	Weasley	F	1969-01-03	Toronto	ON	Penicillin	145	69
4385	Elsa	Weston	F	2003-03-26	Peterborough	ON	Tape	167	66
4387	Demelza	Yang	F	1995-01-19	Toronto	ON	Penicillin	188	93
4388	Sara	Spratt	F	1961-10-08	Hamilton	ON	Bee Stings	147	62
4394	Peggy	Grissom	F	1987-03-21	Burlington	ON	Iodine	172	75
4398	Leonard	Steelgrave	M	1958-04-28	Hamilton	ON	Dye	163	107
4403	Deborah	Stewart	F	1970-01-14	Dundas	ON	Penicillin	153	74
4409	Christine	Soran	F	1974-03-06	Burlington	ON	Penicillin	152	53
4411	Ellery	Morales	M	1981-12-07	Dunton	ON	Penicillin	161	115
4417	Bernard	Hamilton	M	2011-08-28	Hamilton	ON	Penicillin	116	44
4423	Otis	Wright	M	2003-03-31	Troy	ON	Penicillin	184	76
4430	Maia	Warbeck	F	1974-01-31	Fruitland	ON	Codeine	178	101
4436	Cliff	Smith	M	1993-02-09	Hamilton	ON	Penicillin	161	76
4438	Morgan	Santoro	M	1953-04-23	Ancaster	ON	Almonds	194	102
4451	Holly	Railly	F	1952-10-11	Timmins	ON	Codeine	187	96
4454	Polly	Devine	F	1950-03-04	Sarnia	ON	Penicillin	148	58
4459	Mary	Kent	F	1958-02-24	Hamilton	ON	Penicillin	162	67
4461	Roderick	Riviera	M	1975-07-27	Milton	ON	Peanuts	196	118
4462	Chris	Kuroda	M	1952-01-22	Hamilton	ON	Tylenol	133	73
4481	Indiana	Halliwell	M	2012-12-12	Hamilton	ON	Codeine	75	36
4498	Wanda	Rice	F	2016-10-25	Hepworth	ON	Sulfa	55	14
4518	Domenica	Ashton	F	1977-10-02	Hamilton	ON	Sulphur	170	109
4519	Eddie	Drake	M	2017-05-22	Ancaster	ON	Penicillin	42	7
4526	Armando	Matthews	M	1987-12-20	Burlington	ON	Penicillin	173	74
4530	Constance	Yang	F	2002-07-17	Mississauga	ON	Penicillin	177	71
4	Blair	Diaz	M	1967-01-07	Hamilton	ON	NKA	191	104
19	John	West	M	1961-06-19	Oakville	ON	NKA	138	61
26	Nea	Kobayakawa	F	1995-10-18	Toronto	ON	NKA	147	62
30	Roderick	Payne	M	2015-03-22	Halifax	NS	NKA	58	17
50	Phil	Beckett	M	2014-10-11	Ottawa	ON	NKA	83	26
55	Rose	Spellman	F	1957-05-31	Hamilton	ON	NKA	164	59
80	Ernest	Clarkson	M	1962-11-22	Hamilton	ON	NKA	163	66
89	Sam	Spratt	M	1983-09-23	Hamilton	ON	NKA	195	100
96	Jonny	Christian	M	2003-06-26	Kingston	ON	NKA	182	77
99	Richard	Davis	M	1971-08-03	Toronto	ON	NKA	148	75
109	William	Templin	M	1975-08-06	Highland	ON	NKA	152	72
116	Mable	Taggart	F	1962-05-17	Hamilton	ON	NKA	181	87
136	Kenny	Skelton	M	1970-05-29	Calgary	ON	NKA	187	118
146	Scott	Corinthos	M	1999-11-25	Hamilton	ON	NKA	198	123
157	Robert	Page	M	1966-09-28	Stoney Creek	ON	NKA	177	117
167	Alex	Fox	F	1951-11-07	Selkirk	ON	NKA	170	98
169	Temple	LoPresti	F	1970-06-08	Hargersville	ON	NKA	146	45
175	Melody	Frye	F	2006-07-07	Hamilton	ON	NKA	132	44
190	Gwenog	Hughes	F	1951-02-28	Burlington	ON	NKA	162	87
203	Anita	Manu	F	1963-07-16	Dunton	ON	NKA	161	110
204	Wilfred	Vincent	M	1954-10-03	Burlington	ON	NKA	200	114
218	Megan	Fidelma	F	1986-03-19	Burlington	ON	NKA	157	71
225	Magnus	Ferrari	M	1994-01-21	Ottawa	ON	NKA	169	99
239	Mike	Johnson	M	1993-03-07	Hamilton	ON	NKA	158	78
263	Jack	Valentine	M	1954-10-06	Hamilton	ON	NKA	208	106
266	Amy	Peth	F	1964-11-29	Whitby	ON	NKA	171	70
286	John	Crockett	M	1963-07-14	Athens	ON	NKA	187	140
290	Angela	Clearwater	F	1960-04-30	Hamilton	ON	NKA	177	99
293	Mickey	Fisk	M	1984-10-22	Hamilton	ON	NKA	161	57
299	Gary	Blake	M	1977-03-23	Hamilton	ON	NKA	202	116
305	Amane	Flute	F	2006-03-27	Hamilton	ON	NKA	130	48
309	Harold	Buchanan	M	1951-06-26	Toronto	ON	NKA	186	95
313	Claire	Sprockett	F	1995-07-01	Hamilton	ON	NKA	170	67
315	Winifred	Larkin	F	2017-11-03	Brantford	ON	NKA	39	5
319	John	McCrimmon	M	1985-07-06	Paris	ON	NKA	195	135
323	Lylah	Lockwood	F	2002-03-06	Hamilton	ON	NKA	169	75
331	Jason	Hopper	M	1983-06-25	Hamilton	ON	NKA	187	68
344	Bryan	Skywalker	M	1960-05-24	Barrie	ON	NKA	186	80
345	Cordelia	Hanson	F	1934-05-04	Hamilton	ON	NKA	155	68
348	Danny	Magnus	M	2016-01-02	Hamilton	ON	NKA	54	13
352	Peter	Rook	M	1980-12-22	Hamilton	ON	NKA	163	88
361	Marshal	Hawkes	M	1985-12-09	Hamilton	ON	NKA	152	57
365	Angelica	Dalton	F	1983-01-23	Hamilton	ON	NKA	148	49
379	Barney	Atwater	M	1966-03-11	Hamilton	ON	NKA	140	69
385	Ernest	Poirot	M	1977-08-01	Hamilton	ON	NKA	155	91
391	Kingo	Frye	M	1967-04-06	Carisle	ON	NKA	170	63
400	Cordelia	Belden	F	2017-04-12	Hamilton	ON	NKA	45	10
404	Grace	Yurinov	F	1977-08-24	Hamilton	ON	NKA	184	121
409	Julius	Montalbano	M	2007-06-08	Delhi	ON	NKA	127	60
417	Elizabeth	Spencer	F	1973-09-05	Stoney Creek	ON	NKA	160	63
425	Barney	Smith	M	1948-09-20	Hamilton	ON	NKA	162	68
426	Patricia	Rose	F	1993-04-08	Hamilton	ON	NKA	179	92
440	Pablo	Treskovna	M	1994-09-16	Hamilton	ON	NKA	157	60
446	Jane	Goodspeed	F	1980-08-06	Barrie	ON	NKA	162	66
458	Joseph	Miller	M	1991-02-11	Hamilton	ON	NKA	150	87
470	Agnes	Waterfield	F	1958-08-19	Ancaster	ON	NKA	155	65
484	Ismael	Brearly	M	1992-10-13	Hamilton	ON	NKA	202	112
505	Oliver	Corneo	M	1950-07-27	Dunton	ON	NKA	160	81
511	Morgan	Soong	M	1963-05-30	Hamilton	ON	NKA	186	118
512	Celeste	Galloway	F	1990-10-29	Odessa	ON	NKA	171	64
513	Rachel	Patil	F	1991-05-12	Hamilton	ON	NKA	191	101
536	Miss	Holroyd	F	1969-05-07	Hamilton	ON	NKA	162	69
537	Harry	Harkness	M	1993-03-30	Hamilton	ON	NKA	171	72
556	Bill	Watson	M	1963-03-01	St. Johns	NL	NKA	221	111
574	Janice	Yaga	F	1950-10-29	Carlisle	ON	NKA	166	98
581	Elizabeth	Martinelli	F	2003-07-10	Hamilton	ON	NKA	164	64
583	Kay	Rawling	F	1949-05-05	Oakville	ON	NKA	175	83
586	Ariel	Scribbs	F	1972-03-23	Hamilton	ON	NKA	159	90
589	Peter	Hajime	M	2018-01-07	Hamilton	ON	NKA	48	9
592	Lydia	Millhone	F	1985-09-03	Hamilton	ON	NKA	153	45
596	Barry	Cooper	M	1962-01-30	Burlington	ON	NKA	166	65
598	Blanche	Jovanovic	F	1975-04-28	Hamilton	ON	NKA	166	100
601	William	Purbright	M	2004-02-06	Ancaster	ON	NKA	178	78
609	Mickey	Carling	M	1968-05-02	Simcoe	ON	NKA	143	64
619	Anthony	Kingdom	M	1965-07-17	Mississauga	ON	NKA	214	111
626	Miyuki	Moses	F	1964-09-25	Edmonton	AB	NKA	173	93
634	Harry	Travers	M	1971-04-30	Hamilton	ON	NKA	159	62
648	Stanislaus	Schibetta	M	1993-10-05	Walnut Grove	AB	NKA	174	67
665	Rita	De Lesseps	F	1968-08-05	Hamilton	ON	NKA	142	72
666	Jack	Henderson	M	1964-10-19	Hamilton	ON	NKA	146	87
669	Huma	Thomas	F	1978-09-27	Windsor	ON	NKA	159	61
677	Jenna	Crane	F	1958-10-22	Hamilton	ON	NKA	162	94
678	Leonard	Taylor	M	1979-08-07	Hamilton	ON	NKA	163	80
680	Giacomo	Carver	M	1949-05-13	Burlington	ON	NKA	160	83
686	Ichabod	Tura	M	1952-09-12	Peterborough	ON	NKA	157	75
689	Paul	Wolfe	M	1962-10-01	Cambridge	ON	NKA	160	76
691	Marina	Nichols	F	1974-05-23	Hamilton	ON	NKA	161	105
694	Bill	Vallance	M	1991-07-10	Hamilton	ON	NKA	207	107
705	Eben	Corneo	M	2008-11-23	Toronto	ON	NKA	146	58
715	Melody	Potter	F	1996-11-10	Hamilton	ON	NKA	156	107
729	Woodsy	Crane	M	1960-01-05	Hamilton	ON	NKA	176	121
732	Bo	Halliwell	M	1990-11-03	Cambridge	ON	NKA	214	123
738	Ethel	Hare	F	1975-06-18	Ancaster	ON	NKA	180	105
744	Bonnie	Spinnet	F	1997-12-05	Hepworth	ON	NKA	151	55
747	Michael	Pratt	M	1972-11-02	Ancaster	ON	NKA	190	109
748	Marvin	Yurinov	M	1969-04-10	Hamilton	ON	NKA	146	64
779	Ruth	Sisco	F	1953-06-03	Hamilton	ON	NKA	142	48
783	Orla	Cooper	F	1979-02-23	Cambridge	ON	NKA	163	95
799	John	Spuckler	M	2002-08-05	Sarnia	ON	NKA	209	82
809	Tom	Fanucci	M	1998-10-09	Hamilton	ON	NKA	187	132
811	Henry	Martin	M	1961-12-18	Sarnia	ON	NKA	192	116
816	John	Jenkins	M	1989-06-23	Hamilton	ON	NKA	196	102
821	Nero	Jacobs	M	2011-09-14	Hamilton	ON	NKA	102	38
826	Kiranin	Parkinson	M	1987-01-17	Hamilton	ON	NKA	206	124
837	Stephen	Cochrane	M	1954-01-25	Hamilton	ON	NKA	149	68
857	Ian	Leigh	M	1967-03-03	Troy	ON	NKA	168	106
864	Maia	Greener	F	1963-05-22	Hamilton	ON	NKA	170	104
872	Mable	Davenport	F	2013-11-14	Brantford	ON	NKA	89	26
873	Langdale	Cole	M	1948-04-26	Thunder Bay	ON	NKA	183	57
888	Dale	Sigel	M	1963-09-18	Hamilton	ON	NKA	188	93
891	Moe	Smith	M	1996-09-11	Hamilton	ON	NKA	162	83
897	Kevin	Bonasera	M	2009-05-10	Pickering	ON	NKA	126	39
903	Deborah	Fabray	F	2008-08-18	Hamilton	ON	NKA	129	40
925	Dion	Vincent	M	1987-06-23	Toronto	ON	NKA	155	79
930	Bunk	Swift	M	1979-04-20	Hamilton	ON	NKA	200	113
962	Dolores	Davenport	F	1971-11-02	Hamilton	ON	NKA	165	106
995	Georgette	Page	F	1987-01-27	Hamilton	ON	NKA	175	69
997	Georgette	Lambert	F	1991-11-13	Hamilton	ON	NKA	179	100
1003	Keith	MacLean	M	1961-03-05	Hamilton	ON	NKA	202	119
1020	Johnny	Antony	M	2004-10-01	Ancaster	ON	NKA	170	75
1023	Velu	ONeill	M	2003-02-20	Hamilton	ON	NKA	183	81
1068	Mary Jane	Owens	F	1975-04-04	Hamilton	ON	NKA	170	90
1084	Mary	Hammer	F	1956-02-09	Ottawa	ON	NKA	150	78
1087	Phil	Capone	M	1961-09-11	Hamilton	ON	NKA	140	86
1091	Sarah	Day	F	1966-03-31	Timmins	ON	NKA	166	108
1092	Vic	Glicker	M	2006-01-06	Hamilton	ON	NKA	162	57
1099	Perry	Bradley	M	1955-08-02	Hamilton	ON	NKA	146	79
1107	Amy	Travers	F	1987-09-27	Toronto	ON	NKA	156	41
1114	Simon	Kammerer	M	1966-05-10	Burlington	ON	NKA	171	89
1120	Emma	Sena	F	1976-01-22	Hamilton	ON	NKA	133	72
1128	Jimmy	Serrano	M	1987-10-22	Brampton	ON	NKA	161	75
1133	Fiz	Peth	F	2005-03-21	Hamilton	ON	NKA	148	61
1135	Sharon	Flynn	F	2007-02-01	Hamilton	ON	NKA	142	51
1144	Jessica	Hill	F	2002-04-15	Kingston	ON	NKA	166	76
1146	Matt	Sanderson	M	1989-07-30	Hamilton	ON	NKA	142	69
1154	Kate	Lupertazzi	F	1954-07-09	Hamilton	ON	NKA	177	107
1160	Truman	Mancini-Corleone	M	1992-11-03	Hamilton	ON	NKA	155	62
1167	Woody	Wallace	M	1977-06-21	Hamilton	ON	NKA	132	59
1175	Lucky	Crane	M	1994-11-28	Fruitland	ON	NKA	161	77
1188	Tulio	Napoli	M	2003-11-01	Hamilton	ON	NKA	181	78
1206	Joyce	White	F	1968-04-11	Timmins	ON	NKA	174	55
1220	Sarah	Brown	F	1952-06-21	Brantford	ON	NKA	175	85
1225	Motoko	DeWolff	F	1993-09-02	Windsor	ON	NKA	180	110
1227	Loveday	Morgan	F	2016-01-03	Hamilton	ON	NKA	57	13
1245	Larry	Ferguson	M	1981-08-07	Hamilton	ON	NKA	143	75
1286	Roland	Hanover	M	1986-04-09	Hamilton	ON	NKA	206	130
1295	Elvis	Kaiser	M	1984-05-22	Burlington	ON	NKA	147	63
1303	Roman	Banzai	M	2011-06-26	Hamilton	ON	NKA	96	29
1306	Jack	Goren	M	1989-09-01	Oakville	ON	NKA	155	86
1316	Don	Clouseau	M	1975-02-28	Milton	ON	NKA	195	99
1341	Saito	Tony	M	1962-11-05	Hamilton	ON	NKA	195	111
1342	Jim	Grant	M	1974-12-20	Milton	ON	NKA	209	93
1353	Miguel	Whitlock	M	1963-05-02	Hamilton	ON	NKA	189	90
1364	George	Gudmundsdottir	M	1987-05-16	Edmonton	AB	NKA	179	126
1382	Nero	Chandler	M	1979-07-04	Hamilton	ON	NKA	152	80
1387	Chris	Crosby	M	1955-09-10	Toronto	ON	NKA	153	77
1394	Roderick	Sun	M	1974-08-20	Ancaster	ON	NKA	151	78
1404	Wilfred	Russo	M	1993-02-13	Hamilton	ON	NKA	180	117
1420	Deirdre	Baley	F	1994-09-10	Hamilton	ON	NKA	186	109
1427	Dick	Thomas	M	2018-01-12	Hamilton	ON	NKA	40	5
1452	Garryn	Archer	M	1952-05-20	Victoria	BC	NKA	153	68
1457	Gerard	Church	M	1952-08-18	Troy	ON	NKA	162	69
1468	Maia	Sprout	F	1968-04-25	Hamilton	ON	NKA	165	96
1494	Buckaroo	Volsky	M	1992-01-12	Hamilton	ON	NKA	176	118
1497	Katie	Shoop	F	2006-06-17	Halifax	NS	NKA	144	59
1520	Sister	Allan	F	1980-01-31	Montreal	QC	NKA	175	111
1523	Stone	Barton	M	2010-03-06	Cambridge	ON	NKA	123	40
1526	Mary	Sanchez	F	2008-05-13	Hamilton	ON	NKA	133	42
1544	Chan	Snyder	M	2003-12-24	Stoney Creek	ON	NKA	173	76
1565	Pepper	Cameron	F	2007-10-17	Windsor	ON	NKA	131	45
1602	Dickie	Decker	M	2011-06-11	Hamilton	ON	NKA	105	39
1607	George	Lemansky	M	1983-10-13	Paris	ON	NKA	145	66
1611	Paul	Kennedy	M	1982-05-12	Milton	ON	NKA	176	66
1633	Martin	OBrien	M	1988-03-13	Brantford	ON	NKA	188	61
1635	Peter	Thornton	M	1972-05-05	Toronto	ON	NKA	161	72
1660	Bumpy	Hort	M	1983-09-04	Ottawa	ON	NKA	167	91
1672	Sarah	Hare	F	1993-09-03	Hamilton	ON	NKA	169	117
1686	Miranda	Blossom	F	1961-10-27	Hamilton	ON	NKA	164	96
1693	John	Scott	M	1964-06-20	Waterford	ON	NKA	180	125
1700	James	Piquel	M	1999-05-27	Dundas	ON	NKA	159	76
1704	Jay	Prentiss	M	1992-02-04	Hamilton	ON	NKA	214	117
1731	Shinwell	Williams	M	1981-09-25	Hamilton	ON	NKA	211	124
1742	Jaenelle	Granger	F	1978-04-23	Hamilton	ON	NKA	148	58
1745	Meyer	Iosefa	M	2000-11-23	Hamilton	ON	NKA	179	118
1760	Vijay	Scotts	M	1995-02-21	Walnut Grove	AB	NKA	217	115
1763	Harry	Tribbiani	M	1957-12-23	Tyndale	ON	NKA	199	95
1767	Ricardo	Lupertazzi	M	1957-08-07	Hamilton	ON	NKA	150	70
1773	Kirk	Marley	M	1976-08-03	Brantford	ON	NKA	213	104
1776	Tom	Lopez	M	1950-10-19	Hamilton	ON	NKA	176	120
1777	Lucky	Crusher	M	1981-11-16	Caledonia	ON	NKA	191	103
1778	Jack	Anderson	M	2005-01-12	Hamilton	ON	NKA	173	66
1782	Paul	Noble	M	1976-07-10	Ancaster	ON	NKA	152	76
1803	Grace	Aguilar	F	1988-12-03	Burlington	ON	NKA	171	86
1805	Otis	Valentine	M	1987-02-07	Orangeville	ON	NKA	185	100
1812	Callum	Ranall	M	1970-10-29	Hamilton	ON	NKA	175	87
1817	Hestia	Ward	F	2009-10-26	Ancaster	ON	NKA	131	36
1818	Jonathan	Bluenight	M	1970-10-21	Brantford	ON	NKA	186	108
1832	Arnold	Manetta	M	1946-06-09	Hamilton	ON	NKA	196	124
1837	Johnny	Selwyn	M	1956-04-02	Vancouver	BC	NKA	199	104
1845	George	Parker	M	1978-02-02	Hamilton	ON	NKA	147	66
1848	Michael	McNab	M	1988-08-04	Hamilton	ON	NKA	206	107
1861	Gary	Elliot	M	2003-10-04	Hamilton	ON	NKA	177	77
1873	Lloyd	Fortune	M	2000-02-05	Toronto	ON	NKA	180	92
1884	Nick	White	M	1949-05-20	Hamilton	ON	NKA	187	102
1900	Reginald	Prefect	M	1967-05-22	Waterford	ON	NKA	212	108
1902	Jean	Trivino	F	1966-05-13	Ancaster	ON	NKA	164	100
1920	Naomi	Heriot	F	1979-08-25	Burlington	ON	NKA	156	66
1926	Stanislaus	Mancini-Corleone	M	1985-01-27	Hamilton	ON	NKA	173	81
1933	Thomas	Taylor	M	1984-11-24	Hamilton	ON	NKA	156	82
1944	Kouzou	Daystrom	M	2002-04-15	Hamilton	ON	NKA	184	82
1946	Donna	Brea	F	1954-06-26	Hamilton	ON	NKA	140	53
1948	Theo	Wallace	M	1998-12-11	Hamilton	ON	NKA	174	66
1951	Jack	Valentine	M	2013-02-08	Pickering	ON	NKA	84	28
1952	Vickie	Vincent	F	2001-02-15	Hamilton	ON	NKA	180	69
1954	Jonathan	Tremulous	M	1990-02-21	Hamilton	ON	NKA	172	84
1961	Angua	Spratt	F	1996-04-04	Beaverton	ON	NKA	161	101
1985	Lisa	Riggs	F	1993-11-05	Hamilton	ON	NKA	171	107
1991	Dorrie	Brennan	F	1999-02-23	Hamilton	ON	NKA	176	116
1997	Alecto	Goodspeed	F	1987-08-12	Brockville	ON	NKA	148	51
2016	Jake	Morgan	M	1975-06-13	Hamilton	ON	NKA	194	101
2024	Tony	Jenkins	M	1961-03-02	Ancaster	ON	NKA	181	97
2036	Simon	Drew	M	2004-12-01	Paris	ON	NKA	178	81
2042	Thomas	Smart	M	1961-01-22	Hamilton	ON	NKA	222	114
2071	Calleigh	Goth	F	1979-07-12	Beaverton	ON	NKA	166	103
2074	Loveday	Young	F	2002-01-26	Hamilton	ON	NKA	195	69
2076	Clark	Miller	M	1992-05-21	Paris	ON	NKA	177	74
2079	David	Hammer	M	1959-09-09	Hamilton	ON	NKA	210	128
2083	Ann	Halifax	F	1928-08-08	Hamilton	ON	NKA	157	54
2084	Ronnie	Sanderson	M	1989-07-16	Hamilton	ON	NKA	202	120
2091	Emily	Chester	F	2016-12-21	Hamilton	ON	NKA	49	9
2095	Ben	Cavor	M	1989-05-24	Hamilton	ON	NKA	173	80
2097	Viola	Redfield	F	1990-07-22	Orangeville	ON	NKA	161	69
2101	Andy	Cage	M	1963-11-01	Dunton	ON	NKA	183	68
2107	John	Chino	M	1969-12-30	Hamilton	ON	NKA	181	123
2109	Ella	Jones	F	2009-06-09	Hamilton	ON	NKA	102	37
2116	Doran	Graham	F	1995-12-01	Fruitland	ON	NKA	164	48
2120	Dan	Falfa	M	1981-06-05	Hamilton	ON	NKA	173	83
2127	Naoto	Nordbo	F	1986-06-21	Hamilton	ON	NKA	167	95
2128	Fred	Denoon	M	1962-06-08	Hamilton	ON	NKA	137	71
2129	Bigby	Vallance	M	1999-10-15	Hamilton	ON	NKA	166	70
2135	Stella	Lino	F	1967-06-22	Dundas	ON	NKA	156	56
2141	Curtis	Douglas	M	1962-06-13	Odessa	ON	NKA	155	60
2144	Susan	Yurinov	F	1943-12-13	Port Hawkesbury	NS	NKA	175	112
2152	Vance	Vincent	M	1959-04-14	Pickering	ON	NKA	175	62
2161	Shiro	Taylor	M	1955-08-05	Grimsby	ON	NKA	180	104
2175	Todd	Harland	M	1978-12-06	Hamilton	ON	NKA	210	101
2210	Walter	Rush	M	1951-05-08	Hamilton	ON	NKA	151	66
2214	Silvio	Silvermane	M	1950-06-11	Fruitland	ON	NKA	184	122
2219	Andy	Tanner	M	1992-04-03	Port Hawkesbury	NS	NKA	204	117
2226	Frank	Canlaster	M	1952-04-28	Dundas	ON	NKA	191	128
2228	Silvio	Profitt	M	1955-08-10	Hamilton	ON	NKA	205	106
2233	Rosco	Burns	M	1994-05-22	Hamilton	ON	NKA	211	131
2247	Sabrina	Shaw	F	2004-09-24	Hamilton	ON	NKA	172	67
2248	Molly	Hammer	F	2011-11-22	Carlisle	ON	NKA	110	31
2252	Miles	Sinclair	M	1997-02-08	Hamilton	ON	NKA	171	77
2253	Julian	Tura	M	1956-09-01	Brockville	ON	NKA	126	76
2266	Gil	Taylor	M	1985-05-10	Hamilton	ON	NKA	208	109
2276	Gregory	Garlick	M	1949-08-30	Milton	ON	NKA	208	115
2301	Sal	Flinstone	M	2014-09-18	Burlington	ON	NKA	69	21
2302	Michael	Dallas	M	1961-07-24	Hamilton	ON	NKA	198	128
2307	Angelica	Brockway	F	2016-09-05	Grimsby	ON	NKA	50	9
2313	Ethel	Gordon	F	2013-05-26	Burlington	ON	NKA	75	21
2319	Jenny	Petrie	F	1955-11-25	Hamilton	ON	NKA	161	50
2326	Willie	Wesker	M	2005-08-03	Hamilton	ON	NKA	173	60
2333	Septima	Melfi	F	2012-04-27	Burlington	ON	NKA	84	33
2338	Cordelia	Peabody	F	1958-04-13	Burlington	ON	NKA	162	100
2364	Paige	Lynch	F	1950-06-10	Bancroft	ON	NKA	154	67
2366	Chris	Sanders	M	1950-06-03	Dundas	ON	NKA	167	88
2368	Max	Spencer	M	2014-07-07	Thunder Bay	ON	NKA	67	22
2381	Jay	Camonte	M	2009-12-15	Windsor	ON	NKA	131	53
2388	Keziah	Greengrass	F	1979-07-24	Timmins	ON	NKA	166	96
2391	Jean	Brannigan	F	1999-05-17	Kingston	ON	NKA	156	52
2398	Hailey	Pomfrey	F	2012-01-12	Brampton	ON	NKA	81	31
2400	Celestina	Harrison	F	2006-12-06	Guelph	ON	NKA	129	47
2402	Deborah	Threep	F	1950-02-25	Barrie	ON	NKA	157	65
2419	Lou	Lockwood	M	1991-10-21	Hamilton	ON	NKA	174	74
2429	Emil	Macdonald	M	1975-11-25	Windsor	ON	NKA	199	123
2437	Eloise	Ravenclaw	F	1990-08-23	Hamilton	ON	NKA	147	68
2469	Georgia	Crockford	F	1957-11-10	Fruitland	ON	NKA	171	86
2488	Enrique	Smyth	M	2008-05-01	Kelowna	BC	NKA	154	51
2512	Henry	Fuhrey	M	1980-09-22	Hamilton	ON	NKA	172	101
2514	Robert	Spratt	M	1949-10-09	Toronto	ON	NKA	181	94
2517	King	Brady	M	1971-09-28	Stoney Creek	ON	NKA	218	101
2518	Russell	Gabriel	M	1969-10-19	Windsor	ON	NKA	179	109
2521	Kira	Nitt	F	1966-06-08	Toronto	ON	NKA	158	71
2543	William	Fairhead	M	1992-01-26	Fruitland	ON	NKA	174	95
2552	Rex	Ortega	M	1978-01-17	Saskatoon	SK	NKA	167	116
2556	Marcus	Jackson	M	1955-07-13	Brantford	ON	NKA	205	104
2565	Tuppence	Hardbroom	F	2011-04-23	Hamilton	ON	NKA	94	32
2578	Jo	Mallory	F	1981-10-17	Hamilton	ON	NKA	178	104
2580	Jadu	Cantillon	F	2002-11-04	Hamilton	ON	NKA	187	66
2581	Maynard	Von	M	1992-05-16	Hamilton	ON	NKA	192	119
2585	Jimmy	Wylie	M	1949-11-24	Hamilton	ON	NKA	153	78
2590	Mark	Abbot	M	2014-11-17	Toronto	ON	NKA	68	21
2592	Damian	Robins	M	1972-07-02	Brantford	ON	NKA	184	104
2602	Maia	Freeman	F	2015-11-14	Hamilton	ON	NKA	60	14
2612	John	Mitchell	M	2010-06-17	Toronto	ON	NKA	120	49
2617	Rex	MacLeod	M	1952-10-01	Milton	ON	NKA	182	106
2624	Benton	Sigel	M	1958-07-05	Stoney Creek	ON	NKA	185	102
2628	Doris	Scotts	F	1956-07-26	Hamilton	ON	NKA	162	82
2654	Jacques	Cropper	M	2005-09-22	Toronto	ON	NKA	166	66
2659	Vivian	Harding	F	1955-04-24	Timmins	ON	NKA	154	70
2666	Rose	Peretti	F	2003-11-30	Hamilton	ON	NKA	157	61
2675	Eve	Harland	F	1977-05-15	Hamilton	ON	NKA	136	48
2685	Lisbeth	Evans	F	1974-11-21	Hamilton	ON	NKA	181	114
2688	Tom	Falcon	M	2005-08-07	Hamilton	ON	NKA	161	68
2697	Van	Franchetti	M	2002-03-15	Hamilton	ON	NKA	200	89
2698	Frank	Brockman	M	2004-11-23	Victoria	BC	NKA	160	73
2700	David	Beckett	M	2010-03-26	Delhi	ON	NKA	119	39
2704	Hari	Andonuts	M	1985-06-18	Burlington	ON	NKA	158	76
2708	John	Colbert	M	1976-03-24	Hamilton	ON	NKA	179	97
2721	Linda	Lawson	F	1980-06-18	Toronto	ON	NKA	159	61
2729	Benton	Rooney	M	1948-05-03	Hamilton	ON	NKA	169	98
2757	Victor	Vimes	M	1962-07-26	Hamilton	ON	NKA	189	121
2761	Dale	Snyder	M	1949-10-29	Cambridge	ON	NKA	216	126
2763	Sara	Eckhart	F	1997-01-05	Ottawa	ON	NKA	190	85
2785	Mike	Parrish	M	1992-03-16	St. Catharines	ON	NKA	194	116
2788	Matthew	Dagg	M	1952-03-06	London	ON	NKA	198	93
2818	Philip	Reardon	M	1955-04-27	Halifax	NS	NKA	161	62
2825	Jack	Cherrytree	M	1964-12-11	Cambridge	ON	NKA	164	69
2838	Alex	McGonagall	M	1966-06-13	Hamilton	ON	NKA	201	103
2839	Victor	Wildhack	M	1956-11-21	Hamilton	ON	NKA	192	112
2848	Craig	Havers	M	1986-12-11	Hamilton	ON	NKA	201	137
2851	Sandy	Cutting	F	1958-12-16	Hamilton	ON	NKA	187	93
2854	Stefano	Gabriel	M	1975-03-09	Calgary	ON	NKA	139	64
2857	Tabitha	Bek	F	2004-06-24	Hamilton	ON	NKA	166	60
2863	Matthew	Frankenstein	M	1991-10-07	Ancaster	ON	NKA	194	130
2873	Tony	White	M	1948-06-08	Dundas	ON	NKA	187	101
2874	Jake	Stewart	M	1985-08-23	Timmins	ON	NKA	153	77
2886	Haruhara	Stillman	F	2007-10-05	Brantford	ON	NKA	152	55
2890	Herr	Hoare	M	1983-03-09	Toronto	ON	NKA	201	116
2897	Charlotte	Poppins	F	2001-10-19	Hamilton	ON	NKA	205	73
2901	Kate	Jenkins	F	1969-01-30	Toronto	ON	NKA	154	69
2914	Lloyd	Birkin	M	1991-08-13	Fonthill	ON	NKA	172	116
2924	Carlos	Lionel	M	1968-10-05	Timmins	ON	NKA	183	70
2925	John	McAllister	M	1984-11-13	Barrie	ON	NKA	176	102
2960	Alexandra	Holroyd	F	1969-02-28	Brantford	ON	NKA	145	62
2972	Julien	Chino	M	1960-10-03	Paris	ON	NKA	138	91
2974	Lennie	Zatara	M	1951-05-17	Ancaster	ON	NKA	183	70
2983	Bolivar	Randall	M	1957-08-17	Hamilton	ON	NKA	209	115
2986	Carmel	Espinosa	F	1972-06-02	Stoney Creek	ON	NKA	137	62
2990	Clark	Lonsdale	M	2013-10-03	Hamilton	ON	NKA	91	29
2991	Kenny	Serizawa	M	1960-07-20	Hamilton	ON	NKA	175	96
3005	Caesar	Iosefa	M	2003-08-28	Cambridge	ON	NKA	174	78
3017	Leslie	Farley	M	2017-07-03	Carisle	ON	NKA	36	8
3027	Sunny	Burrell	F	1970-01-07	Fruitland	ON	NKA	139	58
3048	Kate	Malfoy	F	2014-12-13	Hamilton	ON	NKA	76	20
3067	Blake	McGrath	F	1984-10-30	Grimsby	ON	NKA	152	70
3078	Jill	Jorkins	F	1979-05-22	Kingston	ON	NKA	175	120
3097	Joyce	Walker	F	1981-08-02	Montreal	QC	NKA	166	65
3099	Kathy	Channing	F	1984-06-19	Stoney Creek	ON	NKA	148	53
3109	Georgina	Jones	F	1952-10-08	Hamilton	ON	NKA	174	68
3119	Adelaide	Xavier	F	2006-03-17	Pickering	ON	NKA	137	53
3121	Gregory	Seldon	M	1975-02-16	Peterborough	ON	NKA	196	106
3130	Jack	Sprockett	M	1978-04-17	Grimsby	ON	NKA	213	126
3132	John	Tura	M	2002-04-03	Brockville	ON	NKA	204	77
3145	Peter	Tully	M	2009-07-13	Hamilton	ON	NKA	116	54
3146	Cal	Savage	M	1992-10-13	Hamilton	ON	NKA	181	85
3148	Vincent	Otley	M	2003-06-14	Hamilton	ON	NKA	182	88
3155	Liz	Moss	F	1993-07-22	Orillia	ON	NKA	145	60
3169	Eddie	Fowler	M	1982-02-19	Hamilton	ON	NKA	141	76
3170	Ginevra	Hufflepuff	F	1987-06-10	Hamilton	ON	NKA	147	64
3187	Frank	Owens	M	2000-10-13	Hamilton	ON	NKA	209	113
3188	Ella	Lupo	F	1963-08-19	Dundas	ON	NKA	193	86
3190	Victoria	Lindell	F	2017-10-28	Brantford	ON	NKA	52	9
3204	Harmony	Halliwell	F	1984-03-31	Hamilton	ON	NKA	153	73
3206	Maggie	Lane	F	1961-07-02	Hamilton	ON	NKA	166	112
3207	Thora	David	F	1959-05-31	Toronto	ON	NKA	163	102
3209	Brian	McEvoy	M	1990-04-27	Halifax	NS	NKA	187	107
3221	Don	Mason	M	1978-10-19	Brantford	ON	NKA	205	105
3222	Jasmine	Corinthos	F	1938-12-20	Hamilton	ON	NKA	170	104
3228	Beppe	Parrish	M	1984-10-31	North York	ON	NKA	153	78
3232	Jimmy	Anderson	M	2004-10-20	Burlington	ON	NKA	170	82
3258	Garryn	Handley	M	1977-06-21	Hamilton	ON	NKA	142	72
3282	Sam	Moss	M	1980-10-24	Hamilton	ON	NKA	156	67
3283	Casanova	Littlefield	M	1988-07-03	Peterborough	ON	NKA	151	55
3291	Vito	Fabray	M	1960-08-06	Orangeville	ON	NKA	177	123
3299	Sarah	Blake	F	1965-07-15	Caledonia	ON	NKA	154	56
3332	Maleen	Maxwell	F	1978-05-16	Red River	MB	NKA	168	60
3338	Deirdre	Rizzoli	F	1964-01-07	Hamilton	ON	NKA	160	57
3344	Leona	Lopez-Fitzgerald	F	1966-05-10	Hargersville	ON	NKA	160	97
3364	Stephen	Summers	M	1979-12-29	Hamilton	ON	NKA	164	94
3377	Al	Brownlee	M	1965-08-13	Toronto	ON	NKA	128	68
3382	Alan	Cameron	M	1999-05-20	Hamilton	ON	NKA	222	108
3383	Diane	Randall	F	1981-05-11	Hamilton	ON	NKA	184	94
3391	Charity	Tanner	F	1997-09-28	Kingston	ON	NKA	159	56
3409	Apolline	Graf	F	1956-03-11	Pickering	ON	NKA	165	80
3413	Robin	Bennet	F	1992-03-11	Tyndale	ON	NKA	143	78
3417	Simon	Heriot	M	1972-05-26	Hamilton	ON	NKA	181	83
3424	Jack	Stone	M	1989-05-23	Ancaster	ON	NKA	202	118
3427	Tulio	Hastings	M	1949-02-19	Ottawa	ON	NKA	176	76
3441	Justin	Tsuna	M	2005-01-22	Toronto	ON	NKA	150	69
3457	Samantha	Troi	F	1980-09-30	Grimsby	ON	NKA	139	54
3459	Claudette	Magliozzi	F	2011-10-21	Hamilton	ON	NKA	97	26
3465	Alpa	Ramsey	M	1986-08-28	Hamilton	ON	NKA	204	110
3467	Lola	Languish	F	1973-06-09	Hamilton	ON	NKA	164	52
3486	Misty	Stenbeck	F	2004-07-07	Hamilton	ON	NKA	174	55
3492	Jamie	Riley	M	1974-08-23	Hamilton	ON	NKA	139	65
3502	Violet	Victoria	F	1979-04-02	Thunder Bay	ON	NKA	157	61
3512	Cal	Powers	M	2004-10-21	Hamilton	ON	NKA	175	79
3527	David	Hoare	M	1965-10-09	Waterford	ON	NKA	158	70
3545	Kurt	Zapatti	M	1967-01-25	Dundas	ON	NKA	191	110
3553	Harris	Macdonald	M	1987-05-16	Hamilton	ON	NKA	182	105
3579	Ashley	Blake	F	1974-07-27	Stoney Creek	ON	NKA	190	102
3590	Paul	Battersby	M	1954-01-09	Hamilton	ON	NKA	159	84
3604	Todd	Tankinson	M	1958-06-21	Hamilton	ON	NKA	191	103
3606	Sandra	Roberts	F	1991-03-10	Paris	ON	NKA	175	104
3648	Bryan	Burdock	M	2010-05-05	Hamilton	ON	NKA	123	46
3654	Polly	Billa	F	1972-10-11	Hamilton	ON	NKA	183	114
3655	Avon	Prentiss	M	2011-01-28	Hamilton	ON	NKA	110	49
3689	William	Buzzard	M	2015-03-17	Milton	ON	NKA	72	21
3697	Georgina	Urameshi	F	1989-01-10	Calgary	ON	NKA	171	96
3701	Gwen	Wyms	F	1984-07-06	Montreal	QC	NKA	148	79
3705	Teddy	Withers	M	1949-11-08	Hamilton	ON	NKA	151	62
3707	Jack	Garrett	M	1959-06-08	Hamilton	ON	NKA	198	115
3723	Billie	Peroni	F	1964-09-28	Hamilton	ON	NKA	146	67
3725	Baba	Cartwright	F	1984-05-07	Dunton	ON	NKA	164	88
3734	Deanna	Spellman	F	1982-06-29	Simcoe	ON	NKA	157	100
3735	Frank	Kirby	M	1983-09-07	Toronto	ON	NKA	159	89
3741	Lisa	Wanawake	F	1975-06-26	Hamilton	ON	NKA	170	59
3763	Alex	Lovelace	F	2011-06-23	Hamilton	ON	NKA	110	30
3764	Tony	Ramsey	M	1969-05-23	Sarnia	ON	NKA	170	85
3769	Reva	Raziel	F	1989-10-10	Cambridge	ON	NKA	161	66
3800	Quinn	Barr	F	1993-12-25	Walnut Grove	AB	NKA	171	64
3816	Art	Castang	M	1977-08-30	Hamilton	ON	NKA	180	62
3817	Liz	Riviera	F	1997-04-23	Hamilton	ON	NKA	133	49
3820	Dale	Vercetti	M	2009-08-11	Hamilton	ON	NKA	114	49
3829	Alecto	Lambert	F	1955-11-26	Hamilton	ON	NKA	171	99
3834	Paige	Stone	F	2013-08-03	Burlington	ON	NKA	76	22
3844	Tony	Appleton	M	1992-03-20	Carlisle	ON	NKA	150	60
3853	Dilys	Lee	F	1963-07-11	Hamilton	ON	NKA	184	110
3865	Davina	MacLean	F	1989-07-19	Brantford	ON	NKA	151	103
3880	Monica	McGrath	F	2000-04-22	Grimsby	ON	NKA	161	61
3901	Eric	Cropper	M	1955-03-09	Hamilton	ON	NKA	148	62
3910	Jimmy	Khan	M	2012-04-08	Paris	ON	NKA	78	35
3915	Rex	Glicker	M	2003-01-02	St. Catharines	ON	NKA	184	77
3939	Dodo	Green	F	1967-11-09	Carisle	ON	NKA	150	44
3942	Alex	Hankle	M	1995-09-23	Kingston	ON	NKA	181	93
3950	Kanuka	Nightshade	F	1956-05-12	Paris	ON	NKA	146	64
3956	Jack	Halliwell	M	1980-08-23	Hamilton	ON	NKA	173	62
3970	Kakihara	Holden	M	2008-07-18	Hamilton	ON	NKA	135	54
3973	Bobby	Nanny	M	1990-05-06	Burlington	ON	NKA	158	82
3990	Helena	Stillman	F	1979-10-02	Hamilton	ON	NKA	141	63
3998	Sam	Travis	M	1953-07-05	Hamilton	ON	NKA	183	79
4005	Arnold	Hutt	M	1969-02-28	Toronto	ON	NKA	206	111
4006	Roman	Barksdale	M	1950-05-15	Dunton	ON	NKA	139	67
4014	Morgan	Sullivan	M	2013-08-16	Hamilton	ON	NKA	77	27
4032	Lilly	Grissom	F	2015-05-28	Hamilton	ON	NKA	57	14
4038	Lex	Brockman	M	1978-08-11	Burlington	ON	NKA	194	109
4041	Basil	Nona	M	1979-05-20	Toronto	ON	NKA	172	124
4043	Karen	Weber	F	2016-12-23	Hamilton	ON	NKA	37	6
4048	Alexandra	Spica	F	1986-12-14	Hamilton	ON	NKA	173	103
4065	Anthony	Corbie	M	1957-07-26	Hamilton	ON	NKA	194	108
4086	Grant	Indelicato	M	1981-09-03	Hamilton	ON	NKA	166	82
4090	Dotty	Parker	F	1980-07-22	Red River	MB	NKA	149	84
4099	Kelly	Rook	F	2017-05-14	Milton	ON	NKA	41	6
4105	Beatrice	Blackwood	F	1974-07-16	Toronto	ON	NKA	167	88
4106	Billie	de Passe	F	1983-10-28	Whitby	ON	NKA	154	117
4129	Angua	Standish	F	1951-11-30	Hamilton	ON	NKA	164	89
4132	Bobby	Kendall	M	1966-10-06	Hamilton	ON	NKA	180	111
4139	Stephen	Moreland	M	1977-07-25	Hamilton	ON	NKA	189	109
4151	Sam	Brockman	M	1994-08-08	Burlington	ON	NKA	142	92
4152	Trinity	Russo	F	1976-02-19	Hamilton	ON	NKA	143	73
4161	Carlos	Urth	M	1971-03-20	Orillia	ON	NKA	147	70
4168	Linda	Ozaki	F	1978-04-22	Fruitland	ON	NKA	176	97
4185	Angela	Rabbit	F	1966-06-07	Burlington	ON	NKA	168	102
4210	Billie	Ladderbanks	F	1959-08-07	Paris	ON	NKA	169	61
4212	Mendy	Platter	M	2003-03-26	Hamilton	ON	NKA	195	82
4221	Christopher	Weber	M	1949-06-23	Toronto	ON	NKA	156	83
4231	Myra	Abbott	F	1993-08-31	Hamilton	ON	NKA	167	89
4232	Jay	Parker	M	1962-03-15	Burlington	ON	NKA	137	68
4239	Jen	Poirot	F	1994-01-05	Kingston	ON	NKA	151	71
4244	Mark	Jonas	M	1987-07-21	Ancaster	ON	NKA	212	116
4245	Elvis	Taylor	M	1991-10-08	Toronto	ON	NKA	132	78
4258	Martha	Cooper	F	1979-08-27	Burlington	ON	NKA	173	92
4261	Angelina	Wu	F	1978-05-24	Hamilton	ON	NKA	172	50
4266	Jeff	Von Doom	M	1994-07-04	Sarnia	ON	NKA	189	114
4288	Stefano	Alvin	M	1981-01-23	Hamilton	ON	NKA	177	112
4290	Enrique	ORourke	M	1976-04-30	Hamilton	ON	NKA	194	94
4293	Johnny	Juntao	M	1991-12-31	Ancaster	ON	NKA	208	106
4300	Agnes	Starsmore	F	1955-06-16	Windsor	ON	NKA	162	78
4308	Eddie	Snyder	M	1993-09-02	Hamilton	ON	NKA	147	85
4313	William	Vinopan	M	1962-10-03	Paris	ON	NKA	192	120
4316	Blanche	Mannheim	F	1949-12-09	Hamilton	ON	NKA	147	52
4319	Steve	Vecchio	M	2011-07-15	Hamilton	ON	NKA	109	47
4321	Langdale	Marino	M	1952-10-11	Stoney Creek	ON	NKA	138	75
4323	Andy	Yurinov	M	1965-06-09	Walnut Grove	AB	NKA	204	110
4324	Gwen	Lewis	F	1983-10-13	Ancaster	ON	NKA	177	92
4325	Robert	Flinstone	M	1967-07-02	Hamilton	ON	NKA	206	136
4327	Michael	Sprockett	M	1966-05-31	Simcoe	ON	NKA	204	112
4329	Ellen	Chandler	F	1977-09-25	Beamsville	ON	NKA	167	45
4333	Avon	Indelicato	M	2006-12-15	Hamilton	ON	NKA	152	59
4342	Laura	Knott	F	1985-04-06	Paris	ON	NKA	142	49
4347	Frederick	Sugden	M	2016-11-21	Burlington	ON	NKA	49	12
4367	Melody	Wilson	F	2004-06-27	Brantford	ON	NKA	172	63
4379	Alan	Loeb	M	1984-05-13	Burlington	ON	NKA	170	80
4380	Doyle	Stockmann	M	1993-07-05	Stoney Creek	ON	NKA	168	87
4381	Francis	Morrow	M	2005-03-13	Hamilton	ON	NKA	178	64
4397	Sam	Jackson	M	1953-04-15	Hamilton	ON	NKA	169	71
4408	Ted	Hecatonchires	M	1956-10-18	Toronto	ON	NKA	144	88
4412	Melanie	Atwater	F	1961-07-13	Montreal	QC	NKA	164	52
4413	Stanley	Willows	M	2007-01-24	Dunton	ON	NKA	133	56
4428	Saito	Henderson	M	1984-09-01	Hamilton	ON	NKA	182	114
4431	Holly	McPherson	F	1956-09-17	Hamilton	ON	NKA	159	64
4434	George	Garrison	M	1950-08-25	St. Catharines	ON	NKA	192	103
4443	John	Corsi	M	1982-04-10	Windsor	ON	NKA	192	118
4452	Norma	Steel-Stuart	F	1997-04-29	London	ON	NKA	177	110
4465	Isobel	Winslow	F	1955-06-05	Dundas	ON	NKA	182	100
4467	Doris	Mercer	F	2011-03-11	Stoney Creek	ON	NKA	111	24
4469	Glorietta	Gribble	F	1968-12-15	Hamilton	ON	NKA	167	66
4486	Paul	Bloom-Wood	M	1984-01-25	Beamsville	ON	NKA	129	74
4488	Hank	Hill	M	1953-04-14	Hamilton	ON	NKA	143	69
4491	Polly	Johnson	F	1973-10-16	Ottawa	ON	NKA	146	65
4496	Frank	Lassiter	M	1986-12-04	Hamilton	ON	NKA	170	66
4504	Sukie	Tennison	F	2005-11-07	Hamilton	ON	NKA	157	50
4505	Jenny	Farrell	F	1959-04-15	Hamilton	ON	NKA	164	96
4506	Ray	Morgan	M	1991-09-27	Victoria	BC	NKA	127	85
4517	Bo	Darby	M	1961-09-24	Toronto	ON	NKA	179	120
4522	Charlie	Neutron	M	1964-12-09	Paris	ON	NKA	199	116
\.


--
-- Data for Name: province_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.province_names (province_id, province_name) FROM stdin;
AB	Alberta
BC	British Columbia
MB	Manitoba
NB	New Brunswick
NL	Newfoundland and Labrador
NT	Northwest Territories
NS	Nova Scotia
NU	Nunavut
ON	Ontario
PE	Prince Edward Island
QC	Quebec
SK	Saskatchewan
YT	Yukon
\.


--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 1, false);


--
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 1, false);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: admissions pk_admissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT pk_admissions PRIMARY KEY (patient_id, admission_date);


--
-- Name: province_names province_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province_names
    ADD CONSTRAINT province_names_pkey PRIMARY KEY (province_id);


--
-- Name: admissions admissions_attending_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_attending_doctor_id_fkey FOREIGN KEY (attending_doctor_id) REFERENCES public.doctors(doctor_id);


--
-- Name: admissions admissions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- Name: patients patients_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province_names(province_id);


--
-- PostgreSQL database dump complete
--

\unrestrict dAh0QbyTrXY0pllcOFcXD3qDiQpt9CBvwfP1ARnQ06BcQjPANaWlTmXRQtsOlOc

