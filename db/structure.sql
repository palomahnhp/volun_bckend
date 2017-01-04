--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying,
    description text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    transport text,
    pdf_url character varying,
    entity_id integer,
    area_id integer,
    project_id integer,
    share boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    road_type_id integer,
    road_name character varying,
    road_number_type character varying,
    road_number character varying,
    grader character varying,
    stairs character varying,
    floor character varying,
    door character varying,
    postal_code character varying,
    town character varying,
    province_id integer,
    country character varying,
    ndp_code character varying,
    local_code character varying,
    class_name character varying,
    latitude character varying,
    longitude character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: areas_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE areas_projects (
    area_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: collectives; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collectives (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: collectives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE collectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE collectives_id_seq OWNED BY collectives.id;


--
-- Name: collectives_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collectives_projects (
    collective_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: coordinations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coordinations (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coordinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coordinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coordinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coordinations_id_seq OWNED BY coordinations.id;


--
-- Name: coordinations_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coordinations_projects (
    coordination_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE districts (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- Name: districts_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE districts_projects (
    district_id integer NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying,
    description text,
    documentum_id character varying,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: entities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entities (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    entity_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entities_id_seq OWNED BY entities.id;


--
-- Name: entity_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entity_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: entity_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entity_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entity_types_id_seq OWNED BY entity_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    eventable_id integer,
    eventable_type character varying,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE issues (
    id integer NOT NULL,
    comments text,
    start_date timestamp without time zone,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE issues_id_seq OWNED BY issues.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE links (
    id integer NOT NULL,
    url character varying,
    description text,
    kind integer,
    linkable_id integer,
    linkable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: project_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE project_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT kind_and_id_must_be_equal CHECK (((((((((((id = 6) AND (kind = 6)) OR ((id = 5) AND (kind = 5))) OR ((id = 1) AND (kind = 1))) OR ((id = 2) AND (kind = 2))) OR ((id = 3) AND (kind = 3))) OR ((id = 4) AND (kind = 4))) OR ((id = 5) AND (kind = 5))) OR ((id = 6) AND (kind = 6))) OR ((id = 7) AND (kind = 7))))
);


--
-- Name: project_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_types_id_seq OWNED BY project_types.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    description text,
    functions character varying,
    execution_start_date date,
    execution_end_date date,
    contact_name character varying,
    contact_first_surname character varying,
    contact_second_surname character varying,
    phone_number character varying,
    email character varying,
    comments text,
    beneficiaries_num integer,
    volunteers_num integer,
    insured boolean DEFAULT false,
    volunteers_allowed boolean DEFAULT false,
    public boolean DEFAULT false,
    outstanding boolean DEFAULT false,
    insurance_date date,
    project_type_id integer,
    pt_extendable_id integer,
    pt_extendable_type character varying,
    entity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT extendable_must_be_consistent CHECK (((((((((project_type_id = 1) AND (pt_extendable_type IS NULL)) OR ((project_type_id = 2) AND (pt_extendable_type IS NULL))) OR ((project_type_id = 3) AND (pt_extendable_type IS NULL))) OR ((project_type_id = 4) AND (pt_extendable_type IS NULL))) OR ((project_type_id = 7) AND (pt_extendable_type IS NULL))) OR ((project_type_id = 6) AND ((pt_extendable_type)::text = 'Pt::Subvention'::text))) OR ((project_type_id = 5) AND ((pt_extendable_type)::text = 'Pt::Entity'::text))))
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: projects_timetables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_timetables (
    project_id integer NOT NULL,
    timetable_id integer NOT NULL
);


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proposals (
    id integer NOT NULL,
    name character varying,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proposals_id_seq OWNED BY proposals.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provinces (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provinces_id_seq OWNED BY provinces.id;


--
-- Name: pt_entities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pt_entities (
    id integer NOT NULL,
    request_date date,
    request_description text,
    volunteers_profile character varying,
    activities text,
    sav_date date,
    derived_volunteers_num integer,
    added_volunteers_num integer,
    agreement_signed boolean DEFAULT false,
    agreement_date date,
    prevailing boolean DEFAULT false,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_entities_id_seq OWNED BY pt_entities.id;


--
-- Name: pt_subventions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pt_subventions (
    id integer NOT NULL,
    representative_name character varying,
    representative_first_surname character varying,
    representative_second_surname character varying,
    id_num character varying,
    vat_num character varying,
    entity_registry boolean DEFAULT false,
    cost double precision,
    requested_amount double precision,
    subsidized_amount double precision,
    initial_volunteers_num integer,
    participants_num integer,
    has_quality_evaluation boolean DEFAULT false,
    proposal_id integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pt_subventions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pt_subventions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pt_subventions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pt_subventions_id_seq OWNED BY pt_subventions.id;


--
-- Name: record_histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE record_histories (
    id integer NOT NULL,
    user_id integer,
    recordable_id integer,
    recordable_type character varying,
    recordable_changed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: record_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE record_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: record_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE record_histories_id_seq OWNED BY record_histories.id;


--
-- Name: rejection_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rejection_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rejection_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rejection_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rejection_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rejection_types_id_seq OWNED BY rejection_types.id;


--
-- Name: request_forms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE request_forms (
    id integer NOT NULL,
    request_type_id integer,
    rt_extendable_id integer,
    rt_extendable_type character varying,
    user_id integer,
    sent_at timestamp without time zone,
    status integer,
    status_date timestamp without time zone,
    rejection_type_id integer,
    comments text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: request_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_forms_id_seq OWNED BY request_forms.id;


--
-- Name: request_reasons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE request_reasons (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: request_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_reasons_id_seq OWNED BY request_reasons.id;


--
-- Name: request_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE request_types (
    id integer NOT NULL,
    kind integer,
    description text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: request_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE request_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE request_types_id_seq OWNED BY request_types.id;


--
-- Name: road_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE road_types (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: road_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE road_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: road_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE road_types_id_seq OWNED BY road_types.id;


--
-- Name: rt_activity_publishings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_activity_publishings (
    id integer NOT NULL,
    name character varying,
    organizer character varying,
    description text,
    execution_date date,
    execution_hour character varying,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    town character varying,
    province character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_activity_publishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_activity_publishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_activity_publishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_activity_publishings_id_seq OWNED BY rt_activity_publishings.id;


--
-- Name: rt_activity_unpublishings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_activity_unpublishings (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_activity_unpublishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_activity_unpublishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_activity_unpublishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_activity_unpublishings_id_seq OWNED BY rt_activity_unpublishings.id;


--
-- Name: rt_entity_subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_entity_subscribes (
    id integer NOT NULL,
    name character varying,
    vat_num character varying,
    email character varying,
    contact_name character varying,
    contact_first_surname character varying,
    contact_second_surname character varying,
    representative_name character varying,
    representative_first_surname character varying,
    representative_second_surname character varying,
    phone_number character varying,
    phone_number_alt character varying,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    town character varying,
    province character varying,
    request_reason_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_entity_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_entity_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_entity_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_entity_subscribes_id_seq OWNED BY rt_entity_subscribes.id;


--
-- Name: rt_entity_unsubscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_entity_unsubscribes (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_entity_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_entity_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_entity_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_entity_unsubscribes_id_seq OWNED BY rt_entity_unsubscribes.id;


--
-- Name: rt_others; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_others (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_others_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_others_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_others_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_others_id_seq OWNED BY rt_others.id;


--
-- Name: rt_project_publishings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_project_publishings (
    id integer NOT NULL,
    description text,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    town character varying,
    province character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_publishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_publishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_publishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_publishings_id_seq OWNED BY rt_project_publishings.id;


--
-- Name: rt_project_unpublishings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_project_unpublishings (
    id integer NOT NULL,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_unpublishings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_unpublishings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_unpublishings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_unpublishings_id_seq OWNED BY rt_project_unpublishings.id;


--
-- Name: rt_project_unsubscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_project_unsubscribes (
    id integer NOT NULL,
    project_id integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_project_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_project_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_project_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_project_unsubscribes_id_seq OWNED BY rt_project_unsubscribes.id;


--
-- Name: rt_volunteer_amendments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_volunteer_amendments (
    id integer NOT NULL,
    volunteer_id integer,
    address_id integer,
    phone_number character varying,
    phone_number_alt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_amendments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_amendments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_amendments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_amendments_id_seq OWNED BY rt_volunteer_amendments.id;


--
-- Name: rt_volunteer_appointments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_volunteer_appointments (
    id integer NOT NULL,
    volunteer_id integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_appointments_id_seq OWNED BY rt_volunteer_appointments.id;


--
-- Name: rt_volunteer_subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_volunteer_subscribes (
    id integer NOT NULL,
    name character varying,
    first_surname character varying,
    second_surname character varying,
    phone_number character varying,
    phone_number_alt character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_subscribes_id_seq OWNED BY rt_volunteer_subscribes.id;


--
-- Name: rt_volunteer_unsubscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_volunteer_unsubscribes (
    id integer NOT NULL,
    volunteer_id integer,
    level integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteer_unsubscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteer_unsubscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteer_unsubscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteer_unsubscribes_id_seq OWNED BY rt_volunteer_unsubscribes.id;


--
-- Name: rt_volunteers_demands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rt_volunteers_demands (
    id integer NOT NULL,
    description text,
    execution_start_date date,
    execution_end_date date,
    road_type character varying,
    road_name character varying,
    number_type character varying,
    road_number character varying,
    postal_code character varying,
    town character varying,
    province character varying,
    requested_volunteers_num character varying,
    volunteers_profile text,
    volunteer_functions_1 text,
    volunteer_functions_2 text,
    volunteer_functions_3 text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rt_volunteers_demands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rt_volunteers_demands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rt_volunteers_demands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rt_volunteers_demands_id_seq OWNED BY rt_volunteers_demands.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: timetables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE timetables (
    id integer NOT NULL,
    event_id integer,
    execution_date date,
    start_hour character varying,
    end_hour character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: timetables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timetables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timetables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE timetables_id_seq OWNED BY timetables.id;


--
-- Name: trackings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackings (
    id integer NOT NULL,
    comments text,
    start_date timestamp without time zone,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trackings_id_seq OWNED BY trackings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    locale character varying,
    profileable_id integer,
    profileable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    name character varying,
    first_surname character varying,
    second_surname character varying,
    age integer,
    id_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY collectives ALTER COLUMN id SET DEFAULT nextval('collectives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinations ALTER COLUMN id SET DEFAULT nextval('coordinations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities ALTER COLUMN id SET DEFAULT nextval('entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entity_types ALTER COLUMN id SET DEFAULT nextval('entity_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_types ALTER COLUMN id SET DEFAULT nextval('project_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposals ALTER COLUMN id SET DEFAULT nextval('proposals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY provinces ALTER COLUMN id SET DEFAULT nextval('provinces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_entities ALTER COLUMN id SET DEFAULT nextval('pt_entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions ALTER COLUMN id SET DEFAULT nextval('pt_subventions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY record_histories ALTER COLUMN id SET DEFAULT nextval('record_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rejection_types ALTER COLUMN id SET DEFAULT nextval('rejection_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms ALTER COLUMN id SET DEFAULT nextval('request_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_reasons ALTER COLUMN id SET DEFAULT nextval('request_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_types ALTER COLUMN id SET DEFAULT nextval('request_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY road_types ALTER COLUMN id SET DEFAULT nextval('road_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_publishings ALTER COLUMN id SET DEFAULT nextval('rt_activity_publishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_activity_unpublishings ALTER COLUMN id SET DEFAULT nextval('rt_activity_unpublishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes ALTER COLUMN id SET DEFAULT nextval('rt_entity_subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_entity_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_others ALTER COLUMN id SET DEFAULT nextval('rt_others_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_publishings ALTER COLUMN id SET DEFAULT nextval('rt_project_publishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unpublishings ALTER COLUMN id SET DEFAULT nextval('rt_project_unpublishings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_project_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_amendments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_appointments ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_appointments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_subscribes ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes ALTER COLUMN id SET DEFAULT nextval('rt_volunteer_unsubscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteers_demands ALTER COLUMN id SET DEFAULT nextval('rt_volunteers_demands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY timetables ALTER COLUMN id SET DEFAULT nextval('timetables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackings ALTER COLUMN id SET DEFAULT nextval('trackings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: collectives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collectives
    ADD CONSTRAINT collectives_pkey PRIMARY KEY (id);


--
-- Name: coordinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coordinations
    ADD CONSTRAINT coordinations_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entity_types
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: project_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY project_types
    ADD CONSTRAINT project_types_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: pt_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pt_entities
    ADD CONSTRAINT pt_entities_pkey PRIMARY KEY (id);


--
-- Name: pt_subventions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT pt_subventions_pkey PRIMARY KEY (id);


--
-- Name: record_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY record_histories
    ADD CONSTRAINT record_histories_pkey PRIMARY KEY (id);


--
-- Name: rejection_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rejection_types
    ADD CONSTRAINT rejection_types_pkey PRIMARY KEY (id);


--
-- Name: request_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT request_forms_pkey PRIMARY KEY (id);


--
-- Name: request_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY request_reasons
    ADD CONSTRAINT request_reasons_pkey PRIMARY KEY (id);


--
-- Name: request_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY request_types
    ADD CONSTRAINT request_types_pkey PRIMARY KEY (id);


--
-- Name: road_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY road_types
    ADD CONSTRAINT road_types_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_activity_publishings
    ADD CONSTRAINT rt_activity_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_activity_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_activity_unpublishings
    ADD CONSTRAINT rt_activity_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT rt_entity_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_entity_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_entity_unsubscribes
    ADD CONSTRAINT rt_entity_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_others_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_others
    ADD CONSTRAINT rt_others_pkey PRIMARY KEY (id);


--
-- Name: rt_project_publishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_project_publishings
    ADD CONSTRAINT rt_project_publishings_pkey PRIMARY KEY (id);


--
-- Name: rt_project_unpublishings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_project_unpublishings
    ADD CONSTRAINT rt_project_unpublishings_pkey PRIMARY KEY (id);


--
-- Name: rt_project_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_project_unsubscribes
    ADD CONSTRAINT rt_project_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_amendments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT rt_volunteer_amendments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_volunteer_appointments
    ADD CONSTRAINT rt_volunteer_appointments_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_volunteer_subscribes
    ADD CONSTRAINT rt_volunteer_subscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteer_unsubscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT rt_volunteer_unsubscribes_pkey PRIMARY KEY (id);


--
-- Name: rt_volunteers_demands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rt_volunteers_demands
    ADD CONSTRAINT rt_volunteers_demands_pkey PRIMARY KEY (id);


--
-- Name: timetables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timetables
    ADD CONSTRAINT timetables_pkey PRIMARY KEY (id);


--
-- Name: trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackings
    ADD CONSTRAINT trackings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_province_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_province_id ON addresses USING btree (province_id);


--
-- Name: index_addresses_on_road_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_road_type_id ON addresses USING btree (road_type_id);


--
-- Name: index_areas_projects_on_area_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_areas_projects_on_area_id_and_project_id ON areas_projects USING btree (area_id, project_id);


--
-- Name: index_areas_projects_on_project_id_and_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_areas_projects_on_project_id_and_area_id ON areas_projects USING btree (project_id, area_id);


--
-- Name: index_collectives_projects_on_collective_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collectives_projects_on_collective_id_and_project_id ON collectives_projects USING btree (collective_id, project_id);


--
-- Name: index_collectives_projects_on_project_id_and_collective_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collectives_projects_on_project_id_and_collective_id ON collectives_projects USING btree (project_id, collective_id);


--
-- Name: index_coordinations_projects_on_coordination_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coordinations_projects_on_coordination_id_and_project_id ON coordinations_projects USING btree (coordination_id, project_id);


--
-- Name: index_coordinations_projects_on_project_id_and_coordination_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coordinations_projects_on_project_id_and_coordination_id ON coordinations_projects USING btree (project_id, coordination_id);


--
-- Name: index_districts_projects_on_district_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_districts_projects_on_district_id_and_project_id ON districts_projects USING btree (district_id, project_id);


--
-- Name: index_districts_projects_on_project_id_and_district_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_districts_projects_on_project_id_and_district_id ON districts_projects USING btree (project_id, district_id);


--
-- Name: index_documents_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_documents_on_project_id ON documents USING btree (project_id);


--
-- Name: index_entities_on_entity_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_entities_on_entity_type_id ON entities USING btree (entity_type_id);


--
-- Name: index_events_on_eventable_type_and_eventable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_eventable_type_and_eventable_id ON events USING btree (eventable_type, eventable_id);


--
-- Name: index_issues_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_issues_on_project_id ON issues USING btree (project_id);


--
-- Name: index_links_on_linkable_type_and_linkable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_links_on_linkable_type_and_linkable_id ON links USING btree (linkable_type, linkable_id);


--
-- Name: index_projects_on_entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_entity_id ON projects USING btree (entity_id);


--
-- Name: index_projects_on_project_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_project_type_id ON projects USING btree (project_type_id);


--
-- Name: index_projects_on_pt_extendable_type_and_pt_extendable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_pt_extendable_type_and_pt_extendable_id ON projects USING btree (pt_extendable_type, pt_extendable_id);


--
-- Name: index_projects_timetables_on_project_id_and_timetable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_timetables_on_project_id_and_timetable_id ON projects_timetables USING btree (project_id, timetable_id);


--
-- Name: index_projects_timetables_on_timetable_id_and_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_timetables_on_timetable_id_and_project_id ON projects_timetables USING btree (timetable_id, project_id);


--
-- Name: index_pt_entities_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_entities_on_project_id ON pt_entities USING btree (project_id);


--
-- Name: index_pt_subventions_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_subventions_on_project_id ON pt_subventions USING btree (project_id);


--
-- Name: index_pt_subventions_on_proposal_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pt_subventions_on_proposal_id ON pt_subventions USING btree (proposal_id);


--
-- Name: index_record_histories_on_recordable_type_and_recordable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_record_histories_on_recordable_type_and_recordable_id ON record_histories USING btree (recordable_type, recordable_id);


--
-- Name: index_record_histories_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_record_histories_on_user_id ON record_histories USING btree (user_id);


--
-- Name: index_request_forms_on_rejection_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_request_forms_on_rejection_type_id ON request_forms USING btree (rejection_type_id);


--
-- Name: index_request_forms_on_request_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_request_forms_on_request_type_id ON request_forms USING btree (request_type_id);


--
-- Name: index_request_forms_on_rt_extendable_type_and_rt_extendable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_request_forms_on_rt_extendable_type_and_rt_extendable_id ON request_forms USING btree (rt_extendable_type, rt_extendable_id);


--
-- Name: index_request_forms_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_request_forms_on_user_id ON request_forms USING btree (user_id);


--
-- Name: index_rt_entity_subscribes_on_request_reason_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_entity_subscribes_on_request_reason_id ON rt_entity_subscribes USING btree (request_reason_id);


--
-- Name: index_rt_project_unsubscribes_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_project_unsubscribes_on_project_id ON rt_project_unsubscribes USING btree (project_id);


--
-- Name: index_rt_volunteer_amendments_on_address_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_volunteer_amendments_on_address_id ON rt_volunteer_amendments USING btree (address_id);


--
-- Name: index_rt_volunteer_amendments_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_volunteer_amendments_on_volunteer_id ON rt_volunteer_amendments USING btree (volunteer_id);


--
-- Name: index_rt_volunteer_appointments_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_volunteer_appointments_on_volunteer_id ON rt_volunteer_appointments USING btree (volunteer_id);


--
-- Name: index_rt_volunteer_unsubscribes_on_volunteer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rt_volunteer_unsubscribes_on_volunteer_id ON rt_volunteer_unsubscribes USING btree (volunteer_id);


--
-- Name: index_trackings_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_trackings_on_project_id ON trackings USING btree (project_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_profileable_type_and_profileable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_profileable_type_and_profileable_id ON users USING btree (profileable_type, profileable_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0286d8b237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_0286d8b237 FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: fk_rails_11a4b85b23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT fk_rails_11a4b85b23 FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- Name: fk_rails_1546fdc6de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_unsubscribes
    ADD CONSTRAINT fk_rails_1546fdc6de FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_1cc9427642; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_appointments
    ADD CONSTRAINT fk_rails_1cc9427642 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_25bfa3a243; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_25bfa3a243 FOREIGN KEY (volunteer_id) REFERENCES volunteers(id);


--
-- Name: fk_rails_3184e37ad1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY record_histories
    ADD CONSTRAINT fk_rails_3184e37ad1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_337988b857; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_volunteer_amendments
    ADD CONSTRAINT fk_rails_337988b857 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk_rails_55cfc1b0e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT fk_rails_55cfc1b0e0 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_899c8f3231; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT fk_rails_899c8f3231 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_8fad3bcf60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_8fad3bcf60 FOREIGN KEY (rejection_type_id) REFERENCES rejection_types(id);


--
-- Name: fk_rails_a27333cee5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_entity_subscribes
    ADD CONSTRAINT fk_rails_a27333cee5 FOREIGN KEY (request_reason_id) REFERENCES request_reasons(id);


--
-- Name: fk_rails_bae3bd12c1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_entities
    ADD CONSTRAINT fk_rails_bae3bd12c1 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_c012c7264f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackings
    ADD CONSTRAINT fk_rails_c012c7264f FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_c52bb7b5dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pt_subventions
    ADD CONSTRAINT fk_rails_c52bb7b5dc FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_d7ca4cafeb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_d7ca4cafeb FOREIGN KEY (project_type_id) REFERENCES project_types(id);


--
-- Name: fk_rails_d97274598d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_d97274598d FOREIGN KEY (request_type_id) REFERENCES request_types(id);


--
-- Name: fk_rails_f4b5a45eed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY request_forms
    ADD CONSTRAINT fk_rails_f4b5a45eed FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_f547f2af04; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rt_project_unsubscribes
    ADD CONSTRAINT fk_rails_f547f2af04 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_f8a44fe9bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_rails_f8a44fe9bf FOREIGN KEY (entity_type_id) REFERENCES entity_types(id);


--
-- Name: fk_rails_fe88fb4ec0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_fe88fb4ec0 FOREIGN KEY (road_type_id) REFERENCES road_types(id);


--
-- Name: fk_rails_ffd1fb1016; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_ffd1fb1016 FOREIGN KEY (entity_id) REFERENCES entities(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20170102144753');

INSERT INTO schema_migrations (version) VALUES ('20170102144754');

INSERT INTO schema_migrations (version) VALUES ('20170102144756');

INSERT INTO schema_migrations (version) VALUES ('20170102144757');

INSERT INTO schema_migrations (version) VALUES ('20170102144758');

INSERT INTO schema_migrations (version) VALUES ('20170102144759');

INSERT INTO schema_migrations (version) VALUES ('20170102144800');

INSERT INTO schema_migrations (version) VALUES ('20170102144802');

INSERT INTO schema_migrations (version) VALUES ('20170102144803');

INSERT INTO schema_migrations (version) VALUES ('20170102144804');

INSERT INTO schema_migrations (version) VALUES ('20170102144805');

INSERT INTO schema_migrations (version) VALUES ('20170102144806');

INSERT INTO schema_migrations (version) VALUES ('20170102144808');

INSERT INTO schema_migrations (version) VALUES ('20170102144809');

INSERT INTO schema_migrations (version) VALUES ('20170102144810');

INSERT INTO schema_migrations (version) VALUES ('20170102144811');

INSERT INTO schema_migrations (version) VALUES ('20170102144812');

INSERT INTO schema_migrations (version) VALUES ('20170102144814');

INSERT INTO schema_migrations (version) VALUES ('20170102144815');

INSERT INTO schema_migrations (version) VALUES ('20170102144816');

INSERT INTO schema_migrations (version) VALUES ('20170102144817');

INSERT INTO schema_migrations (version) VALUES ('20170102144819');

INSERT INTO schema_migrations (version) VALUES ('20170102144820');

INSERT INTO schema_migrations (version) VALUES ('20170102144821');

INSERT INTO schema_migrations (version) VALUES ('20170102144823');

INSERT INTO schema_migrations (version) VALUES ('20170102144824');

INSERT INTO schema_migrations (version) VALUES ('20170102144826');

INSERT INTO schema_migrations (version) VALUES ('20170102144828');

INSERT INTO schema_migrations (version) VALUES ('20170102144830');

INSERT INTO schema_migrations (version) VALUES ('20170102144831');

INSERT INTO schema_migrations (version) VALUES ('20170102144833');

INSERT INTO schema_migrations (version) VALUES ('20170102144835');

INSERT INTO schema_migrations (version) VALUES ('20170102144836');

INSERT INTO schema_migrations (version) VALUES ('20170102144837');

INSERT INTO schema_migrations (version) VALUES ('20170102144838');

INSERT INTO schema_migrations (version) VALUES ('20170102144840');

INSERT INTO schema_migrations (version) VALUES ('20170102144841');

INSERT INTO schema_migrations (version) VALUES ('20170102144842');

INSERT INTO schema_migrations (version) VALUES ('20170102144844');

INSERT INTO schema_migrations (version) VALUES ('20170102144845');

INSERT INTO schema_migrations (version) VALUES ('20170102144847');

INSERT INTO schema_migrations (version) VALUES ('20170102144848');

INSERT INTO schema_migrations (version) VALUES ('20170102144849');

INSERT INTO schema_migrations (version) VALUES ('20170102144850');

INSERT INTO schema_migrations (version) VALUES ('20170102144851');

INSERT INTO schema_migrations (version) VALUES ('20170102144852');

INSERT INTO schema_migrations (version) VALUES ('20170102144853');

INSERT INTO schema_migrations (version) VALUES ('20170302083218');

INSERT INTO schema_migrations (version) VALUES ('20170303083217');

