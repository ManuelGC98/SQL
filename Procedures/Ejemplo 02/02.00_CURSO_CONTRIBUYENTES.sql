
BEGIN
   BEGIN
      EXECUTE IMMEDIATE 'CREATE TABLE CURSO_CONTRIBUYENTES ' ||
                        '( ' ||
                        '    ID                      NUMBER(22)                     NOT NULL, ' ||
                        '    USUARIO_CREA            VARCHAR2(32)  DEFAULT USER     NOT NULL, ' ||
                        '    F_CREA                  DATE          DEFAULT SYSDATE  NOT NULL, ' ||
                        '    USUARIO_MODI            VARCHAR2(32)  DEFAULT USER     NOT NULL, ' ||
                        '    F_MODI                  DATE          DEFAULT SYSDATE  NOT NULL, ' ||
                        '    NOMBRE                  VARCHAR2(64)                   , ' ||
                        '    APELLIDO1               VARCHAR2(64)                   , ' ||
                        '    APELLIDO2               VARCHAR2(64)                   , ' ||
                        '    NIF                     VARCHAR2(64)                   , ' ||
                        '    NOMBRE_NORMALIZADO      VARCHAR2(256)                  NOT NULL, ' ||
                        '    NIF_NORMALIZADO         CHAR(9)                        NOT NULL ' ||
                        ')  ';
   EXCEPTION 
      WHEN OTHERS THEN 
      BEGIN
         IF SQLCODE = -955 THEN
            NULL;
         ELSE
            RAISE;
         END IF;
      END; 
   END;
END;
/


BEGIN   
   EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX PK1_CURSO_CONTRI ON CURSO_CONTRIBUYENTES (ID) ';
   EXCEPTION   
   WHEN OTHERS THEN      
   BEGIN         
      IF SQLCODE = -955 THEN NULL;         
      ELSE RAISE;
      END IF;      
   END;
END;
/

BEGIN   
   EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX UK1_CURSO_CONTRI ON CURSO_CONTRIBUYENTES (NIF_NORMALIZADO) ';
   EXCEPTION   
   WHEN OTHERS THEN      
   BEGIN         
      IF SQLCODE = -955 THEN NULL;         
      ELSE RAISE;
      END IF;      
   END;
END;
/

BEGIN   
   EXECUTE IMMEDIATE 'ALTER TABLE CURSO_CONTRIBUYENTES ADD ( ' ||
                     '  CONSTRAINT PK1_CURSO_CONTRI PRIMARY KEY (ID) USING INDEX PK1_CURSO_CONTRI ENABLE VALIDATE)';
   EXCEPTION   
   WHEN OTHERS THEN      
   BEGIN         
      IF SQLCODE IN (-2260) THEN NULL;         
      ELSE RAISE;
      END IF;      
   END;
END;
/

BEGIN   
   EXECUTE IMMEDIATE 'ALTER TABLE CURSO_CONTRIBUYENTES ADD ( ' ||
                     '  CONSTRAINT UK1_CURSO_CONTRI UNIQUE (NIF_NORMALIZADO) USING INDEX UK1_CURSO_CONTRI ENABLE VALIDATE)';
   EXCEPTION   
   WHEN OTHERS THEN      
   BEGIN         
      IF SQLCODE IN (-2261) THEN NULL;         
      ELSE RAISE;
      END IF;      
   END;
END;
/

BEGIN   
   EXECUTE IMMEDIATE 'CREATE SEQUENCE GEN_CURSO_CONTRIBUYENTES INCREMENT BY 1 START WITH 1';
   EXCEPTION   
   WHEN OTHERS THEN      
   BEGIN         
      IF SQLCODE = -955 THEN NULL;         
      ELSE RAISE;
      END IF;      
   END;
END;
/

