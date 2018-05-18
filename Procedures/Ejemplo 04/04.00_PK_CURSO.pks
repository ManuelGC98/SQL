CREATE OR REPLACE PACKAGE PK_CURSO 
AS

   NMIN  CONSTANT NUMBER := 10;
   NMAX  CONSTANT NUMBER := 1000;

   PROCEDURE CONTRATAR_EMPLEADO_OP( P_DNI          IN EMPLEADOS.DNI%TYPE,
                                    P_NOMBRE       IN EMPLEADOS.NOMEMP%TYPE,
                                    P_JEFE         IN EMPLEADOS.JEFE%TYPE,
                                    P_DEPARTAMENTO IN EMPLEADOS.DEPARTAMENTO%TYPE,
                                    P_SALARIO      IN EMPLEADOS.SALARIO%TYPE,
                                    P_USUARIO      IN EMPLEADOS.USUARIO%TYPE,
                                    P_FECHA        IN EMPLEADOS.FECHA%TYPE,
                                    P_DNI_OK       OUT EMPLEADOS.DNI%TYPE);
   
   FUNCTION DAMENIF(P_DNI IN VARCHAR2) RETURN VARCHAR2;

   PROCEDURE ESTABLECER_POBLACION(P_NUM IN NUMBER);

END PK_CURSO;
/


