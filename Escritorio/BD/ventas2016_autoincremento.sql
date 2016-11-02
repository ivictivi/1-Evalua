-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-10-2016 a las 19:26:32
-- Versión del servidor: 5.7.13-0ubuntu0.16.04.2
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas2016_autoincremento`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `importe_pedido` (`elpedido` INT) RETURNS DOUBLE BEGIN
DECLARE importe REAL;

select sum(cantidad*pvp) into importe 
from linped where pedido=elpedido;

RETURN importe;

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_articulo` int(6) UNSIGNED NOT NULL,
  `ID_FABRICA` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `COD_ARTI` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `DENOMINACION` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'P. GENÉRICO''',
  `EXISTENCIAS` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `PRE_COMPRA` decimal(9,2) DEFAULT NULL,
  `CANT_REPO` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `ID_FABRICA`, `COD_ARTI`, `DENOMINACION`, `EXISTENCIAS`, `PRE_COMPRA`, `CANT_REPO`) VALUES
(1, 'ACI', '41001', 'Artículo tipo 1', 227, '70.00', 45),
(2, 'ACI', '41002', 'Artículo tipo 2', 167, '450.00', 300),
(3, 'ACI', '41003', 'Artículo tipo 3', 207, '40.00', 150),
(4, 'ACI', '41004', 'Artículo tipo 4', 139, '20.00', 100),
(5, 'ACI', '4100X', 'Tornillo Ajustador', 37, '2.50', 24),
(6, 'ACI', '4100Y', 'Extractor', 25, '120.00', 12),
(7, 'ACI', '4100Z', 'Montador', 28, '500.00', 45),
(8, 'BIC', '41003', 'Manivela', 3, '120.00', 15),
(9, 'BIC', '41089', 'Codo', 78, '2.50', 23),
(10, 'BIC', '41672', 'Pletina', 0, '5.00', 5),
(11, 'FEA', '112', 'Cubierta', 115, '25.00', 100),
(12, 'FEA', '114', 'Bancada Motor', 15, '130.00', 21),
(13, 'IMM', '773C', 'Riostra 1/2-tm', 28, '650.00', 12),
(14, 'IMM', '775C', 'Riostra 1-tm', 5, '200.00', 20),
(15, 'IMM', '779C', 'Riostra 2-m', 9, '150.00', 20),
(16, 'IMM', '887H', 'Soporte', 223, '5.00', 200),
(17, 'IMM', '887P', 'Perno', 24, '5.00', 12),
(18, 'IMM', '887X', 'Retenedor Riostra', 32, '6.00', 21),
(19, 'QSA', 'XK47', 'Reductor', 38, '60.00', 9),
(20, 'QSA', 'XK48', 'Reductor', 203, '80.00', 125),
(21, 'QSA', 'XK48A', 'Reductor', 37, '70.00', 23),
(22, 'REI', '2A44G', 'Pasador Bisagra', 14, '9.00', 33),
(23, 'REI', '2A44L', 'Bisagra Izquierda', 12, '3.00', 6),
(24, 'REI', '2A44R', 'Bisagra Derecha', 12, '6.00', 7),
(25, 'REI', '2A45C', 'Tornillo Trinquete', 210, '8.00', 125);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabped`
--

CREATE TABLE `cabped` (
  `id_pedido` int(6) UNSIGNED NOT NULL,
  `FECHA_PED` date NOT NULL,
  `FECHA_ENVI` date DEFAULT NULL,
  `PAGADO` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `MODO_ENVIO` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_vendedor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cabped`
--

