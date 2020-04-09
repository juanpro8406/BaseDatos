select * from dba_tablespaces;

select * from dba_data_files;

create tablespace TallerPRPU
datafile 'D:\Taller\Taller01' size 100M
extent management local autoallocate;

alter session set "_ORACLE_SCRIPT"=TRUE;

create user PRUEBA1
identified by "PR123"
default tablespace TallerPRPU
quota unlimited on TallerPRPU
grant create session to PRUEBA1;


create user PRUEBA2
identified by "PR123"
default tablespace TallerPRPU
quota unlimited on TallerPRPU
grant create session to PRUEBA2;

select * from user_resource_limits

select * from dba_profiles

Create profile PERFIL_CONSULTA limit
Sessions_per_user     3-----------------------------Sesiones Por Usuario 3
Connect_time          60----------------------------tiempo de conexión: 60
Idle_time             30----------------------------tiempo de inactividad: 30
Password_life_time    unlimited---------------------------tiempo de vida de la contraseña: Ilimitada * /


Select * from DBA_PROFILES where PROFILE = 'PERFIL_CONSULTA'AND NOT LIMIT ='DEFAULT';

CREATE ROLE APP_ROLE;

GRANT CREATE TABLE TO APP_ROLE;
GRANT RESOURCE TO APP_ROLE;
GRANT SELECT_CATALOG_ROLE TO APP_ROLE;
GRANT ALTER ANY TABLE TO APP_ROLE;


select * from dba_sys_privs where grantee = 'APP_ROLE'

select * from DBA_ROLE_PRIVS WHERE GRANTEE = 'APP_ROLE' order by GRANTEE;

alter user PRUEBA1 profile PERFIL_CONSULTA;

alter user PRUEBA2 profile PERFIL_CONSULTA;

GRANT APP_ROLE TO PRUEBA1;

GRANT APP_ROLE TO PRUEBA2;


SELECT * FROM SYSTEM_PRIVILEGE_MAP;
SELECT * FROM dba_sys_privs WHERE GRANTEE ='PRUEBA1'
SELECT * FROM dba_sys_privs WHERE GRANTEE ='PRUEBA2';
select * from dba_sys_privs where grantee = 'APP_ROLE'


CREATE ROLE ADMINISTRADORES;

GRANT DBA TO ADMINISTRADORES;


select * from dba_sys_privs where grantee = 'ADMINISTRADORES'

select * from DBA_ROLE_PRIVS WHERE GRANTEE = 'ADMINISTRADORES' order by GRANTEE;

select username,user_id,account_status,default_tablespace from dba_users where default_tablespace = 'system';

select username, granted_role
   from user_role_privs
   
   select username, granted_role
   from user_role_privs
   
   
  GRANT DBA TO PRUEBA1  

  REVOKE "APP_ROLE" FROM "PRUEBA1";
  
  GRANT ADMINISTRADORES TO PRUEBA1;
  
  select username, profile from dba_users WHERE USERNAME ='PRUEBA1'; 
  
  DROP PROFILE PERFIL_CONSULTA CASCADE; 



