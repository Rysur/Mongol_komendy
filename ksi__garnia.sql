-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Mar 2023, 09:54
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
-- Baza danych: `księgarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `narodowosc` varchar(30) DEFAULT NULL,
  `okres_tworzenia` varchar(35) DEFAULT NULL,
  `jezyk` varchar(30) DEFAULT NULL,
  `rodzaj_tworczosci` varchar(35) DEFAULT NULL,
  `osiagniecia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktura`
--

CREATE TABLE `faktura` (
  `nr_faktury` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `sposob_platnosci` varchar(50) NOT NULL,
  `data_wystawienia_faktury` date NOT NULL,
  `cena_za_egz` decimal(10,2) NOT NULL,
  `data_zakupu` date NOT NULL,
  `nabywca` varchar(100) NOT NULL,
  `adres_nabywcy` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klienta` int(11) NOT NULL,
  `nazwisko` varchar(60) NOT NULL,
  `imie` varchar(40) NOT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `miejscowosc` varchar(50) DEFAULT 'Kraków',
  `ulica` varchar(50) DEFAULT NULL,
  `nr_domu` varchar(7) DEFAULT NULL,
  `PESEL` varchar(11) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `adres_e_mail` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(100) NOT NULL,
  `cena` float(5,2) DEFAULT NULL,
  `wydawnictwo` varchar(20) DEFAULT NULL,
  `temat` varchar(30) DEFAULT NULL,
  `miejsce_wydania` varchar(28) DEFAULT NULL,
  `jezyk_ksiazki` varchar(15) DEFAULT NULL,
  `opis` varchar(100) DEFAULT NULL,
  `rok_wydania` varchar(4) NOT NULL,
  `id_autora` int(11) NOT NULL,
  `liczba_stron` varchar(5) CHARACTER SET utf8 DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rejestracja_zamowienia`
--

CREATE TABLE `rejestracja_zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `liczba_egz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `data_zlozenia_zamowienia` datetime DEFAULT NULL,
  `data_wyslania` datetime DEFAULT NULL,
  `koszt_wysylki` decimal(10,0) DEFAULT NULL,
  `id_faktury` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indeksy dla tabeli `faktura`
--
ALTER TABLE `faktura`
  ADD PRIMARY KEY (`nr_faktury`),
  ADD KEY `id_zamowienia` (`id_zamowienia`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klienta`),
  ADD UNIQUE KEY `PESEL` (`PESEL`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id_ksiazki`),
  ADD UNIQUE KEY `tytul` (`tytul`);

--
-- Indeksy dla tabeli `rejestracja_zamowienia`
--
ALTER TABLE `rejestracja_zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `faktura`
--
ALTER TABLE `faktura`
  MODIFY `nr_faktury` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rejestracja_zamowienia`
--
ALTER TABLE `rejestracja_zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `faktura`
--
ALTER TABLE `faktura`
  ADD CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `rejestracja_zamowienia` (`id_zamowienia`);

--
-- Ograniczenia dla tabeli `rejestracja_zamowienia`
--
ALTER TABLE `rejestracja_zamowienia`
  ADD CONSTRAINT `rejestracja_zamowienia_ibfk_1` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`id_ksiazki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
