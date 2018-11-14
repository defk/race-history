--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-1.pgdg14.04+1)
-- Dumped by pg_dump version 11.1 (Ubuntu 11.1-1.pgdg14.04+1)

-- Started on 2018-11-14 17:30:02 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE race_history;
--
-- TOC entry 2895 (class 1262 OID 16385)
-- Name: race_history; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE race_history WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';


\connect race_history

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: championships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.championships (
    id integer NOT NULL,
    title character varying(15),
    result_id integer
);


--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: championships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.championships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 196
-- Name: championships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.championships_id_seq OWNED BY public.championships.id;


--
-- TOC entry 208 (class 1259 OID 16446)
-- Name: data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data (
    championship_id integer NOT NULL,
    round_id integer NOT NULL,
    team_id integer NOT NULL,
    driver_id integer NOT NULL,
    result_points_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16410)
-- Name: drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drivers (
    id integer NOT NULL,
    title character varying(15)
);


--
-- TOC entry 203 (class 1259 OID 16413)
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.drivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 203
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- TOC entry 206 (class 1259 OID 16426)
-- Name: result_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.result_points (
    id integer NOT NULL,
    result_id integer NOT NULL,
    alias character varying(15),
    points integer NOT NULL,
    order_points integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 16429)
-- Name: result_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.result_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 207
-- Name: result_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.result_points_id_seq OWNED BY public.result_points.id;


--
-- TOC entry 204 (class 1259 OID 16418)
-- Name: results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.results (
    id integer NOT NULL,
    title character varying(15)
);


--
-- TOC entry 205 (class 1259 OID 16421)
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 205
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;


--
-- TOC entry 198 (class 1259 OID 16394)
-- Name: rounds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rounds (
    id integer NOT NULL,
    title character varying(15)
);


--
-- TOC entry 199 (class 1259 OID 16397)
-- Name: rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rounds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 199
-- Name: rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rounds_id_seq OWNED BY public.rounds.id;


--
-- TOC entry 200 (class 1259 OID 16402)
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    title character varying(15)
);


--
-- TOC entry 201 (class 1259 OID 16405)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 201
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 2740 (class 2604 OID 16391)
-- Name: championships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.championships ALTER COLUMN id SET DEFAULT nextval('public.championships_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16415)
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 16431)
-- Name: result_points id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.result_points ALTER COLUMN id SET DEFAULT nextval('public.result_points_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 16423)
-- Name: results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 16399)
-- Name: rounds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rounds ALTER COLUMN id SET DEFAULT nextval('public.rounds_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 16407)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 2748 (class 2606 OID 16393)
-- Name: championships championships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.championships
    ADD CONSTRAINT championships_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 16450)
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (championship_id, round_id, team_id, driver_id, result_points_id);


--
-- TOC entry 2754 (class 2606 OID 16417)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 16433)
-- Name: result_points result_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.result_points
    ADD CONSTRAINT result_points_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 16425)
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 16401)
-- Name: rounds rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rounds
    ADD CONSTRAINT rounds_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 16409)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 1259 OID 16445)
-- Name: FKI_championshipsResult_to_results; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FKI_championshipsResult_to_results" ON public.championships USING btree (result_id);


--
-- TOC entry 2757 (class 1259 OID 16439)
-- Name: FKI_resultPoints_to_results; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "FKI_resultPoints_to_results" ON public.result_points USING btree (result_id);


--
-- TOC entry 2762 (class 2606 OID 16440)
-- Name: championships FK_championshipsResult_to_results; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.championships
    ADD CONSTRAINT "FK_championshipsResult_to_results" FOREIGN KEY (result_id) REFERENCES public.results(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2768 (class 2606 OID 16451)
-- Name: data FK_dataChampionship_to_Championships; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT "FK_dataChampionship_to_Championships" FOREIGN KEY (championship_id) REFERENCES public.championships(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2766 (class 2606 OID 16481)
-- Name: data FK_dataDrivers_to_Drivers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT "FK_dataDrivers_to_Drivers" FOREIGN KEY (driver_id) REFERENCES public.drivers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2767 (class 2606 OID 16486)
-- Name: data FK_dataResultPoint_to_ResultPoints; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT "FK_dataResultPoint_to_ResultPoints" FOREIGN KEY (result_points_id) REFERENCES public.result_points(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2764 (class 2606 OID 16471)
-- Name: data FK_dataRound_to_Rounds; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT "FK_dataRound_to_Rounds" FOREIGN KEY (round_id) REFERENCES public.rounds(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2765 (class 2606 OID 16476)
-- Name: data FK_dataTeams_to_Teams; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT "FK_dataTeams_to_Teams" FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2763 (class 2606 OID 16434)
-- Name: result_points FK_resultPoints_to_results; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.result_points
    ADD CONSTRAINT "FK_resultPoints_to_results" FOREIGN KEY (result_id) REFERENCES public.results(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-11-14 17:30:02 MSK

--
-- PostgreSQL database dump complete
--

