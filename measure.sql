set timing on;
set termout off;
set autotrace traceonly;
spool result1.txt;

select count(*) from table_small;
select count(*) from table_medium;
select count(*) from table_big;

select * from table_small where INTEGER_NUMBER < 10;
select * from table_medium where INTEGER_NUMBER < 10;
select * from table_big where INTEGER_NUMBER < 10;

select * from table_small where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select * from table_medium where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select * from table_big where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';

select * from table_small where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';
select * from table_medium where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';
select * from table_big where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';

select * from table_small where SMALL_VARIABLE_CHAR = 'murcia';
select * from table_medium where SMALL_VARIABLE_CHAR = 'murcia';
select * from table_big where SMALL_VARIABLE_CHAR = 'murcia';

set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_small(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat'); 
  end loop;
end;
/
update table_small set SMALL_VARIABLE_CHAR = 'moderate' where SMALL_FIXED_STRING='moderate';
delete from table_small where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_medium(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat'); 
  end loop;
end;
/
update table_medium set SMALL_VARIABLE_CHAR = 'moderate' where SMALL_FIXED_STRING='moderate';
delete from table_medium where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_big(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat')
  end loop;
end;
/
update table_big set SMALL_VARIABLE_CHAR = 'moderate' where SMALL_FIXED_STRING='moderate';
delete from table_big where RAND_DATE='14-FEB-2020';

spool off;
spool result2.txt;

create index small_int_key on table_small(INTEGER_NUMBER);
create index small_date_key on table_small(RAND_DATE);
create index small_lchar_key on table_small(BIG_FIXED_STRING);
create index small_svchar_key on table_small(SMALL_VARIABLE_CHAR);

create index medium_int_key on table_medium(INTEGER_NUMBER);
create index medium_date_key on table_medium(RAND_DATE);
create index medium_lchar_key on table_medium(BIG_FIXED_STRING);
create index medium_svchar_key on table_medium(SMALL_VARIABLE_CHAR);

create index big_int_key on table_big(INTEGER_NUMBER);
create index big_date_key on table_big(RAND_DATE);
create index big_lchar_key on table_big(BIG_FIXED_STRING);
create index big_svchar_key on table_big(SMALL_VARIABLE_CHAR);

select * from table_small;
select * from table_medium;
select * from table_big;

select /*+ index(table_small small_int_key */ * from table_small where INTEGER_NUMBER < 10;
select /*+ index(table_medium medim_int_key */ * from table_medium where INTEGER_NUMBER < 10;
select /*+ index(table_big big_int_key */ * from table_big where INTEGER_NUMBER < 10;

select /*+ index(table_small small_date_key) */ * from table_small where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select /*+ index(table_medium medium_date_key) */ * from table_medium where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select /*+ index(table_big big_date_key) */ * from table_big where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';

select /*+ index(table_small small_lchar_key) */ * from table_small where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';
select /*+ index(table_medium medium_lchar_key) */ * from table_medium where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';
select /*+ index(table_big big_lchar_key) */ * from table_big where BIG_FIXED_STRING = 'microelectronicsmicroelectronics';

select /*+ index(table_small small_svchar_key) */ * from table_small where SMALL_VARIABLE_CHAR = 'murcia';
select /*+ index(table_medium medium_svchar_key) */ * from table_medium where SMALL_VARIABLE_CHAR = 'murcia';
select /*+ index(table_big big_svchar_key) */ * from table_big where SMALL_VARIABLE_CHAR = 'murcia';

set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_small
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat');
  end loop;
end;
/
update table_small set SMALL_VARIABLE_CHAR = 'mikado' where SMALL_FIXED_STRING='moderate';
delete from table_small where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_medium
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat');
  end loop;
end;
/
update table_medium set SMALL_VARIABLE_CHAR = 'mikado' where SMALL_FIXED_STRING='moderate';
delete from table_medium where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_big
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'moderate','machiavellianismmachiavellianism', 'mikado', 'municipalizationmunicipalizat');
  end loop;
end;
/
update table_big set SMALL_VARIABLE_CHAR = 'mikado' where SMALL_FIXED_STRING='moderate';
delete from table_big where RAND_DATE='14-FEB-2020';

drop index small_int_key;
drop index small_float_key;
drop index small_date_key;
drop index small_schar_key;
drop index small_lchar_key;
drop index small_svchar_key;
drop index small_lvchar_key;
drop index medium_int_key;
drop index medium_float_key;
drop index medium_date_key;
drop index medium_schar_key;
drop index medium_lchar_key;
drop index medium_svchar_key;
drop index medium_lvchar_key;
drop index big_int_key;
drop index big_float_key;
drop index big_date_key;
drop index big_schar_key;
drop index big_lchar_key;
drop index big_svchar_key;
drop index big_lvchar_key;
spool off;
set termout on;