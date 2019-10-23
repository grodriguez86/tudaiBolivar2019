-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-10-2019 a las 17:19:19
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trashout`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `idciudadano` int(50) NOT NULL,
  `dni` int(8) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `numero` int(11) NOT NULL,
  `piso` varchar(3) DEFAULT NULL,
  `dtp` varchar(5) DEFAULT NULL,
  `idlocalidad` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`idciudadano`, `dni`, `apellido`, `nombre`, `calle`, `numero`, `piso`, `dtp`, `idlocalidad`, `mail`) VALUES
(3, 12313, 'asdas', 'asdasd', 'ssdfds', 321321, '', '', 1, 'usuario@com'),
(4, 18000000, 'garcia', 'roberto', 'Viamonte', 1234, '', '', 1, 'roberto@com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadrilla`
--

CREATE TABLE `cuadrilla` (
  `idcuadrilla` int(11) NOT NULL,
  `idciudadano` int(50) NOT NULL,
  `idcargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia`
--

CREATE TABLE `denuncia` (
  `iddenuncia` int(11) NOT NULL,
  `idciudadano` int(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `idlocalidad` int(11) NOT NULL,
  `latitud` double(10,6) NOT NULL,
  `longitud` double(10,6) NOT NULL,
  `fecha_denuncia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idcuadrilla` int(11) NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `denuncia`
--

INSERT INTO `denuncia` (`iddenuncia`, `idciudadano`, `descripcion`, `ubicacion`, `idlocalidad`, `latitud`, `longitud`, `fecha_denuncia`, `idcuadrilla`, `fecha_finalizacion`) VALUES
(3, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:27:28', 1, NULL),
(4, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:28:16', 1, NULL),
(5, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:32:30', 1, NULL),
(6, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:33:56', 1, NULL),
(7, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:35:45', 1, NULL),
(8, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:46:09', 1, NULL),
(9, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:47:20', 1, NULL),
(10, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:48:23', 1, NULL),
(11, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 15:50:46', 1, NULL),
(12, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 16:08:13', 1, NULL),
(13, 4, '', '', 1, -36.240678, -61.128680, '2019-10-12 16:12:02', 1, NULL),
(14, 4, '', 'hotel san carlos, bolivar', 1, -36.229017, -61.113685, '2019-10-12 17:15:48', 1, NULL),
(15, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.240678, -61.128680, '2019-10-12 17:17:53', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idlocalidad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`idlocalidad`, `nombre`) VALUES
(1, 'Bolivar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `mail` varchar(50) NOT NULL,
  `clave` varchar(130) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`mail`, `clave`) VALUES
('roberto@com', '$2y$10$wOmV543go.m7uh.UQjF7Z.qUgGEt7r7DvlB0I9H6nit4VP4qckloG'),
('usuario@com', '$2y$10$aCLjs5HvgQLkC.v3vPVPRez0tViQpJS.jYnF8D7CJv433s7.m.aB.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`idciudadano`,`dni`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indices de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD PRIMARY KEY (`idcuadrilla`);

--
-- Indices de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`iddenuncia`,`idciudadano`,`idcuadrilla`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idlocalidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`mail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `idciudadano` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  MODIFY `idcuadrilla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `iddenuncia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idlocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
