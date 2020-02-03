SELECT a.id, a.classificator_id, c.name, a.seqnumber, a.title, a.type, a.length,
       a.precision, a.ref_classificator_id
  FROM stat_mk.classificator_extra_field a
  inner join stat_mk.vr_classificator c on c.id = a.classificator_id 
  order by name, seqnumber
/  
select c.name cl_name, a.* from stat_mk.vr_classificator_value a
    inner join stat_mk.vr_classificator c on c.id = a.classificator_id
--where lower(c.name) like '%знач%'
where c.id = 91520077
order by cl_name, code
/

SELECT efd.*, decode(efd.type, 1, to_char(ef.val_number), 2, ef.val_varchar, 3, to_char(ef.val_date, 'YYYY.MM.DD'), 4, to_char(ef.ref_classificator_value_id), ef.val_null) as val  
  FROM stat_mk.classificator_val_extra_field ef
    inner join stat_mk.classificator_extra_field efd on efd.id = ef.extra_field_id
/
    
-- Трасформированные атрибуты справочников
select c.name cl_name, a.*
    ,(SELECT decode(efd.type, 1, to_char(ef.val_number), 2, ef.val_varchar, 3, to_char(ef.val_date, 'YYYY.MM.DD'), 4, to_char(ef.ref_classificator_value_id), ef.val_null) as val  
          FROM stat_mk.classificator_val_extra_field ef
            inner join stat_mk.classificator_extra_field efd on efd.id = ef.extra_field_id 
            where efd.classificator_id = a.classificator_id and ef.classificator_value_id = a.id and efd.seqnumber = 1 ) as attr1 
    ,(SELECT decode(efd.type, 1, to_char(ef.val_number), 2, ef.val_varchar, 3, to_char(ef.val_date, 'YYYY.MM.DD'), 4, to_char(ef.ref_classificator_value_id), ef.val_null) as val  
          FROM stat_mk.classificator_val_extra_field ef
            inner join stat_mk.classificator_extra_field efd on efd.id = ef.extra_field_id 
            where efd.classificator_id = a.classificator_id and ef.classificator_value_id = a.id and efd.seqnumber = 10 ) as attr10  
from stat_mk.vr_classificator_value a
    inner join stat_mk.vr_classificator c on c.id = a.classificator_id
--where lower(c.name) like '%знач%'
where c.id = 91610077
  and rownum < 101
order by cl_name, code

asd