-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-10-2019 a las 10:44:37
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `relaciones`
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
  `calle` varchar(30) NOT NULL,
  `numero` int(11) NOT NULL,
  `idlocalidad` int(11) NOT NULL,
  `fecha_denuncia` date NOT NULL,
  `idcuadrilla` int(11) NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idlocalidad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `mail` varchar(50) NOT NULL,
  `clave` varchar(130) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `idlocalidad` (`idlocalidad`),
  ADD KEY `mail_2` (`mail`);

--
-- Indices de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD PRIMARY KEY (`idcuadrilla`),
  ADD KEY `idcargo` (`idcargo`),
  ADD KEY `idciudadano` (`idciudadano`);

--
-- Indices de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`iddenuncia`,`idciudadano`,`idcuadrilla`),
  ADD KEY `idlocalidad` (`idlocalidad`),
  ADD KEY `idcuadrilla` (`idcuadrilla`),
  ADD KEY `idciudadano` (`idciudadano`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idlocalidad`),
  ADD KEY `idlocalidad` (`idlocalidad`);

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
  MODIFY `idciudadano` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  MODIFY `idcuadrilla` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `iddenuncia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idlocalidad` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD CONSTRAINT `ciudadano_ibfk_1` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudadano_ibfk_2` FOREIGN KEY (`mail`) REFERENCES `usuario` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD CONSTRAINT `cuadrilla_ibfk_1` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`),
  ADD CONSTRAINT `cuadrilla_ibfk_2` FOREIGN KEY (`idciudadano`) REFERENCES `ciudadano` (`idciudadano`);

--
-- Filtros para la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`),
  ADD CONSTRAINT `denuncia_ibfk_2` FOREIGN KEY (`idcuadrilla`) REFERENCES `cuadrilla` (`idcuadrilla`),
  ADD CONSTRAINT `denuncia_ibfk_3` FOREIGN KEY (`idciudadano`) REFERENCES `ciudadano` (`idciudadano`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
