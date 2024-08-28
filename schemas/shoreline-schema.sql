--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: shoreline; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shoreline (
    gid integer NOT NULL,
    error smallint,
    tile_x smallint,
    tile_y smallint,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


ALTER TABLE public.shoreline OWNER TO postgres;

--
-- Name: shoreline_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shoreline_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shoreline_gid_seq OWNER TO postgres;

--
-- Name: shoreline_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shoreline_gid_seq OWNED BY shoreline.gid;


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE shoreline ALTER COLUMN gid SET DEFAULT nextval('shoreline_gid_seq'::regclass);


--
-- Name: shoreline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shoreline
    ADD CONSTRAINT shoreline_pkey PRIMARY KEY (gid);


--
-- Name: shoreline_error_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shoreline_error_index ON shoreline USING btree (error);


--
-- Name: shoreline_gid_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shoreline_gid_index ON shoreline USING btree (gid);


--
-- Name: shoreline_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shoreline_index ON shoreline USING gist (the_geom);


--
-- Name: shoreline_tilex_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shoreline_tilex_index ON shoreline USING btree (tile_x);


--
-- Name: shoreline_tiley_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX shoreline_tiley_index ON shoreline USING btree (tile_y);


--
-- PostgreSQL database dump complete
--

