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
-- Name: rncids; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rncids (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry,
    rncid character varying,
    mnc character varying,
    mcc character varying,
    geometrywkt character varying,
    CONSTRAINT enforce_dims_wkb_geometry CHECK ((st_ndims(wkb_geometry) = 2)),
    CONSTRAINT enforce_geotype_wkb_geometry CHECK (((geometrytype(wkb_geometry) = 'POINT'::text) OR (wkb_geometry IS NULL)))
);


ALTER TABLE public.rncids OWNER TO postgres;

--
-- Name: rncids_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rncids_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rncids_ogc_fid_seq OWNER TO postgres;

--
-- Name: rncids_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rncids_ogc_fid_seq OWNED BY rncids.ogc_fid;


--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rncids ALTER COLUMN ogc_fid SET DEFAULT nextval('rncids_ogc_fid_seq'::regclass);


--
-- Name: rncids_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rncids
    ADD CONSTRAINT rncids_pk PRIMARY KEY (ogc_fid);


--
-- Name: rncids_geom_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX rncids_geom_idx ON rncids USING gist (wkb_geometry);


--
-- PostgreSQL database dump complete
--

