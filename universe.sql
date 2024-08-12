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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(40),
    diameter_km numeric(4,1) NOT NULL,
    mean_distance_from_sun_in_au numeric(4,3) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type text,
    name character varying(40),
    size_in_ly integer,
    distance_from_earth_in_ly integer DEFAULT 0 NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    is_spherical boolean,
    year_discovered integer,
    planet_id integer,
    name character varying(40) NOT NULL
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
    name character varying(40),
    planet_id integer NOT NULL,
    has_life boolean,
    size integer NOT NULL,
    distance_from_sun_in_m_miles numeric(4,1) NOT NULL,
    name_etymology text,
    number_of_moons integer,
    star_id integer
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
    name character varying(40),
    star_id integer NOT NULL,
    number_of_planets integer NOT NULL,
    age_in_gyr numeric(5,3) NOT NULL,
    distance_from_earth_in_ly numeric(10,6),
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, 2.766);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.4, 2.362);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 511.0, 2.773);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 433.0, 3.139);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 332.0, 3.062);
INSERT INTO public.asteroid VALUES (6, 'Europa', 319.0, 3.095);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'barred spiral', 'Milky Way', 87400, 0);
INSERT INTO public.galaxy VALUES (5, 'barred spiral', 'Andromeda', 152000, 2500000);
INSERT INTO public.galaxy VALUES (6, 'Magellanic spiral', 'Large Magellanic Cloud', 32200, 163000);
INSERT INTO public.galaxy VALUES (7, 'dwarf irregular', 'Small Magellanic Cloud', 18900, 200000);
INSERT INTO public.galaxy VALUES (8, 'interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus', 'Whirlpool', 76900, 23500000);
INSERT INTO public.galaxy VALUES (9, ' peculiar galaxy of unclear classification', 'Sombrero', 105000, 105000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 0, 3, 'The Moon');
INSERT INTO public.moon VALUES (2, false, 1877, 4, 'Phobos');
INSERT INTO public.moon VALUES (3, false, 1877, 4, 'Deimos');
INSERT INTO public.moon VALUES (4, true, 1610, 5, 'Io');
INSERT INTO public.moon VALUES (5, true, 1610, 5, 'Europa');
INSERT INTO public.moon VALUES (6, true, 1610, 5, 'Ganymede');
INSERT INTO public.moon VALUES (7, true, 1610, 5, 'Callisto');
INSERT INTO public.moon VALUES (8, true, 1655, 6, 'Titan');
INSERT INTO public.moon VALUES (9, true, 1789, 6, 'Enceladus');
INSERT INTO public.moon VALUES (10, false, 1848, 6, 'Hyperion');
INSERT INTO public.moon VALUES (11, false, 1980, 6, 'Prometheus');
INSERT INTO public.moon VALUES (12, false, 1980, 6, 'Pandora');
INSERT INTO public.moon VALUES (13, false, 1966, 6, 'Janus');
INSERT INTO public.moon VALUES (14, false, 1966, 6, 'Epimetheus');
INSERT INTO public.moon VALUES (15, false, 1789, 6, 'Mimas');
INSERT INTO public.moon VALUES (16, true, 1948, 7, 'Miranda');
INSERT INTO public.moon VALUES (17, true, 1851, 7, 'Ariel');
INSERT INTO public.moon VALUES (18, true, 1851, 7, 'Umbriel');
INSERT INTO public.moon VALUES (19, true, 1846, 8, 'Triton');
INSERT INTO public.moon VALUES (20, false, 1949, 8, 'Nereid');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, false, 3030, 43.5, 'In English, it is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods.', 0, 2);
INSERT INTO public.planet VALUES ('Venus', 2, false, 7521, 67.2, 'Romans named Venus after their goddess of love, who in turn was based on the ancient Greek goddess of love Aphrodite', 0, 2);
INSERT INTO public.planet VALUES ('Earth', 3, true, 7926, 93.0, 'The word Earth comes from the Old English words eor(th)e and ertha, which are at least 1,000 years old and mean - the ground', 1, 2);
INSERT INTO public.planet VALUES ('Mars', 4, false, 4212, 142.0, ' named by the ancient Romans for their god of war because its reddish color was reminiscent of blood', 2, 2);
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 88846, 483.7, 'The name Jupiter comes from the Latin words Iūpiter or Iuppiter, which are derived from the Proto-Italic words djous ("day, sky") and patēr ("father"). This means "sky father".', 95, 2);
INSERT INTO public.planet VALUES ('Saturn', 6, false, 74898, 889.8, 'The name Saturn comes from the Roman god of agriculture and time, who was also the father of Jupiter', 146, 2);
INSERT INTO public.planet VALUES ('Uranus', 7, false, 31763, 1.8, 'The name Uranus comes from the Latin word Ūranus, which comes from the Greek word Ouranós, meaning "sky or heaven"', 28, 2);
INSERT INTO public.planet VALUES ('Neptune', 8, false, 30775, 2.8, 'Neptune was the Roman god of the sea, oceans, water, and aquatic elements.', 16, 2);
INSERT INTO public.planet VALUES ('Kepler-90b', 9, NULL, 0, 0.0, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 10, NULL, 0, 0.0, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 11, NULL, 0, 0.0, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('TRAPPIST-1f', 12, NULL, 0, 0.0, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 2, 8, 4.600, 0.000016, 4);
INSERT INTO public.star VALUES ('Kepler-90', 4, 8, 2.000, 2840.000000, 4);
INSERT INTO public.star VALUES ('HD-219134', 5, 6, 12.660, 21.000000, 4);
INSERT INTO public.star VALUES ('TRAPPIST-1', 6, 7, 7.600, 39.500000, 4);
INSERT INTO public.star VALUES ('HD-40307', 7, 4, 1.198, 42.000000, 4);
INSERT INTO public.star VALUES ('Proxima Centauri', 8, 2, 4.850, 4.224000, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

