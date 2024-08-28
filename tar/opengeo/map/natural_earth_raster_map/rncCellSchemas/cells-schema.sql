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
-- Name: cells; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cells (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry,
    rncid character varying,
    mnc character varying,
    mcc character varying,
    cellid character varying,
    cellname character varying,
    cellboundary character varying,
    rat character varying,
    vendor character varying,
    CONSTRAINT enforce_dims_wkb_geometry CHECK ((st_ndims(wkb_geometry) = 2))
);


ALTER TABLE public.cells OWNER TO postgres;

--
-- Name: cells_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cells_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cells_ogc_fid_seq OWNER TO postgres;

--
-- Name: cells_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cells_ogc_fid_seq OWNED BY cells.ogc_fid;


--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cells ALTER COLUMN ogc_fid SET DEFAULT nextval('cells_ogc_fid_seq'::regclass);


--
-- Name: cells_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT cells_pk PRIMARY KEY (ogc_fid);


--
-- Name: cells_geom_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cells_geom_idx ON cells USING gist (wkb_geometry);


--
-- PostgreSQL database dump complete
--