CREATE OR REPLACE PACKAGE BODY PK_CURSO 
AS

   PROCEDURE CONTRATAR_EMPLEADO_OP( P_DNI          IN EMPLEADOS.DNI%TYPE,
                                    P_NOMBRE       IN EMPLEADOS.NOMEMP%TYPE,
                                    P_JEFE         IN EMPLEADOS.JEFE%TYPE,
                                    P_DEPARTAMENTO IN EMPLEADOS.DEPARTAMENTO%TYPE,
                                    P_SALARIO      IN EMPLEADOS.SALARIO%TYPE,
                                    P_USUARIO      IN EMPLEADOS.USUARIO%TYPE,
                                    P_FECHA        IN EMPLEADOS.FECHA%TYPE,
                                    P_DNI_OK       OUT EMPLEADOS.DNI%TYPE)
   IS
   BEGIN
      INSERT INTO EMPLEADOS (DNI,
                             NOMEMP,
                             JEFE,
                             DEPARTAMENTO,
                             SALARIO,
                             USUARIO,
                             FECHA)
           VALUES (DAMENIF(P_DNI),
                   P_NOMBRE,
                   P_JEFE,
                   P_DEPARTAMENTO,
                   P_SALARIO,
                   P_USUARIO,
                   P_FECHA) RETURNING DNI INTO P_DNI_OK;
   END CONTRATAR_EMPLEADO_OP;
   

   FUNCTION ESNUMERO (P_NUMERO IN VARCHAR2) RETURN BOOLEAN
   IS
      V_RESULTADO BOOLEAN;
      V_NUMERO    NUMBER;
   BEGIN
      V_RESULTADO := FALSE;
      BEGIN
         V_NUMERO    := TO_NUMBER(P_NUMERO);
         V_RESULTADO := TRUE;
      EXCEPTION
         WHEN OTHERS THEN NULL;
      END;
      RETURN V_RESULTADO;
   END;


   FUNCTION LETRADNI (P_DNI IN VARCHAR2) RETURN VARCHAR2
   IS
      V_DNI_C  CHAR(8);
      V_DNI_N  NUMBER(8);
      V_LETRAS CHAR(28) := 'TRWAGMYFPDXBNJZSQVHLCKEI';
      V_CODE   NUMBER(12);
      V_LETRA  CHAR(1);
   BEGIN
      V_DNI_C := LPAD(SUBSTR(TRIM(P_DNI),1,8),8,'0');
      IF ESNUMERO(V_DNI_C) THEN
         V_DNI_N := TO_NUMBER(V_DNI_C);
         V_CODE  := TRUNC(V_DNI_N - (TRUNC(V_DNI_N/23) * 23));
         V_LETRA := SUBSTR(V_LETRAS, V_CODE+1, 1);
      END IF;
      RETURN V_LETRA;
   END;


   FUNCTION DAMENIF(P_DNI IN VARCHAR2) RETURN VARCHAR2
   IS
      V_DUMMY  VARCHAR2(32767);
   BEGIN
      --1. ELIMINO CARACTERES 'EXTRAÑOS'
      V_DUMMY  := REPLACE(REPLACE(REPLACE(REPLACE(UPPER(TRIM(P_DNI)),' '),'.'),','),'-');
      IF V_DUMMY IS NULL THEN
         RAISE_APPLICATION_ERROR(-20001, 'EL DNI NO ES VÁLIDO');
      END IF;
      --2. TOMO LOS 8 PRIMEROS CARACTERES, Y SI SON MENOS, RELLENO CON CEROS POR LA IZQUIERDA
      V_DUMMY  := LPAD(SUBSTR(V_DUMMY,1,8),8,'0');
      IF NOT ESNUMERO(V_DUMMY) THEN
         --3. SI NO ES UN NÚMERO ES PORQUE PUEDE QUE ME VENGA LA LETRA AL FINAL. 
         --   REPITO EL PROCESO PERO CON UN CARÁCTER MENOS PARA DESCARTAR DICHA LETRA.
         V_DUMMY  := LPAD(SUBSTR(V_DUMMY,1,7),8,'0');
         IF NOT ESNUMERO(V_DUMMY) THEN
            --SI LO QUE TENGO TAMPOCO ES UN NÚMERO, LO DOY POR IMPOSIBLE Y DEVUELVO ERROR
            RAISE_APPLICATION_ERROR(-20002, 'EL DNI NO ES VÁLIDO');
         END IF;
      END IF;
      --EN ESTE PUNTO HEMOS DE TENER EN V_DUMMY SOLAMENTE 8 NÚMEROS
      RETURN V_DUMMY || LETRADNI(V_DUMMY);
   END;
   
   
   FUNCTION NORMALIZA_NOMBRE( P_NOM IN CURSO_CONTRIBUYENTES.NOMBRE%TYPE,
                              P_AP1 IN CURSO_CONTRIBUYENTES.APELLIDO1%TYPE,
                              P_AP2 IN CURSO_CONTRIBUYENTES.APELLIDO2%TYPE) RETURN CURSO_CONTRIBUYENTES.NOMBRE_NORMALIZADO%TYPE
   IS
      V_DUMMY     VARCHAR2(32767);
      V_NOMBRE_N  CURSO_CONTRIBUYENTES.NOMBRE_NORMALIZADO%TYPE;
   BEGIN
      --P_AP1
      V_DUMMY  := UPPER(TRIM(P_AP1));
      WHILE INSTR(V_DUMMY, '  ') > 0 
      LOOP
         V_DUMMY := REPLACE(V_DUMMY, '  ', ' ');
      END LOOP;
      V_NOMBRE_N := V_DUMMY;
      --P_AP2
      V_DUMMY  := UPPER(TRIM(P_AP2));
      WHILE INSTR(V_DUMMY, '  ') > 0 
      LOOP
         V_DUMMY := REPLACE(V_DUMMY, '  ', ' ');
      END LOOP;
      V_NOMBRE_N := V_NOMBRE_N||' '||V_DUMMY;
      --P_NOM
      V_DUMMY  := UPPER(TRIM(P_NOM));
      WHILE INSTR(V_DUMMY, '  ') > 0 
      LOOP
         V_DUMMY := REPLACE(V_DUMMY, '  ', ' ');
      END LOOP;
      V_NOMBRE_N := V_NOMBRE_N||', '||V_DUMMY;
      RETURN TRIM(V_NOMBRE_N);
   END NORMALIZA_NOMBRE;

   
   PROCEDURE CREAR_CONTRIBUYENTE(P_NIF IN CURSO_CONTRIBUYENTES.NIF%TYPE, 
                                 P_NOM IN CURSO_CONTRIBUYENTES.NOMBRE%TYPE,
                                 P_AP1 IN CURSO_CONTRIBUYENTES.APELLIDO1%TYPE,
                                 P_AP2 IN CURSO_CONTRIBUYENTES.APELLIDO2%TYPE)
   AS

   BEGIN
      INSERT INTO CURSO_CONTRIBUYENTES (NOMBRE,
                                        APELLIDO1,
                                        APELLIDO2,
                                        NIF)
           VALUES (P_NOM,
                   P_AP1,
                   P_AP2,
                   P_NIF);
   END CREAR_CONTRIBUYENTE;



   FUNCTION BUSCA_CONTRIBUYENTE(P_NIF IN CURSO_CONTRIBUYENTES.NIF%TYPE) RETURN CURSO_CONTRIBUYENTES.ID%TYPE
   IS
      V_ID CURSO_CONTRIBUYENTES.ID%TYPE;
   BEGIN
      V_ID := 0;
      BEGIN
         SELECT ID INTO V_ID FROM CURSO_CONTRIBUYENTES WHERE NIF_NORMALIZADO = DAMENIF(P_NIF);
      EXCEPTION
         WHEN OTHERS THEN NULL;
      END;
      RETURN V_ID;
   END BUSCA_CONTRIBUYENTE;
      

   PROCEDURE MODIFICA_CONTRIBUYENTE(P_NIF IN CURSO_CONTRIBUYENTES.NIF%TYPE, 
                                    P_NOM IN CURSO_CONTRIBUYENTES.NOMBRE%TYPE,
                                    P_AP1 IN CURSO_CONTRIBUYENTES.APELLIDO1%TYPE,
                                    P_AP2 IN CURSO_CONTRIBUYENTES.APELLIDO2%TYPE)
   AS
      V_ID CURSO_CONTRIBUYENTES.ID%TYPE;

   BEGIN
      V_ID := BUSCA_CONTRIBUYENTE (P_NIF);
      IF V_ID > 0 THEN
         UPDATE CURSO_CONTRIBUYENTES
            SET NOMBRE    = P_NOM, 
                APELLIDO1 = P_AP1, 
                APELLIDO2 = P_AP2
          WHERE ID = V_ID;
      END IF;
   END MODIFICA_CONTRIBUYENTE;


      
   FUNCTION ALEATORIO(P_QUE IN CHAR) RETURN VARCHAR2
   IS
      V_RES VARCHAR2(256);
   BEGIN
      IF P_QUE = 'N' THEN--NOMBRE ALEATORIO
         SELECT NOMBRE INTO V_RES
         FROM   (SELECT NOMBRE
                   FROM CURSO_NOMBRES
                  ORDER BY DBMS_RANDOM.RANDOM)
         WHERE  ROWNUM = 1;      
      ELSE--APELLIDO ALEATORIO
         SELECT APELLIDO INTO V_RES
         FROM   (SELECT APELLIDO
                   FROM CURSO_APELLIDOS
                  ORDER BY DBMS_RANDOM.RANDOM)
         WHERE  ROWNUM = 1;      
      END IF;
      RETURN V_RES;
   END ALEATORIO;
    
     
   PROCEDURE ESTABLECER_POBLACION(P_NUM IN NUMBER)
   AS
      V_MAX       NUMBER;
      V_N_CONTRI  NUMBER;
      V_ID        NUMBER;
      V_NIF       NUMBER;
      
   BEGIN
      IF NVL(P_NUM,0) < NMIN THEN
         V_MAX := NMIN;
      ELSIF P_NUM > NMAX THEN
         V_MAX := NMAX;
      ELSE
         V_MAX := P_NUM;
      END IF;
      SELECT COUNT(1) INTO V_N_CONTRI FROM CURSO_CONTRIBUYENTES;
      --SI HAY MÁS DE LA CUENTA, ELIMINO
      WHILE V_N_CONTRI > V_MAX
      LOOP
         SELECT ID INTO V_ID
           FROM (SELECT ID 
                   FROM CURSO_CONTRIBUYENTES
               ORDER BY DBMS_RANDOM.RANDOM)
          WHERE ROWNUM = 1;
         DELETE FROM CURSO_CONTRIBUYENTES WHERE ID = V_ID;
         V_N_CONTRI := V_N_CONTRI - 1;
      END LOOP;
      --SI HAY MENOS CONTRIBUYENTES QUE LOS INDICADOS, LOS CREO O MODIFICO
      WHILE V_N_CONTRI < V_MAX
      LOOP
         V_NIF := DBMS_RANDOM.RANDOM;
         BEGIN
            CREAR_CONTRIBUYENTE(V_NIF, 
                                ALEATORIO('N'),
                                ALEATORIO('A'),
                                ALEATORIO('A'));
            V_N_CONTRI := V_N_CONTRI + 1;
         EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
               MODIFICA_CONTRIBUYENTE(V_NIF, 
                                      ALEATORIO('N'),
                                      ALEATORIO('A'),
                                      ALEATORIO('A'));
            WHEN OTHERS THEN
               RAISE;
         END;
      END LOOP;
   END ESTABLECER_POBLACION;


END PK_CURSO;
/
