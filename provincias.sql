DROP TABLE MUN
DROP TABLE PRO


CREATE TABLE PRO(
PRO_COD NUMBER(3) NOT NULL,
PRO_DES VARCHAR2(50) NULL,
PRIMARY KEY(PRO_COD))


CREATE TABLE MUN(
MUN_COD NUMBER(3) NOT NULL,
MUN_PRO NUMBER(3) NOT NULL,
MUN_DES VARCHAR2(50) NULL,
MUN_HAB NUMBER(10) NULL,
PRIMARY KEY(MUN_PRO, MUN_COD),
CONSTRAINT FK_MUN_PRO FOREIGN KEY (MUN_PRO) REFERENCES PRO(PRO_COD))



--select 'INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(' || PRV_COD || ',''' || PRV_NOM || ''');'  from p_prv where prv_cod <> 99


INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(1,'ARAVA/ALAVA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(2,'ALBACETE');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(3,'ALICANTE/ALACANT');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(4,'ALMERIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(5,'ÁVILA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(6,'BADAJOZ');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(7,'BALEARES/BALEARS');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(8,'BARCELONA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(9,'BURGOS');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(10,'CÁCERES');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(11,'CÁDIZ');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(12,'CASTELLÓN/CASTELLÓ');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(13,'CIUDAD REAL');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(14,'CÓRDOBA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(15,'LA CORUÑA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(16,'CUENCA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(17,'GIRONA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(18,'GRANADA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(19,'GUADALAJARA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(20,'GUIPÚZCOA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(21,'HUELVA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(22,'HUESCA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(23,'JAÉN');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(24,'LEÓN');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(25,'LÉRIDA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(26,'LA RIOJA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(27,'LUGO');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(28,'MADRID');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(29,'MÁLAGA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(30,'MURCIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(31,'NAVARRA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(32,'ORENSE');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(33,'ASTURIAS');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(34,'PALENCIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(35,'LAS PALMAS');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(36,'PONTEVEDRA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(37,'SALAMANCA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(38,'SANTA CRUZ DE TENERIFE');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(39,'CANTABRIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(40,'SEGOVIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(41,'SEVILLA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(42,'SORIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(43,'TARRAGONA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(44,'TERUEL');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(45,'TOLEDO');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(46,'VALENCIA/VALÉNCIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(47,'VALLADOLID');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(48,'VIZCAYA/BIZKAIA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(49,'ZAMORA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(50,'ZARAGOZA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(51,'CEUTA');
INSERT INTO PRO(PRO_COD, PRO_DES) VALUES(52,'MELILLA');

--select 'INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(' || MUN_PRV || ',' || MUN_COD || ',''' || MUN_NOM || ''', 1);'  from p_mun where mun_prv in (14, 41) order by mun_prv, mun_cod

INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,1,'ADAMUZ', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,2,'AGUILAR DE LA FRONTERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,3,'ALCARACEJOS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,4,'ALMEDINILLA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,5,'ALMODOVAR DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,6,'AÑORA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,7,'BAENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,8,'BELALCAZAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,9,'BELMEZ', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,10,'BENAMEJI', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,11,'BLAZQUEZ (LOS)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,12,'BUJALANCE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,13,'CABRA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,14,'CAÑETE DE LAS TORRES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,15,'CARCABUEY', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,16,'CARDEÑA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,17,'CARLOTA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,18,'CARPIO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,19,'CASTRO DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,20,'CONQUISTA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,21,'CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,22,'DOÑA MENCIA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,23,'DOS-TORRES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,24,'ENCINAS REALES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,25,'ESPEJO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,26,'ESPIEL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,27,'FERNAN NUÑEZ', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,28,'FUENTE LA LANCHA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,29,'FUENTE OBEJUNA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,30,'FUENTE PALMERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,31,'FUENTE-TOJAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,32,'GRANJUELA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,33,'GUADALCAZAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,34,'GUIJO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,35,'HINOJOSA DEL DUQUE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,36,'HORNACHUELOS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,37,'IZNAJAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,38,'LUCENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,39,'LUQUE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,40,'MONTALBAN DE CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,41,'MONTEMAYOR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,42,'MONTILLA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,43,'MONTORO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,44,'MONTURQUE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,45,'MORILES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,46,'NUEVA-CARTEYA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,47,'OBEJO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,48,'PALENCIANA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,49,'PALMA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,50,'PEDRO ABAD', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,51,'PEDROCHE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,52,'PEÑARROYA-PUEBLONUEVO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,53,'POSADAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,54,'POZOBLANCO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,55,'PRIEGO DE CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,56,'PUENTE-GENIL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,57,'RAMBLA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,58,'RUTE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,59,'SAN SEBASTIAN DE LOS BALL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,60,'SANTAELLA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,61,'SANTA EUFEMIA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,62,'TORRECAMPO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,63,'VALENZUELA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,64,'VALSEQUILLO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,65,'VICTORIA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,66,'VILLA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,67,'VILLAFRANCA DE CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,68,'VILLAHARTA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,69,'VILLANUEVA DE CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,70,'VILLANUEVA DEL DUQUE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,71,'VILLANUEVA DEL REY', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,72,'VILLARALTO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,73,'VILLAVICIOSA DE CORDOBA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,74,'VISO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(14,75,'ZUHEROS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,1,'AGUADULCE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,2,'ALANIS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,3,'ALBAIDA DEL ALJARAFE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,4,'ALCALA DE GUADAIRA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,5,'ALCALA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,6,'ALCOLEA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,7,'ALGABA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,8,'ALGAMITAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,9,'ALMADEN DE LA PLATA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,10,'ALMENSILLA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,11,'ARAHAL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,12,'AZNALCAZAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,13,'AZNALCOLLAR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,14,'BADOLATOSA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,15,'BENACAZON', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,16,'BOLLULLOS DE LA MITACION', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,17,'BORMUJOS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,18,'BRENES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,19,'BURGUILLOS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,20,'CABEZAS DE SAN JUAN (LAS)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,21,'CAMAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,22,'CAMPANA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,23,'CANTILLANA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,24,'CARMONA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,25,'CARRION DE LOS CESPEDES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,26,'CASARICHE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,27,'CASTILBLANCO DE LOS ARROY', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,28,'CASTILLEJA DE GUZMAN', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,29,'CASTILLEJA DE LA CUESTA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,30,'CASTILLEJA DEL CAMPO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,31,'CASTILLO DE LAS GUARDAS (', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,32,'CAZALLA DE LA SIERRA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,33,'CONSTANTINA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,34,'CORIA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,35,'CORIPE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,36,'CORONIL (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,37,'CORRALES (LOS)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,38,'DOS HERMANAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,39,'ECIJA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,40,'ESPARTINAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,41,'ESTEPA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,42,'FUENTES DE ANDALUCIA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,43,'GARROBO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,44,'GELVES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,45,'GERENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,46,'GILENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,47,'GINES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,48,'GUADALCANAL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,49,'GUILLENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,50,'HERRERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,51,'HUEVAR DEL ALJARAFE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,52,'LANTEJUELA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,53,'LEBRIJA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,54,'LORA DE ESTEPA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,55,'LORA DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,56,'LUISIANA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,57,'MADROÑO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,58,'MAIRENA DEL ALCOR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,59,'MAIRENA DEL  ALJARAFE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,60,'MARCHENA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,61,'MARINALEDA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,62,'MARTIN DE LA JARA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,63,'MOLARES (LOS)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,64,'MONTELLANO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,65,'MORON DE LA FRONTERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,66,'NAVAS DE LA CONCEPCION (L', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,67,'OLIVARES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,68,'OSUNA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,69,'PALACIOS Y VILLAFRANCA (L', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,70,'PALOMARES DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,71,'PARADAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,72,'PEDRERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,73,'PEDROSO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,74,'PEÑAFLOR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,75,'PILAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,76,'PRUNA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,77,'PUEBLA DE CAZALLA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,78,'PUEBLA DE LOS INFANT', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,79,'PUEBLA DEL RIO (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,80,'REAL DE LA JARA (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,81,'RINCONADA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,82,'RODA DE ANDALUCIA (LA)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,83,'RONQUILLO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,84,'RUBIO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,85,'SALTERAS', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,86,'SAN JUAN DE AZNALFARACHE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,87,'SANLUCAR LA MAYOR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,88,'SAN NICOLAS DEL PUERTO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,89,'SANTIPONCE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,90,'SAUCEJO (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,91,'SEVILLA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,92,'TOCINA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,93,'TOMARES', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,94,'UMBRETE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,95,'UTRERA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,96,'VALENCINA DE LA CONCEPCIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,97,'VILLAMANRIQUE DE LA CONDE', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,98,'VILLANUEVA DEL ARISCAL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,99,'VILLANUEVA DEL RIO Y MINA', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,100,'VILLANUEVA DE SAN JUAN', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,101,'VILLAVERDE DEL RIO', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,102,'VISO DEL ALCOR (EL)', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,901,'CAÑADA ROSAL', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,902,'ISLA MAYOR', 1);
INSERT INTO MUN(MUN_PRO, MUN_COD, MUN_DES, MUN_HAB) VALUES(41,903,'CUERVO DE SEVILLA (EL)', 1);


--------------------------


select * from mun where mun_des like 'ECIJA';

update mun set mun_hab = mun_hab * 0.1 where mun_pro = 41 and mun_cod = 39;

update mun set mun_hab = (select mun_hab from mun where mun_pro = 41 and mun_cod = 39) where mun_des like 'A%';

select * from mun where mun_des like 'A%';
