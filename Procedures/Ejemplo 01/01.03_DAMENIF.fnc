/*
Funci�n que recibe en una cadena de caracteres un DNI o un NIF y devuelve el NIF formateado y con la letra correcta 
*/
CREATE OR REPLACE FUNCTION DAMENIF(P_DNI IN VARCHAR2) RETURN VARCHAR2
IS
   V_DUMMY  VARCHAR2(32767);
BEGIN
   --1. ELIMINO CARACTERES 'EXTRA�OS'
   V_DUMMY  := REPLACE(REPLACE(REPLACE(REPLACE(UPPER(TRIM(P_DNI)),' '),'.'),','),'-');
   IF V_DUMMY IS NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'EL DNI NO ES V�LIDO');
   END IF;
   --2. TOMO LOS 8 PRIMEROS CARACTERES, Y SI SON MENOS, RELLENO CON CEROS POR LA IZQUIERDA
   V_DUMMY  := LPAD(SUBSTR(V_DUMMY,1,8),8,'0');
   IF NOT ESNUMERO(V_DUMMY) THEN
      --3. SI NO ES UN N�MERO ES PORQUE PUEDE QUE ME VENGA LA LETRA AL FINAL. 
      --   REPITO EL PROCESO PERO CON UN CAR�CTER MENOS PARA DESCARTAR DICHA LETRA.
      V_DUMMY  := LPAD(SUBSTR(V_DUMMY,1,7),8,'0');
      IF NOT ESNUMERO(V_DUMMY) THEN
         --SI LO QUE TENGO TAMPOCO ES UN N�MERO, LO DOY POR IMPOSIBLE Y DEVUELVO ERROR
         RAISE_APPLICATION_ERROR(-20002, 'EL DNI NO ES V�LIDO');
      END IF;
   END IF;
   --EN ESTE PUNTO HEMOS DE TENER EN V_DUMMY SOLAMENTE 8 N�MEROS
   RETURN V_DUMMY || LETRADNI(V_DUMMY);
END;
/