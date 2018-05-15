CREATE TABLE empleados
(
   dni            CHAR (9) PRIMARY KEY,
   nomemp         VARCHAR2 (50),
   jefe           CHAR (9),
   departamento   INTEGER,
   salario        NUMBER (9, 2) DEFAULT 1000 ,
   usuario        VARCHAR2 (50),
   fecha          DATE,
   FOREIGN KEY (jefe) REFERENCES empleados (dni)
);

CREATE TABLE empleados_baja
(
   dni            CHAR (9) PRIMARY KEY,
   nomemp         VARCHAR2 (50),
   jefe           CHAR (9),
   departamento   INTEGER,
   salario        NUMBER (9, 2) DEFAULT 1000 ,
   usuario        VARCHAR2 (50),
   fecha          DATE
);

INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('11111111H','Antonio Ruiz', null,1,2500,'aruiz',to_date('14/03/2001','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('00415843A','Francisco Sanchez', '11111111H',1,1200,'fsanchez',to_date('30/08/2009','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('54887531B','Victor Murillo', '11111111H',1,1000,'vmurillo',to_date('14/09/2010','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('12109810C','Sonia Castillo', '11111111H',1,800,'scastillo',to_date('01/02/2014','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('63300147D','Jose Gonzalez', '11111111H',1,2500,'jgonzalez',to_date('18/04/2008','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('22222222J','María Robles', null,2,2700,'mlopez',to_date('21/06/1998','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('96365410E','Luis Marquez', '22222222J',2,1400,'lmarquez',to_date('14/03/2001','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('01012453F','Alfonso Jimenez', '22222222J',2,1650,'ajimenez',to_date('14/03/2001','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('96334478G','Silvia Dominguez', '22222222J',2,1120,'sdominguez',to_date('14/03/2001','dd/mm/yyyy'));
INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('31211048H','Manuel Moreno', '22222222J',2,900,'mmoreno',to_date('14/03/2001','dd/mm/yyyy'));

---------------


-- Ejercicio 1
create or replace trigger jefes
before insert on empleados
for each row
declare
  supervisa integer;
begin
  select count(*) into supervisa from empleados where jefe = :new.jefe;
  if (supervisa > 4) then
    raise_application_error (-20600,:new.jefe||'no se puede supervisar más de 5');
  end if;
end;


-- Este insert dará error
-- INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('31222048C','Manuel Moreno', '22222222J',2,900,'mmoreno',to_date('14/03/2001','dd/mm/yyyy'));


-- Ejercicio 2
create or replace trigger salarios
before update on empleados
for each row
declare
  salario integer;
begin
  select count(*) into salario from empleados where salario = :old.salario;
if (:new.salario > :old.salario * 1.20) then
  raise_application_error (-20600,:new.salario||'no se puede aumentar más de 20%');
end if;
end;


-- Este update dará error
-- update empleados set salario = salario * 1.30 where dni = 22222222J;


--Ejercicio 3
create or replace trigger baja
after delete on empleados
for each row
begin
  insert into empleados_baja values(:old.dni, :old.nomemp,:old.jefe,:old.departamento,:old.salario,USER,SYSDATE);
end;


INSERT INTO empleados (dni, nomemp, jefe, departamento, salario, usuario, fecha) values ('22229988J','María Robles', null,2,2700,'mlopez',to_date('21/06/1998','dd/mm/yyyy'));
delete from empleados where dni = '22229988J';

select * from empleados_baja;
