


CREATE OR REPLACE PROCEDURE ESTABLECER_POBLACION(P_MAX   IN NUMBER)
AS
   V_MAX       NUMBER;
   V_N_CONTRI  NUMBER;
   V_ID        NUMBER;
   V_NIF       NUMBER;
   
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
   
BEGIN

   IF NVL(P_MAX,0) < 10 THEN
      V_MAX := 10;
   ELSIF P_MAX > 1000 THEN
      V_MAX := 1000;
   ELSE
      V_MAX := P_MAX;
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
/
