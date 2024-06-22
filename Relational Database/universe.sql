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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    distance numeric,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    habitable boolean,
    distance numeric,
    description text NOT NULL,
    temperature integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    habitable boolean,
    distance numeric,
    description text NOT NULL,
    temperature integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    distance numeric,
    description text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: unknown; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.unknown (
    unknown_id integer NOT NULL,
    description text NOT NULL,
    name character varying(30)
);


ALTER TABLE public.unknown OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via lactea', true, 100000, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 2500000, 'Messier 31');
INSERT INTO public.galaxy VALUES (3, 'Triangulo', false, 2723000, 'Messier 33');
INSERT INTO public.galaxy VALUES (5, 'Pequena nuvem de Magalhaes', false, 200000, 'SMC');
INSERT INTO public.galaxy VALUES (4, 'Grande nuvem de Magalhaes', false, 160000, 'LMC');
INSERT INTO public.galaxy VALUES (6, 'Centauro A', false, 13050000, 'NGC 5128');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (10001, 'lua 1', NULL, NULL, NULL, '1', NULL, 1002);
INSERT INTO public.moon VALUES (10002, 'lua 2', NULL, NULL, NULL, '2', NULL, 1002);
INSERT INTO public.moon VALUES (10003, 'lua 3', NULL, NULL, NULL, '3', NULL, 1002);
INSERT INTO public.moon VALUES (10004, 'lua 4', NULL, NULL, NULL, '4', NULL, 1002);
INSERT INTO public.moon VALUES (10005, 'lua 5', NULL, NULL, NULL, '5', NULL, 1002);
INSERT INTO public.moon VALUES (10006, 'lua 6', NULL, NULL, NULL, '6', NULL, 1002);
INSERT INTO public.moon VALUES (10007, 'lua 7', NULL, NULL, NULL, '7', NULL, 1002);
INSERT INTO public.moon VALUES (10008, 'lua 8', NULL, NULL, NULL, '8', NULL, 1002);
INSERT INTO public.moon VALUES (10009, 'lua 9', NULL, NULL, NULL, '9', NULL, 1002);
INSERT INTO public.moon VALUES (10010, 'lua 10', NULL, NULL, NULL, '10', NULL, 1002);
INSERT INTO public.moon VALUES (10011, 'lua 11', NULL, NULL, NULL, '11', NULL, 1002);
INSERT INTO public.moon VALUES (10012, 'lua 12', NULL, NULL, NULL, '12', NULL, 1002);
INSERT INTO public.moon VALUES (10013, 'lua 13', NULL, NULL, NULL, '13', NULL, 1002);
INSERT INTO public.moon VALUES (10014, 'lua 14', NULL, NULL, NULL, '14', NULL, 1002);
INSERT INTO public.moon VALUES (10015, 'lua 15', NULL, NULL, NULL, '15', NULL, 1002);
INSERT INTO public.moon VALUES (10016, 'lua 16', NULL, NULL, NULL, '16', NULL, 1002);
INSERT INTO public.moon VALUES (10017, 'lua 17', NULL, NULL, NULL, '17', NULL, 1002);
INSERT INTO public.moon VALUES (10018, 'lua 18', NULL, NULL, NULL, '18', NULL, 1002);
INSERT INTO public.moon VALUES (10019, 'lua 19', NULL, NULL, NULL, '19', NULL, 1002);
INSERT INTO public.moon VALUES (10020, 'lua 20', NULL, NULL, NULL, '20', NULL, 1002);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1001, 'Terra', NULL, NULL, NULL, 'planeta azul', NULL, 100);
INSERT INTO public.planet VALUES (1002, 'planeta 2', NULL, NULL, NULL, '2', NULL, 100);
INSERT INTO public.planet VALUES (1003, 'planeta 3', NULL, NULL, NULL, '3', NULL, 100);
INSERT INTO public.planet VALUES (1004, 'planeta 4', NULL, NULL, NULL, '4', NULL, 100);
INSERT INTO public.planet VALUES (1005, 'planeta 5', NULL, NULL, NULL, '5', NULL, 100);
INSERT INTO public.planet VALUES (1006, 'planeta 6', NULL, NULL, NULL, '6', NULL, 100);
INSERT INTO public.planet VALUES (1007, 'planeta 7', NULL, NULL, NULL, '7', NULL, 100);
INSERT INTO public.planet VALUES (1008, 'planeta 8', NULL, NULL, NULL, '8', NULL, 100);
INSERT INTO public.planet VALUES (1009, 'planeta 9', NULL, NULL, NULL, '9', NULL, 100);
INSERT INTO public.planet VALUES (1010, 'planeta 10', NULL, NULL, NULL, '10', NULL, 100);
INSERT INTO public.planet VALUES (1011, 'planeta 11', NULL, NULL, NULL, '11', NULL, 100);
INSERT INTO public.planet VALUES (1012, 'planeta 12', NULL, NULL, NULL, '12', NULL, 100);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (100, 'Sol', NULL, NULL, 'quente', 1);
INSERT INTO public.star VALUES (101, 'Sirius', NULL, NULL, 'estrela do cao', 1);
INSERT INTO public.star VALUES (102, 'Alpha Centauri', NULL, NULL, 'composta por 3 estrelas', 1);
INSERT INTO public.star VALUES (103, 'Betelgeuse', NULL, NULL, 'alpha orionis', 1);
INSERT INTO public.star VALUES (104, 'vega', NULL, NULL, 'alpha lyrae', 1);
INSERT INTO public.star VALUES (105, 'Polaris', NULL, NULL, 'alpha ursae minoris', 1);


--
-- Data for Name: unknown; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.unknown VALUES (9001, 'desconhecido 1', NULL);
INSERT INTO public.unknown VALUES (9003, 'desconhecido 3', NULL);
INSERT INTO public.unknown VALUES (9002, 'desconhecido 2', NULL);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (moon_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star_id);


--
-- Name: unknown unique_unknown; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unknown
    ADD CONSTRAINT unique_unknown UNIQUE (unknown_id);


--
-- Name: unknown unknown_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unknown
    ADD CONSTRAINT unknown_pkey PRIMARY KEY (unknown_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

