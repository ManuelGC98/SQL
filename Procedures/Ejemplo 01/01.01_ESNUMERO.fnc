/*
Funci�n que recibe una cadena de caracteres y devuelve TRUE si la cadena est� formada por n�meros. FALSE en caso contrario.
*/
CREATE OR REPLACE FUNCTION ESNUMERO (P_NUMERO IN VARCHAR2) RETURN BOOLEAN
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
/
