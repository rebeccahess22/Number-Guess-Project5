--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 9, 1);
INSERT INTO public.games VALUES (2, 333, 2);
INSERT INTO public.games VALUES (3, 835, 2);
INSERT INTO public.games VALUES (4, 75, 3);
INSERT INTO public.games VALUES (5, 78, 3);
INSERT INTO public.games VALUES (6, 498, 2);
INSERT INTO public.games VALUES (7, 136, 2);
INSERT INTO public.games VALUES (8, 567, 2);
INSERT INTO public.games VALUES (9, 651, 4);
INSERT INTO public.games VALUES (10, 706, 4);
INSERT INTO public.games VALUES (11, 411, 5);
INSERT INTO public.games VALUES (12, 607, 5);
INSERT INTO public.games VALUES (13, 668, 4);
INSERT INTO public.games VALUES (14, 725, 4);
INSERT INTO public.games VALUES (15, 907, 4);
INSERT INTO public.games VALUES (16, 392, 6);
INSERT INTO public.games VALUES (17, 815, 6);
INSERT INTO public.games VALUES (18, 334, 7);
INSERT INTO public.games VALUES (19, 256, 7);
INSERT INTO public.games VALUES (20, 76, 6);
INSERT INTO public.games VALUES (21, 758, 6);
INSERT INTO public.games VALUES (22, 988, 6);
INSERT INTO public.games VALUES (23, 11, 8);
INSERT INTO public.games VALUES (24, 551, 9);
INSERT INTO public.games VALUES (25, 100, 9);
INSERT INTO public.games VALUES (26, 964, 10);
INSERT INTO public.games VALUES (27, 282, 10);
INSERT INTO public.games VALUES (28, 775, 9);
INSERT INTO public.games VALUES (29, 884, 9);
INSERT INTO public.games VALUES (30, 475, 9);
INSERT INTO public.games VALUES (31, 344, 11);
INSERT INTO public.games VALUES (32, 59, 11);
INSERT INTO public.games VALUES (33, 281, 12);
INSERT INTO public.games VALUES (34, 404, 12);
INSERT INTO public.games VALUES (35, 848, 11);
INSERT INTO public.games VALUES (36, 545, 11);
INSERT INTO public.games VALUES (37, 114, 11);
INSERT INTO public.games VALUES (38, 9, 8);
INSERT INTO public.games VALUES (39, 769, 13);
INSERT INTO public.games VALUES (40, 311, 13);
INSERT INTO public.games VALUES (41, 193, 14);
INSERT INTO public.games VALUES (42, 659, 14);
INSERT INTO public.games VALUES (43, 475, 13);
INSERT INTO public.games VALUES (44, 312, 13);
INSERT INTO public.games VALUES (45, 459, 13);
INSERT INTO public.games VALUES (46, 704, 15);
INSERT INTO public.games VALUES (47, 115, 15);
INSERT INTO public.games VALUES (48, 253, 16);
INSERT INTO public.games VALUES (49, 674, 16);
INSERT INTO public.games VALUES (50, 349, 15);
INSERT INTO public.games VALUES (51, 15, 15);
INSERT INTO public.games VALUES (52, 167, 15);
INSERT INTO public.games VALUES (53, 722, 17);
INSERT INTO public.games VALUES (54, 881, 17);
INSERT INTO public.games VALUES (55, 163, 18);
INSERT INTO public.games VALUES (56, 75, 18);
INSERT INTO public.games VALUES (57, 383, 17);
INSERT INTO public.games VALUES (58, 459, 17);
INSERT INTO public.games VALUES (59, 203, 17);
INSERT INTO public.games VALUES (60, 512, 19);
INSERT INTO public.games VALUES (61, 702, 19);
INSERT INTO public.games VALUES (62, 94, 20);
INSERT INTO public.games VALUES (63, 905, 20);
INSERT INTO public.games VALUES (64, 552, 19);
INSERT INTO public.games VALUES (65, 960, 19);
INSERT INTO public.games VALUES (66, 981, 19);
INSERT INTO public.games VALUES (67, 347, 21);
INSERT INTO public.games VALUES (68, 281, 21);
INSERT INTO public.games VALUES (69, 132, 22);
INSERT INTO public.games VALUES (70, 433, 22);
INSERT INTO public.games VALUES (71, 917, 21);
INSERT INTO public.games VALUES (72, 503, 21);
INSERT INTO public.games VALUES (73, 410, 21);
INSERT INTO public.games VALUES (74, 848, 23);
INSERT INTO public.games VALUES (75, 79, 23);
INSERT INTO public.games VALUES (76, 999, 24);
INSERT INTO public.games VALUES (77, 964, 24);
INSERT INTO public.games VALUES (78, 395, 23);
INSERT INTO public.games VALUES (79, 744, 23);
INSERT INTO public.games VALUES (80, 553, 23);
INSERT INTO public.games VALUES (81, 10, 8);
INSERT INTO public.games VALUES (82, 140, 25);
INSERT INTO public.games VALUES (83, 880, 25);
INSERT INTO public.games VALUES (84, 888, 26);
INSERT INTO public.games VALUES (85, 144, 26);
INSERT INTO public.games VALUES (86, 744, 25);
INSERT INTO public.games VALUES (87, 237, 25);
INSERT INTO public.games VALUES (88, 381, 25);
INSERT INTO public.games VALUES (89, 778, 27);
INSERT INTO public.games VALUES (90, 435, 27);
INSERT INTO public.games VALUES (91, 313, 28);
INSERT INTO public.games VALUES (92, 326, 28);
INSERT INTO public.games VALUES (93, 764, 27);
INSERT INTO public.games VALUES (94, 157, 27);
INSERT INTO public.games VALUES (95, 898, 27);
INSERT INTO public.games VALUES (96, 9, 8);
INSERT INTO public.games VALUES (97, 83, 29);
INSERT INTO public.games VALUES (98, 422, 29);
INSERT INTO public.games VALUES (99, 402, 30);
INSERT INTO public.games VALUES (100, 776, 30);
INSERT INTO public.games VALUES (101, 194, 29);
INSERT INTO public.games VALUES (102, 385, 29);
INSERT INTO public.games VALUES (103, 883, 29);
INSERT INTO public.games VALUES (104, 858, 31);
INSERT INTO public.games VALUES (105, 8, 31);
INSERT INTO public.games VALUES (106, 418, 32);
INSERT INTO public.games VALUES (107, 31, 32);
INSERT INTO public.games VALUES (108, 336, 31);
INSERT INTO public.games VALUES (109, 587, 31);
INSERT INTO public.games VALUES (110, 174, 31);
INSERT INTO public.games VALUES (111, 9, 8);
INSERT INTO public.games VALUES (112, 385, 33);
INSERT INTO public.games VALUES (113, 312, 33);
INSERT INTO public.games VALUES (114, 650, 34);
INSERT INTO public.games VALUES (115, 312, 34);
INSERT INTO public.games VALUES (116, 540, 33);
INSERT INTO public.games VALUES (117, 430, 33);
INSERT INTO public.games VALUES (118, 84, 33);
INSERT INTO public.games VALUES (119, 5, 35);
INSERT INTO public.games VALUES (120, 11, 35);
INSERT INTO public.games VALUES (121, 450, 36);
INSERT INTO public.games VALUES (122, 287, 36);
INSERT INTO public.games VALUES (123, 262, 37);
INSERT INTO public.games VALUES (124, 453, 37);
INSERT INTO public.games VALUES (125, 968, 36);
INSERT INTO public.games VALUES (126, 470, 36);
INSERT INTO public.games VALUES (127, 360, 36);
INSERT INTO public.games VALUES (128, 896, 38);
INSERT INTO public.games VALUES (129, 407, 38);
INSERT INTO public.games VALUES (130, 399, 39);
INSERT INTO public.games VALUES (131, 795, 39);
INSERT INTO public.games VALUES (132, 0, 38);
INSERT INTO public.games VALUES (133, 12, 38);
INSERT INTO public.games VALUES (134, 842, 38);
INSERT INTO public.games VALUES (135, 9, 1);
INSERT INTO public.games VALUES (136, 236, 40);
INSERT INTO public.games VALUES (137, 697, 40);
INSERT INTO public.games VALUES (138, 647, 41);
INSERT INTO public.games VALUES (139, 167, 41);
INSERT INTO public.games VALUES (140, 997, 40);
INSERT INTO public.games VALUES (141, 681, 40);
INSERT INTO public.games VALUES (142, 555, 40);
INSERT INTO public.games VALUES (143, 709, 42);
INSERT INTO public.games VALUES (144, 560, 42);
INSERT INTO public.games VALUES (145, 679, 43);
INSERT INTO public.games VALUES (146, 921, 43);
INSERT INTO public.games VALUES (147, 296, 42);
INSERT INTO public.games VALUES (148, 846, 42);
INSERT INTO public.games VALUES (149, 297, 42);
INSERT INTO public.games VALUES (150, 9, 1);
INSERT INTO public.games VALUES (151, 202, 44);
INSERT INTO public.games VALUES (152, 612, 44);
INSERT INTO public.games VALUES (153, 164, 45);
INSERT INTO public.games VALUES (154, 681, 45);
INSERT INTO public.games VALUES (155, 700, 44);
INSERT INTO public.games VALUES (156, 911, 44);
INSERT INTO public.games VALUES (157, 865, 44);
INSERT INTO public.games VALUES (158, 323, 46);
INSERT INTO public.games VALUES (159, 718, 46);
INSERT INTO public.games VALUES (160, 903, 47);
INSERT INTO public.games VALUES (161, 52, 47);
INSERT INTO public.games VALUES (162, 307, 46);
INSERT INTO public.games VALUES (163, 425, 46);
INSERT INTO public.games VALUES (164, 506, 46);
INSERT INTO public.games VALUES (165, 9, 8);
INSERT INTO public.games VALUES (166, 721, 48);
INSERT INTO public.games VALUES (167, 904, 48);
INSERT INTO public.games VALUES (168, 461, 49);
INSERT INTO public.games VALUES (169, 890, 49);
INSERT INTO public.games VALUES (170, 170, 48);
INSERT INTO public.games VALUES (171, 33, 48);
INSERT INTO public.games VALUES (172, 665, 48);
INSERT INTO public.games VALUES (173, 259, 50);
INSERT INTO public.games VALUES (174, 166, 50);
INSERT INTO public.games VALUES (175, 749, 51);
INSERT INTO public.games VALUES (176, 796, 51);
INSERT INTO public.games VALUES (177, 705, 50);
INSERT INTO public.games VALUES (178, 133, 50);
INSERT INTO public.games VALUES (179, 58, 50);
INSERT INTO public.games VALUES (180, 905, 52);
INSERT INTO public.games VALUES (181, 142, 52);
INSERT INTO public.games VALUES (182, 635, 53);
INSERT INTO public.games VALUES (183, 77, 53);
INSERT INTO public.games VALUES (184, 498, 52);
INSERT INTO public.games VALUES (185, 804, 52);
INSERT INTO public.games VALUES (186, 615, 52);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'becca');
INSERT INTO public.users VALUES (2, 'user_1744817192857');
INSERT INTO public.users VALUES (3, 'user_1744817192856');
INSERT INTO public.users VALUES (4, 'user_1744817226522');
INSERT INTO public.users VALUES (5, 'user_1744817226521');
INSERT INTO public.users VALUES (6, 'user_1744817261543');
INSERT INTO public.users VALUES (7, 'user_1744817261542');
INSERT INTO public.users VALUES (8, 'BECCA');
INSERT INTO public.users VALUES (9, 'user_1744817301230');
INSERT INTO public.users VALUES (10, 'user_1744817301229');
INSERT INTO public.users VALUES (11, 'user_1744817422945');
INSERT INTO public.users VALUES (12, 'user_1744817422944');
INSERT INTO public.users VALUES (13, 'user_1744817535595');
INSERT INTO public.users VALUES (14, 'user_1744817535594');
INSERT INTO public.users VALUES (15, 'user_1744817648517');
INSERT INTO public.users VALUES (16, 'user_1744817648516');
INSERT INTO public.users VALUES (17, 'user_1744817704152');
INSERT INTO public.users VALUES (18, 'user_1744817704151');
INSERT INTO public.users VALUES (19, 'user_1744817784741');
INSERT INTO public.users VALUES (20, 'user_1744817784740');
INSERT INTO public.users VALUES (21, 'user_1744817831163');
INSERT INTO public.users VALUES (22, 'user_1744817831162');
INSERT INTO public.users VALUES (23, 'user_1744817856882');
INSERT INTO public.users VALUES (24, 'user_1744817856881');
INSERT INTO public.users VALUES (25, 'user_1744817924487');
INSERT INTO public.users VALUES (26, 'user_1744817924486');
INSERT INTO public.users VALUES (27, 'user_1744818115655');
INSERT INTO public.users VALUES (28, 'user_1744818115654');
INSERT INTO public.users VALUES (29, 'user_1744818992485');
INSERT INTO public.users VALUES (30, 'user_1744818992484');
INSERT INTO public.users VALUES (31, 'user_1744819049109');
INSERT INTO public.users VALUES (32, 'user_1744819049108');
INSERT INTO public.users VALUES (33, 'user_1744819084808');
INSERT INTO public.users VALUES (34, 'user_1744819084807');
INSERT INTO public.users VALUES (35, 'JO');
INSERT INTO public.users VALUES (36, 'user_1744819221350');
INSERT INTO public.users VALUES (37, 'user_1744819221349');
INSERT INTO public.users VALUES (38, 'user_1744819287026');
INSERT INTO public.users VALUES (39, 'user_1744819287025');
INSERT INTO public.users VALUES (40, 'user_1744819343164');
INSERT INTO public.users VALUES (41, 'user_1744819343163');
INSERT INTO public.users VALUES (42, 'user_1744819359883');
INSERT INTO public.users VALUES (43, 'user_1744819359882');
INSERT INTO public.users VALUES (44, 'user_1744819427638');
INSERT INTO public.users VALUES (45, 'user_1744819427637');
INSERT INTO public.users VALUES (46, 'user_1744819497030');
INSERT INTO public.users VALUES (47, 'user_1744819497029');
INSERT INTO public.users VALUES (48, 'user_1744819561200');
INSERT INTO public.users VALUES (49, 'user_1744819561199');
INSERT INTO public.users VALUES (50, 'user_1744819648703');
INSERT INTO public.users VALUES (51, 'user_1744819648702');
INSERT INTO public.users VALUES (52, 'user_1744819677476');
INSERT INTO public.users VALUES (53, 'user_1744819677475');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 186, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 53, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

