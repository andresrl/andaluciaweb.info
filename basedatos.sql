-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 18-09-2024 a las 15:22:36
-- Versión del servidor: 5.7.44
-- Versión de PHP: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `abb_and_info_db1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_tradename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_sector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `meetings`
--

INSERT INTO `meetings` (`id`, `company_name`, `company_tradename`, `company_username`, `company_email`, `professional_fullname`, `professional_company`, `professional_email`, `professional_sector`, `created_at`, `updated_at`) VALUES
(1, 'ARL', 'ARL incorporated', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-08-29 08:44:13', '2024-08-29 08:44:13'),
(2, 'ARL', 'ARL incorporated', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-08-29 08:53:00', '2024-08-29 08:53:00'),
(3, 'ARL', 'ARL incorporated', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-06 10:00:17', '2024-09-06 10:00:17'),
(4, 'ARL', 'Absolute', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:54:20', '2024-09-11 09:54:20'),
(5, 'Absolute', 'Absolute', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:54:31', '2024-09-11 09:54:31'),
(6, 'Company 1', 'Company 1', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:54:37', '2024-09-11 09:54:37'),
(7, 'Empresa 2', 'Empresa 2', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:07', '2024-09-11 09:55:07'),
(8, 'Empresa 2', 'Empresa 2', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:08', '2024-09-11 09:55:08'),
(9, 'Empresa 2', 'Empresa 2', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:08', '2024-09-11 09:55:08'),
(10, 'Empresa CCC', 'Empresa CCC', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:17', '2024-09-11 09:55:17'),
(11, 'Empresa CCC', 'Empresa CCC', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:18', '2024-09-11 09:55:18'),
(13, 'Absolute', 'Absolute', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:26', '2024-09-11 09:55:26'),
(14, 'Absolute', 'Absolute', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:27', '2024-09-11 09:55:27'),
(15, 'Absolute', 'Absolute', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 09:55:27', '2024-09-11 09:55:27'),
(16, 'Empresa 2', 'Empresa 2', 'Andres', 'andres@andresrl.es', 'Pepe Montoto', 'Mugel', 'pepemontoto@gmail.com', 'Toros', '2024-09-11 10:02:17', '2024-09-11 10:02:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_29_100338_create_meetings_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
