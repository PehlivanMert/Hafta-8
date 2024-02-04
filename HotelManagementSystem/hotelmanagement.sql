toc.dat                                                                                             0000600 0004000 0002000 00000024324 14557775000 0014456 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP        8                |            HotelManagementSystemDatabase    16.1    16.1 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    41336    HotelManagementSystemDatabase    DATABASE     �   CREATE DATABASE "HotelManagementSystemDatabase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
 /   DROP DATABASE "HotelManagementSystemDatabase";
                postgres    false         �            1259    41346    hotel    TABLE     �  CREATE TABLE public.hotel (
    hotel_id bigint NOT NULL,
    hotel_name text NOT NULL,
    hotel_address text NOT NULL,
    hotel_mail text NOT NULL,
    hotel_phone text NOT NULL,
    hotel_star text NOT NULL,
    hotel_carpark boolean NOT NULL,
    hotel_wifi boolean NOT NULL,
    hotel_pool boolean NOT NULL,
    hotel_fitness boolean NOT NULL,
    hotel_concierge boolean NOT NULL,
    hotel_spa boolean NOT NULL,
    hotel_roomservice boolean NOT NULL
);
    DROP TABLE public.hotel;
       public         heap    postgres    false         �            1259    41345    Hotel_hotel_id_seq    SEQUENCE     �   ALTER TABLE public.hotel ALTER COLUMN hotel_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Hotel_hotel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218         �            1259    41359    pension    TABLE     ~   CREATE TABLE public.pension (
    pension_id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    pension_type text NOT NULL
);
    DROP TABLE public.pension;
       public         heap    postgres    false         �            1259    41362    pension_pension_id_seq    SEQUENCE     �   ALTER TABLE public.pension ALTER COLUMN pension_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pension_pension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221         �            1259    41391    reservation    TABLE     s  CREATE TABLE public.reservation (
    reservation_id bigint NOT NULL,
    room_id bigint NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    total_price double precision NOT NULL,
    guest_count bigint NOT NULL,
    guest_name text NOT NULL,
    guest_citizen_id text NOT NULL,
    guest_mail text NOT NULL,
    guest_phone text NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false         �            1259    41390    reservation_reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN reservation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226         �            1259    41371    room    TABLE     �  CREATE TABLE public.room (
    room_id bigint NOT NULL,
    hotel_name text NOT NULL,
    pension_type text NOT NULL,
    room_type text NOT NULL,
    stock bigint NOT NULL,
    adult_price double precision NOT NULL,
    child_price double precision NOT NULL,
    bed_capacity bigint NOT NULL,
    square_meter text NOT NULL,
    tv boolean NOT NULL,
    minibar boolean NOT NULL,
    konsol boolean NOT NULL,
    kasa boolean NOT NULL,
    projeksiyon boolean NOT NULL,
    hotel_id bigint NOT NULL
);
    DROP TABLE public.room;
       public         heap    postgres    false         �            1259    41370    room_room_id_seq    SEQUENCE     �   ALTER TABLE public.room ALTER COLUMN room_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.room_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224         �            1259    41354    season    TABLE     �   CREATE TABLE public.season (
    season_id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    baslangic date NOT NULL,
    bitis date NOT NULL
);
    DROP TABLE public.season;
       public         heap    postgres    false         �            1259    41353    season_season_id_seq    SEQUENCE     �   ALTER TABLE public.season ALTER COLUMN season_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.season_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220         �            1259    41338    user    TABLE     �   CREATE TABLE public."user" (
    user_id bigint NOT NULL,
    user_name text NOT NULL,
    user_pass text NOT NULL,
    user_role text NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false         �            1259    41337    user_user_id_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216                   0    41346    hotel 
   TABLE DATA           �   COPY public.hotel (hotel_id, hotel_name, hotel_address, hotel_mail, hotel_phone, hotel_star, hotel_carpark, hotel_wifi, hotel_pool, hotel_fitness, hotel_concierge, hotel_spa, hotel_roomservice) FROM stdin;
    public          postgres    false    218       4871.dat 
          0    41359    pension 
   TABLE DATA           E   COPY public.pension (pension_id, hotel_id, pension_type) FROM stdin;
    public          postgres    false    221       4874.dat           0    41391    reservation 
   TABLE DATA           �   COPY public.reservation (reservation_id, room_id, check_in_date, check_out_date, total_price, guest_count, guest_name, guest_citizen_id, guest_mail, guest_phone) FROM stdin;
    public          postgres    false    226       4879.dat           0    41371    room 
   TABLE DATA           �   COPY public.room (room_id, hotel_name, pension_type, room_type, stock, adult_price, child_price, bed_capacity, square_meter, tv, minibar, konsol, kasa, projeksiyon, hotel_id) FROM stdin;
    public          postgres    false    224       4877.dat 	          0    41354    season 
   TABLE DATA           G   COPY public.season (season_id, hotel_id, baslangic, bitis) FROM stdin;
    public          postgres    false    220       4873.dat           0    41338    user 
   TABLE DATA           J   COPY public."user" (user_id, user_name, user_pass, user_role) FROM stdin;
    public          postgres    false    216       4869.dat            0    0    Hotel_hotel_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Hotel_hotel_id_seq"', 5, true);
          public          postgres    false    217                    0    0    pension_pension_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pension_pension_id_seq', 6, true);
          public          postgres    false    222                    0    0    reservation_reservation_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.reservation_reservation_id_seq', 2, true);
          public          postgres    false    225                    0    0    room_room_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_room_id_seq', 10, true);
          public          postgres    false    223                    0    0    season_season_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.season_season_id_seq', 6, true);
          public          postgres    false    219                    0    0    user_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_user_id_seq', 14, true);
          public          postgres    false    215         l           2606    41352    hotel Hotel_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT "Hotel_pkey" PRIMARY KEY (hotel_id);
 <   ALTER TABLE ONLY public.hotel DROP CONSTRAINT "Hotel_pkey";
       public            postgres    false    218         p           2606    41369    pension pension_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pension
    ADD CONSTRAINT pension_pkey PRIMARY KEY (pension_id);
 >   ALTER TABLE ONLY public.pension DROP CONSTRAINT pension_pkey;
       public            postgres    false    221         t           2606    41397    reservation reservation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    226         r           2606    41377    room room_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgres    false    224         n           2606    41358    season season_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_pkey PRIMARY KEY (season_id);
 <   ALTER TABLE ONLY public.season DROP CONSTRAINT season_pkey;
       public            postgres    false    220         j           2606    41344    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    216                                                                                                                                                                                                                                                                                                                    4871.dat                                                                                            0000600 0004000 0002000 00000000302 14557775000 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hapimag	Bodrum	hapimag@hapimag.com	Bodrum	*****	t	t	t	t	t	t	t
2	Hilton	İstanbul	hilton@hilton.com	İstanbul	*****	t	t	t	t	t	t	t
5	Rixos	İzmir	rixos@rixos.com	İzmir	*****	t	t	t	t	t	t	t
\.


                                                                                                                                                                                                                                                                                                                              4874.dat                                                                                            0000600 0004000 0002000 00000000171 14557775000 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Yarım Pansiyon
2	1	Herşey Dahil
3	1	Ultra Herşey Dahil
5	2	Herşey Dahil
4	2	Oda Kahvaltı
6	5	Oda Kahvaltı
\.


                                                                                                                                                                                                                                                                                                                                                                                                       4879.dat                                                                                            0000600 0004000 0002000 00000000111 14557775000 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	2024-01-12	2024-01-15	8500	2	Mert	2545845	ddd@gmail.com	5142586
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                       4877.dat                                                                                            0000600 0004000 0002000 00000000447 14557775000 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hapimag	Yarım Pansiyon	Çift Kişilik Oda	25	2500	1500	2	25	t	t	f	t	f	1
2	Hapimag	Herşey Dahil	Tek Kişilik Oda	12	1850	1000	1	15	t	t	t	t	f	1
3	Hilton	Oda Kahvaltı	Çift Kişilik Oda	21	3750	2500	2	30	t	t	t	t	f	2
4	Hilton	Herşey Dahil	Çift Kişilik Oda	12	5000	3750	2	30	t	t	t	t	t	2
\.


                                                                                                                                                                                                                         4873.dat                                                                                            0000600 0004000 0002000 00000000207 14557775000 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	2024-01-01	2024-05-31
2	2	2024-01-01	2024-05-31
3	2	2024-06-01	2024-12-31
4	1	2024-06-01	2024-12-31
6	5	2024-01-01	2024-12-31
\.


                                                                                                                                                                                                                                                                                                                                                                                         4869.dat                                                                                            0000600 0004000 0002000 00000000061 14557775000 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	employee	1234	Employee
1	admin	1234	Admin
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000023250 14557775000 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP DATABASE "HotelManagementSystemDatabase";
--
-- Name: HotelManagementSystemDatabase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "HotelManagementSystemDatabase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "HotelManagementSystemDatabase" OWNER TO postgres;

\connect "HotelManagementSystemDatabase"

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
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    hotel_id bigint NOT NULL,
    hotel_name text NOT NULL,
    hotel_address text NOT NULL,
    hotel_mail text NOT NULL,
    hotel_phone text NOT NULL,
    hotel_star text NOT NULL,
    hotel_carpark boolean NOT NULL,
    hotel_wifi boolean NOT NULL,
    hotel_pool boolean NOT NULL,
    hotel_fitness boolean NOT NULL,
    hotel_concierge boolean NOT NULL,
    hotel_spa boolean NOT NULL,
    hotel_roomservice boolean NOT NULL
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: Hotel_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.hotel ALTER COLUMN hotel_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Hotel_hotel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pension (
    pension_id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    pension_type text NOT NULL
);


ALTER TABLE public.pension OWNER TO postgres;

--
-- Name: pension_pension_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pension ALTER COLUMN pension_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pension_pension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    reservation_id bigint NOT NULL,
    room_id bigint NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    total_price double precision NOT NULL,
    guest_count bigint NOT NULL,
    guest_name text NOT NULL,
    guest_citizen_id text NOT NULL,
    guest_mail text NOT NULL,
    guest_phone text NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reservation ALTER COLUMN reservation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    room_id bigint NOT NULL,
    hotel_name text NOT NULL,
    pension_type text NOT NULL,
    room_type text NOT NULL,
    stock bigint NOT NULL,
    adult_price double precision NOT NULL,
    child_price double precision NOT NULL,
    bed_capacity bigint NOT NULL,
    square_meter text NOT NULL,
    tv boolean NOT NULL,
    minibar boolean NOT NULL,
    konsol boolean NOT NULL,
    kasa boolean NOT NULL,
    projeksiyon boolean NOT NULL,
    hotel_id bigint NOT NULL
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.room ALTER COLUMN room_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.room_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.season (
    season_id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    baslangic date NOT NULL,
    bitis date NOT NULL
);


ALTER TABLE public.season OWNER TO postgres;

--
-- Name: season_season_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.season ALTER COLUMN season_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.season_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id bigint NOT NULL,
    user_name text NOT NULL,
    user_pass text NOT NULL,
    user_role text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (hotel_id, hotel_name, hotel_address, hotel_mail, hotel_phone, hotel_star, hotel_carpark, hotel_wifi, hotel_pool, hotel_fitness, hotel_concierge, hotel_spa, hotel_roomservice) FROM stdin;
\.
COPY public.hotel (hotel_id, hotel_name, hotel_address, hotel_mail, hotel_phone, hotel_star, hotel_carpark, hotel_wifi, hotel_pool, hotel_fitness, hotel_concierge, hotel_spa, hotel_roomservice) FROM '$$PATH$$/4871.dat';

--
-- Data for Name: pension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pension (pension_id, hotel_id, pension_type) FROM stdin;
\.
COPY public.pension (pension_id, hotel_id, pension_type) FROM '$$PATH$$/4874.dat';

--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (reservation_id, room_id, check_in_date, check_out_date, total_price, guest_count, guest_name, guest_citizen_id, guest_mail, guest_phone) FROM stdin;
\.
COPY public.reservation (reservation_id, room_id, check_in_date, check_out_date, total_price, guest_count, guest_name, guest_citizen_id, guest_mail, guest_phone) FROM '$$PATH$$/4879.dat';

--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (room_id, hotel_name, pension_type, room_type, stock, adult_price, child_price, bed_capacity, square_meter, tv, minibar, konsol, kasa, projeksiyon, hotel_id) FROM stdin;
\.
COPY public.room (room_id, hotel_name, pension_type, room_type, stock, adult_price, child_price, bed_capacity, square_meter, tv, minibar, konsol, kasa, projeksiyon, hotel_id) FROM '$$PATH$$/4877.dat';

--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.season (season_id, hotel_id, baslangic, bitis) FROM stdin;
\.
COPY public.season (season_id, hotel_id, baslangic, bitis) FROM '$$PATH$$/4873.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, user_name, user_pass, user_role) FROM stdin;
\.
COPY public."user" (user_id, user_name, user_pass, user_role) FROM '$$PATH$$/4869.dat';

--
-- Name: Hotel_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Hotel_hotel_id_seq"', 5, true);


--
-- Name: pension_pension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pension_pension_id_seq', 6, true);


--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_reservation_id_seq', 2, true);


--
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_room_id_seq', 10, true);


--
-- Name: season_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.season_season_id_seq', 6, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 14, true);


--
-- Name: hotel Hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT "Hotel_pkey" PRIMARY KEY (hotel_id);


--
-- Name: pension pension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pension
    ADD CONSTRAINT pension_pkey PRIMARY KEY (pension_id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_pkey PRIMARY KEY (season_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        