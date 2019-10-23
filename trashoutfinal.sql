-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2019 a las 17:54:17
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(4, 18000000, 'garcia', 'roberto', 'Viamonte', 1234, '', '', 1, 'roberto@com'),
(5, 4243434, 'Kskaks', 'Kalsls', 'Usisjw', 5464, '', '', 1, 'a@a.com'),
(7, 12345678, 'Garcia Amaro', 'Manuel', 'Viamonte', 123, '', '', 1, 'manuelgarcia0952@gmail.com'),
(8, 87654321, 'Garcia Amaro', 'Manuel', 'VIAMONTE', 123, '', '', 1, 'demo@com'),
(9, 36524481, 'dagata', 'luciano', '1234', 1234, '', '', 1, 'asd@asd.com'),
(11, 23993247, 'saavedra', 'sebastian', 'Edison', 145, '', '', 1, 'tcsbolivar@gmail.com');

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
(16, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.240678, -61.128680, '2019-10-12 20:26:55', 1, NULL),
(17, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.232378, -61.122021, '2019-10-12 20:36:11', 1, NULL),
(18, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.232417, -61.121889, '2019-10-12 20:40:14', 1, NULL),
(19, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.232472, -61.121910, '2019-10-12 20:49:00', 1, NULL),
(20, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.223682, -61.108032, '2019-10-12 22:10:41', 1, NULL),
(21, 4, '', 'La rural, Bolívar', 1, -36.223149, -61.107041, '2019-10-12 22:52:20', 1, NULL),
(22, 4, '', 'Ubicacion actual por geolocalizacion', 1, -36.232378, -61.121893, '2019-10-13 03:26:42', 1, NULL),
(23, 4, '', 'Otra', 1, -36.232506, -61.121752, '2019-10-13 03:27:26', 1, NULL),
(24, 6, '', 'edison 350, bolivar, buenos aires', 1, -36.236460, -61.114348, '2019-10-13 22:29:18', 1, NULL),
(25, 8, '', 'Cine Avenida Bolivar', 1, -36.241408, -61.128704, '2019-10-16 17:29:14', 1, NULL),
(26, 5, '', 'Ubicacion actual por geolocalizacion', 1, -36.238765, -61.114280, '2019-10-16 21:17:41', 1, NULL),
(27, 4, '', 'Ubicacion actual por geolocalizacion', 1, -37.994925, -57.555775, '2019-10-17 23:29:35', 1, NULL),
(28, 6, '', 'edison 350, bolivar, buenos aires', 1, -36.236460, -61.114348, '2019-10-23 01:49:15', 1, NULL),
(29, 5, '', 'Quirno Costa 540', 1, -34.666789, -58.542696, '2019-10-23 15:17:10', 1, NULL);

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
  `clave` varchar(130) NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`mail`, `clave`, `nivel`) VALUES
('a@a.com', '$2y$10$H/SILgBbmNOjHprFyhiG3ODxlmyRD/7vZ33uUSHtHjWVH1ccoZ4PS', 0),
('asd@asd.com', '$2y$10$ReU40QaJUAwnCWUnRVI3I.WvXYaHr9y1ZkyokOCkcm.8hTd8cgN42', 0),
('demo@com', '$2y$10$K0vDBOZX7NINZoFvD5j6XusXqNsWE28W97kwFy2GiqbDy6Zy3Q3zu', 0),
('manuelgarcia0952@gmail.com', '$2y$10$xobmjUXQLqmPKVu.F1U85uRb1iMp5gv3E6zVciQnwI4tyjgjEoII2', 0),
('roberto@com', '$2y$10$wOmV543go.m7uh.UQjF7Z.qUgGEt7r7DvlB0I9H6nit4VP4qckloG', 0),
('tcsbolivar@gmail.com', '$2y$10$fmsdGdC44Rr1nTyOAwgkceiTK4TjFXqNRZScs.cl6Glh5B/HysC5G', 1),
('usuario@com', '$2y$10$aCLjs5HvgQLkC.v3vPVPRez0tViQpJS.jYnF8D7CJv433s7.m.aB.', 0);

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
  MODIFY `idciudadano` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  MODIFY `idcuadrilla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `iddenuncia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idlocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
