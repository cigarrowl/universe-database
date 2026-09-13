--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(15,2) NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_common boolean NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    orbital_period integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    has_life boolean NOT NULL,
    moons_count integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    temperature integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A large spiral galaxy near the Milky Way', 10010, 2537000.00, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home spiral galaxy', 13610, 0.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A nearby spiral galaxy', 13000, 2723000.00, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand design spiral galaxy', 9000, 23000000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A bright galaxy with a prominent dust lane', 10000, 29000000.00, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'A ring galaxy shaped by a collision', 300, 500000000.00, true);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A galaxy with winding arms', true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A smooth oval galaxy', true);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy without a regular shape', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (61, 'Luna', 27, 'Earths natural satellite', 28, false);
INSERT INTO public.moon VALUES (62, 'Phobos', 28, 'An inner moon of Mars', 0, false);
INSERT INTO public.moon VALUES (63, 'Deimos', 28, 'An outer moon of Mars', 1, false);
INSERT INTO public.moon VALUES (64, 'Io', 29, 'A volcanic moon of Jupiter', 2, false);
INSERT INTO public.moon VALUES (65, 'Europa', 29, 'An icy moon of Jupiter', 4, false);
INSERT INTO public.moon VALUES (66, 'Ganymede', 29, 'The largest moon in the solar system', 7, false);
INSERT INTO public.moon VALUES (67, 'Callisto', 29, 'A heavily cratered moon', 17, false);
INSERT INTO public.moon VALUES (68, 'Titan', 30, 'A moon with a thick atmosphere', 16, false);
INSERT INTO public.moon VALUES (69, 'Rhea', 30, 'An icy moon of Saturn', 5, false);
INSERT INTO public.moon VALUES (70, 'Iapetus', 30, 'A two-toned moon of Saturn', 79, false);
INSERT INTO public.moon VALUES (71, 'Titania', 31, 'The largest moon of Uranus', 9, false);
INSERT INTO public.moon VALUES (72, 'Oberon', 31, 'An outer moon of Uranus', 13, false);
INSERT INTO public.moon VALUES (73, 'Ariel', 31, 'A bright moon of Uranus', 3, false);
INSERT INTO public.moon VALUES (74, 'Umbriel', 31, 'A dark moon of Uranus', 4, false);
INSERT INTO public.moon VALUES (75, 'Triton', 32, 'A retrograde moon of Neptune', 6, false);
INSERT INTO public.moon VALUES (76, 'Nereid', 32, 'An eccentric moon of Neptune', 360, false);
INSERT INTO public.moon VALUES (77, 'Asteria I', 33, 'A moon of an Andromedan planet', 12, false);
INSERT INTO public.moon VALUES (78, 'Mirach I', 34, 'A moon of Mirach Minor', 20, false);
INSERT INTO public.moon VALUES (79, 'Triangulum I', 35, 'A moon of Triangulum One', 10, false);
INSERT INTO public.moon VALUES (80, 'Triangulum II', 36, 'A moon of Triangulum Two', 30, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Mercury', 7, 'The smallest planet in the solar system', 4500, 91700000.00, false, 0);
INSERT INTO public.planet VALUES (26, 'Venus', 7, 'A hot world with a thick atmosphere', 4500, 41400000.00, false, 0);
INSERT INTO public.planet VALUES (27, 'Earth', 7, 'The ocean world where humanity lives', 4500, 0.00, true, 1);
INSERT INTO public.planet VALUES (28, 'Mars', 7, 'A cold red planet', 4600, 78300000.00, false, 2);
INSERT INTO public.planet VALUES (29, 'Jupiter', 7, 'The largest planet in the solar system', 4600, 628700000.00, false, 4);
INSERT INTO public.planet VALUES (30, 'Saturn', 7, 'A gas giant famous for its rings', 4500, 1275000000.00, false, 5);
INSERT INTO public.planet VALUES (31, 'Uranus', 7, 'An ice giant tilted on its side', 4500, 2721000000.00, false, 2);
INSERT INTO public.planet VALUES (32, 'Neptune', 7, 'A distant blue ice giant', 4500, 4347000000.00, false, 2);
INSERT INTO public.planet VALUES (33, 'Asteria', 10, 'A rocky planet around Alpheratz', 8000, 2537000.00, false, 1);
INSERT INTO public.planet VALUES (34, 'Mirach Minor', 11, 'A small world around Mirach', 7000, 2537000.00, false, 1);
INSERT INTO public.planet VALUES (35, 'Triangulum One', 12, 'A temperate world in Triangulum', 6000, 2723000.00, false, 1);
INSERT INTO public.planet VALUES (36, 'Triangulum Two', 12, 'A distant gas giant in Triangulum', 6000, 2723000.00, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 1, 'The star at the center of our system', 5778, false);
INSERT INTO public.star VALUES (8, 'Sirius', 2, 'The brightest star in the night sky', 9940, false);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 3, 'The closest known star to the Sun', 3042, false);
INSERT INTO public.star VALUES (10, 'Alpheratz', 4, 'A bright star in Andromeda', 13800, false);
INSERT INTO public.star VALUES (11, 'Mirach', 5, 'A red giant in Andromeda', 3800, false);
INSERT INTO public.star VALUES (12, 'Triangulum Prime', 6, 'A luminous star in Triangulum', 7200, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 80, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

