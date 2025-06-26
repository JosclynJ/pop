-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2025 pada 05.35
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add berita', 7, 'add_berita'),
(26, 'Can change berita', 7, 'change_berita'),
(27, 'Can delete berita', 7, 'delete_berita'),
(28, 'Can view berita', 7, 'view_berita');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$82AkDRmiHNeNpo66KQZGI7$ZHpTacAsXiIO2omURnNxzn5FnS7qjPMBIfWpOyaroFo=', '2025-06-26 03:24:32.496723', 1, 'Josclyn', '', '', '', 1, 1, '2025-05-28 09:03:37.660333'),
(3, 'pbkdf2_sha256$720000$jajcXQmd6swdlqCKDj9WC4$ais9cP59oC/zQhtPCTwyt5AlRpZQ1mNWO9r1AFvM2Ag=', '2025-06-26 03:23:04.000000', 1, 'admin', '', '', '', 1, 1, '2025-06-26 03:21:43.000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita_berita`
--

CREATE TABLE `berita_berita` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `konten` longtext NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita_berita`
--

INSERT INTO `berita_berita` (`id`, `judul`, `konten`, `gambar`, `created_at`, `created_by_id`) VALUES
(1, 'Hai', 'Apa ini', 'berita/images/c581de2f-dcf6-4f17-9d2f-06afb823c4a6.jpeg', '2025-06-25 15:57:25.954778', 1),
(2, 'wibu', 'liana', 'berita/images/wibu_lBial2y.jpeg', '2025-06-26 02:51:49.381499', 1),
(3, 'wibu', 'jshsj', 'berita/images/Desain_tanpa_judul.png', '2025-06-26 03:23:53.768084', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-06-25 15:57:25.958802', '1', 'Hai', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-06-26 02:40:10.349625', '1', 'Hai', 2, '[{\"changed\": {\"fields\": [\"Gambar\"]}}]', 7, 1),
(3, '2025-06-26 03:21:02.036567', '2', 'admin', 1, '[{\"added\": {}}]', 4, 1),
(4, '2025-06-26 03:21:20.672048', '2', 'admin', 3, '', 4, 1),
(5, '2025-06-26 03:21:44.154024', '3', 'admin', 1, '[{\"added\": {}}]', 4, 1),
(6, '2025-06-26 03:24:42.163831', '3', 'admin', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'berita', 'berita'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-28 09:03:02.056773'),
(2, 'auth', '0001_initial', '2025-05-28 09:03:04.293548'),
(3, 'admin', '0001_initial', '2025-05-28 09:03:04.669119'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-05-28 09:03:04.680251'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-28 09:03:04.696071'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-05-28 09:03:04.862244'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-05-28 09:03:05.018955'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-05-28 09:03:05.047073'),
(9, 'auth', '0004_alter_user_username_opts', '2025-05-28 09:03:05.062039'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-05-28 09:03:05.218213'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-05-28 09:03:05.231192'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-05-28 09:03:05.242191'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-05-28 09:03:05.277573'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-05-28 09:03:05.302872'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-05-28 09:03:05.331507'),
(16, 'auth', '0011_update_proxy_permissions', '2025-05-28 09:03:05.349533'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-05-28 09:03:05.375536'),
(18, 'sessions', '0001_initial', '2025-05-28 09:03:05.490647'),
(19, 'berita', '0001_initial', '2025-06-25 15:36:36.733864'),
(20, 'berita', '0002_remove_berita_status_alter_berita_gambar', '2025-06-26 03:10:08.470338');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2g2b2ge1t5s32juw3shnuygwgscyje2d', '.eJxVjEEOwiAQRe_C2hBhqAwu3fcMZIZBqRpISrsy3l2bdKHb_977LxVpXUpce57jJOqsjDr8bkzpkesG5E711nRqdZkn1puid9r12CQ_L7v7d1Col29NzooxxnkB50FkQAhOwoBXJJ_BAUE6kXg-MkJ2bIVsBkJCK4HZqPcH0b03-Q:1uStnm:YLAIGupu_EKo3kPzBZ96I13jC15yEun1wR5ZmG7-0Yw', '2025-07-05 08:42:18.778817'),
('e21rt3cyegabpnyoyot2fs7gyvpar44g', '.eJxVjMEOwiAQRP-FsyEUlkU8evcbCCyLVA1NSnsy_rtt0oMeZ96beYsQ16WGtfMcxiwuYhCn3y5FenLbQX7Edp8kTW2ZxyR3RR60y9uU-XU93L-DGnvd1gUSWSgmKevNGYE0W6ONsopd1gYc6uId-C14g8gOB1I2F-cUeE0oPl-5PDZq:1uMLv7:MfMOhZtmAj9uRYQ1j7dcvhV47oOWxV7jUjD4z19TXTY', '2025-06-17 07:18:49.636724'),
('hh2n84g6j9bcr19ic6hmadosab9payw0', '.eJxVjMEOwiAQRP-FsyEUlkU8evcbCCyLVA1NSnsy_rtt0oMeZ96beYsQ16WGtfMcxiwuYhCn3y5FenLbQX7Edp8kTW2ZxyR3RR60y9uU-XU93L-DGnvd1gUSWSgmKevNGYE0W6ONsopd1gYc6uId-C14g8gOB1I2F-cUeE0oPl-5PDZq:1uKChi:-VADTMaliFxK-1zLRq9wj8g6mo_8lKJvsGhP1OnDznw', '2025-06-11 09:04:06.359885'),
('qwrza9a401f3fu47mx17peq0jgk9dd7p', '.eJxVjEEOwiAQRe_C2hBhqAwu3fcMZIZBqRpISrsy3l2bdKHb_977LxVpXUpce57jJOqsjDr8bkzpkesG5E711nRqdZkn1puid9r12CQ_L7v7d1Col29NzooxxnkB50FkQAhOwoBXJJ_BAUE6kXg-MkJ2bIVsBkJCK4HZqPcH0b03-Q:1uUdE0:UFFhmqsWZM4pqXop2Rsn_cNKLJERelx3Fb0LI6mZUkQ', '2025-07-10 03:24:32.501794');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `berita_berita`
--
ALTER TABLE `berita_berita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `berita_berita_created_by_id_2eeff08b_fk_auth_user_id` (`created_by_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `berita_berita`
--
ALTER TABLE `berita_berita`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `berita_berita`
--
ALTER TABLE `berita_berita`
  ADD CONSTRAINT `berita_berita_created_by_id_2eeff08b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
