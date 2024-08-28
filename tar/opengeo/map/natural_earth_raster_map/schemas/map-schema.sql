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
-- Name: planet_osm_line; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planet_osm_line (
    osm_id integer,
    "addr:flats" text,
    admin_level text,
    aeroway text,
    amenity text,
    bicycle text,
    building text,
    disused text,
    highway text,
    landuse text,
    learning text,
    leisure text,
    military text,
    name text,
    "natural" text,
    oneway text,
    place text,
    railway text,
    residence text,
    route text,
    tourism text,
    waterway text,
    way_area real,
    way geometry
);


ALTER TABLE public.planet_osm_line OWNER TO postgres;

--
-- Name: planet_osm_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planet_osm_point (
    osm_id integer,
    "addr:flats" text,
    admin_level text,
    aeroway text,
    amenity text,
    bicycle text,
    building text,
    disused text,
    highway text,
    landuse text,
    learning text,
    leisure text,
    military text,
    name text,
    "natural" text,
    oneway text,
    place text,
    railway text,
    residence text,
    route text,
    tourism text,
    waterway text,
    way geometry
);


ALTER TABLE public.planet_osm_point OWNER TO postgres;

--
-- Name: planet_osm_polygon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planet_osm_polygon (
    osm_id integer,
    "addr:flats" text,
    admin_level text,
    aeroway text,
    amenity text,
    bicycle text,
    building text,
    disused text,
    highway text,
    landuse text,
    learning text,
    leisure text,
    military text,
    name text,
    "natural" text,
    oneway text,
    place text,
    railway text,
    residence text,
    route text,
    tourism text,
    waterway text,
    way_area real,
    way geometry
);


ALTER TABLE public.planet_osm_polygon OWNER TO postgres;

--
-- Name: planet_osm_line_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index ON planet_osm_line USING gist (way);


--
-- Name: planet_osm_line_index_admin_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_admin_level ON planet_osm_line USING btree (admin_level);


--
-- Name: planet_osm_line_index_aeroway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_aeroway ON planet_osm_line USING btree (aeroway);


--
-- Name: planet_osm_line_index_amenity; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_amenity ON planet_osm_line USING btree (amenity);


--
-- Name: planet_osm_line_index_bicycle; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_bicycle ON planet_osm_line USING btree (bicycle);


--
-- Name: planet_osm_line_index_building; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_building ON planet_osm_line USING btree (building);


--
-- Name: planet_osm_line_index_disused; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_disused ON planet_osm_line USING btree (disused);


--
-- Name: planet_osm_line_index_highway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_highway ON planet_osm_line USING btree (highway);


--
-- Name: planet_osm_line_index_landuse; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_landuse ON planet_osm_line USING btree (landuse);


--
-- Name: planet_osm_line_index_leisure; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_leisure ON planet_osm_line USING btree (leisure);


--
-- Name: planet_osm_line_index_military; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_military ON planet_osm_line USING btree (military);


--
-- Name: planet_osm_line_index_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_name ON planet_osm_line USING btree (name);


--
-- Name: planet_osm_line_index_natural; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_natural ON planet_osm_line USING btree ("natural");


--
-- Name: planet_osm_line_index_oneway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_oneway ON planet_osm_line USING btree (oneway);


--
-- Name: planet_osm_line_index_place; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_place ON planet_osm_line USING btree (place);


--
-- Name: planet_osm_line_index_railway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_railway ON planet_osm_line USING btree (railway);


--
-- Name: planet_osm_line_index_route; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_route ON planet_osm_line USING btree (route);


--
-- Name: planet_osm_line_index_tourism; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_tourism ON planet_osm_line USING btree (tourism);


--
-- Name: planet_osm_line_index_waterway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_waterway ON planet_osm_line USING btree (waterway);


--
-- Name: planet_osm_line_index_way_area; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_index_way_area ON planet_osm_line USING btree (way_area);


--
-- Name: planet_osm_line_pkey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_line_pkey ON planet_osm_line USING btree (osm_id);


--
-- Name: planet_osm_point_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index ON planet_osm_point USING gist (way);


--
-- Name: planet_osm_point_index_admin_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_admin_level ON planet_osm_point USING btree (admin_level);


--
-- Name: planet_osm_point_index_aeroway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_aeroway ON planet_osm_point USING btree (aeroway);


--
-- Name: planet_osm_point_index_amenity; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_amenity ON planet_osm_point USING btree (amenity);


--
-- Name: planet_osm_point_index_bicycle; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_bicycle ON planet_osm_point USING btree (bicycle);


--
-- Name: planet_osm_point_index_building; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_building ON planet_osm_point USING btree (building);


--
-- Name: planet_osm_point_index_disused; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_disused ON planet_osm_point USING btree (disused);


