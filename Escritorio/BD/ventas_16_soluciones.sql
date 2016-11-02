CREATE DATABASE IF NOT EXISTS `ventas_2016` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ventas_2016`;


-- Volcando estructura para tabla ventas_2016.articulos
CREATE TABLE IF NOT EXISTS `articulos` (
  `ID_FABRICA` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `COD_ARTI` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `DENOMINACION` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'P. GEN…RICO''',
  `EXISTENCIAS` int(4) unsigned NOT NULL DEFAULT '0',
  `PRE_COMPRA` decimal(9,2) DEFAULT NULL,
  `CANT_REPO` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_FABRICA`,`COD_ARTI`),
  KEY `i_arti` (`COD_ARTI`),
  KEY `i_fab` (`ID_FABRICA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.articulos: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`ID_FABRICA`, `COD_ARTI`, `DENOMINACION`, `EXISTENCIAS`, `PRE_COMPRA`, `CANT_REPO`) VALUES
	('ACI', '41001', 'ArtÌculo tipo 1', 227, 70.00, 45),
	('ACI', '41002', 'ArtÌculo tipo 2', 167, 450.00, 300),
	('ACI', '41003', 'ArtÌculo tipo 3', 207, 40.00, 150),
	('ACI', '41004', 'ArtÌculo tipo 4', 139, 20.00, 100),
	('ACI', '4100X', 'Tornillo Ajustador', 37, 2.50, 24),
	('ACI', '4100Y', 'Extractor', 25, 120.00, 12),
	('ACI', '4100Z', 'Montador', 28, 500.00, 45),
	('BIC', '41003', 'Manivela', 3, 120.00, 15),
	('BIC', '41089', 'Codo', 78, 2.50, 23),
	('BIC', '41672', 'Pletina', 0, 5.00, 5),
	('FEA', '112', 'Cubierta', 115, 25.00, 100),
	('FEA', '114', 'Bancada Motor', 15, 130.00, 21),
	('IMM', '773C', 'Riostra 1/2-tm', 28, 650.00, 12),
	('IMM', '775C', 'Riostra 1-tm', 5, 200.00, 20),
	('IMM', '779C', 'Riostra 2-m', 9, 150.00, 20),
	('IMM', '887H', 'Soporte', 223, 5.00, 200),
	('IMM', '887P', 'Perno', 24, 5.00, 12),
	('IMM', '887X', 'Retenedor Riostra', 32, 6.00, 21),
	('QSA', 'XK47', 'Reductor', 38, 60.00, 9),
	('QSA', 'XK48', 'Reductor', 203, 80.00, 125),
	('QSA', 'XK48A', 'Reductor', 37, 70.00, 23),
	('REI', '2A44G', 'Pasador Bisagra', 14, 9.00, 33),
	('REI', '2A44L', 'Bisagra Izquierda', 12, 3.00, 6),
	('REI', '2A44R', 'Bisagra Derecha', 12, 6.00, 7),
	('REI', '2A45C', 'Tornillo Trinquete', 210, 8.00, 125);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


-- Volcando estructura para tabla ventas_2016.cabped
CREATE TABLE IF NOT EXISTS `cabped` (
  `NUM_PEDIDO` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `COD_CLI` varchar(4) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FECHA_PED` date NOT NULL,
  `COD_VENDE` varchar(3) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FECHA_ENVI` date DEFAULT NULL,
  `PAGADO` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `MODO_ENVIO` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`NUM_PEDIDO`),
  KEY `cliente_pedido` (`COD_CLI`),
  KEY `vendedor_pedido` (`COD_VENDE`)
 
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.cabped: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `cabped` DISABLE KEYS */;
INSERT INTO `cabped` (`NUM_PEDIDO`, `COD_CLI`, `FECHA_PED`, `COD_VENDE`, `FECHA_ENVI`, `PAGADO`, `MODO_ENVIO`) VALUES
	('110012', '2122', '2013-12-17', '105', '2013-12-27', 'SI', 'RENFE'),
	('110013', '2122', '2013-12-17', '105', '2013-12-17', 'SI', 'RENFE'),
	('110014', '2122', '2013-12-17', '105', '2013-12-22', 'SI', 'RENFE'),
	('110024', '2112', '2013-12-17', '108', '2013-12-17', 'NO', 'SEUR'),
	('110028', '2112', '2013-12-17', '108', '2013-12-23', 'NO', 'SEUR'),
	('110036', '2107', '2013-12-17', '110', '2013-12-19', 'SI', 'CAVE'),
	('113051', '2112', '2013-12-17', '108', '2013-12-21', 'NO', 'SEUR'),
	('113061', '2108', '2013-12-17', '109', '2013-12-22', 'NO', 'CAVE'),
	('113191', '2114', '2013-12-17', '102', '2013-12-17', 'SI', 'SEUR'),
	('113241', '2124', '2013-12-17', '107', '2013-12-17', 'NO', 'RENFE'),
	('113749', '2111', '2013-12-17', '103', '2013-12-17', 'SI', 'CAVE'),
	('114023', '2113', '2013-12-17', '104', '2013-12-28', 'SI', 'CAVE'),
	('114968', '2102', '2013-12-17', '101', '2013-12-27', 'SI', 'CAVE'),
	('117961', '2117', '2013-12-17', '106', '2013-12-27', 'SI', 'SEUR'),
	('117983', '2103', '2013-12-17', '105', '2013-12-27', 'SI', 'RENFE');
/*!40000 ALTER TABLE `cabped` ENABLE KEYS */;




-- Volcando estructura para tabla ventas_2016.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `NUM_CLI` varchar(4) COLLATE latin1_spanish_ci NOT NULL,
  `NOMBRE` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `CIUDAD_CLI` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FAX` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `TIPO_CLI` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `REPRESENT` varchar(3) COLLATE latin1_spanish_ci DEFAULT NULL,
  `LIM_CRE` decimal(10,2) DEFAULT '0.00',
  `domicilio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`NUM_CLI`),
  KEY `i_repre` (`REPRESENT`),
  KEY `NUM_CLI` (`NUM_CLI`)
 
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.clientes: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`NUM_CLI`, `NOMBRE`, `CIUDAD_CLI`, `TELEFONO`, `FAX`, `TIPO_CLI`, `REPRESENT`, `LIM_CRE`, `domicilio`, `cp`) VALUES
	('2101', 'JULIA ANTEQUERA', NULL, '123456789', '56543219', 'B', '106', 6500.00, NULL, NULL),
	('2102', 'FINDEX', 'ALICANTE', '123456789', '56543219', 'B', '101', 6500.00, NULL, NULL),
	('2103', 'ACME', 'ALICANTE', '123456789', '56543219', 'MB', '105', 5000.00, NULL, NULL),
	('2105', 'AAA INVEST.', 'ALICANTE', '123456789', '56543219', 'MB', '101', 4500.00, NULL, NULL),
	('2106', 'FRENTES S.A.', 'PAMPLONA', '123456789', '56543219', 'M', '102', 6500.00, NULL, NULL),
	('2107', 'ACEINTER', 'ALICANTE', '123456789', '56543219', 'R', '110', 3500.00, NULL, NULL),
	('2108', 'HOLAND', 'VALENCIA', '123456789', '56543219', 'M', '109', 5500.00, NULL, NULL),
	('2109', 'CHEN QUIMICA', 'ALICANTE', '123456789', '56543219', 'B', '103', 2500.00, NULL, NULL),
	('2111', 'JCP S.L.', 'ALICANTE', '123456789', '56543219', 'R', '103', 5000.00, NULL, NULL),
	('2112', 'ZETA', 'VALENCIA', '123456789', '56543219', 'B', '108', 5000.00, NULL, NULL),
	('2113', 'JUAN S.L.', 'VALENCIA', '123456789', '56543219', 'B', '104', 2000.00, NULL, NULL),
	('2114', 'ORI¡N', 'PAMPLONA', '123456789', '56543219', 'B', '102', 2000.00, NULL, NULL),
	('2115', 'SANS”N COP.', 'ALICANTE', '123456789', '56543219', 'M', '101', 2000.00, NULL, NULL),
	('2117', 'JAVPER', NULL, '123456789', '56543219', 'M', '106', 3500.00, NULL, NULL),
	('2118', 'MEDIO SIST.', 'VALENCIA', '123456789', '56543219', 'M', '108', 6000.00, NULL, NULL),
	('2119', 'SALOM”N S.L.', 'VALENCIA', '123456789', '56543219', 'M', '109', 2500.00, NULL, NULL),
	('2120', 'RICA S.A.', 'PAMPLONA', '123456789', '56543219', 'R', '102', 5000.00, NULL, NULL),
	('2121', 'QMA ASOC.', 'ALICANTE', '123456789', '56543219', 'B', '103', 4500.00, NULL, NULL),
	('2122', 'TERCERA LIN.', 'ALICANTE', '123456789', '56543219', 'R', '105', 3000.00, NULL, NULL),
	('2123', 'CARTERAS S.A.', 'PAMPLONA', '123456789', '56543219', 'M', '102', 4000.00, NULL, NULL),
	('2124', 'PEDRO HNOS.', 'PAMPLONA', '123456789', '56543219', 'MB', '107', 4000.00, NULL, NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Volcando estructura para tabla ventas_2016.infemple
CREATE TABLE IF NOT EXISTS `infemple` (
  `NUM_EMPLE` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `NOMBRE` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `EDAD` decimal(2,0) DEFAULT NULL,
  `SUCURSAL` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `CARGO` varchar(10) COLLATE latin1_spanish_ci DEFAULT 'vendedor',
  `FECHA_CONTRATO` date DEFAULT NULL,
  `JEFE` varchar(3) COLLATE latin1_spanish_ci DEFAULT NULL,
  `CUOTA_A—O` decimal(12,2) DEFAULT NULL,
  `salario` decimal(6,2) DEFAULT NULL,
  `comision` int(2) DEFAULT NULL,
  PRIMARY KEY (`NUM_EMPLE`),
  KEY `lasucursal` (`SUCURSAL`),
  KEY `es_jefe_de` (`JEFE`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.infemple: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `infemple` DISABLE KEYS */;
INSERT INTO `infemple` (`NUM_EMPLE`, `NOMBRE`, `EDAD`, `SUCURSAL`, `CARGO`, `FECHA_CONTRATO`, `JEFE`, `CUOTA_A—O`, `salario`, `comision`) VALUES
	('101', 'Antonio Viguer', 45, '12', 'vendedor', '1986-10-20', '104', 60000.00, NULL, NULL),
	('102', '√Ålvaro Jaumes', 48, '21', 'vendedor', '1986-12-10', '108', 70000.00, NULL, NULL),
	('103', 'Susana Andreu', 29, '12', 'vendedor', '1987-01-03', '104', 55000.00, NULL, NULL),
	('104', 'Lorenzo BÛ', 33, '12', 'dir ventas', '1987-05-19', '106', 40000.00, NULL, NULL),
	('105', 'Vicente Pantalla', 37, '13', 'vendedor', '1988-06-14', '104', 70000.00, NULL, NULL),
	('106', 'Jorge Bobbio', 52, '11', 'dir ventas', '1988-11-14', NULL, 55000.00, NULL, NULL),
	('107', 'JosÈ LÛpez', 49, '22', 'vendedor', '1989-10-12', '108', 60000.00, NULL, NULL),
	('108', 'Samuel Cacho', 62, '21', 'dir ventas', '1989-12-10', '106', 70000.00, NULL, NULL),
	('109', 'Nuria Esplai', 31, '11', 'vendedor', '1989-12-10', '106', 60000.00, NULL, NULL),
	('110', 'Paulino SÈez', 41, NULL, 'vendedor', '1990-01-13', '101', NULL, NULL, NULL);
/*!40000 ALTER TABLE `infemple` ENABLE KEYS */;


-- Volcando estructura para tabla ventas_2016.linped
CREATE TABLE IF NOT EXISTS `linped` (
  `PEDIDO` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `FABRICA` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `ARTICULO` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `CANTIDAD` decimal(6,0) NOT NULL,
  `PVP` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`PEDIDO`,`FABRICA`,`ARTICULO`),
  KEY `articulo` (`FABRICA`,`ARTICULO`),
  CONSTRAINT `articulo` FOREIGN KEY (`FABRICA`, `ARTICULO`) REFERENCES `articulos` (`ID_FABRICA`, `COD_ARTI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.linped: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `linped` DISABLE KEYS */;
INSERT INTO `linped` (`PEDIDO`, `FABRICA`, `ARTICULO`, `CANTIDAD`, `PVP`) VALUES
	('110012', 'ACI', '41002', 54, 585.00),
	('110012', 'ACI', '41003', 35, 52.00),
	('110012', 'ACI', '41004', 28, 26.00),
	('110013', 'FEA', '112', 11, 32.50),
	('110013', 'IMM', '779C', 2, 195.00),
	('110013', 'REI', '2A44R', 14, 7.80),
	('110014', 'BIC', '41003', 11, 156.00),
	('110014', 'IMM', '779C', 2, 195.00),
	('110014', 'QSA', 'XK48', 5, 104.00),
	('110014', 'REI', '2A44R', 14, 7.80),
	('110024', 'ACI', '41002', 10, 585.00),
	('110024', 'QSA', 'XK47', 20, 78.00),
	('110024', 'QSA', 'XK48', 2, 104.00),
	('110028', 'FEA', '112', 11, 32.50),
	('110028', 'IMM', '779C', 2, 195.00),
	('110036', 'ACI', '4100Z', 9, 650.00),
	('110036', 'REI', '2A45C', 8, 10.40),
	('113051', 'BIC', '41003', 1, 156.00),
	('113051', 'QSA', 'XK48', 4, 104.00),
	('113051', 'REI', '2A44R', 10, 7.80),
	('113061', 'FEA', '112', 10, 32.50),
	('113061', 'IMM', '779C', 3, 195.00),
	('113191', 'ACI', '4100Z', 6, 650.00),
	('113191', 'IMM', '779C', 2, 195.00),
	('113191', 'QSA', 'XK47', 6, 78.00),
	('113191', 'REI', '2A45C', 24, 10.40),
	('113241', 'BIC', '41003', 1, 156.00),
	('113241', 'FEA', '114', 10, 169.00),
	('113241', 'IMM', '775C', 22, 260.00),
	('113749', 'ACI', '4100X', 24, 3.25),
	('113749', 'REI', '2A44G', 6, 11.70),
	('114968', 'ACI', '41004', 34, 26.00),
	('114968', 'ACI', '4100X', 6, 3.25),
	('114968', 'REI', '2A44R', 5, 7.80),
	('117961', 'FEA', '114', 6, 169.00),
	('117961', 'REI', '2A44L', 7, 3.90),
	('117983', 'ACI', '41004', 6, 26.00),
	('117983', 'ACI', '4100Y', 11, 156.00);
/*!40000 ALTER TABLE `linped` ENABLE KEYS */;

-- Volcando estructura para tabla ventas_2016.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `NUM_SUC` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `CIUDAD` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `ZONA` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `DIRECTOR` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `OBJETIVO_A—O` decimal(14,2) NOT NULL,
  `domicilio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`NUM_SUC`),
  UNIQUE KEY `iu_ciu` (`CIUDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla ventas_2016.sucursal: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` (`NUM_SUC`, `CIUDAD`, `ZONA`, `DIRECTOR`, `OBJETIVO_A—O`, `domicilio`, `cp`) VALUES
	('11', 'VALENCIA', 'ESTE', '106', 57500.00, NULL, NULL),
	('12', 'ALICANTE', 'ESTE', '104', 77500.00, NULL, NULL),
	('13', 'CASTELL”N', 'ESTE', '105', 350000.00, NULL, NULL),
	('21', 'PAMPLONA', 'NORTE', '108', 70000.00, NULL, NULL),
	('22', 'ZARAGOZA', 'NORTE', '108', 30000.00, NULL, NULL);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;


..........................................................

alter table cabped
add CONSTRAINT `cliente_pedido` FOREIGN KEY (`COD_CLI`) REFERENCES `clientes` (`NUM_CLI`);
alter table cabped
add  CONSTRAINT `vendedor_pedido` FOREIGN KEY (`COD_VENDE`) REFERENCES `infemple` (`NUM_EMPLE`) ON DELETE SET NULL ON UPDATE CASCADE;


alter table clientes add
 CONSTRAINT `vendedor` FOREIGN KEY (`REPRESENT`) REFERENCES `infemple` (`NUM_EMPLE`) ON DELETE SET NULL ON UPDATE CASCADE;


ALTER TABLE infemple ADD
CONSTRAINT `es_jefe_de` FOREIGN KEY (`JEFE`) REFERENCES `infemple` (`NUM_EMPLE`) ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE infemple ADD CONSTRAINT `lasucursal` FOREIGN KEY (`SUCURSAL`) REFERENCES `sucursal` (`NUM_SUC`) ON DELETE SET NULL ON UPDATE CASCADE;

 
