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
    user_id integer,
    guesses integer NOT NULL
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
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
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

INSERT INTO public.games VALUES (1, 5, 423);
INSERT INTO public.games VALUES (2, 5, 289);
INSERT INTO public.games VALUES (3, 6, 799);
INSERT INTO public.games VALUES (4, 6, 633);
INSERT INTO public.games VALUES (5, 5, 369);
INSERT INTO public.games VALUES (6, 5, 395);
INSERT INTO public.games VALUES (7, 5, 773);
INSERT INTO public.games VALUES (8, 7, 670);
INSERT INTO public.games VALUES (9, 7, 432);
INSERT INTO public.games VALUES (10, 8, 718);
INSERT INTO public.games VALUES (11, 8, 521);
INSERT INTO public.games VALUES (12, 7, 683);
INSERT INTO public.games VALUES (13, 7, 51);
INSERT INTO public.games VALUES (14, 7, 593);
INSERT INTO public.games VALUES (15, 9, 135);
INSERT INTO public.games VALUES (16, 9, 366);
INSERT INTO public.games VALUES (17, 10, 340);
INSERT INTO public.games VALUES (18, 10, 434);
INSERT INTO public.games VALUES (19, 9, 387);
INSERT INTO public.games VALUES (20, 9, 146);
INSERT INTO public.games VALUES (21, 9, 862);
INSERT INTO public.games VALUES (22, 11, 679);
INSERT INTO public.games VALUES (23, 11, 29);
INSERT INTO public.games VALUES (24, 12, 78);
INSERT INTO public.games VALUES (25, 12, 703);
INSERT INTO public.games VALUES (26, 11, 934);
INSERT INTO public.games VALUES (27, 11, 339);
INSERT INTO public.games VALUES (28, 11, 16);
INSERT INTO public.games VALUES (29, 13, 825);
INSERT INTO public.games VALUES (30, 13, 977);
INSERT INTO public.games VALUES (31, 14, 935);
INSERT INTO public.games VALUES (32, 14, 902);
INSERT INTO public.games VALUES (33, 13, 30);
INSERT INTO public.games VALUES (34, 13, 960);
INSERT INTO public.games VALUES (35, 13, 66);
INSERT INTO public.games VALUES (36, 15, 826);
INSERT INTO public.games VALUES (37, 15, 520);
INSERT INTO public.games VALUES (38, 16, 300);
INSERT INTO public.games VALUES (39, 16, 213);
INSERT INTO public.games VALUES (40, 15, 973);
INSERT INTO public.games VALUES (41, 15, 337);
INSERT INTO public.games VALUES (42, 15, 518);
INSERT INTO public.games VALUES (43, 17, 575);
INSERT INTO public.games VALUES (44, 17, 986);
INSERT INTO public.games VALUES (45, 18, 814);
INSERT INTO public.games VALUES (46, 18, 362);
INSERT INTO public.games VALUES (47, 17, 61);
INSERT INTO public.games VALUES (48, 17, 340);
INSERT INTO public.games VALUES (49, 17, 21);
INSERT INTO public.games VALUES (50, 19, 929);
INSERT INTO public.games VALUES (51, 19, 33);
INSERT INTO public.games VALUES (52, 20, 518);
INSERT INTO public.games VALUES (53, 20, 18);
INSERT INTO public.games VALUES (54, 19, 627);
INSERT INTO public.games VALUES (55, 19, 545);
INSERT INTO public.games VALUES (56, 19, 146);
INSERT INTO public.games VALUES (57, 21, 507);
INSERT INTO public.games VALUES (58, 21, 230);
INSERT INTO public.games VALUES (59, 22, 830);
INSERT INTO public.games VALUES (60, 22, 919);
INSERT INTO public.games VALUES (61, 21, 655);
INSERT INTO public.games VALUES (62, 21, 677);
INSERT INTO public.games VALUES (63, 21, 45);
INSERT INTO public.games VALUES (64, 23, 124);
INSERT INTO public.games VALUES (65, 23, 485);
INSERT INTO public.games VALUES (66, 24, 277);
INSERT INTO public.games VALUES (67, 24, 378);
INSERT INTO public.games VALUES (68, 23, 347);
INSERT INTO public.games VALUES (69, 23, 572);
INSERT INTO public.games VALUES (70, 23, 446);
INSERT INTO public.games VALUES (71, 25, 597);
INSERT INTO public.games VALUES (72, 25, 131);
INSERT INTO public.games VALUES (73, 26, 477);
INSERT INTO public.games VALUES (74, 26, 649);
INSERT INTO public.games VALUES (75, 25, 647);
INSERT INTO public.games VALUES (76, 25, 707);
INSERT INTO public.games VALUES (77, 25, 652);
INSERT INTO public.games VALUES (78, 27, 600);
INSERT INTO public.games VALUES (79, 27, 16);
INSERT INTO public.games VALUES (80, 28, 18);
INSERT INTO public.games VALUES (81, 28, 903);
INSERT INTO public.games VALUES (82, 27, 269);
INSERT INTO public.games VALUES (83, 27, 601);
INSERT INTO public.games VALUES (84, 27, 439);
INSERT INTO public.games VALUES (85, 29, 119);
INSERT INTO public.games VALUES (86, 29, 984);
INSERT INTO public.games VALUES (87, 30, 594);
INSERT INTO public.games VALUES (88, 30, 457);
INSERT INTO public.games VALUES (89, 29, 239);
INSERT INTO public.games VALUES (90, 29, 573);
INSERT INTO public.games VALUES (91, 29, 258);
INSERT INTO public.games VALUES (92, 31, 594);
INSERT INTO public.games VALUES (93, 31, 890);
INSERT INTO public.games VALUES (94, 32, 742);
INSERT INTO public.games VALUES (95, 32, 687);
INSERT INTO public.games VALUES (96, 31, 450);
INSERT INTO public.games VALUES (97, 31, 878);
INSERT INTO public.games VALUES (98, 31, 657);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1721493055041', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1721493055040', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1721493344712', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1721493344711', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1721493445671', 0, 289);
INSERT INTO public.users VALUES (6, 'user_1721493445670', 0, 633);
INSERT INTO public.users VALUES (8, 'user_1721493576241', 0, 521);
INSERT INTO public.users VALUES (7, 'user_1721493576242', 0, 51);
INSERT INTO public.users VALUES (9, 'user_1721493739781', 0, 135);
INSERT INTO public.users VALUES (10, 'user_1721493739780', 0, 340);
INSERT INTO public.users VALUES (12, 'user_1721494131224', 0, 78);
INSERT INTO public.users VALUES (11, 'user_1721494131225', 0, 16);
INSERT INTO public.users VALUES (14, 'user_1721494310789', 0, 902);
INSERT INTO public.users VALUES (13, 'user_1721494310790', 0, 30);
INSERT INTO public.users VALUES (16, 'user_1721494462439', 0, 213);
INSERT INTO public.users VALUES (15, 'user_1721494462440', 0, 337);
INSERT INTO public.users VALUES (18, 'user_1721494625045', 0, 362);
INSERT INTO public.users VALUES (17, 'user_1721494625046', 0, 21);
INSERT INTO public.users VALUES (19, 'user_1721494704647', 0, 33);
INSERT INTO public.users VALUES (20, 'user_1721494704646', 0, 18);
INSERT INTO public.users VALUES (22, 'user_1721494732528', 0, 830);
INSERT INTO public.users VALUES (21, 'user_1721494732529', 0, 45);
INSERT INTO public.users VALUES (23, 'user_1721494750267', 0, 124);
INSERT INTO public.users VALUES (24, 'user_1721494750266', 0, 277);
INSERT INTO public.users VALUES (25, 'user_1721494829043', 0, 131);
INSERT INTO public.users VALUES (26, 'user_1721494829042', 0, 477);
INSERT INTO public.users VALUES (27, 'user_1721494855470', 0, 16);
INSERT INTO public.users VALUES (28, 'user_1721494855469', 0, 18);
INSERT INTO public.users VALUES (29, 'user_1721494882210', 0, 119);
INSERT INTO public.users VALUES (30, 'user_1721494882209', 0, 457);
INSERT INTO public.users VALUES (32, 'user_1721494978471', 0, 687);
INSERT INTO public.users VALUES (31, 'user_1721494978472', 0, 450);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 98, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


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

