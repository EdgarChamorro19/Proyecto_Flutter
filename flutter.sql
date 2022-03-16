-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2022 a las 10:15:51
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flutter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `shipper` varchar(50) NOT NULL,
  `consigner` varchar(50) NOT NULL,
  `carrier` varchar(50) NOT NULL,
  `tracking` varchar(50) NOT NULL,
  `valorcompra` decimal(10,2) NOT NULL,
  `detalle` text NOT NULL,
  `estado` varchar(50) NOT NULL,
  `CedUsuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha`, `shipper`, `consigner`, `carrier`, `tracking`, `valorcompra`, `detalle`, `estado`, `CedUsuario`) VALUES
(1, '2022-03-14 00:00:00', 'Amazon', 'Edgar Chamorro', 'Servientrega', 'No se que es esto', '50.00', 'Camiseta Adidas Negra Talla S', 'Por Confirmar', '0956378416'),
(2, '2022-03-15 00:00:00', 'Mercadolibre ', 'Edgar Chamorro ', 'Servientrega ', 'blavla', '200.00', 'hhfkhcghj', 'Por Confirmar', '0963258741'),
(4, '2022-03-16 00:00:00', 'Mercadolibre ', 'Luis', 'Correos del Ecuador', 'bla bla ', '200.00', 'Zapatos Adidas talla 7.5 ', 'Por Confirmar', '0986324856');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Cedula` varchar(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Cedula`, `Nombre`, `Apellido`, `Email`, `Password`, `Rol`) VALUES
('0956378416', 'Edgar', 'Chamorro', 'edgar@gmail.com', 'edgar123', 'Cliente'),
('0963258741', 'Jose', 'Perez', 'jose@gmail.com', 'jose123', 'Cliente'),
('0986324856', 'Luis', 'Hernandez', 'luis@gmail.com', 'luis123', 'Cliente'),
('0987653215', 'Pepe', 'Parrales', 'pepe@gmail.com', 'pepe123', 'Cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CedUsuario` (`CedUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`CedUsuario`) REFERENCES `usuario` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
