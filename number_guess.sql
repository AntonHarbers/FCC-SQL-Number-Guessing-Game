--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1683995915515', 2, 86);
INSERT INTO public.users VALUES ('user_1683995316997', 2, 729);
INSERT INTO public.users VALUES ('user_1683995316998', 5, 36);
INSERT INTO public.users VALUES ('user_1683995915516', 4, 403);
INSERT INTO public.users VALUES ('', 1, 8);
INSERT INTO public.users VALUES ('hey', 0, NULL);
INSERT INTO public.users VALUES ('user_1683995529233', 2, 133);
INSERT INTO public.users VALUES ('user_1683995529234', 4, 271);
INSERT INTO public.users VALUES ('user_1683996111182', 1, 314);
INSERT INTO public.users VALUES ('user_1683995559534', 1, 462);
INSERT INTO public.users VALUES ('user_1683996111183', 5, 15);
INSERT INTO public.users VALUES ('user_1683995559535', 5, 98);
INSERT INTO public.users VALUES ('user_1683995585184', 2, 418);
INSERT INTO public.users VALUES ('user_1683995585185', 5, 151);
INSERT INTO public.users VALUES ('Tony', 1, 9);
INSERT INTO public.users VALUES ('user_1683995864650', 2, 64);
INSERT INTO public.users VALUES ('user_1683995864651', 4, 8);
INSERT INTO public.users VALUES ('user_1683995887662', 2, 171);
INSERT INTO public.users VALUES ('user_1683995887663', 4, 316);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--
