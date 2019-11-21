-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-11-2019 a las 17:38:38
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `mail` varchar(50) NOT NULL,
  `clave` varchar(130) NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT 0,
  `codigo` int(10) NOT NULL,
  `estado` varchar(2) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`mail`, `clave`, `nivel`, `codigo`, `estado`) VALUES
('a@a.com', '$2y$10$H/SILgBbmNOjHprFyhiG3ODxlmyRD/7vZ33uUSHtHjWVH1ccoZ4PS', 0, 0, 'SI'),
('asd@asd.com', '$2y$10$ReU40QaJUAwnCWUnRVI3I.WvXYaHr9y1ZkyokOCkcm.8hTd8cgN42', 0, 0, 'SI'),
('demo@com', '$2y$10$K0vDBOZX7NINZoFvD5j6XusXqNsWE28W97kwFy2GiqbDy6Zy3Q3zu', 0, 0, 'SI'),
('jj@jj', '$2y$10$XxoBCd.1ThcDjqEPjalk9.hmyI5zc8JFGMn7ukmnq9/b53gA.BvJ2', 0, 22478, 'SI'),
('loco@loco', '$2y$10$SBOqYf4o7ZX/VzKSetx/1empjigLEneqRICoCZBjGZcOXnJI09kum', 0, 0, 'SI'),
('manuelgarcia0952@gmail.com', '$2y$10$xobmjUXQLqmPKVu.F1U85uRb1iMp5gv3E6zVciQnwI4tyjgjEoII2', 0, 0, 'SI'),
('roberto@com', '$2y$10$wOmV543go.m7uh.UQjF7Z.qUgGEt7r7DvlB0I9H6nit4VP4qckloG', 0, 0, 'SI'),
('tcsbolivar@gmail.com', '$2y$10$fmsdGdC44Rr1nTyOAwgkceiTK4TjFXqNRZScs.cl6Glh5B/HysC5G', 1, 0, 'SI'),
('usuario@com', '$2y$10$aCLjs5HvgQLkC.v3vPVPRez0tViQpJS.jYnF8D7CJv433s7.m.aB.', 0, 0, 'SI');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`mail`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
