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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    stars_with_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    apparent_magnitude double precision,
    constellation character varying(50)
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
    planet_id integer,
    name character varying(40) NOT NULL,
    description text,
    discovered_by character varying(50)
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
    has_life boolean NOT NULL,
    age_in_billions numeric(4,3),
    description text,
    is_spherical boolean,
    star_id integer,
    name character varying(40) NOT NULL
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
    galaxy_id integer,
    name character varying(40) NOT NULL,
    constellation_id integer,
    description text
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (3, 'Coma Berencies', 'An ancient asterism in the northern sky, which has been defined as one of the 88 modern constellations', 5);
INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'One of the constellations of the zodiac that is located in the Southern celestial hemisphere.', 32);
INSERT INTO public.constellation VALUES (2, 'Sculptor', 'A small and faint constellation in the souther sky that represents a sculptor.', 6);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 'A constellation in the northern sky, whose associated mythology likely dates back into prehistory', 21);
INSERT INTO public.constellation VALUES (5, 'Pegasus', 'A constellation in the northern sky, named after the winged horse Pegasus in Greek mythology.', 12);
INSERT INTO public.constellation VALUES (6, 'Scorpius', 'A zodiac constellation located in Southern celestial hemisphere.', 14);
INSERT INTO public.constellation VALUES (7, 'Orion', 'A prominent constellation located on the celestial equator and visible throughout the world.', 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes our Solar System, with the name describing the galaxys apperance from Earth.', -5, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Comet Galaxy', 'A spiral galaxy located 3.2 billion light-years from Earth.', 18.7, 'Sculptor');
INSERT INTO public.galaxy VALUES (3, 'Needle Galaxy', 'An edge-on spiral galaxy about 30 to 50 million light-years away.', 10.42, 'Coma Berencies');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 'A face-on spiral galaxy 21 million light-years away from Eart.', 7.9, 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Medusa Merger', 'A pair of interacting galaxies and a region of extreme star formation.', 16.3, 'Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Little Sombrero Galaxy', 'A spiral galaxy about 40 million light-years away that is seen edge-on from Earth.', 11.6, 'Pegasus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 2, 'Phobos', 'The innermost and larger of the two natural satellites of Mars.', 'Asaph Hall');
INSERT INTO public.moon VALUES (2, 2, 'Deimos', 'The smaller and outermost of the two natural satellites of Mars.', 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 7, 'Puck', 'An inner moon of Uranus.', 'Stephen P. Synnott');
INSERT INTO public.moon VALUES (4, 7, 'Miranda', 'The smallest and innermost of Uranus five round satellites.', 'Gerard P. Kuiper');
INSERT INTO public.moon VALUES (5, 7, 'Ariel', 'The fourth-largest of the 27 known moons of Uranus.', 'William Lassell');
INSERT INTO public.moon VALUES (6, 7, 'Umbriel', 'A moon that consists mainly of ice with a substantial fraction of rock.', 'William Lassell');
INSERT INTO public.moon VALUES (7, 7, 'Titania', 'The largest of the moons of Uranus and the eight largest moon in the Solar System.', 'William Herschel');
INSERT INTO public.moon VALUES (8, 7, 'Oberon', 'The outermost major moon of Uranus.', 'William Herschel');
INSERT INTO public.moon VALUES (9, 5, 'Io', 'The innermost and third-largest of the four Galilean moons of Jupiter.', 'Galileo Galilei');
INSERT INTO public.moon VALUES (10, 5, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet.', 'Galileo Galilei');
INSERT INTO public.moon VALUES (11, 5, 'Ganymede', 'The largest and most massive of the Solar Systems moons.', 'Galileo Galilei');
INSERT INTO public.moon VALUES (12, 5, 'Callisto', 'The second-largest moon of Jupiter.', 'Galileo Galilei');
INSERT INTO public.moon VALUES (13, 6, 'Titan', 'The largest moon of Saturn and the second-largest natural satellite in the Solar System.', 'Christian Huygens');
INSERT INTO public.moon VALUES (14, 6, 'Tethys', 'A mid-sized moon of Saturn named after titan from Greek mythology', 'G. D. Cassini');
INSERT INTO public.moon VALUES (15, 6, 'Dione', 'A moon of Saturn. Its interior is likely a combination of silicate rock and water ice', 'Giovanni Cassini');
INSERT INTO public.moon VALUES (16, 6, 'Rhea', 'The second-largest moon of Saturn. It is the smallest body in the Solar System for which precise measurements have confirmed a shape consistent with hydrostatic equilibrium', 'G. D. Cassini');
INSERT INTO public.moon VALUES (17, 6, 'Iapetus', 'A relatively low-density body made up mostly of ice, Iapetus is home to several distinctive and unusual features', 'G. D. Cassini');
INSERT INTO public.moon VALUES (18, 6, 'Mimas', 'It is a smallest astronomical body that is known to still be rounded in shape because of self-gravitation.', 'William Herschel');
INSERT INTO public.moon VALUES (19, 6, 'Enceladus', 'A moon mostly covered by fresh, clean ice, making it one of the most reflective bodies of the Solar System.', 'William Herschel');
INSERT INTO public.moon VALUES (20, 6, 'Hyperion', 'A moon distinguished by its irregular shape, chaotic rotation, and its unexplained sponge-like appearance.', 'William Bond, George Bond, William Lassell');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 4.543, 'The third planet from the Sun and home to all known life.', true, NULL, 'Earth');
INSERT INTO public.planet VALUES (2, false, 4.603, 'The fourth planet from the Sun and second-smallest one in the Solar System.', true, NULL, 'Mars');
INSERT INTO public.planet VALUES (3, false, 4.503, 'The smallest planet in the Solar System and the closest to the Sun.', true, NULL, 'Mercury');
INSERT INTO public.planet VALUES (4, false, 4.503, 'The second planet from the Sun, sometimes called Earths sister as it is almost as large and has a similar composition.', true, NULL, 'Venus');
INSERT INTO public.planet VALUES (5, false, 4.603, 'The fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in SS combined.', true, NULL, 'Jupiter');
INSERT INTO public.planet VALUES (6, false, 4.503, 'The sixth planet from the Sun and the second-largest in the Solar System. Gas giant with an average radius of about nine and a half times that of Earth', false, NULL, 'Saturn');
INSERT INTO public.planet VALUES (7, false, 4.503, 'The seventh planet from the Sun. It is named after Greek sky deity Uranus.', true, NULL, 'Uranus');
INSERT INTO public.planet VALUES (8, false, 4.503, 'The eight planet from the Sun and the farthest known planet in the Solar System.', true, NULL, 'Neptune');
INSERT INTO public.planet VALUES (9, false, 0.240, 'A dwarf planet in the asteroid belt between the orbits of Mars and Jupiter.', true, NULL, 'Ceres');
INSERT INTO public.planet VALUES (10, false, 4.600, 'A dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.', true, NULL, 'Pluto');
INSERT INTO public.planet VALUES (11, false, 4.500, 'A dwarf planet located beyond Neptunees orbit. It was discovered in 2004.', true, NULL, 'Haumea');
INSERT INTO public.planet VALUES (12, false, 4.500, 'A dwarf planet and the second-largest of what are known as the classical population of Kuiper belt objects.', true, NULL, 'Makemake');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Antares', 6, 'The brightest star in the constellation of Scorpius');
INSERT INTO public.star VALUES (2, 1, 'Betelgeuse', 7, 'A red supergiant of spectral type M1-2 and one of the largest stars visible to the naked eye.');
INSERT INTO public.star VALUES (3, 4, 'Mizar', 4, 'A second-magnitude star in the handle of the Big Dipper asterism.');
INSERT INTO public.star VALUES (4, 4, 'Alcor', 4, 'A binary star system, fainter companion of Mizar.');
INSERT INTO public.star VALUES (5, 3, '11 Com', 3, 'A binary star system located in the sky, east and slightly north of Denebola in Leo.');
INSERT INTO public.star VALUES (6, 1, 'Enif', 5, 'The brightest star in Pegasus.');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: constellation uni_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT uni_name UNIQUE (name);


--
-- Name: constellation fk_constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

