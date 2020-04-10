-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-04-2020 a las 23:13:13
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planilla_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_19543`
--

CREATE TABLE `concepto_19543` (
  `codigo_concepto` varchar(5) NOT NULL,
  `nombre_concepto` varchar(60) NOT NULL,
  `efecto_concepto` varchar(1) NOT NULL,
  `estatus_concepto` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `concepto_19543`
--

INSERT INTO `concepto_19543` (`codigo_concepto`, `nombre_concepto`, `efecto_concepto`, `estatus_concepto`) VALUES
('1', 'Pago', 'P', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_19543`
--

CREATE TABLE `departamento_19543` (
  `codigo_departamento` varchar(5) NOT NULL,
  `nombre_departamento` varchar(60) NOT NULL,
  `estatus_departamento` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_19543`
--

CREATE TABLE `empleado_19543` (
  `codigo_empleado` varchar(5) NOT NULL,
  `nombre_empleado` varchar(60) NOT NULL,
  `FKcodigo_puesto` varchar(5) NOT NULL,
  `FKcodigo_departamento` varchar(5) NOT NULL,
  `sueldo_empleado` float(10,2) NOT NULL,
  `estatus_empleado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominae_19543`
--

CREATE TABLE `nominae_19543` (
  `codigo_nomina` varchar(5) NOT NULL,
  `fecha_inicial_nomina` date NOT NULL,
  `fecha_final_nomina` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominasd_19543`
--

CREATE TABLE `nominasd_19543` (
  `FK_CodigoNomina` varchar(5) NOT NULL,
  `Fk_CodigoEmpleado` varchar(5) NOT NULL,
  `FK_CodigoConcepto` varchar(5) NOT NULL,
  `valor_nominaD` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto_19543`
--

CREATE TABLE `puesto_19543` (
  `codigo_puesto` varchar(5) NOT NULL,
  `nombre_puesto` varchar(60) NOT NULL,
  `estatus_puesto` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto_19543`
--
ALTER TABLE `concepto_19543`
  ADD PRIMARY KEY (`codigo_concepto`);

--
-- Indices de la tabla `departamento_19543`
--
ALTER TABLE `departamento_19543`
  ADD PRIMARY KEY (`codigo_departamento`);

--
-- Indices de la tabla `empleado_19543`
--
ALTER TABLE `empleado_19543`
  ADD PRIMARY KEY (`codigo_empleado`),
  ADD KEY `FKcodigo_puesto` (`FKcodigo_puesto`),
  ADD KEY `FKcodigo_departamento` (`FKcodigo_departamento`);

--
-- Indices de la tabla `nominae_19543`
--
ALTER TABLE `nominae_19543`
  ADD PRIMARY KEY (`codigo_nomina`);

--
-- Indices de la tabla `nominasd_19543`
--
ALTER TABLE `nominasd_19543`
  ADD KEY `FK_CodigoNomina` (`FK_CodigoNomina`),
  ADD KEY `Fk_CodigoEmpleado` (`Fk_CodigoEmpleado`),
  ADD KEY `FK_CodigoConcepto` (`FK_CodigoConcepto`);

--
-- Indices de la tabla `puesto_19543`
--
ALTER TABLE `puesto_19543`
  ADD PRIMARY KEY (`codigo_puesto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_19543`
--
ALTER TABLE `empleado_19543`
  ADD CONSTRAINT `empleado_19543_ibfk_1` FOREIGN KEY (`FKcodigo_puesto`) REFERENCES `puesto_19543` (`codigo_puesto`),
  ADD CONSTRAINT `empleado_19543_ibfk_2` FOREIGN KEY (`FKcodigo_departamento`) REFERENCES `departamento_19543` (`codigo_departamento`);

--
-- Filtros para la tabla `nominasd_19543`
--
ALTER TABLE `nominasd_19543`
  ADD CONSTRAINT `nominasd_19543_ibfk_1` FOREIGN KEY (`FK_CodigoNomina`) REFERENCES `nominae_19543` (`codigo_nomina`),
  ADD CONSTRAINT `nominasd_19543_ibfk_2` FOREIGN KEY (`Fk_CodigoEmpleado`) REFERENCES `empleado_19543` (`codigo_empleado`),
  ADD CONSTRAINT `nominasd_19543_ibfk_3` FOREIGN KEY (`FK_CodigoConcepto`) REFERENCES `concepto_19543` (`codigo_concepto`),
  ADD CONSTRAINT `nominasd_19543_ibfk_4` FOREIGN KEY (`Fk_CodigoEmpleado`) REFERENCES `empleado_19543` (`codigo_empleado`),
  ADD CONSTRAINT `nominasd_19543_ibfk_5` FOREIGN KEY (`FK_CodigoConcepto`) REFERENCES `concepto_19543` (`codigo_concepto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
