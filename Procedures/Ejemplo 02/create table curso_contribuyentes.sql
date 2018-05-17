CREATE TABLE CURSO_CONTRIBUYENTES
(
   ID                       number (22)     PRIMARY KEY         NOT NULL,
   USUARIO_CREA             VARCHAR2 (32)   default('user')     NOT NULL,
   F_CREA                   date            default(sysdate)    NOT NULL,
   USUARIO_MODI             VARCHAR2 (32)   default('user')     NOT NULL,
   F_MODI                   date            default(sysdate)    NOT NULL,
   NOMBRE                   VARCHAR2 (64)                               ,
   APELLIDO1                VARCHAR2 (64)                               ,
   APELLIDO2                VARCHAR2 (64)                               ,
   NIF                      VARCHAR2 (64)                               ,
   NOMBRE_NORMALIZADO       VARCHAR2 (256)                      NOT NULL,
   NIF_NORMALIZADO          char (9)                            NOT NULL
);