create table table_small(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(32),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(32));
create table table_medium(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(32),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(32));
create table table_big(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(32),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(32));
set serveroutput on
declare
  type small is table of varchar(8);
  small_fixed small;
  small_variable small;
  type huge is table of varchar(32);
  big_fixed huge;
  big_variable huge;
  rnd_int int;
  rnd_ind int;
  rnd_inde int;
  rnd_day int;
  rnd_flt float;
begin
  small_fixed := small('montcalm', 'misology', 'maleness', 'mcnamara', 'manichee', 'melchers', 'manuring', 'marjoram', 'moderate', 'menthene');
  small_variable := small('mikado', 'murcia', 'mum', 'media', 'merk', 'misce','melville', 'monsieur', 'metanira', 'modeller');
  big_fixed := huge('microelectronicsmicroelectronics', 'mechanotherapistmechanotherapist', 'meteorologicallymeteorologically', 'maladministratormaladministrator', 'machiavellianismmachiavellianism');
  big_variable:= huge('multituberculatemultituberc', 'malapportionmentmalapportionmen', 'multiflagellatedmultiflagellat', 'municipalizationmunicipalizat', 'magnetogeneratormagnetogener');
  
  for i in 1..2000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,1000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_small
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
  for i in 1..200000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,100000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_medium
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
  for i in 1..20000000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,1000000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_big
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
end;
/