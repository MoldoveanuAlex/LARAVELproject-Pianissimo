-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 17, 2023 la 05:11 PM
-- Versiune server: 10.4.25-MariaDB
-- Versiune PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `exlara`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `updated_at`, `status`, `user_id`) VALUES
(25, '2023-01-14 14:15:42', '2023-01-14 14:15:47', 1, NULL),
(26, '2023-01-14 14:32:13', '2023-01-14 14:32:21', 1, NULL),
(27, '2023-01-14 14:33:25', '2023-01-14 14:33:28', 1, NULL),
(28, '2023-01-14 14:34:26', '2023-01-14 14:34:31', 1, NULL),
(29, '2023-01-14 14:35:14', '2023-01-14 14:35:19', 1, NULL),
(30, '2023-01-14 14:37:43', '2023-01-14 14:37:49', 1, NULL),
(31, '2023-01-14 14:40:34', '2023-01-14 14:41:10', 1, NULL),
(32, '2023-01-14 14:44:02', '2023-01-14 14:44:05', 1, NULL),
(33, '2023-01-15 11:26:11', '2023-01-15 11:26:16', 1, NULL),
(34, '2023-01-15 15:54:21', '2023-01-16 14:08:56', 1, NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `cart_products`
--

INSERT INTO `cart_products` (`id`, `created_at`, `updated_at`, `cart_id`, `product_id`, `quantity`) VALUES
(69, '2023-01-15 15:54:21', '2023-01-15 15:54:21', 34, 4, 1),
(70, '2023-01-15 16:10:37', '2023-01-15 16:10:37', 34, 3, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_01_10_174004_create_tasks_table', 1),
(12, '2023_01_11_161936_create_products_table', 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `photo`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Flame SLP-175 WH\r\n', 'Specificatii Tehnice:\r\n\r\n88 Clape Grele\r\nClaviatură: RHA Generație Nouă\r\nPolifonie max: 64 note\r\n25 Sunete presetate prin tehnologia DNS\r\nDisplay LED\r\nEfect: Reverb\r\n3 Pedale: Soft, Sostenuto, Damper\r\nPedală cu funcție half-damper\r\nInterfață MIDI: USB to Host Tip B\r\nInterfață Audio integrată: 48 khz/16 bit\r\nCompatibilitate: Windows/Mac/Android/iOS\r\nFuncții:\r\nÎnregistrare: 2 x track-uri per cântec\r\nLayer\r\nSplit\r\nPian Dual\r\nMaster Tune\r\nTranspoziție\r\nTouch\r\nMetronom\r\nIeșire Căști Stereo: 2 x Jack 3.5mm Stereo\r\nIeșire Audio Stereo: 2 x RCA (L/R)\r\nIntrare Audio Auxiliară/MP3: 2 x RCA (L/R)\r\nDifuzoare: 13 W x 2\r\nDimensiuni (Lățime x Lungime x Înălțime): 1380 x 420 x 840 mm\r\nCuloare: Alb\r\nInclude scaun de pian asortat și alimentator', 'https://d1x6zptmo84fe3.cloudfront.net/produse/flame-slp-175-wh-id83939-sizex670-sizey438-type2.webp', '3000.00', NULL, NULL),
(2, 'Yamaha YDP-145 Arius Black\r\n', 'Claviatură:\r\n88 clape cu mecanism de ciocănele GHS\r\nSensibilitate la atingere selectabilă între: hard/medium/soft/fixed\r\n3 pedale: damper (cu funcție half-pedal), sostenuto, soft\r\nCapac claviatură: glisant\r\nSuport de partitură inclus\r\nGenerare de tonuri:\r\nSunet de pian Yamaha CFX\r\nVirtual Resonance Modeling Lite (VRM Lite)\r\nPolifonie maximă 192 voci\r\n10 voci presetate\r\nEfecte:\r\n4 tipuri de reverb\r\nIntelligent Acoustic Control\r\nStereophonic Optimizer\r\nPiese prestocate:\r\n10 x demo,\r\n50 x piese clasice presetate\r\n303 x piese de studiu\r\nÎnregistrare:\r\n1 melodie\r\n2 piste\r\nCapacitate de stocare: 100 KB/piesă (Aprox. 11 000 note)\r\nFormat compatibil:\r\nRedare: Standard MIDI File (SMF) Format 0 & 1\r\nÎnregistrare: Standard MIDI File (SMF) Format 0\r\nFuncții:\r\nDual layers\r\nDuo\r\nMetronom, tempo 5 - 280\r\nTranspunere note -6 – 0 – +6\r\nAcordaj: 414.8 – 440.0 – 466.8 Hz\r\nConexiuni:\r\n2 x Jack standard stereo pentru căști\r\nUSB TO HOST\r\nSistem de sunet:\r\nAmplificare: 2 x 8W\r\n2 x difuzoarede de 12 cm\r\nDimensiuni: (L x Î x A): 1357 x 815 x 422 mm\r\nGreutate: 38 kg\r\nFinisaj negru', 'https://d1x6zptmo84fe3.cloudfront.net/produse/yamaha-ydp-145-arius-black-id80973-sizex670-sizey438-type2.webp', '4600.00', NULL, NULL),
(3, 'Yamaha CLP-735 Rosewood\r\n', 'Yamaha CLP-735, pian digital cu cele mai noi tehnologii Yamaha ce oferă o experiență similară cu pianele de concert, permite pianistului multiple variații de viteză și adâncime la interpretare:\r\n\r\nsunete și ritmuri:\r\nYamaha CFX\r\nBösendorfer Imperial\r\nsamplări binaurale CFX și Bösendorfer Imperial\r\n38 voci incluzând 2 x sunete forte piano Mozart Piano/Chopin Piano\r\n20 ritmuri\r\n21 piese demo voce + 50 piese de pian + 303 piese de lecții\r\ntehnologie Stereophonic Optimizer pentru căști\r\nVRM (Virtual Resonance Modeling) îmbunătățit - emulează rezonanța coardelor, corpului, damperului\r\ntehnologie Grand Expression Modeling ce oferă varietate tonală infinită\r\nclaviatură GrandTouch-S™ cu 88 clape grele:\r\ndiferență de poziție fulcrum între clapele albe și negre\r\ncontrol expresiv pentru modelarea sunetului de la pp la ff\r\nstabilitate îmbunătățită la apăsarea clapelor\r\nclape placate cu abanos și fildeș sintetic\r\nescapement\r\nmoduri Dual / Split / Duo\r\nsensibilitate la atingere: Hard2/Hard1/Medium/Soft1/Soft2/Fixed\r\ncontrol de ton: bas, medii și înalte pentru sunetele individuale\r\nefecte: 6 x reverb, 3 x chorus, 7+utilizator x brilliance, 12 efecte master\r\npolifonie 256-note\r\n3 x pedale:\r\nDamper (cu funcție de jumătate), Sostenuto, Soft\r\nfuncții: Sustain (Switch), Sustain Continuously, Sostenuto, Soft, Pitch Bend Up, Pitch Bend Down, Rotary Speed, Vibe Rotor, Song Play/Pause\r\nafișaj 128 x 64 LCD\r\ncompatibil cu aplicația de tabletă SmartPianist APP\r\nrecorder 16 piste, recorder prin USB, permite înregistrarea a 250 piese, wav-uri de 44.1 kHz 16 biți\r\ncontroale adițonale:\r\nmetronom\r\nplajaă tempo 01/05/00\r\ntranspunere -12 - 0 - +12\r\nacordaj 414.8 - 440.0 - 466.8 Hz (în pași de aproximatov 0.2 Hz)\r\n7 tipuri de scale\r\nUSB to Host, USB to Device\r\namplificare: 2 x 30W\r\ndifuzoare: 2 x 16 cm\r\nconectivitate:\r\n2 x ieșiri de căști Jack mare\r\nMIDI In/Out/Thru\r\n1 x intrare auxiliara Jack mic stereo\r\nieșiri auxiliare: [L/L+R] [R]\r\n1 x intrare alimentare electrică, alimentator PA-300C\r\ndimensiuni: 1461 x 927 x 459 mm\r\ngreutate: 57 kg\r\nfinisaj: Rosewood', 'https://d1x6zptmo84fe3.cloudfront.net/produse/yamaha-clp-735-rosewood-id68710-sizex670-sizey438-type2.webp', '9000.00', NULL, NULL),
(4, 'Roland HP-704 DR\r\n', 'Roland HP-704 DR - Pian digital ce utilizează cea mai nouă tehnologie digitală într-un design clasic și elegant, beneficiază de un sistem de sunet puternic format din 4 difuzoare tip acoustic projection, și incorporează un display OLED 128 x 32. Utilizează tehnologia Roland Super Natural Piano Modelling Tone, care generează o experiență acustică reală, tehnologia PureAcoustic Ambience ce oferă un sunet realistic și natural de pian și ambientă din jurul acestuia, tehnologia Headphones 3D Ambience pentru căști.\r\n\r\nTon acustic autentic prin tehnologia Roland SuperNATURAL Piano Modeling\r\nClaviatura Standard PHA-50 și pedale cu Acțiune Damper Progresivă\r\nHeadphones 3D Ambience oferă o experiență de interpretare impecabilă și realistă atunci când se exersează cu căști\r\nInclude o colecție largă și versatilă de sunete precum, pian electric, instrumente cu coarde, orgi și multe altele\r\nDesign simplu și modern de cabinet, cu picioarele frontale elegante și curbe sofisticate\r\nCompatibil cu aplicația Roland Piano Every Day\r\nClaviatura : 88 clape, standard PHA-50: cu escapament și Ivory Feel\r\nPolifonie : 384 de voci\r\nTonuri : 324\r\nPedale : Damper / Soft / Sostenuto\r\nDifuzoare : 2 x 25 W, 2 x 5 W\r\nEfecte : Brilliance, Ambience\r\nFormat redare : fișiere MIDI standard (Format 0,1), fișiere audio (WAV: 44.1 kHz, 16-bit, MP3: 44.1 kHz, 64 kbps - 320 kbps, necesită stick USB Flash)\r\nÎnregistrare : fișiere MIDI standard (Format 0,3 aproximativ 70000 note), fișiere audio (WAV: 44.1 kHz, 16-bit, necesită stick USB Flash)\r\nBluetooth: Audio: Bluetooth ver 3.0, MIDI: Bluetooth ver 4.0\r\nAplicații Roland pentru Android / iOS : Piano Every Day / Piano Designer\r\nFuncții disponibile: Metronom / Registration / Dual / Split / TwinPiano / Transpose (în semitonuri) / volum difuzoare și căști / Panel Lock / Auto Off\r\nEfect pentru căști 3D ambience\r\nAfișaj: OLED 128 x 32 puncte\r\nConectori : mufă DC IN, Intrare: mufă mini stereo jack, Ieșiri: (L/Mono, R) : mufă jack 1/4\", Port USB pentru computer : tip B, Port USB de memorie : tip A\r\nSursă de alimentare : adaptor AC\r\nConsum de putere: 13 W(12 W - 30 W)\r\nDimensiuni (L x l x h) : 1377 x 468 x 1113 mm\r\nGreutate : 59.5 kg\r\nCuloare : Dark Rosewood\r\nAccesorii incluse : adaptor AC, cablu alimentare, suport pentru partituri ajustabil în 3 nivele, suport căști, colecție de partituri \"Roland Piano Masterpieces\"', 'https://d1x6zptmo84fe3.cloudfront.net/produse/roland-hp-704-dr-id72613-sizex670-sizey438-type2.webp', '9900.00', NULL, NULL),
(5, 'Roland LX-706 DR\r\n', 'Claviatura : 88 clape, cu structura hibridă lemn și plastic PHA-50\r\nGenerator de sunet : PureAcoustic Piano Modeling\r\nPolifonie : nelimitată (cântând fără acompaniament(solo) și folosind categoria de tonuri \"Piano\") și 256 pentru tonurile adiționale\r\nTonuri : 324\r\nPedale : Damper / Soft / Sostenuto\r\nDifuzoare: 25 W x 2 / 7 W x 2 / 5 W x 2\r\nEfecte : Brilliance\r\nFormat redare : fișiere MIDI standard (Format 0,1), fișiere audio (WAV: 44.1 kHz, 16-bit, MP3: 44.1 kHz, 64 kbps - 320 kbps, necesită stick USB Flash)\r\nÎnregistrare : fișiere MIDI standard (Format 0,3 aproximativ 70000 note), fișiere audio (WAV: 44.1 kHz, 16-bit, necesită stick USB Flash)\r\nBluetooth: Audio: Bluetooth ver 3.0, MIDI: Bluetooth ver 4.0\r\nAplicații Roland pentru Android / iOS : Piano Every Day / Piano Designer\r\nFuncții disponibile: Metronom / Registration / Dual / Split / TwinPiano / Transpose (în semitonuri) / volum difuzoare și căști / Panel Lock / Auto Off\r\nSistem audio încorporat de tip acoustic projection\r\nEfect pentru căști 3D ambience\r\nAfișaj: OLED 128 x 32 puncte\r\nConectori : mufă DC IN, Intrare: mufă mini stereo jack, Ieșiri: (L/Mono, R) : mufă jack 1/4\", Port USB pentru computer : tip B, Port USB de memorie : tip A\r\nSursă de alimentare : adaptor AC\r\nConsum de putere: 17 W (16 W – 55 W)\r\nDimensiuni (cu stativ) (L x l x h) : 1383 x 493 x 1118 mm\r\nGreutate (cu stativ) : 98 kg\r\nCuloare : Dark Rosewood\r\nAccesorii incluse : adaptor AC, cablu alimentare, cârlig pentru căști', 'https://d1x6zptmo84fe3.cloudfront.net/produse/roland-lx-706-dr-id59902-sizex670-sizey438-type2.webp', '16200.00', NULL, NULL),
(7, 'tyest', 'test', 'test', '34.00', '2023-01-16 14:10:27', '2023-01-16 14:10:27');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Alex', 'alex@gmail.com', NULL, '$2y$10$bTDJ/zTY54wsGcaWxHfp4eWops/504N6sfFNcWuCOG/x95MdTk0TG', 'TiClKlImhAt5pi75pj1IgCCiOQdSVajvl2sYQKBDBNEoogQqQrhXMvTlcgqm', '2023-01-11 14:38:45', '2023-01-11 14:38:45', 0),
(2, 'admin', 'admin@admin.com', NULL, '$2y$10$hWbR9cGJ/QI3Ry4JHyqMa.g7wyFmtbb8W8Cqp.gU9ZF1LL.ukMl9i', '1WSHcSrscIMWE7nmRcQ22rx7HOrrT0LP2MUVsZcgyBXXOulQhuKLKEdBljJe', '2023-01-15 11:22:16', '2023-01-15 11:22:16', 1);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexuri pentru tabele `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_products_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_products_product_id_foreign` (`product_id`);

--
-- Indexuri pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexuri pentru tabele `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexuri pentru tabele `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexuri pentru tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pentru tabele `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pentru tabele `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
