--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11
-- Dumped by pg_dump version 13.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    brand character varying(100) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_brand_id_seq OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    car_id integer NOT NULL,
    model_id smallint NOT NULL,
    drive_id smallint NOT NULL,
    price bigint NOT NULL,
    mileage integer NOT NULL,
    vehicle_year smallint NOT NULL,
    color_id smallint NOT NULL,
    engine_id bigint NOT NULL
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: car_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_car_id_seq OWNER TO postgres;

--
-- Name: car_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_car_id_seq OWNED BY public.car.car_id;


--
-- Name: car_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_order (
    order_id bigint NOT NULL,
    status_id smallint NOT NULL,
    order_date date NOT NULL,
    car_id integer NOT NULL,
    client_id integer NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE public.car_order OWNER TO postgres;

--
-- Name: car_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_order_order_id_seq OWNER TO postgres;

--
-- Name: car_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_order_order_id_seq OWNED BY public.car_order.order_id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    passport bigint NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_client_id_seq OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    color_id integer NOT NULL,
    color character varying(50) NOT NULL
);


ALTER TABLE public.color OWNER TO postgres;

--
-- Name: color_color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.color_color_id_seq OWNER TO postgres;

--
-- Name: color_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_color_id_seq OWNED BY public.color.color_id;


--
-- Name: contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract (
    contract_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- Name: contract_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_contract_id_seq OWNER TO postgres;

--
-- Name: contract_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_contract_id_seq OWNED BY public.contract.contract_id;


--
-- Name: drive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drive (
    drive_id smallint NOT NULL,
    drive_type character varying(50) NOT NULL
);


ALTER TABLE public.drive OWNER TO postgres;

--
-- Name: drive_drive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drive_drive_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drive_drive_id_seq OWNER TO postgres;

--
-- Name: drive_drive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drive_drive_id_seq OWNED BY public.drive.drive_id;


--
-- Name: engine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.engine (
    engine_id bigint NOT NULL,
    engine_power bigint NOT NULL,
    engine_capacity real,
    battery_capacity integer,
    engine_type_id smallint NOT NULL
);


ALTER TABLE public.engine OWNER TO postgres;

--
-- Name: engine_engine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.engine_engine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.engine_engine_id_seq OWNER TO postgres;

--
-- Name: engine_engine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.engine_engine_id_seq OWNED BY public.engine.engine_id;


--
-- Name: engine_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.engine_type (
    engine_type_id smallint NOT NULL,
    engine_type character varying(20) NOT NULL
);


ALTER TABLE public.engine_type OWNER TO postgres;

--
-- Name: engine_type_engine_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.engine_type_engine_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.engine_type_engine_type_id_seq OWNER TO postgres;

--
-- Name: engine_type_engine_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.engine_type_engine_type_id_seq OWNED BY public.engine_type.engine_type_id;


--
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    model_id integer NOT NULL,
    brand_id integer NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- Name: model_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_model_id_seq OWNER TO postgres;

--
-- Name: model_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_model_id_seq OWNED BY public.model.model_id;


--
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    status_id smallint NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- Name: order_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_status_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_status_id_seq OWNER TO postgres;

--
-- Name: order_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_status_id_seq OWNED BY public.order_status.status_id;


--
-- Name: seller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seller (
    seller_id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    number_sold_cars smallint
);


ALTER TABLE public.seller OWNER TO postgres;

--
-- Name: seller_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seller_seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seller_seller_id_seq OWNER TO postgres;

--
-- Name: seller_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seller_seller_id_seq OWNED BY public.seller.seller_id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id bigint NOT NULL,
    email character varying(100) NOT NULL,
    country character varying(50) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_supplier_id_seq OWNER TO postgres;

--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;


--
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- Name: car car_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN car_id SET DEFAULT nextval('public.car_car_id_seq'::regclass);


--
-- Name: car_order order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order ALTER COLUMN order_id SET DEFAULT nextval('public.car_order_order_id_seq'::regclass);


--
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- Name: color color_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color ALTER COLUMN color_id SET DEFAULT nextval('public.color_color_id_seq'::regclass);


--
-- Name: contract contract_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_id_seq'::regclass);


--
-- Name: drive drive_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drive ALTER COLUMN drive_id SET DEFAULT nextval('public.drive_drive_id_seq'::regclass);


--
-- Name: engine engine_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine ALTER COLUMN engine_id SET DEFAULT nextval('public.engine_engine_id_seq'::regclass);


--
-- Name: engine_type engine_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine_type ALTER COLUMN engine_type_id SET DEFAULT nextval('public.engine_type_engine_type_id_seq'::regclass);


--
-- Name: model model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN model_id SET DEFAULT nextval('public.model_model_id_seq'::regclass);


--
-- Name: order_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status ALTER COLUMN status_id SET DEFAULT nextval('public.order_status_status_id_seq'::regclass);


--
-- Name: seller seller_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller ALTER COLUMN seller_id SET DEFAULT nextval('public.seller_seller_id_seq'::regclass);


--
-- Name: supplier supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (brand_id, brand) FROM stdin;
1	Bugatti
2	Nissan
3	Xiaomi
4	Mercedes-Benz
5	Lamborghini
\.


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (car_id, model_id, drive_id, price, mileage, vehicle_year, color_id, engine_id) FROM stdin;
1	1	1	400000000	1	2021	2	1
2	2	1	985000000	700	2021	4	1
3	3	2	1250000	126300	2012	3	2
4	4	1	14500000	1800	2017	1	3
5	5	1	6250000	55	2024	5	4
6	6	1	18690000	10	2024	4	5
7	7	3	40900000	0	2024	1	6
\.


--
-- Data for Name: car_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_order (order_id, status_id, order_date, car_id, client_id, supplier_id) FROM stdin;
1	1	2024-10-01	1	1	1
2	2	2021-01-05	2	4	2
3	3	2024-10-05	3	7	3
4	2	2024-10-22	4	14	4
5	1	2022-10-05	5	13	5
6	2	2024-10-24	6	15	5
7	3	2024-10-23	7	3	4
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, firstname, surname, patronymic, passport) FROM stdin;
2	Александр	Васильев	Станиславович	6324548740
3	Даниил	Волков	Андреевич	6324733970
4	Валерия	Воробей	Глебовна	6324890496
5	Егор	Гасилин	Денисович	6324275675
6	Ольга	Довбуш	Александровна	6324602322
7	Леонид	Егоров	Александрович	6324601436
8	Николай	Заковряшин	Михайлович	6324587891
9	Эдуард	Исаков	Вячеславович	6324156944
10	Александр	Калмыков	Михайлович	6324057936
11	Софья	Капитонова	Романовна	6324458970
12	Арина	Карева	Александровна	6324262081
13	Владислав	Кликушин	Игоревич	6324738250
16	Дмитрий	Орехов	Сергеевич	6324258070
17	Александр	Основин	Игоревич	6324517967
18	Кирилл	Павлов	Сергеевич	6324691698
19	Александра	Преснякова	Владимировна	6324141182
20	Юлия	Рапопорт	Юрьевна	6324321841
21	Владимир	Расщепкин	Антонович	6324880154
22	Егор	Ромашов	Алексеевич	6324768917
23	Илья	Рудиков	Михайлович	6324643746
24	Тимур	Сариков	Аслиддинович	6324113058
25	Илья	Серебренников	Константинович	6324133236
26	Павел	Суховилов	Павлович	6324511815
27	Тимур	Шарибов	Рамазанович	6324438243
28	Павел	Яковлев	Андреевич	6324690550
29	Леонид	Яськов	Владимирович	6324866341
30	Данила	Яшин	Олегович	6324060179
15	Данил	Корольков	Игоревич	6324579623
14	Александр	Коротков	Дмитриевич	6324929817
1	Александр	Арефьев	Михайлович	1234567890
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (color_id, color) FROM stdin;
1	Оранжевый
2	Синий
3	Белый
4	Чёрный
5	Голубой
\.


