-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql7.freemysqlhosting.net
-- Время создания: Дек 03 2018 г., 20:36
-- Версия сервера: 5.5.58-0ubuntu0.14.04.1
-- Версия PHP: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql7268050`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `IDClients` int(11) NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Surname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `E-mail` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  `Abonement` int(10) NOT NULL DEFAULT '0',
  `IDTrainer` int(10) DEFAULT '0',
  `Registration day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Services`
--

CREATE TABLE `Services` (
  `Abonement` int(25) NOT NULL,
  `Service` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Services`
--

INSERT INTO `Services` (`Abonement`, `Service`) VALUES
(1, 'Gym'),
(2, 'Massage'),
(3, 'Fight club'),
(4, 'Cosmetology'),
(5, 'Yoga'),
(6, 'Aerobics'),
(7, 'Sauna'),
(8, 'Fitness food');

-- --------------------------------------------------------

--
-- Структура таблицы `Trainers`
--

CREATE TABLE `Trainers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Surname` int(11) NOT NULL,
  `E-mail` int(11) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Salary` int(11) NOT NULL,
  `Number of clients` int(11) NOT NULL DEFAULT '0',
  `Start_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`IDClients`);

--
-- Индексы таблицы `Trainers`
--
ALTER TABLE `Trainers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Clients`
--
ALTER TABLE `Clients`
  MODIFY `IDClients` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Trainers`
--
ALTER TABLE `Trainers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
