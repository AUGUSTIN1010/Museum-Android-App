-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: sql.freedb.tech
-- Timp de generare: mai 29, 2024 la 06:58 PM
-- Versiune server: 8.0.36-0ubuntu0.22.04.1
-- Versiune PHP: 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `freedb_proiecT_java`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `muzee`
--

CREATE TABLE `muzee` (
  `id` int NOT NULL,
  `nume_muzeu` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `oras` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `text` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `muzee`
--

INSERT INTO `muzee` (`id`, `nume_muzeu`, `oras`, `image`, `text`) VALUES
(1, 'Muzeul Național de Artă al României', 'București', 'https://booktes.com/thumbs/866/61d832c5ec987_1641558725.jpg', 'Înființat în anul 1948, este cel mai important muzeu de artă din țară și este găzduit de Palatul Regal din București. Dacă decizi să vizitezi acest muzeu te vei bucura nu doar de arhitectura maiestuosului palat, dar și de cele mai uimitoare picturi ale unor mari artiști români și internaționali, pe care îi poți regăsi menționați în cele mai prestigioase cărți despre artă și istoria artei. La Muzeul Național de Artă al României, printre cele peste 70000 de exponate se află și un tablou al celebrului pictor Rembrandt, dar și alte picturi celebre pe care le poți vedea în Galeria de Artă Europeană.'),
(2, 'Muzeul Național de Istorie al României', 'Bucuresti', 'https://cdn.adh.reperio.news/image-d/d6c2b963-80a9-4e7b-bb89-4c33cea7d321/index.jpeg?p=a%3D1%26co%3D1.05%26w%3D1000%26h%3D815%26f%3Dwebp', 'Are sediul în fostul Palat al Poștelor și este considerat cel mai important muzeu al României. Când a fost înființat, în anul 1970, avea scopul de a ilustra evoluțiile culturale și istorice de-a lungul epocilor. Printre exponatele prezente în acest muzeu se numără obiecte cu valoare istorică descoperite pe teritoriul României din timpuri preistorice și până în perioada contemporană.'),
(3, 'Muzeul Național de Istorie Naturală „Grigore Antipa”', 'Bucuresti', 'https://merg.in/thumbs/big_art/2016/12/21/muzeul-national-de-istorie-naturala-grigore-antipa-1682.jpg', 'Cel mai vizitat muzeu din București este, totodată, și cel mai bogat în exponatele pe care le are, acestea însumând peste 2 milioane de piese grupate în diferite colecții zoologice, paleontologice, de minerale și roci. A fost înființat în anul 1834 de Mihalache Ghica și este cea mai longevivă instituție de cercetare a biodiversității.'),
(4, 'Complexul Național Muzeal „Moldova”', 'Iași', 'https://upload.wikimedia.org/wikipedia/commons/4/42/Palatul_Culturii_Ia%C8%99i.jpg', 'Își are sediul în Palatul Culturii din Iași, acesta fiind un monument de arhitectură în stil neogotic, o adevărată emblemă a orașului. Complexul muzeal cuprinde alte patru clădiri deosebit de importante: Muzeul de Istorie al Moldovei, Muzeul Științei și Tehnicii „Ștefan Procopiu”, Muzeul Etnografic al Moldovei și Muzeul de Artă.'),
(5, 'Complexul Muzeal Național „Astra”', 'Sibiu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Sibiu_Muzeul_in_aer_liber_ASTRA_%282%29.JPG/280px-Sibiu_Muzeul_in_aer_liber_ASTRA_%282%29.JPG', 'Cel mai cunoscut muzeu din ansamblul de unități muzeale ale Complexului este Muzeul Civilizației Populare Tradiționale „Astra”, acesta având 10 km de alei pe care te poți plimba relaxat alături de familie, dar pe suprafața acestuia se mai găsesc și două restaurante, două pensiuni și un loc de joacă. Aici poți descoperi casele în care au trăit înaintașii tăi și poți observa cel mai bine stilul lor de viață.'),
(6, 'Muzeul Peleș ', 'Sinaia', 'https://lh3.googleusercontent.com/p/AF1QipOjocs_RKzDv8mBtNUEBbUHu_zFmlvKS1YGbMvP=s680-w680-h510', 'Este considerat unul dintre cele mai frumoase castele din România și este fosta reședință a Casei Regale a României, ce te invită să descoperi eleganța și istoria camerelor din interior. O vizită la Castelul Peleș îți va oferi o veritabilă lecție de istorie, iar plimbarea prin sălile din palat îți va bucura privirea mult timp după încheierea vacanței.\r\n\r\n'),
(7, 'Castelul Bran', 'Pasul Bran-Rucăr', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Bran_castle_%2847626731362%29.jpg/220px-Bran_castle_%2847626731362%29.jpg', 'Un monument arhitectural plin de istorie, Bran este cel mai vizitat castel din România, despre care s-au vehiculat diverse mituri, cel mai cunoscut fiind acela că ar fi castelul lui Dracula, confundat deseori cu domnitorul Vlad Țepeș, care însă nu a fost niciodată în acest castel.'),
(8, 'Muzeul Ceasului', 'Ploiești', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/RO_PH_Ploiesti_clock_museum_1.jpg/1280px-RO_PH_Ploiesti_clock_museum_1.jpg', 'Impresionanta clădire, care găzduiește acest muzeu unic în Europa, a fost construită în anul 1890 și renovată recent. Muzeul are o colecție de aproximativ 1000 de piese, însă doar o parte dintre acestea sunt expuse, colecțiile de ceasuri ilustrând evoluția mijloacelor de măsurare a timpului.'),
(9, 'Muzeul Satului „Dimitrie Gusti”', 'București', 'https://lh3.googleusercontent.com/p/AF1QipP7FFk3XCnjE-wIylntvaQygdL862DNXZEqHnHK=s680-w680-h510', 'Este un muzeu în aer liber, situat chiar în inima capitalei, și care reprezintă o oază de liniște. Exponatele care se află aici se întind pe o suprafață de 14 ha și te întâmpină astfel cu un cadru minunat al caselor reprezentative pentru satele României. Acesta are peste 380 de monumente și este cel mai vizitat muzeu din România atât de turiștii străini cât și de cei români.');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `muzee`
--
ALTER TABLE `muzee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `muzee`
--
ALTER TABLE `muzee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
