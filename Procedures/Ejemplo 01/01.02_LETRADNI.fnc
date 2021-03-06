/*
Funci�n que devuelve la letra de un DNI 
*/
CREATE OR REPLACE FUNCTION LETRADNI (P_DNI IN VARCHAR2) RETURN VARCHAR2
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
/