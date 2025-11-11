-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2025 a las 14:00:33
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
-- Base de datos: `tallermecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`, `email`) VALUES
(1, 'Miguel Merentiel', '1123456789', 'miguelmerentiel@gmail.com'),
(2, 'Leandro Paredes', '1134567890', 'leandroparedes@gmail.com'),
(3, 'Lionel Messi', '1145678901', 'lionelmessi@gmail.com'),
(4, 'Exequiel Zeballos', '1156789012', 'exequielzeballos@gmail.com'),
(5, 'Emiliano Martinez', '1167890123', 'emilianomartinez@gmail.com'),
(6, 'Ayrton Costa', '1178901234', 'ayrtoncosta@gmail.com'),
(7, 'Enzo Fernandez', '1189012345', 'enzofernandez@gmail.com'),
(8, 'Milton Delgado', '1190123456', 'miltondelgado@gmail.com'),
(9, 'Miguel Borja', '1101234567', 'miguelborja@gmail.com'),
(10, 'Matias Galarza', '1112345678', 'matiasgalarza@gmail.com'),
(11, 'Paulo Diaz', '1123456789', 'paulodiaz@gmail.com'),
(12, 'Franco Armani', '1134567890', 'francoarmani@gmail.com'),
(13, 'Milton Gimenez', '1145678901', 'miltongimenez@gmail.com'),
(14, 'Edinson Cavani', '1156789012', 'edinsoncavani@gmail.com'),
(15, 'Lautaro Blanco', '1167890123', 'lautaroblanco@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `rol`) VALUES
(1, 'Ramiro Magallanes', 'Recepcionista'),
(2, 'Vito Peluso', 'Mecánico'),
(3, 'Ignacio Vildozo', 'Mecánico'),
(4, 'Ramiro Ridolfi', 'Administrativo'),
(5, 'Marco Caputo', 'Jefe de Taller'),
(6, 'Facundo Bellini', 'Mecánico'),
(7, 'Ciro Maratea', 'Mecánico'),
(8, 'Adrian Rojas', 'Recepcionista'),
(9, 'Matias Lamensa', 'Mecánico'),
(10, 'Abhay Rodriguez', 'Mecánico'),
(11, 'Roman Rey', 'Administrativo'),
(12, 'Santiago Mendez', 'Jefe de Taller'),
(13, 'Ezequiel Garcia', 'Recepcionista'),
(14, 'Joaquin Sulca', 'Mecánico'),
(15, 'Giuliano Santangelo', 'Administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresotaller`
--

CREATE TABLE `ingresotaller` (
  `id_ingreso` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `motivo_ingreso` text DEFAULT NULL,
  `trabajos_realizados` text DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingresotaller`
--

INSERT INTO `ingresotaller` (`id_ingreso`, `id_vehiculo`, `fecha_ingreso`, `fecha_egreso`, `motivo_ingreso`, `trabajos_realizados`, `id_empleado`) VALUES
(1, 1, '2025-10-01', '2025-10-02', 'Cambio de aceite', 'Aceite y filtro cambiados', 2),
(2, 2, '2025-10-03', '2025-10-04', 'Falla en frenos', 'Cambio de pastillas', 3),
(3, 3, '2025-10-04', '2025-10-06', 'Revisión general', 'Chequeo completo', 2),
(4, 4, '2025-10-05', '2025-10-07', 'No arranca', 'Cambio de batería', 6),
(5, 5, '2025-10-06', '2025-10-08', 'Cambio de neumáticos', '4 neumáticos nuevos', 7),
(6, 6, '2025-10-07', '2025-10-09', 'Falla eléctrica', 'Reparación de alternador', 9),
(7, 7, '2025-10-08', '2025-10-10', 'Cambio de correa', 'Reemplazo completo', 10),
(8, 8, '2025-10-09', '2025-10-11', 'Ruidos en motor', 'Ajuste de válvulas', 14),
(9, 9, '2025-10-10', '2025-10-12', 'Chequeo de frenos', 'Pastillas y discos revisados', 3),
(10, 10, '2025-10-11', '2025-10-12', 'Luces fallan', 'Cambio de lámparas', 2),
(11, 11, '2025-10-12', '2025-10-13', 'Pérdida de potencia', 'Cambio de filtro de aire', 6),
(12, 12, '2025-10-13', '2025-10-14', 'Vibraciones', 'Balanceo y alineación', 7),
(13, 13, '2025-10-14', '2025-10-16', 'Cambio de embrague', 'Reemplazo completo', 9),
(14, 14, '2025-10-15', '2025-10-17', 'Cambio de bujías', 'Bujías nuevas instaladas', 10),
(15, 15, '2025-10-16', '2025-10-18', 'Fallo en dirección', 'Reparación hidráulica', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajorealizado`
--

CREATE TABLE `trabajorealizado` (
  `id_trabajo` int(11) NOT NULL,
  `id_ingreso` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajorealizado`
--

INSERT INTO `trabajorealizado` (`id_trabajo`, `id_ingreso`, `descripcion`, `costo`, `id_empleado`) VALUES
(1, 1, 'Cambio de aceite y filtro', '15000.00', 2),
(2, 2, 'Reparación de frenos', '22000.00', 3),
(3, 3, 'Chequeo general', '18000.00', 2),
(4, 4, 'Cambio de batería', '25000.00', 6),
(5, 5, 'Instalación de neumáticos', '80000.00', 7),
(6, 6, 'Reparación de alternador', '30000.00', 9),
(7, 7, 'Cambio de correa de distribución', '45000.00', 10),
(8, 8, 'Ajuste de válvulas', '35000.00', 14),
(9, 9, 'Revisión de frenos', '20000.00', 3),
(10, 10, 'Cambio de luces delanteras', '10000.00', 2),
(11, 11, 'Cambio de filtro de aire', '12000.00', 6),
(12, 12, 'Balanceo y alineación', '15000.00', 7),
(13, 13, 'Cambio de embrague', '90000.00', 9),
(14, 14, 'Reemplazo de bujías', '8000.00', 10),
(15, 15, 'Reparación de dirección hidráulica', '55000.00', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `fecha_turno` date NOT NULL,
  `hora_turno` time NOT NULL,
  `motivo` text DEFAULT NULL,
  `estado` enum('Pendiente','Confirmado','Cancelado','Atendido') DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `id_cliente`, `id_vehiculo`, `fecha_turno`, `hora_turno`, `motivo`, `estado`) VALUES
(1, 1, 1, '2025-11-01', '09:00:00', 'Revisión de rutina', 'Pendiente'),
(2, 2, 2, '2025-11-02', '10:00:00', 'Chequeo de frenos', 'Confirmado'),
(3, 3, 3, '2025-11-03', '11:30:00', 'Cambio de aceite', 'Pendiente'),
(4, 4, 4, '2025-11-04', '08:45:00', 'Problema eléctrico', 'Pendiente'),
(5, 5, 5, '2025-11-05', '13:00:00', 'Cambio de neumáticos', 'Pendiente'),
(6, 6, 6, '2025-11-06', '14:30:00', 'Revisión general', 'Confirmado'),
(7, 7, 7, '2025-11-07', '09:15:00', 'Chequeo motor', 'Pendiente'),
(8, 8, 8, '2025-11-08', '10:45:00', 'Cambio de correa', 'Pendiente'),
(9, 9, 9, '2025-11-09', '12:00:00', 'Diagnóstico de frenos', 'Pendiente'),
(10, 10, 10, '2025-11-10', '11:00:00', 'Revisión luces', 'Atendido'),
(11, 11, 11, '2025-11-11', '09:30:00', 'Alineación y balanceo', 'Pendiente'),
(12, 12, 12, '2025-11-12', '10:00:00', 'Cambio de bujías', 'Pendiente'),
(13, 13, 13, '2025-11-13', '15:00:00', 'Falla embrague', 'Confirmado'),
(14, 14, 14, '2025-11-14', '16:00:00', 'Chequeo general', 'Cancelado'),
(15, 15, 15, '2025-11-15', '08:30:00', 'Cambio de aceite', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `patente` varchar(10) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `patente`, `marca`, `modelo`, `id_cliente`) VALUES
(1, 'FED654', 'Toyota', 'Corolla', 1),
(2, 'CBA321', 'Ford', 'Focus', 2),
(3, 'LKJ210', 'Chevrolet', 'Cruze', 3),
(4, 'IHG987', 'Volkswagen', 'Polo', 4),
(5, 'RQP876', 'Honda', 'Civic', 5),
(6, 'ONM543', 'Renault', 'Clio', 6),
(7, 'XWV432', 'Peugeot', '208', 7),
(8, 'TUS109', 'Fiat', 'Cronos', 8),
(9, 'DCB098', 'Nissan', 'Sentra', 9),
(10, 'AZY765', 'Kia', 'Rio', 10),
(11, 'JIH465', 'Hyundai', 'i30', 11),
(12, 'GFE213', 'Mazda', '3', 12),
(13, 'PON210', 'Subaru', 'Impreza', 13),
(14, 'MLK978', 'BMW', '320i', 14),
(15, 'QRS435', 'Audi', 'A3', 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `ingresotaller`
--
ALTER TABLE `ingresotaller`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `trabajorealizado`
--
ALTER TABLE `trabajorealizado`
  ADD PRIMARY KEY (`id_trabajo`),
  ADD KEY `id_ingreso` (`id_ingreso`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `patente` (`patente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ingresotaller`
--
ALTER TABLE `ingresotaller`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `trabajorealizado`
--
ALTER TABLE `trabajorealizado`
  MODIFY `id_trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresotaller`
--
ALTER TABLE `ingresotaller`
  ADD CONSTRAINT `ingresotaller_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `ingresotaller_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `trabajorealizado`
--
ALTER TABLE `trabajorealizado`
  ADD CONSTRAINT `trabajorealizado_ibfk_1` FOREIGN KEY (`id_ingreso`) REFERENCES `ingresotaller` (`id_ingreso`),
  ADD CONSTRAINT `trabajorealizado_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
