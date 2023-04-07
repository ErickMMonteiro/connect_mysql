-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Abr-2023 às 00:22
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_reservas`
--
CREATE DATABASE IF NOT EXISTS `bd_reservas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_reservas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colabor`
--

DROP TABLE IF EXISTS `colabor`;
CREATE TABLE `colabor` (
  `ID` int(4) NOT NULL,
  `NOME` varchar(200) NOT NULL,
  `NR_CNH` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `colabor`
--

INSERT INTO `colabor` (`ID`, `NOME`, `NR_CNH`) VALUES
(1, 'HHH', 1234546789),
(2, 'III', 234567891),
(3, 'JJJ', 345678912);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE `reserva` (
  `ID` int(5) NOT NULL,
  `DATA` datetime NOT NULL,
  `MOTIVO` varchar(200) NOT NULL,
  `ID_VEÍCULO` int(5) NOT NULL,
  `ID_COLABORADOR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`ID`, `DATA`, `MOTIVO`, `ID_VEÍCULO`, `ID_COLABORADOR`) VALUES
(1, '2022-10-11 20:25:17', 'DDD', 2, 1),
(2, '2023-03-31 01:25:17', 'EEE', 3, 2),
(3, '2023-07-12 04:26:26', 'FFF', 3, 3),
(4, '2023-05-11 09:42:26', 'GGG', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veículo`
--

DROP TABLE IF EXISTS `veículo`;
CREATE TABLE `veículo` (
  `ID` int(5) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `ANO` int(4) NOT NULL,
  `KM` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veículo`
--

INSERT INTO `veículo` (`ID`, `NOME`, `ANO`, `KM`) VALUES
(1, 'AAA', 2021, 50500),
(2, 'BBB', 2022, 2000),
(3, 'CCC', 2023, 999);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `colabor`
--
ALTER TABLE `colabor`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RESERVA_VEÍCULO` (`ID_VEÍCULO`),
  ADD KEY `FK_RESERVA_COLABORADOR` (`ID_COLABORADOR`);

--
-- Índices para tabela `veículo`
--
ALTER TABLE `veículo`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `colabor`
--
ALTER TABLE `colabor`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `veículo`
--
ALTER TABLE `veículo`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_RESERVA_COLABORADOR` FOREIGN KEY (`ID_COLABORADOR`) REFERENCES `colabor` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RESERVA_VEÍCULO` FOREIGN KEY (`ID_VEÍCULO`) REFERENCES `veículo` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