--
-- Name: planet_osm_point_index_highway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_highway ON planet_osm_point USING btree (highway);


--
-- Name: planet_osm_point_index_landuse; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_landuse ON planet_osm_point USING btree (landuse);


--
-- Name: planet_osm_point_index_leisure; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_leisure ON planet_osm_point USING btree (leisure);


--
-- Name: planet_osm_point_index_military; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_military ON planet_osm_point USING btree (military);


--
-- Name: planet_osm_point_index_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_name ON planet_osm_point USING btree (name);


--
-- Name: planet_osm_point_index_natural; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_natural ON planet_osm_point USING btree ("natural");


--
-- Name: planet_osm_point_index_oneway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_oneway ON planet_osm_point USING btree (oneway);


--
-- Name: planet_osm_point_index_place; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_place ON planet_osm_point USING btree (place);


--
-- Name: planet_osm_point_index_railway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_railway ON planet_osm_point USING btree (railway);


--
-- Name: planet_osm_point_index_route; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_route ON planet_osm_point USING btree (route);


--
-- Name: planet_osm_point_index_tourism; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_tourism ON planet_osm_point USING btree (tourism);


--
-- Name: planet_osm_point_index_waterway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_index_waterway ON planet_osm_point USING btree (waterway);


--
-- Name: planet_osm_point_pkey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_point_pkey ON planet_osm_point USING btree (osm_id);


--
-- Name: planet_osm_polygon_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index ON planet_osm_polygon USING gist (way);


--
-- Name: planet_osm_polygon_index_admin_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_admin_level ON planet_osm_polygon USING btree (admin_level);


--
-- Name: planet_osm_polygon_index_aeroway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_aeroway ON planet_osm_polygon USING btree (aeroway);


--
-- Name: planet_osm_polygon_index_amenity; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_amenity ON planet_osm_polygon USING btree (amenity);


--
-- Name: planet_osm_polygon_index_bicycle; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_bicycle ON planet_osm_polygon USING btree (bicycle);


--
-- Name: planet_osm_polygon_index_building; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_building ON planet_osm_polygon USING btree (building);


--
-- Name: planet_osm_polygon_index_disused; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_disused ON planet_osm_polygon USING btree (disused);


--
-- Name: planet_osm_polygon_index_highway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_highway ON planet_osm_polygon USING btree (highway);


--
-- Name: planet_osm_polygon_index_landuse; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_landuse ON planet_osm_polygon USING btree (landuse);


--
-- Name: planet_osm_polygon_index_leisure; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_leisure ON planet_osm_polygon USING btree (leisure);


--
-- Name: planet_osm_polygon_index_military; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_military ON planet_osm_polygon USING btree (military);


--
-- Name: planet_osm_polygon_index_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_name ON planet_osm_polygon USING btree (name);


--
-- Name: planet_osm_polygon_index_natural; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_natural ON planet_osm_polygon USING btree ("natural");


--
-- Name: planet_osm_polygon_index_oneway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_oneway ON planet_osm_polygon USING btree (oneway);


--
-- Name: planet_osm_polygon_index_place; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_place ON planet_osm_polygon USING btree (place);


--
-- Name: planet_osm_polygon_index_railway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_railway ON planet_osm_polygon USING btree (railway);


--
-- Name: planet_osm_polygon_index_route; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_route ON planet_osm_polygon USING btree (route);


--
-- Name: planet_osm_polygon_index_tourism; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_tourism ON planet_osm_polygon USING btree (tourism);


--
-- Name: planet_osm_polygon_index_waterway; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_waterway ON planet_osm_polygon USING btree (waterway);


--
-- Name: planet_osm_polygon_index_way_area; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_index_way_area ON planet_osm_polygon USING btree (way_area);


--
-- Name: planet_osm_polygon_pkey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX planet_osm_polygon_pkey ON planet_osm_polygon USING btree (osm_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: planet_osm_line; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE planet_osm_line FROM PUBLIC;
REVOKE ALL ON TABLE planet_osm_line FROM postgres;
GRANT ALL ON TABLE planet_osm_line TO postgres;
GRANT SELECT ON TABLE planet_osm_line TO PUBLIC;


--
-- Name: planet_osm_point; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE planet_osm_point FROM PUBLIC;
REVOKE ALL ON TABLE planet_osm_point FROM postgres;
GRANT ALL ON TABLE planet_osm_point TO postgres;
GRANT SELECT ON TABLE planet_osm_point TO PUBLIC;


--
-- Name: planet_osm_polygon; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE planet_osm_polygon FROM PUBLIC;
REVOKE ALL ON TABLE planet_osm_polygon FROM postgres;
GRANT ALL ON TABLE planet_osm_polygon TO postgres;
GRANT SELECT ON TABLE planet_osm_polygon TO PUBLIC;


--
-- PostgreSQL database dump complete
--

