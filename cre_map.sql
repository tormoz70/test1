CREATE EXTENSION oracle_fdw;

DROP SERVER orastat_tst;
CREATE SERVER orastat_tst FOREIGN DATA WRAPPER oracle_fdw
          OPTIONS (dbserver 'stat_tst');

GRANT USAGE ON FOREIGN SERVER orastat_tst TO postgres;

CREATE USER MAPPING FOR postgres SERVER orastat_tst
          OPTIONS (user 'master', password 'sysdba');

CREATE SCHEMA orastat_mk;
CREATE FOREIGN TABLE orastat_mk.stat_form
    (id                            numeric(10) NOT NULL,
    code                           character varying(30) NOT NULL,
    name                           character varying(256) NOT NULL,
    descr                          character varying(1000),
    period_id                      numeric(10) NOT NULL,
    organization                   character varying(256),
    ministry_id                    numeric(10),
    header                         text,
    s_date                         DATE,
    e_date                         DATE,
    template                       bytea,
    descr_doc                      bytea,
    control_dates                  character varying(4000),
    cumulative_sum                 numeric(1) DEFAULT 0 NOT NULL,
    is_modified                    character(1) DEFAULT 'N' NOT NULL,
    ready_to_sync                  character(1) DEFAULT 'N' NOT NULL,
    early_collect_date             numeric(1) DEFAULT 0,
    date_interval                  numeric,
    dirctn                         character(1) DEFAULT '0' NOT NULL)
SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM');

select * from orastat_mk.stat_form

SELECT oracle_diag('orastat_tst');