--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract (contract_id, seller_id, order_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
\.


--
-- Data for Name: drive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drive (drive_id, drive_type) FROM stdin;
1	Полный
2	Передний
3	Задний
\.


--
-- Data for Name: engine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.engine (engine_id, engine_power, engine_capacity, battery_capacity, engine_type_id) FROM stdin;
1	1500	8	\N	1
2	117	1.6	\N	1
3	555	3.8	\N	1
4	673	\N	495	3
5	367	3	\N	2
6	640	5.2	\N	1
\.


--
-- Data for Name: engine_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.engine_type (engine_type_id, engine_type) FROM stdin;
1	Бензин
2	Дизель
3	Электро
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model (model_id, brand_id, model) FROM stdin;
1	1	Chiron
2	1	Divo
3	2	Juke
4	2	GT-R
5	3	SU7
6	4	GLS 450
7	5	Huracan Tecnica
\.


--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status (status_id, status) FROM stdin;
1	Ожидается
2	Отправлен
3	Доставлен
\.


--
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seller (seller_id, firstname, surname, patronymic, phone_number, email, number_sold_cars) FROM stdin;
1	Людмила	Скворцова	Анатольевна	+79152893255	skvortsova@mirea.ru	\N
2	Александр	Филатов	Сергеевич	+79261234568	filatov_a@mirea.ru	\N
3	Михаил	Рысин	Леонидович	+79361234569	rysin@mirea.ru	\N
4	Марина	Туманова	Борисовна	+79161236879	tumanova@mirea.ru	\N
5	Ирина	Куликова	Викторовна	+79161236015	kulikova_irv@mirea.ru	\N
6	Иван	Зайцев	Юрьевич	+79163245643	zajcev_i@mirea.ru	\N
7	Галина	Богомольная	Владимировна	+79163241010	bogomolnaya@mirea.ru	\N
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, email, country) FROM stdin;
1	akatev@mirea.ru	Россия
2	zheleznyak@mirea.ru	Египет
3	sorokin_a@mirea.ru	Индия
4	dzerzhinskij@mirea.ru	Россия
5	puturidze@mirea.ru	Грузия
\.


