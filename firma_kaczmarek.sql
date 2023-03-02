-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Mar 2023, 14:35
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `firma_kaczmarek`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

CREATE TABLE `adresy` (
  `id_pracownika` int(11) DEFAULT NULL,
  `ulica` varchar(255) DEFAULT NULL,
  `nr_domu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `adresy`
--

INSERT INTO `adresy` (`id_pracownika`, `ulica`, `nr_domu`) VALUES
(1, 'ul. Kolorowa', '10A'),
(2, 'ul. Kwiatowa', '22');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `data_ur` date NOT NULL,
  `pesel` char(11) NOT NULL,
  `miasto` varchar(20) NOT NULL,
  `stanowisko` int(11) DEFAULT NULL,
  `drugie_imie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imie`, `nazwisko`, `data_ur`, `pesel`, `miasto`, `stanowisko`, `drugie_imie`) VALUES
(1, 'Anna', 'Nowak', '1985-04-01', '85040112345', 'Sopot', 3, NULL),
(2, 'Jan', 'Kowalski', '1975-05-01', '75050154321', 'Gdańsk', 1, NULL),
(3, 'Kaja', 'Borecka', '1980-12-24', '80122454321', 'Gdynia', 2, NULL),
(4, 'Maria', 'Borek', '1967-11-30', '67113012345', 'Gdynia', 4, NULL),
(5, 'Marian', 'Marczak', '1965-11-10', '65111098765', 'Sopot', 4, NULL),
(6, 'Kajetan', 'Grota', '1965-01-31', '65013198765', 'Sopot', 5, NULL),
(7, 'Oskar', 'Kaczmarek', '2004-04-06', '04240600123', 'Wolsztyn', 6, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

CREATE TABLE `stanowiska` (
  `id_stanowiska` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `pensja` decimal(7,2) NOT NULL,
  `wyksztalcenie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`id_stanowiska`, `nazwa`, `pensja`, `wyksztalcenie`) VALUES
(1, 'kierownik', '4000.00', 'wyższe'),
(2, 'asystent', '3200.00', 'wyższe'),
(3, 'sekretarka', '2500.00', 'średnie'),
(4, 'pracownik', '2800.00', 'średnie'),
(5, 'kierowca', '2700.00', 'średnie');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pesel` (`pesel`);

--
-- Indeksy dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`id_stanowiska`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  MODIFY `id_stanowiska` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
