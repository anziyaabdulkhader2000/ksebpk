-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2023 at 04:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retirement_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add login', 1, 'add_login'),
(2, 'Can change login', 1, 'change_login'),
(3, 'Can delete login', 1, 'delete_login'),
(4, 'Can view login', 1, 'view_login'),
(5, 'Can add news', 2, 'add_news'),
(6, 'Can change news', 2, 'change_news'),
(7, 'Can delete news', 2, 'delete_news'),
(8, 'Can view news', 2, 'view_news'),
(9, 'Can add subscription', 3, 'add_subscription'),
(10, 'Can change subscription', 3, 'change_subscription'),
(11, 'Can delete subscription', 3, 'delete_subscription'),
(12, 'Can view subscription', 3, 'view_subscription'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add admin', 5, 'add_admin'),
(18, 'Can change admin', 5, 'change_admin'),
(19, 'Can delete admin', 5, 'delete_admin'),
(20, 'Can view admin', 5, 'view_admin'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(5, 'mainapp', 'admin'),
(1, 'mainapp', 'login'),
(2, 'mainapp', 'news'),
(3, 'mainapp', 'subscription'),
(4, 'mainapp', 'user'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-02 17:30:21.851841'),
(2, 'auth', '0001_initial', '2023-08-02 17:30:22.870690'),
(3, 'admin', '0001_initial', '2023-08-02 17:30:23.095554'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-02 17:30:23.141647'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-02 17:30:23.166590'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-02 17:30:23.317484'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-02 17:30:23.417026'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-02 17:30:23.462191'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-02 17:30:23.483435'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-02 17:30:23.583992'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-02 17:30:23.585229'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-02 17:30:23.602937'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-02 17:30:23.643826'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-02 17:30:23.695105'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-02 17:30:23.756338'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-02 17:30:23.778111'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-02 17:30:23.832965'),
(18, 'mainapp', '0001_initial', '2023-08-02 17:30:24.297806'),
(19, 'sessions', '0001_initial', '2023-08-02 17:30:24.401884'),
(20, 'mainapp', '0002_alter_user_user_permitted', '2023-08-02 17:52:50.172712'),
(21, 'mainapp', '0003_auto_20230813_1304', '2023-08-13 07:34:57.379657'),
(22, 'mainapp', '0004_admin_admin_picture', '2023-08-13 11:12:51.866975');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1l2veewa3n98x0v2zy9eod4soaopoxhg', '.eJyFUctOwzAQ_BXL5zRxHm2Tnqh4CFQEFai9IIS2yZIYJXZlO6AK8e-s26Tixm1nxp59zDe3CKZssOILfiNbhwYrtjuw535nSyP3TmrFrlXFrsAhW7BEJNlExBMxZU4PqCDEA95bNJYvXr75hqo3SZZJcKoVdEgNlvZLKnKyfOCxA9mSAF6owIaJKC5qT4al7sZXUFUGrfUGple6ggN07FZTv4BtoW1lqau_JVuHjwFbg2uAGrtGOgcBW6GBFkK2vnugPWZ5McvyscO-0coPmOdpXmR5miajsnzaEL_SSsmRUrqTisjtwTYKPs_8hz7ScRKJLIqLuRgFg04ab5-IKBYRHS09r1YTP88HtJPGNd6iiMSULLLpeUBtpY-CxMtG4jtFUkuFaM4P0HS0p8_RmR4HllIcc7jXNZVHlP28Bvzf0xvd-pl9qoRO_34B_GOwLg:1qVAVS:jEBb97v7_MYYUJ3LnnHw6QpIADPU9NZW-WnHHiCAImA', '2023-08-27 12:47:42.032407');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_admin`
--

CREATE TABLE `mainapp_admin` (
  `Admin_id` int(11) NOT NULL,
  `Admin_name` varchar(200) NOT NULL,
  `Admin_email` varchar(100) NOT NULL,
  `Admin_address` varchar(200) NOT NULL,
  `Admin_phone` varchar(12) NOT NULL,
  `Admin_Area` varchar(100) NOT NULL,
  `Admin_position` varchar(100) NOT NULL,
  `Admin_permitted` tinyint(1) NOT NULL,
  `Log_id_id` int(11) DEFAULT NULL,
  `Admin_Picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_admin`
--

INSERT INTO `mainapp_admin` (`Admin_id`, `Admin_name`, `Admin_email`, `Admin_address`, `Admin_phone`, `Admin_Area`, `Admin_position`, `Admin_permitted`, `Log_id_id`, `Admin_Picture`) VALUES
(1, 'Manu Varma', 'manuvarma@gmail.com', 'Madampally, Adoor, Pathanamthitta', '9865023506', 'Konni', 'Village Officer', 0, 5, NULL),
(2, 'Savithri Devi', 'savithridevi@gmail.com', 'Arangatt mana, Peroor P.O, Palakkad', '9860479234', 'Karimpetti Thaluk', 'Thahasildhar', 0, 6, 'images/admins/admin1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_login`
--

CREATE TABLE `mainapp_login` (
  `log_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_login`
--

INSERT INTO `mainapp_login` (`log_id`, `email`, `password`, `role`) VALUES
(1, 'superadmin@gmail.com', 'supadmin', 'super_admin'),
(4, 'aswindas.209@gmail.com', '@c%T458D', 'user'),
(5, 'manuvarma@gmail.com', 'F9p89*S@', 'admin'),
(6, 'savithridevi@gmail.com', '5h@th73$', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_news`
--

CREATE TABLE `mainapp_news` (
  `News_id` int(11) NOT NULL,
  `News_title` varchar(500) NOT NULL,
  `News_content` varchar(2000) NOT NULL,
  `News_date` date NOT NULL,
  `News_Picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_news`
--

INSERT INTO `mainapp_news` (`News_id`, `News_title`, `News_content`, `News_date`, `News_Picture`) VALUES
(1, 'Onam 2023: Fund sanctioned for 2 months’ welfare pensions', 'Thiruvananthapuram: Kerala finance department has sanctioned Rs 1,762 cr for welfare pension distribution ahead of the Onam festival. Rs 1,550 crore is designated for social security pensions and Rs 212 crore for welfare board pensions.\r\n', '2023-08-05', 'images/news/pension_news_fwvxRaZ.jpg'),
(3, 'സംസ്ഥാന ബജറ്റ്: 2% ക്ഷാമബത്തയും പെൻഷൻ കുടിശികയും നൽകിയേക്കും', 'സർവീസ് പെൻഷൻകാർക്ക് നൽകാനുള്ള പെൻഷൻ പരിഷ്കരണ കുടിശികയും ജീവനക്കാർക്ക് നൽകാനുള്ള ക്ഷാമബത്ത കുടിശികയുടെ ഒരു പങ്കും സംസ്ഥാന ബജറ്റിൽ അനുവദിക്കാൻ സാധ്യത.\r\nപെൻഷൻ പരിഷ്കരണ കുടിശിക 4 ഗഡുക്കളായി നൽകാനാണ് സർക്കാർ തീരുമാനിച്ചിരുന്നത്. എന്നാൽ, 2 ഗഡുക്കളെ നൽകിയുള്ളൂ. ബാക്കി 2021 ഓഗസ്റ്റിലും നവംബറിലുമായി നൽകുമെന്നായിരുന്നു ഉത്തരവ്.\r\nഎന്നാൽ, സാമ്പത്തിക പ്രതിസന്ധി കാരണം മൂന്നാം ഗഡു വിതരണം ഇൗ സാമ്പത്തിക വർഷത്തേക്കും (2022–23), നാലാം ഗഡു അടുത്ത സാമ്പത്തിക വർഷത്തേക്കും (2023–24) മാറ്റിവച്ചെങ്കിലും ഇതു വരെ ഇൗ വർഷത്തെ കുടിശിക നൽകിയില്ല. \r\nഇത് അടുത്ത വർഷം നൽകുമെന്ന് ബജറ്റിൽ പ്രഖ്യാപിക്കാനാണു സാധ്യത.', '2023-08-13', 'images/news/finance_minister_qqYvP3k.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_subscription`
--

CREATE TABLE `mainapp_subscription` (
  `Sub_id` int(11) NOT NULL,
  `Sub_date` varchar(100) DEFAULT NULL,
  `Sub_end` varchar(200) DEFAULT NULL,
  `Sub_trans_id` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_subscription`
--

INSERT INTO `mainapp_subscription` (`Sub_id`, `Sub_date`, `Sub_end`, `Sub_trans_id`) VALUES
(2, '2023-08-02', '2024-08-02', '20230802823165');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_user`
--

CREATE TABLE `mainapp_user` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(200) NOT NULL,
  `User_email` varchar(100) NOT NULL,
  `User_address` varchar(200) NOT NULL,
  `User_phone` varchar(12) NOT NULL,
  `User_ARU` varchar(100) NOT NULL,
  `User_nomin` varchar(100) NOT NULL,
  `User_join` varchar(100) NOT NULL,
  `User_retire` varchar(100) NOT NULL,
  `User_age` int(11) NOT NULL,
  `User_birth` varchar(100) NOT NULL,
  `User_position` varchar(100) NOT NULL,
  `User_permitted` tinyint(1) NOT NULL,
  `Log_id_id` int(11) DEFAULT NULL,
  `User_Sub_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_user`
--

INSERT INTO `mainapp_user` (`User_id`, `User_name`, `User_email`, `User_address`, `User_phone`, `User_ARU`, `User_nomin`, `User_join`, `User_retire`, `User_age`, `User_birth`, `User_position`, `User_permitted`, `Log_id_id`, `User_Sub_id`) VALUES
(2, 'Aswin Das', 'aswindas.209@gmail.com', 'Arunodayam House, Vallicode, Vallicode P.O, Pathanamthitta, Kerala. PIN : 689648', '8838948332', 'Konni', 'Vyshnavi', '12/04/1970', '20/10/2023', 78, '19/05/1945', 'Chief Engineer', 1, 4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mainapp_admin`
--
ALTER TABLE `mainapp_admin`
  ADD PRIMARY KEY (`Admin_id`),
  ADD UNIQUE KEY `Admin_email` (`Admin_email`),
  ADD KEY `mainapp_admin_Log_id_id_8d9e37a2_fk_mainapp_login_log_id` (`Log_id_id`);

--
-- Indexes for table `mainapp_login`
--
ALTER TABLE `mainapp_login`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `mainapp_news`
--
ALTER TABLE `mainapp_news`
  ADD PRIMARY KEY (`News_id`);

--
-- Indexes for table `mainapp_subscription`
--
ALTER TABLE `mainapp_subscription`
  ADD PRIMARY KEY (`Sub_id`);

--
-- Indexes for table `mainapp_user`
--
ALTER TABLE `mainapp_user`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `User_email` (`User_email`),
  ADD KEY `mainapp_user_Log_id_id_b0e7ab3d_fk_mainapp_login_log_id` (`Log_id_id`),
  ADD KEY `mainapp_user_User_Sub_id_aac9e250_fk_mainapp_subscription_Sub_id` (`User_Sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mainapp_admin`
--
ALTER TABLE `mainapp_admin`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_login`
--
ALTER TABLE `mainapp_login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mainapp_news`
--
ALTER TABLE `mainapp_news`
  MODIFY `News_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mainapp_subscription`
--
ALTER TABLE `mainapp_subscription`
  MODIFY `Sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_user`
--
ALTER TABLE `mainapp_user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_admin`
--
ALTER TABLE `mainapp_admin`
  ADD CONSTRAINT `mainapp_admin_Log_id_id_8d9e37a2_fk_mainapp_login_log_id` FOREIGN KEY (`Log_id_id`) REFERENCES `mainapp_login` (`log_id`);

--
-- Constraints for table `mainapp_user`
--
ALTER TABLE `mainapp_user`
  ADD CONSTRAINT `mainapp_user_Log_id_id_b0e7ab3d_fk_mainapp_login_log_id` FOREIGN KEY (`Log_id_id`) REFERENCES `mainapp_login` (`log_id`),
  ADD CONSTRAINT `mainapp_user_User_Sub_id_aac9e250_fk_mainapp_subscription_Sub_id` FOREIGN KEY (`User_Sub_id`) REFERENCES `mainapp_subscription` (`Sub_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