--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 5, true);


--
-- Name: car_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_car_id_seq', 7, true);


--
-- Name: car_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_order_order_id_seq', 7, true);


--
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 30, true);


--
-- Name: color_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_color_id_seq', 5, true);


--
-- Name: contract_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_contract_id_seq', 7, true);


--
-- Name: drive_drive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drive_drive_id_seq', 3, true);


--
-- Name: engine_engine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.engine_engine_id_seq', 6, true);


--
-- Name: engine_type_engine_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.engine_type_engine_type_id_seq', 3, true);


--
-- Name: model_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_model_id_seq', 7, true);


--
-- Name: order_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_status_id_seq', 3, true);


--
-- Name: seller_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seller_seller_id_seq', 7, true);


--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 5, true);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- Name: car_order car_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_pkey PRIMARY KEY (order_id);


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_id);


--
-- Name: client client_passport_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_passport_key UNIQUE (passport);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: color color_color_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_color_key UNIQUE (color);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (color_id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);


--
-- Name: drive drive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drive
    ADD CONSTRAINT drive_pkey PRIMARY KEY (drive_id);


--
-- Name: engine engine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_pkey PRIMARY KEY (engine_id);


--
-- Name: engine_type engine_type_engine_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine_type
    ADD CONSTRAINT engine_type_engine_type_key UNIQUE (engine_type);


--
-- Name: engine_type engine_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine_type
    ADD CONSTRAINT engine_type_pkey PRIMARY KEY (engine_type_id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (model_id);


--
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (status_id);


--
-- Name: seller seller_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_email_key UNIQUE (email);


--
-- Name: seller seller_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_phone_number_key UNIQUE (phone_number);


--
-- Name: seller seller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (seller_id);


--
-- Name: supplier supplier_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_email_key UNIQUE (email);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- Name: car car_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id) ON DELETE CASCADE;


--
-- Name: car car_drive_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_drive_id_fkey FOREIGN KEY (drive_id) REFERENCES public.drive(drive_id) ON DELETE CASCADE;


--
-- Name: car car_engine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_engine_id_fkey FOREIGN KEY (engine_id) REFERENCES public.engine(engine_id) ON DELETE CASCADE;


--
-- Name: car car_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.model(model_id) ON DELETE CASCADE;


--
-- Name: car_order car_order_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(car_id) ON DELETE CASCADE;


--
-- Name: car_order car_order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON DELETE CASCADE;


--
-- Name: car_order car_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.order_status(status_id) ON DELETE CASCADE;


--
-- Name: car_order car_order_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_order
    ADD CONSTRAINT car_order_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id) ON DELETE CASCADE;


--
-- Name: contract contract_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.car_order(order_id) ON DELETE CASCADE;


--
-- Name: contract contract_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.seller(seller_id) ON DELETE CASCADE;


--
-- Name: engine engine_engine_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_engine_type_id_fkey FOREIGN KEY (engine_type_id) REFERENCES public.engine_type(engine_type_id) ON DELETE CASCADE;


--
-- Name: model model_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

