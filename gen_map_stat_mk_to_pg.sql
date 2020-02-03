CREATE SCHEMA orastat_mk;
CREATE FOREIGN TABLE orastat_mk.stat_data(
      ID numeric(10,0) NOT NULL
      ,PART_ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0)
      ,GROUP_ID numeric(10,0)
      ,COLLECT_DATE timestamp NOT NULL
      ,STAT_MATRIX bytea
      ,COLLECT_PERIOD character(10) NOT NULL
      ,ORIGINAL_DOC_ID numeric(10,0)
      ,ROW_COUNT numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_DATA');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_data_attributes(
      ID numeric(10,0) NOT NULL
      ,GRAPH_ID numeric(10,0) NOT NULL
      ,PARENT_ROW_ID numeric(10,0) NOT NULL
      ,CLASSIFICATOR_VALUE_ID numeric(10,0)
      ,SEQ_NUM numeric
      ,STAT_DATA_ID numeric
      ,VALUE character varying(2000)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_DATA_ATTRIBUTES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_doc_sources(
      ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0) NOT NULL
      ,DOC_ID numeric(10,0) NOT NULL
      ,ELEMENT_DOC_ID numeric(10,0)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_DOC_SOURCES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form(
      ID numeric(10,0) NOT NULL
      ,CODE character varying(30) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,PERIOD_ID numeric(10,0) NOT NULL
      ,ORGANIZATION character varying(256)
      ,MINISTRY_ID numeric(10,0)
      ,HEADER text
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
      ,TEMPLATE bytea
      ,DESCR_DOC bytea
      ,CONTROL_DATES character varying(4000)
      ,CUMULATIVE_SUM numeric(1,0) NOT NULL
      ,IS_MODIFIED character(1) NOT NULL
      ,READY_TO_SYNC character(1) NOT NULL
      ,EARLY_COLLECT_DATE numeric(1,0)
      ,DATE_INTERVAL numeric
      ,DIRCTN character(1) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form_group(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,GROUP_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM_GROUP');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form_rpts(
      RPTSREG_ID numeric(18,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM_RPTS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form_source(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0) NOT NULL
      ,CONTROL_DATES character varying(1000)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM_SOURCE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form_source_qb(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,SOURCE_QB_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM_SOURCE_QB');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_form_templates(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,NAME character varying(256)
      ,DESCR character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
      ,TEMPLATE bytea
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_FORM_TEMPLATES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_graph(
      ID numeric(10,0) NOT NULL
      ,SEQ_NUMBER numeric(10,0) NOT NULL
      ,CODE character varying(30)
      ,PART_ID numeric(10,0) NOT NULL
      ,NAME character varying(1000)
      ,DESCR character varying(1000)
      ,FROM_CLASSIFICATOR numeric(1,0)
      ,IS_ROW_HEADER numeric(1,0)
      ,SUMM_TYPE character varying(1)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_GRAPH');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_ministry(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(255)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_MINISTRY');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_original_docs(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0)
      ,GROUP_ID numeric(10,0)
      ,PARENT_ID numeric(10,0)
      ,FILE_NAME character varying(200) NOT NULL
      ,DOC_DATA bytea
      ,COLLECT_PERIOD character(10) NOT NULL
      ,UP_COLLECT_PERIOD character varying(10)
      ,LOAD_DATE timestamp NOT NULL
      ,LOAD_ERRORS character varying(200)
      ,ACTUAL_VER numeric(1,0) NOT NULL
      ,CREATE_CODE character varying(1)
      ,COMENT character varying(1000)
      ,ERROR_MSG text
      ,APPROVED numeric(1,0) NOT NULL
      ,LOCKED character(1)
      ,LOCKED_SESSION_ID character varying(64)
      ,LOCKED_TM timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_ORIGINAL_DOCS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_parameters(
      ID numeric(10,0) NOT NULL
      ,PARAM character varying(256) NOT NULL
      ,VAL character varying(256)
      ,APP_USER character varying(30)
      ,C_DATE timestamp NOT NULL
      ,U_DATE timestamp
      ,COMENT character varying(256)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_PARAMETERS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_part(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0) NOT NULL
      ,SEQ_NUMBER numeric(10,0)
      ,CODE character varying(30)
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,PART_SHEET numeric(10,0)
      ,LOGIC_VALIDATION text
      ,VALUE_PRECISION text
      ,LOCKED_CELLS character varying(1000)
      ,INPUT_CALC text
      ,EXCEL_CONVERT character varying(1000)
      ,TRANSFER_FORMAT character varying(1000)
      ,IS_ROUND character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
      ,LINES numeric(5,0)
      ,GRAFS numeric(3,0)
      ,LIST_NAME character varying(256)
      ,OLD text
      ,READONLY_FIELDS text
      ,LOGIC_VALIDATION_EXTRA text
      ,INPUT_CALC_FIXED text
      ,VOLATILE_ROWS numeric(1,0)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_PART');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_periods(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,CODE character varying(2) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_PERIODS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_region_types(
      ID numeric(10,0) NOT NULL
      ,REG_TYPE_CODE character varying(30) NOT NULL
      ,REG_TYPE_NAME character varying(100) NOT NULL
      ,COMENT character varying(200)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_REGION_TYPES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_row(
      ID numeric(10,0) NOT NULL
      ,SEQ_NUMBER numeric(10,0) NOT NULL
      ,CODE character varying(30)
      ,PART_ID numeric(10,0) NOT NULL
      ,NAME character varying(1000)
      ,DESCR character varying(1000)
      ,IS_PATTERN numeric(1,0)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_ROW');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_selected_source(
      SELECTOR_ID character varying(64) NOT NULL
      ,SS_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SELECTED_SOURCE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
      ,REGION_TYPE_ID numeric(10,0)
      ,LONGITUDE numeric(10,6)
      ,LATITUDE numeric(10,6)
      ,PARENT_ID numeric(10,0)
      ,CURR numeric(1,0)
      ,GRP numeric(1,0)
      ,NAME_NP character varying(2000)
      ,NAME_ND character varying(25)
      ,NAME_N40 character varying(50)
      ,DIRECTOR character varying(1000)
      ,ADDRES character varying(4000)
      ,TELEFON character varying(100)
      ,WEB_ADR character varying(1000)
      ,FAX character varying(500)
      ,EMAIL character varying(500)
      ,TER numeric
      ,TA character varying(500)
      ,ZO numeric(1,0)
      ,PR1 numeric(1,0)
      ,KINO numeric(1,0)
      ,NNH numeric
      ,OPF numeric
      ,KV numeric
      ,GANR numeric
      ,KP numeric
      ,SOB numeric
      ,KU numeric
      ,GO numeric
      ,PS numeric(1,0)
      ,PR2 numeric
      ,INN character varying(500)
      ,OKR character varying(500)
      ,PZ numeric(1,0)
      ,PU numeric(1,0)
      ,DM numeric(1,0)
      ,AVTON numeric(1,0)
      ,SELO numeric(1,0)
      ,NAME_NA70 character varying(150)
      ,MOBILE numeric
      ,LIBRARY_TYPE numeric
      ,SCHOOL_TYPE numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_group(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
      ,SUM_VERSION character varying(64)
      ,PARENT_SOURCE_ID numeric
      ,PARENT_GROUP_ID numeric(10,0)
      ,SUMM_HEADER character varying(1000)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_GROUP');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_group_rel(
      ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0) NOT NULL
      ,GROUP_ID numeric(10,0) NOT NULL
      ,SEQ_NUMBER numeric(10,0) NOT NULL
      ,DO_SUM character(1)
      ,AVG_METHOD character varying(30)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_GROUP_REL');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_ministry(
      ID numeric(10,0) NOT NULL
      ,STAT_ID numeric(10,0) NOT NULL
      ,STAT_SOURCE_NAME character varying(255) NOT NULL
      ,MINISTRY_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_MINISTRY');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_qb(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(255) NOT NULL
      ,XML text
      ,QUERY text
      ,COLUMNS character varying(2000)
      ,PARENT_ID numeric(10,0)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_QB');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_qb1(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(255) NOT NULL
      ,XML text
      ,QUERY text
      ,COLUMNS character varying(2000)
      ,COLUMN_NAMES text
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_QB1');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_source_rel(
      ID numeric(10,0) NOT NULL
      ,SOURCE_ID numeric(10,0)
      ,OLD_SOURCE_ID numeric(10,0)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_SOURCE_REL');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_user_forms(
      USER_ID numeric(10,0) NOT NULL
      ,FORM_CODE character varying(30) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_USER_FORMS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_user_sources(
      USER_ID numeric(10,0) NOT NULL
      ,SOURCE_NAME character varying(255) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_USER_SOURCES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.temp11(
      R numeric
      ,ID numeric(10,0) NOT NULL
      ,SEQ_NUMBER numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'TEMP11');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.temp22(
      ID numeric NOT NULL
      ,DISPLAY_NAME character varying(500)
      ,XX character varying(1536)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'TEMP22');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.vr_classificator(
      ID numeric NOT NULL
      ,NAME character varying(100)
      ,DESCR character varying(4000)
      ,DISPLAY_NAME character varying(250)
      ,ACT_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'VR_CLASSIFICATOR');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.vr_classificator_value(
      ID numeric NOT NULL
      ,CODE character varying(30)
      ,DESCRIPTION character varying(500)
      ,CLASSIFICATOR_ID numeric
      ,PARENT_ID numeric
      ,DISPLAY_NAME character varying(500)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'VR_CLASSIFICATOR_VALUE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.additional_files(
      ID numeric(10,0) NOT NULL
      ,STATUS character(1) NOT NULL
      ,FILE_NAME character varying(200)
      ,EXTENSION character varying(200)
      ,FILE_DATA bytea
      ,LOAD_DATE timestamp
      ,DOWNLOAD_DATE timestamp
      ,LOAD_USER_NAME character varying(200)
      ,DOWNLOAD_USER_NAME character varying(200)
      ,FILE_SIZE numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'ADDITIONAL_FILES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_dept(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(100) NOT NULL
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_DEPT');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_function(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,CODE character varying(1000)
      ,ACTION_TYPE numeric(10,0)
      ,OBJECT_TYPE_ID numeric(10,0)
      ,OBJECT_REQ_STATUS numeric(10,0)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_FUNCTION');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_object_type(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(256) NOT NULL
      ,DESCR character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_OBJECT_TYPE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_role(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(30) NOT NULL
      ,DESCR character varying(1000)
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_ROLE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_role_item(
      ID numeric(10,0) NOT NULL
      ,FUNCTION_ID numeric(10,0) NOT NULL
      ,ROLE_ID numeric(10,0) NOT NULL
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_ROLE_ITEM');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_user(
      ID numeric(10,0) NOT NULL
      ,LOGIN character varying(30) NOT NULL
      ,PASSWORD character varying(32) NOT NULL
      ,NAME character varying(100) NOT NULL
      ,TITLE character varying(100)
      ,EMAIL character varying(30)
      ,PHONE character varying(20)
      ,DEPT_ID numeric(10,0) NOT NULL
      ,S_DATE timestamp NOT NULL
      ,E_DATE timestamp
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_USER');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_user_act_log(
      ID numeric(10,0) NOT NULL
      ,ACTION character(1) NOT NULL
      ,OBJECT_ID numeric(10,0)
      ,OBJECT_TYPE_ID numeric(10,0)
      ,STATUS numeric(10,0)
      ,USER_ID numeric(10,0) NOT NULL
      ,ACT_DATE timestamp NOT NULL
      ,DATA_BEFORE character varying(3500)
      ,DATA_AFTER character varying(3500)
      ,PC_INFO character varying(255)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_USER_ACT_LOG');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.au_user_role(
      ID numeric(10,0) NOT NULL
      ,USER_ID numeric(10,0) NOT NULL
      ,ROLE_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'AU_USER_ROLE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.base_object(
      ID numeric(10,0) NOT NULL
      ,OBJECT_TYPE_ID numeric(10,0) NOT NULL
      ,STATUS numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'BASE_OBJECT');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.classificator_extra_field(
      ID numeric NOT NULL
      ,CLASSIFICATOR_ID numeric
      ,SEQNUMBER numeric
      ,TITLE character varying(1000)
      ,TYPE numeric
      ,LENGTH numeric
      ,PRECISION numeric
      ,REF_CLASSIFICATOR_ID numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'CLASSIFICATOR_EXTRA_FIELD');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.classificator_val_extra_field(
      ID numeric NOT NULL
      ,CLASSIFICATOR_VALUE_ID numeric
      ,VAL_NULL numeric
      ,VAL_NUMBER numeric
      ,VAL_DATE timestamp
      ,VAL_VARCHAR character varying(1000)
      ,REF_CLASSIFICATOR_VALUE_ID numeric
      ,EXTRA_FIELD_ID numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'CLASSIFICATOR_VAL_EXTRA_FIELD');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.del(
      C1 numeric(10,0)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'DEL');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.news(
      ID numeric(10,0) NOT NULL
      ,DT timestamp NOT NULL
      ,TITLE character varying(2000) NOT NULL
      ,ANNOT text
      ,NEWS text
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'NEWS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.news_status(
      ID numeric(10,0) NOT NULL
      ,NEWS_ID numeric(10,0) NOT NULL
      ,USER_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'NEWS_STATUS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.object_params(
      OBJECT_ID numeric(10,0) NOT NULL
      ,PARAM_ID character varying(32) NOT NULL
      ,CHAR_VAL character varying(4000)
      ,CLOB_VAL text
      ,BLOB_VAL bytea
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'OBJECT_PARAMS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.object_type_status(
      ID numeric(10,0) NOT NULL
      ,VALUE numeric(10,0) NOT NULL
      ,DESCR character varying(1000)
      ,OBJECT_TYPE_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'OBJECT_TYPE_STATUS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.part_attributes(
      ID numeric(10,0) NOT NULL
      ,PART_ID numeric(10,0) NOT NULL
      ,GRAPH_ID numeric(10,0) NOT NULL
      ,ROW_ID numeric(10,0) NOT NULL
      ,CLASSIFICATOR_ID numeric(10,0) NOT NULL
      ,PARENT_GRAPH_ID numeric(10,0)
      ,PARENT_VALUE_TYPE numeric(10,0)
      ,FOR_ROW_NAME numeric(1,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'PART_ATTRIBUTES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.rptsreg(
      RPTSREG_ID numeric(18,0) NOT NULL
      ,FCODE character varying(30) NOT NULL
      ,FNAME character varying(500) NOT NULL
      ,FDESC character varying(4000)
      ,RUNFORM character varying(500) NOT NULL
      ,DEPRECATED character(1) NOT NULL
      ,CREDATE timestamp NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'RPTSREG');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_add_attributes(
      ID numeric(10,0) NOT NULL
      ,FORM_ID numeric(10,0)
      ,TEMPLATE_ATTR_ID numeric(10,0)
      ,NAME character varying(256) NOT NULL
      ,LIST_EXCEL numeric(2,0)
      ,CELL_EXCEL character varying(8)
      ,ACTIVE numeric(1,0) NOT NULL
      ,LABEL_GUI character varying(256) NOT NULL
      ,LABEL_WEB character varying(256) NOT NULL
      ,DESCR character varying(256)
      ,LIST_NAME character varying(256)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_ADD_ATTRIBUTES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_archive(
      ID numeric(10,0) NOT NULL
      ,NAME character varying(200)
      ,TYPE character(1)
      ,PARENT_ID numeric(10,0)
      ,FILE_NAME character varying(200)
      ,EXTENSION character varying(200)
      ,FILE_DATA bytea
      ,CREATE_DATE timestamp
      ,FILE_SIZE numeric
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_ARCHIVE');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_attr_values(
      ID numeric(10,0) NOT NULL
      ,VALUE character varying(1000)
      ,ATTRIBUTE_ID numeric(10,0) NOT NULL
      ,DOC_ID numeric(10,0) NOT NULL
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_ATTR_VALUES');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_collect_periods(
      SOURCE_ID numeric(10,0)
      ,FORM_ID numeric(10,0) NOT NULL
      ,CONTROL_DATE character varying(255)
      ,STAT_PERIOD character varying(10)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_COLLECT_PERIODS');
----------------------------------------------------------------------------------------------------------------------------------
CREATE FOREIGN TABLE orastat_mk.stat_collect_periods2(
      SOURCE_ID numeric(10,0)
      ,FORM_ID numeric(10,0) NOT NULL
      ,CONTROL_DATE character varying(255)
      ,STAT_PERIOD character varying(10)
   ) SERVER orastat_tst OPTIONS (schema 'STAT_MK', table 'STAT_COLLECT_PERIODS2');
----------------------------------------------------------------------------------------------------------------------------------
