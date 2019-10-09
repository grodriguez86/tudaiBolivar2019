-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2019 a las 15:10:12
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
  `idcargo` int(50) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `idciudadano` int(50) NOT NULL,
  `dni` decimal(8,0) NOT NULL,
  `numero` int(11) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `piso` decimal(3,0) DEFAULT NULL,
  `dtp` varchar(2) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `idlocalidad` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadrilla`
--

CREATE TABLE `cuadrilla` (
  `idcuadrilla` int(50) NOT NULL,
  `idciudadano` int(50) NOT NULL,
  `idcargo` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia`
--

CREATE TABLE `denuncia` (
  `iddenuncia` int(50) NOT NULL,
  `idciudadano` int(50) DEFAULT NULL,
  `calle` decimal(8,0) NOT NULL,
  `numero` int(11) NOT NULL,
  `idlocalidad` int(50) NOT NULL,
  `fecha_denuncia` date DEFAULT NULL,
  `idcuadrilla` int(50) DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idlocalidad` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `mail` varchar(50) NOT NULL,
  `clave` varchar(130) NOT NULL
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
  ADD PRIMARY KEY (`idciudadano`,`mail`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `mail` (`mail`),
  ADD KEY `fk_ciudadano_localidad` (`idlocalidad`);

--
-- Indices de la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD PRIMARY KEY (`idcuadrilla`),
  ADD KEY `fk_cuadrilla_cargo` (`idcargo`),
  ADD KEY `fk_cuadrilla_ciudadano` (`idciudadano`);

--
-- Indices de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`iddenuncia`),
  ADD KEY `fk_denuncia_ciudadano` (`idciudadano`),
  ADD KEY `fk_denuncia_localidad` (`idlocalidad`),
  ADD KEY `fk_denuncia_cuadrilla` (`idcuadrilla`);

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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD CONSTRAINT `fk_ciudadano_localidad` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuadrilla`
--
ALTER TABLE `cuadrilla`
  ADD CONSTRAINT `fk_cuadrilla_cargo` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cuadrilla_ciudadano` FOREIGN KEY (`idciudadano`) REFERENCES `ciudadano` (`idciudadano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `fk_denuncia_ciudadano` FOREIGN KEY (`idciudadano`) REFERENCES `ciudadano` (`idciudadano`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_denuncia_cuadrilla` FOREIGN KEY (`idcuadrilla`) REFERENCES `cuadrilla` (`idcuadrilla`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_denuncia_localidad` FOREIGN KEY (`idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_ciudadano` FOREIGN KEY (`mail`) REFERENCES `ciudadano` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
