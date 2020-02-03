create table tmp_output (
   ord number, txt varchar2(4000)
);

DROP SEQUENCE seq_tmp_output;
CREATE SEQUENCE seq_tmp_output
  INCREMENT BY 1
  START WITH 1
  MINVALUE 0
  MAXVALUE 9999999999
  NOCYCLE
  NOORDER
  CACHE 2
/


declare
    --cs_ora_gen_schema varchar2(100) := 'STAT_MK';
    --cs_remote_ora_server varchar2(100) := 'orastat_tst';
    --cs_pg_target_schema varchar2(100) := 'orastat_mk';
    cs_ora_gen_schema varchar2(100) := 'STAT_PORTAL_MK';
    cs_remote_ora_server varchar2(100) := 'orastat_tst';
    cs_pg_target_schema varchar2(100) := 'orastat_portal_mk';
    is_first_col boolean;
    tab varchar2(100) := '   ';
    atype varchar2(30);
    procedure append_line(p_txt varchar2) 
    is
    begin
        insert into tmp_output(ord, txt)
        values(seq_tmp_output.nextval, p_txt);
    end; 
    procedure append_table(p_schema varchar2, p_table varchar2)
    is
    begin
        append_line('CREATE FOREIGN TABLE '||lower(cs_pg_target_schema)||'.'||lower(p_table)||'(');
        is_first_col := true; 
        for c in (select a.column_id, a.column_name, a.data_type, a.data_length, a.data_precision, a.data_scale, a.nullable, a.data_default, c.comments from all_tab_columns a
                        inner join all_col_comments c on c.owner = a.owner and c.table_name = a.table_name and c.column_name = a.column_name  
                   where a.owner = upper(p_schema)
                     and a.table_name = upper(p_table)
                   order by COLUMN_ID)
        loop
            atype := case 
                    when c.data_type in ('VARCHAR', 'VARCHAR2', 'NVARCHAR2') then 'character varying('||c.data_length||')'
                    when c.data_type in ('CHAR') then 'character('||c.data_length||')'
                    when c.data_type in ('CLOB', 'LONG') then 'text'
                    when c.data_type in ('BLOB') then 'bytea'
                    when c.data_type in ('DATE') then 'timestamp'
                    when c.data_type in ('NUMBER') then 'numeric' || (case when c.data_precision is not null 
                                                                           then '('||c.data_precision||(case when c.data_scale is not null 
                                                                                                             then ','||c.data_scale 
                                                                                                             else '' 
                                                                                                        end)||')' 
                                                                           else '' 
                                                                      end)
                    else 'unknown' end;
            append_line(tab||tab||(case when is_first_col then '' else ',' end)||c.column_name|| ' ' || atype || (case c.nullable when 'N' then ' NOT NULL' else '' end));
            is_first_col := false;
        end loop;
        append_line(tab||') SERVER '||cs_remote_ora_server||' OPTIONS (schema '''||upper(p_schema)||''', table '''||upper(p_table)||''');');
        append_line('----------------------------------------------------------------------------------------------------------------------------------');            
    end; 
begin
    execute immediate 'truncate table tmp_output';
    for c in (select * from all_tables a where a.owner = cs_ora_gen_schema and a.temporary = 'N') loop
        append_table(upper(c.owner), upper(c.table_name));
    end loop;
end;
/
--select * from tmp_output order by 1
/
