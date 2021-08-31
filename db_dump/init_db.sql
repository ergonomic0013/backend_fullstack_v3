-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: frozeneon-mysql
-- Время создания: Авг 31 2021 г., 09:36
-- Версия сервера: 8.0.26
-- Версия PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `analytics`
--

CREATE TABLE `analytics` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `object` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `object_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `boosterpack`
--

CREATE TABLE `boosterpack` (
  `id` int NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bank` decimal(10,2) NOT NULL DEFAULT '0.00',
  `us` int NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `boosterpack`
--

INSERT INTO `boosterpack` (`id`, `price`, `bank`, `us`, `time_created`, `time_updated`) VALUES
(1, '5.00', '0.00', 1, '2021-08-30 14:25:38', '2021-08-30 14:25:38'),
(2, '20.00', '0.00', 2, '2021-08-30 14:25:38', '2021-08-30 14:25:38'),
(3, '50.00', '0.00', 5, '2021-08-30 14:25:38', '2021-08-30 14:25:38');

-- --------------------------------------------------------

--
-- Структура таблицы `boosterpack_info`
--

CREATE TABLE `boosterpack_info` (
  `id` int NOT NULL,
  `boosterpack_id` int NOT NULL,
  `item_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `assign_id` int UNSIGNED NOT NULL,
  `reply_id` int DEFAULT NULL,
  `text` text NOT NULL,
  `likes` int DEFAULT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `assign_id`, `reply_id`, `text`, `likes`, `time_created`, `time_updated`) VALUES
(1, 1, 1, NULL, 'Comment #1', 0, '2021-08-30 14:25:38', '2021-08-30 14:25:38'),
(2, 1, 1, NULL, 'Comment #2', 0, '2021-08-30 14:25:38', '2021-08-30 14:25:38'),
(12, 2, 0, 0, 'test text', NULL, '2021-08-31 08:40:22', '2021-08-31 09:13:23'),
(13, 2, 0, 12, 'test text', NULL, '2021-08-31 08:45:41', '2021-08-31 09:23:48'),
(14, 2, 0, 13, 'test text', NULL, '2021-08-31 08:45:55', '2021-08-31 09:23:51'),
(15, 2, 0, 14, 'test text', NULL, '2021-08-31 08:46:15', '2021-08-31 09:23:53'),
(16, 2, 0, 15, 'test text', NULL, '2021-08-31 08:46:51', '2021-08-31 09:23:55'),
(17, 2, 0, 16, 'test text', NULL, '2021-08-31 08:47:42', '2021-08-31 09:23:56'),
(18, 2, 0, 17, 'test text', NULL, '2021-08-31 08:48:54', '2021-08-31 09:23:58'),
(19, 2, 0, 18, 'test text', NULL, '2021-08-31 08:48:56', '2021-08-31 09:24:00');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `name`, `price`) VALUES
(1, '1 Likes', 1),
(2, '2 Likes', 2),
(3, '3 Likes', 3),
(4, '5 Likes', 5),
(5, '10 Likes', 10),
(6, '15 Likes', 15),
(7, '20 Likes', 20),
(8, '30 Likes', 30),
(9, '50 Likes', 50),
(10, '100 Likes', 100),
(11, '200 Likes', 200),
(12, '500 Likes', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `img` varchar(1024) DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `user_id`, `text`, `img`, `likes`, `time_created`, `time_updated`) VALUES
(1, 1, 'Post 1', '/images/posts/1.png', 0, '2021-08-30 14:25:38', '2021-08-30 14:25:38'),
(2, 1, 'Post 2', '/images/posts/2.png', 0, '2021-08-30 14:25:38', '2021-08-30 14:25:38');

-- --------------------------------------------------------

--
-- Структура таблицы `post_comment`
--

CREATE TABLE `post_comment` (
  `id` int NOT NULL,
  `comment_id` int NOT NULL,
  `post_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `post_comment`
--

INSERT INTO `post_comment` (`id`, `comment_id`, `post_id`) VALUES
(1, 12, 1),
(2, 13, 1),
(3, 14, 1),
(4, 15, 1),
(5, 16, 1),
(6, 17, 1),
(7, 18, 1),
(8, 19, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `personaname` varchar(50) NOT NULL DEFAULT '',
  `avatarfull` varchar(150) NOT NULL DEFAULT '',
  `rights` tinyint NOT NULL DEFAULT '0',
  `likes_balance` int DEFAULT '0',
  `wallet_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `wallet_total_refilled` decimal(10,2) NOT NULL DEFAULT '0.00',
  `wallet_total_withdrawn` decimal(10,2) NOT NULL DEFAULT '0.00',
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `personaname`, `avatarfull`, `rights`, `likes_balance`, `wallet_balance`, `wallet_total_refilled`, `wallet_total_withdrawn`, `time_created`, `time_updated`) VALUES
(1, 'admin@admin.pl', '12345', 'Admin User', 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/96/967871835afdb29f131325125d4395d55386c07a_full.jpg', 0, 0, '0.00', '0.00', '0.00', '2021-08-30 14:25:39', '2021-08-30 14:25:39'),
(2, 'user@user.pl', '123', 'User #1', 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/86/86a0c845038332896455a566a1f805660a13609b_full.jpg', 0, 0, '0.00', '0.00', '0.00', '2021-08-30 14:25:39', '2021-08-30 14:25:39');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `boosterpack`
--
ALTER TABLE `boosterpack`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `boosterpack_info`
--
ALTER TABLE `boosterpack_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_comment`
--
ALTER TABLE `post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commnet_id_index` (`comment_id`),
  ADD KEY `post_id_index` (`post_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `analytics`
--
ALTER TABLE `analytics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `boosterpack`
--
ALTER TABLE `boosterpack`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `boosterpack_info`
--
ALTER TABLE `boosterpack_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `post_comment`
--
ALTER TABLE `post_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