INSERT INTO `cabped` (`id_pedido`, `FECHA_PED`, `FECHA_ENVI`, `PAGADO`, `MODO_ENVIO`, `id_cliente`, `id_vendedor`) VALUES
(1, '2013-12-17', '2013-12-27', 'SI', 'RENFE', 19, 5),
(2, '2013-12-17', '2013-12-17', 'SI', 'RENFE', 19, 5),
(3, '2013-12-17', '2013-12-22', 'SI', 'RENFE', 19, 5),
(4, '2013-12-17', '2013-12-17', 'NO', 'SEUR', 10, 8),
(5, '2013-12-17', '2013-12-23', 'NO', 'SEUR', 10, 8),
(6, '2013-12-17', '2013-12-19', 'SI', 'CAVE', 6, 10),
(7, '2013-12-17', '2013-12-21', 'NO', 'SEUR', 10, 8),
(8, '2013-12-17', '2013-12-22', 'NO', 'CAVE', 7, 9),
(9, '2013-12-17', '2013-12-17', 'SI', 'SEUR', 12, 2),
(10, '2013-12-17', '2013-12-17', 'NO', 'RENFE', 21, 7),
(11, '2013-12-17', '2013-12-17', 'SI', 'CAVE', 9, 3),
(12, '2013-12-17', '2013-12-28', 'SI', 'CAVE', 11, 4),
(13, '2013-12-17', '2013-12-27', 'SI', 'CAVE', 2, 1),
(14, '2013-12-17', '2013-12-27', 'SI', 'SEUR', 14, 6),
(15, '2013-12-17', '2013-12-27', 'SI', 'RENFE', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(6) UNSIGNED NOT NULL,
  `NOMBRE` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `CIUDAD_CLI` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `FAX` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `TIPO_CLI` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `LIM_CRE` decimal(10,2) DEFAULT '0.00',
  `domicilio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_empleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `NOMBRE`, `CIUDAD_CLI`, `TELEFONO`, `FAX`, `TIPO_CLI`, `LIM_CRE`, `domicilio`, `cp`, `id_empleado`) VALUES
(1, 'JULIA ANTEQUERA', NULL, '123456789', '56543219', 'B', '6500.00', NULL, NULL, 6),
(2, 'FINDEX', 'ALICANTE', '123456789', '56543219', 'B', '6500.00', NULL, NULL, 1),
(3, 'ACME', 'ALICANTE', '123456789', '56543219', 'MB', '5000.00', NULL, NULL, 5),
(4, 'AAA INVEST.', 'ALICANTE', '123456789', '56543219', 'MB', '4500.00', NULL, NULL, 1),
(5, 'FRENTES S.A.', 'PAMPLONA', '123456789', '56543219', 'M', '6500.00', NULL, NULL, 2),
(6, 'ACEINTER', 'ALICANTE', '123456789', '56543219', 'R', '3500.00', NULL, NULL, 10),
(7, 'HOLAND', 'VALENCIA', '123456789', '56543219', 'M', '5500.00', NULL, NULL, 9),
(8, 'CHEN QUIMICA', 'ALICANTE', '123456789', '56543219', 'B', '2500.00', NULL, NULL, 3),
(9, 'JCP S.L.', 'ALICANTE', '123456789', '56543219', 'R', '5000.00', NULL, NULL, 3),
(10, 'ZETA', 'VALENCIA', '123456789', '56543219', 'B', '5000.00', NULL, NULL, 8),
(11, 'JUAN S.L.', 'VALENCIA', '123456789', '56543219', 'B', '2000.00', NULL, NULL, 4),
(12, 'ORIÁN', 'PAMPLONA', '123456789', '56543219', 'B', '2000.00', NULL, NULL, 2),
(13, 'SANSÓN COP.', 'ALICANTE', '123456789', '56543219', 'M', '2000.00', NULL, NULL, 1),
(14, 'JAVPER', NULL, '123456789', '56543219', 'M', '3500.00', NULL, NULL, 6),
(15, 'MEDIO SIST.', 'VALENCIA', '123456789', '56543219', 'M', '6000.00', NULL, NULL, 8),
(16, 'SALOMÓN S.L.', 'VALENCIA', '123456789', '56543219', 'M', '2500.00', NULL, NULL, 9),
(17, 'RICA S.A.', 'PAMPLONA', '123456789', '56543219', 'R', '5000.00', NULL, NULL, 2),
(18, 'QMA ASOC.', 'ALICANTE', '123456789', '56543219', 'B', '4500.00', NULL, NULL, 3),
(19, 'TERCERA LIN.', 'ALICANTE', '123456789', '56543219', 'R', '3000.00', NULL, NULL, 5),
(20, 'CARTERAS S.A.', 'PAMPLONA', '123456789', '56543219', 'M', '4000.00', NULL, NULL, 2),
(21, 'PEDRO HNOS.', 'PAMPLONA', '123456789', '56543219', 'MB', '4000.00', NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infemple`
--

CREATE TABLE `infemple` (
  `id_empleado` int(6) UNSIGNED NOT NULL,
  `NOMBRE` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `EDAD` decimal(2,0) DEFAULT NULL,
  `CARGO` varchar(10) COLLATE latin1_spanish_ci DEFAULT 'vendedor',
  `FECHA_CONTRATO` date DEFAULT NULL,
  `CUOTA_AÑO` decimal(12,2) DEFAULT NULL,
  `salario` decimal(6,2) DEFAULT NULL,
  `comision` int(2) DEFAULT NULL,
  `id_sucursal` int(10) UNSIGNED DEFAULT NULL,
  `id_jefe` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `infemple`
--

INSERT INTO `infemple` (`id_empleado`, `NOMBRE`, `EDAD`, `CARGO`, `FECHA_CONTRATO`, `CUOTA_AÑO`, `salario`, `comision`, `id_sucursal`, `id_jefe`) VALUES
(1, 'Antonio Viguer', '45', 'vendedor', '1986-10-20', '60000.00', NULL, NULL, 1, 4),
(2, 'Ãlvaro Jaumes', '48', 'vendedor', '1986-12-10', '70000.00', NULL, NULL, 3, 8),
(3, 'Susana Andreu', '29', 'vendedor', '1987-01-03', '55000.00', NULL, NULL, 1, 4),
(4, 'Lorenzo Bó', '33', 'dir ventas', '1987-05-19', '40000.00', NULL, NULL, 1, 6),
(5, 'Vicente Pantalla', '37', 'vendedor', '1988-06-14', '70000.00', NULL, NULL, 2, 4),
(6, 'Jorge Bobbio', '52', 'dir ventas', '1988-11-14', '55000.00', NULL, NULL, 4, NULL),
(7, 'José López', '49', 'vendedor', '1989-10-12', '60000.00', NULL, NULL, 5, 8),
(8, 'Samuel Cacho', '62', 'dir ventas', '1989-12-10', '70000.00', NULL, NULL, 3, 6),
(9, 'Nuria Esplai', '31', 'vendedor', '1989-12-10', '60000.00', NULL, NULL, 4, 6),
(10, 'Paulino Séez', '41', 'vendedor', '1990-01-13', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linped`
--

CREATE TABLE `linped` (
  `PEDIDO` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `CANTIDAD` decimal(6,0) NOT NULL,
  `PVP` decimal(9,2) DEFAULT NULL,
  `id_articulo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `linped`
--

INSERT INTO `linped` (`PEDIDO`, `CANTIDAD`, `PVP`, `id_articulo`) VALUES
('1', '54', '585.00', 2),
('1', '35', '52.00', 3),
('1', '28', '26.00', 4),
('2', '11', '32.50', 11),
('2', '2', '195.00', 15),
('2', '14', '7.80', 24),
('3', '11', '156.00', 3),
('3', '2', '195.00', 15),
('3', '5', '104.00', 20),
('3', '14', '7.80', 24),
('4', '10', '585.00', 2),
('4', '20', '78.00', 19),
('4', '2', '104.00', 20),
('5', '11', '32.50', 11),
('5', '2', '195.00', 15),
('6', '9', '650.00', 7),
('6', '8', '10.40', 25),
('7', '1', '156.00', 3),
('7', '4', '104.00', 20),
('7', '10', '7.80', 24),
('8', '10', '32.50', 11),
('8', '3', '195.00', 15),
('9', '6', '650.00', 7),
('9', '2', '195.00', 15),
('9', '6', '78.00', 19),
('9', '24', '10.40', 25),
('10', '1', '156.00', 3),
('10', '10', '169.00', 12),
('10', '22', '260.00', 14),
('11', '24', '3.25', 5),
('11', '6', '11.70', 22),
('13', '34', '26.00', 4),
('13', '6', '3.25', 5),
('13', '5', '7.80', 24),
('14', '6', '169.00', 12),
('14', '7', '3.90', 23),
('15', '6', '26.00', 4),
('15', '11', '156.00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(6) UNSIGNED NOT NULL,
  `CIUDAD` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `ZONA` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `DIRECTOR` int(6) NOT NULL,
  `OBJETIVO_AÑO` decimal(14,2) NOT NULL,
  `domicilio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `CIUDAD`, `ZONA`, `DIRECTOR`, `OBJETIVO_AÑO`, `domicilio`, `cp`) VALUES
(1, 'ALICANTE', 'ESTE', 4, '77500.00', NULL, NULL),
(2, 'CASTELLÓN', 'ESTE', 5, '350000.00', NULL, NULL),
(3, 'PAMPLONA', 'NORTE', 8, '70000.00', NULL, NULL),
(4, 'VALENCIA', 'ESTE', 6, '57500.00', NULL, NULL),
(5, 'ZARAGOZA', 'NORTE', 8, '30000.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ventas_med_vendedor`
--
CREATE TABLE `ventas_med_vendedor` (
`id_vendedor` int(10) unsigned
,`media_pedido` double
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ventas_med_vendedor`
--
DROP TABLE IF EXISTS `ventas_med_vendedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ventas_med_vendedor`  AS  select `cabped`.`id_vendedor` AS `id_vendedor`,avg(`importe_pedido`(`cabped`.`id_pedido`)) AS `media_pedido` from `cabped` group by `cabped`.`id_vendedor` having (`media_pedido` is not null) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `i_arti` (`COD_ARTI`),
  ADD KEY `i_fab` (`ID_FABRICA`);

--
-- Indices de la tabla `cabped`
--
ALTER TABLE `cabped`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `cliente` (`id_cliente`),
  ADD KEY `vendedor` (`id_vendedor`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `representante` (`id_empleado`);

--
-- Indices de la tabla `infemple`
--
ALTER TABLE `infemple`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `sucursal` (`id_sucursal`),
  ADD KEY `jefe` (`id_jefe`);

--
-- Indices de la tabla `linped`
--
ALTER TABLE `linped`
  ADD KEY `articulo` (`id_articulo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD UNIQUE KEY `iu_ciu` (`CIUDAD`),
  ADD KEY `DIRECTOR` (`DIRECTOR`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_articulo` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `cabped`
--
ALTER TABLE `cabped`
  MODIFY `id_pedido` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `infemple`
--
ALTER TABLE `infemple`
  MODIFY `id_empleado` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cabped`
--
ALTER TABLE `cabped`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `infemple` (`id_empleado`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `representante` FOREIGN KEY (`id_empleado`) REFERENCES `infemple` (`id_empleado`);

--
-- Filtros para la tabla `infemple`
--
ALTER TABLE `infemple`
  ADD CONSTRAINT `jefe` FOREIGN KEY (`id_jefe`) REFERENCES `infemple` (`id_empleado`),
  ADD CONSTRAINT `sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `linped`
--
ALTER TABLE `linped`
  ADD CONSTRAINT `articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
