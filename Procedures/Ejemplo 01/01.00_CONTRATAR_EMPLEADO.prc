CREATE OR REPLACE PROCEDURE CONTRATAR_EMPLEADO (P_DNI          IN EMPLEADOS.DNI%TYPE,
                                                P_NOMBRE       IN EMPLEADOS.NOMEMP%TYPE,
                                                P_JEFE         IN EMPLEADOS.JEFE%TYPE,
                                                P_DEPARTAMENTO IN EMPLEADOS.DEPARTAMENTO%TYPE,
                                                P_SALARIO      IN EMPLEADOS.SALARIO%TYPE,
                                                P_USUARIO      IN EMPLEADOS.USUARIO%TYPE,
                                                P_FECHA        IN EMPLEADOS.FECHA%TYPE,
                                                P_DNI_OK       OUT EMPLEADOS.DNI%TYPE)
IS
   V_DNI    VARCHAR2(16);
   V_LETRA  CHAR(1);
BEGIN
   V_DNI := UPPER(TRIM(P_DNI));
   IF ESNUMERO(SUBSTR(V_DNI, -1)) THEN
      V_LETRA := LETRADNI(V_DNI);
      V_DNI   := LPAD(SUBSTR(V_DNI,1,8),8,'0')||V_LETRA;
   END IF;
   INSERT INTO EMPLEADOS (DNI,
                          NOMEMP,
                          JEFE,
                          DEPARTAMENTO,
                          SALARIO,
                          USUARIO,
                          FECHA)
        VALUES (V_DNI,
                P_NOMBRE,
                P_JEFE,
                P_DEPARTAMENTO,
                P_SALARIO,
                P_USUARIO,
                P_FECHA) RETURNING DNI INTO P_DNI_OK;
END CONTRATAR_EMPLEADO;
/