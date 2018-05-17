CREATE OR REPLACE PROCEDURE CONTRATAR_EMPLEADO_OP( P_DNI          IN EMPLEADOS.DNI%TYPE,
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
/