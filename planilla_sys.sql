-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-05-2020 a las 00:07:28
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planilla_sys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` varchar(10) NOT NULL,
  `nombre_concepto` varchar(40) NOT NULL,
  `efecto_concepto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `nombre_concepto`, `efecto_concepto`) VALUES
('BONI', 'Bonificación', 'Ingreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` varchar(10) NOT NULL,
  `nombre_departamento` varchar(60) NOT NULL,
  `estado_departamento` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre_departamento`, `estado_departamento`) VALUES
('conta4893', 'Contabilidad', 'A'),
('desar6322', 'Desarrollo de Software', 'A'),
('ingen2354', 'Ingeniería', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_nomina`
--

CREATE TABLE `detalle_nomina` (
  `id_detalle` int(15) NOT NULL,
  `fk_nominae` varchar(30) NOT NULL,
  `fk_concepto` varchar(10) NOT NULL,
  `valor_concepto` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `carnet_empleado` varchar(15) NOT NULL,
  `dpi_empleado` varchar(15) NOT NULL,
  `nombre_empleado` varchar(75) NOT NULL,
  `apellidos_empleado` varchar(75) NOT NULL,
  `domicilio_empleado` varchar(50) NOT NULL,
  `telefono_empleado` int(8) NOT NULL,
  `celular_empleado` int(8) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estatus_empleado` varchar(1) NOT NULL,
  `fk_puesto` varchar(10) NOT NULL,
  `fk_departamento` varchar(10) NOT NULL,
  `sueldo_base` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`carnet_empleado`, `dpi_empleado`, `nombre_empleado`, `apellidos_empleado`, `domicilio_empleado`, `telefono_empleado`, `celular_empleado`, `fecha_nacimiento`, `estatus_empleado`, `fk_puesto`, `fk_departamento`, `sueldo_base`) VALUES
('AR2345', '234567890', 'Abel', 'Ruiz', 'Zona 8', 66335544, 55889944, '1972-00-04', 'A', 'ingen7716', 'ingen2354', 8000.00),
('AR4545', '4545454', 'Artemio', 'Ruíz', 'Zona 9', 5, 5, '1950-01-15', 'a', 'ingen7716', 'ingen2354', 9000.00),
('DPVV3756', '375641208700', 'Diego Pablo', 'Vásquez Vásquez', 'Guatemala, Zona 17', 22663355, 58964174, '2001-07-05', 'A', 'ingen7716', 'desar6322', 5000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresion_nomina`
--

CREATE TABLE `impresion_nomina` (
  `id_impresion` int(11) NOT NULL,
  `fk_nomEmp` varchar(15) NOT NULL,
  `ingresos_totales` float(10,2) NOT NULL,
  `egresos_totales` float(10,2) NOT NULL,
  `total_liquido` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `id_nomina` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_empleado`
--

CREATE TABLE `nomina_empleado` (
  `id_nomEmp` varchar(30) NOT NULL,
  `fk_empleado` varchar(15) NOT NULL,
  `fk_nomina` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id_puesto` varchar(10) NOT NULL,
  `nombre_puesto` varchar(60) NOT NULL,
  `estado_puesto` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`id_puesto`, `nombre_puesto`, `estado_puesto`) VALUES
('aboga9041', 'Abogado', 'a'),
('ingen7716', 'Ingeniero', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_concepto` (`fk_concepto`),
  ADD KEY `fk_nominae` (`fk_nominae`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`carnet_empleado`),
  ADD UNIQUE KEY `dpi_empleado` (`dpi_empleado`),
  ADD KEY `fk_puesto` (`fk_puesto`),
  ADD KEY `fk_departamento` (`fk_departamento`);

--
-- Indices de la tabla `impresion_nomina`
--
ALTER TABLE `impresion_nomina`
  ADD PRIMARY KEY (`id_impresion`),
  ADD KEY `fk_nomEmp` (`fk_nomEmp`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`id_nomina`);

--
-- Indices de la tabla `nomina_empleado`
--
ALTER TABLE `nomina_empleado`
  ADD PRIMARY KEY (`id_nomEmp`),
  ADD KEY `fk_nomina` (`fk_nomina`),
  ADD KEY `fk_empleado` (`fk_empleado`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id_puesto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  MODIFY `id_detalle` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `impresion_nomina`
--
ALTER TABLE `impresion_nomina`
  MODIFY `id_impresion` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_nomina`
--
ALTER TABLE `detalle_nomina`
  ADD CONSTRAINT `fk_concepto` FOREIGN KEY (`fk_concepto`) REFERENCES `concepto` (`id_concepto`),
  ADD CONSTRAINT `fk_nominae` FOREIGN KEY (`fk_nominae`) REFERENCES `nomina_empleado` (`id_nomEmp`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`fk_puesto`) REFERENCES `puesto` (`id_puesto`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`fk_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `impresion_nomina`
--
ALTER TABLE `impresion_nomina`
  ADD CONSTRAINT `fk_nomEmp` FOREIGN KEY (`fk_nomEmp`) REFERENCES `nomina_empleado` (`id_nomEmp`);

--
-- Filtros para la tabla `nomina_empleado`
--
ALTER TABLE `nomina_empleado`
  ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`carnet_empleado`),
  ADD CONSTRAINT `fk_nomina` FOREIGN KEY (`fk_nomina`) REFERENCES `nomina` (`id_nomina`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
