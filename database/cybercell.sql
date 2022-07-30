-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2022 at 10:28 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cybercell`
--
CREATE DATABASE IF NOT EXISTS `cybercell` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cybercell`;

-- --------------------------------------------------------

--
-- Table structure for table `add_informer`
--

CREATE TABLE IF NOT EXISTS `add_informer` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `add_informer`
--

INSERT INTO `add_informer` (`user_id`, `name`, `area`, `email`, `password`, `image`) VALUES
(1, 'sameer', 'medchal', 'sameer@gmail.com', 'sameer123', 'images/i1.jpg'),
(2, 'nagesh', 'balanagar', 'nagesh@gmail.com', 'nagesh123', 'images/i2.jpg'),
(3, 'ramesh', 'bolaram', 'ramesh@gmail.com', 'ramesh123', 'images/i3.jpg'),
(4, 'gopal', 'champapet', 'gopal@gmail.com', 'gopal123', 'images/i4.jpg'),
(5, 'satish', 'charkaman', 'satish@gmail.com', 'satish123', 'images/i5.jpg'),
(6, 'vinay', 'chintal', 'vinay@gmail.com', 'vinay123', 'images/i6.jpg'),
(7, 'vishal', 'ECIL', 'vishal@gmail.com', 'vishal123', 'images/i7.jpg'),
(8, 'nitin', 'erragadda', 'nitin@gmail.com', 'nitin123', 'images/i8.jpg'),
(9, 'nishanth', 'hakimpet', 'nishanth@gmail.com', 'nishanth123', 'images/i9.jpg'),
(10, 'jayanth', 'kachiguda', 'jayanth@gmail.com', 'jayanth123', 'images/i10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `add_police`
--

CREATE TABLE IF NOT EXISTS `add_police` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `add_police`
--

INSERT INTO `add_police` (`user_id`, `name`, `area`, `email`, `password`, `image`) VALUES
(1, 'S.I Ramu', 'meerpet', 'ramu@gmail.com', 'ramu123', 'images/p1.jpg'),
(2, 'S.I kiran', 'balapurr', 'kiran@gmail.com', 'kiran123', 'images/p2.jpg'),
(3, 'S.I kishore', 'miyapur', 'kishore@gmail.com', 'kishore123', 'images/p3.jpg'),
(4, 'S.I Tharun', 'madhapur', 'tharun@gmail.com', 'tharun123', 'images/p4.jpg'),
(5, 'S.I Teja', 'nalgonda', 'teja@gmail.com', 'teja123', 'images/p5.jpeg'),
(6, 'S.I Sharath', 'malakpet', 'sharath@gmail.com', 'sharath123', 'images/p6.jpg'),
(7, 'S.I Satish', 'saidabad', 'satish@gmail.com', 'satish123', 'images/p8.jpg'),
(8, 'S.I hemanth', 'l.b nagar', 'hemath@gmail.com', 'hemanth123', 'images/p9.jpg'),
(9, 'pavan', 'nampally', 'pavan@gmail.com', 'pavan123', 'images/p10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add police add wanted model', 7, 'add_policeaddwantedmodel'),
(26, 'Can change police add wanted model', 7, 'change_policeaddwantedmodel'),
(27, 'Can delete police add wanted model', 7, 'delete_policeaddwantedmodel'),
(28, 'Can view police add wanted model', 7, 'view_policeaddwantedmodel'),
(29, 'Can add police add missing models', 8, 'add_policeaddmissingmodels'),
(30, 'Can change police add missing models', 8, 'change_policeaddmissingmodels'),
(31, 'Can delete police add missing models', 8, 'delete_policeaddmissingmodels'),
(32, 'Can view police add missing models', 8, 'view_policeaddmissingmodels'),
(33, 'Can add admin add police model', 9, 'add_adminaddpolicemodel'),
(34, 'Can change admin add police model', 9, 'change_adminaddpolicemodel'),
(35, 'Can delete admin add police model', 9, 'delete_adminaddpolicemodel'),
(36, 'Can view admin add police model', 9, 'view_adminaddpolicemodel'),
(37, 'Can add admin add informer model', 10, 'add_adminaddinformermodel'),
(38, 'Can change admin add informer model', 10, 'change_adminaddinformermodel'),
(39, 'Can delete admin add informer model', 10, 'delete_adminaddinformermodel'),
(40, 'Can view admin add informer model', 10, 'view_adminaddinformermodel'),
(41, 'Can add citizen register model', 11, 'add_citizenregistermodel'),
(42, 'Can change citizen register model', 11, 'change_citizenregistermodel'),
(43, 'Can delete citizen register model', 11, 'delete_citizenregistermodel'),
(44, 'Can view citizen register model', 11, 'view_citizenregistermodel'),
(45, 'Can add citizen register complaint model', 12, 'add_citizenregistercomplaintmodel'),
(46, 'Can change citizen register complaint model', 12, 'change_citizenregistercomplaintmodel'),
(47, 'Can delete citizen register complaint model', 12, 'delete_citizenregistercomplaintmodel'),
(48, 'Can view citizen register complaint model', 12, 'view_citizenregistercomplaintmodel'),
(49, 'Can add informer add info model', 13, 'add_informeraddinfomodel'),
(50, 'Can change informer add info model', 13, 'change_informeraddinfomodel'),
(51, 'Can delete informer add info model', 13, 'delete_informeraddinfomodel'),
(52, 'Can view informer add info model', 13, 'view_informeraddinfomodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `citizen_complaints`
--

CREATE TABLE IF NOT EXISTS `citizen_complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `address` varchar(400) NOT NULL,
  `category` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `status_category` varchar(100) DEFAULT NULL,
  `status_category_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `citizen_complaints`
--

INSERT INTO `citizen_complaints` (`complaint_id`, `user_id`, `name`, `mobile`, `address`, `category`, `email`, `description`, `status_category`, `status_category_2`) VALUES
(1, 8, 'tharun karree', 9618716570, 'meerpet, new balaji nagar,hno:460,', 'Robbery', 'saitharun581@gmail.com', 'It is to state that, I was going to my friend’s/parents/grandparent’s home in (Area/City name) (date) on my car (Transport name), when two men (or more) who were standing across the road near (Area name) tried to stop me by waving their hands. I thought might be possible, they need some help, I applied the brakes and asked them what if they need some help. (Show your actual problem and situation).  Suddenly one of them pulled out a pocket knife (or gun) and ordered me to come out of the car (Transport name). I had no other choice except to do as they command. I came out of my car (Transport name), one man started searching my pockets and the other stood still pointing the knife towards me. They took my cash, my cards, my cellular phone, and my laptop too.', 'Processing', NULL),
(2, 8, 'tharun karree', 9618716570, 'meerpet, new balaji nagar,hno:460,', 'Accident', 'tharun@gmail.com', 'I am writing this letter to file a report for a car accident in which I was involved on the 5th of February. I was driving my Hyundai i10, 9678 in Bandra when a Honda city, 7845 came in a rush and hit me from behind. My car was totally smashed and damaged brutally. The Honda city managed to escape from the scene immediately, and I could not hold the driver at that moment. But I managed to take a note of his car number which I have stated above.  The accident not only led to physical damage of the car but it has also injured me to a great extent. My right shoulder bone has been dislocated and I have been told to undergo an operation to fix it. I would like you to file a report against the owner and driver of the Honda city. Please take the necessary steps, whatever it may be to find out about them. With the help of the car number, it will be easy for you to locate them.  Kindly look into the matter as soon as possible and revert back to me with positive response.', 'Received', NULL),
(3, 9, 'teja karre', 9848025344, 'meerpet, new balaji nagar,hno:762,', 'Drugs', 'teja@gmail.com', 'What is going on across the street from my home is a travesty, and you have the power to fix it. I urge you to initiate the eviction process immediately. The county Sheriff''s Office is equipped to enforce such matters and can be reached at 555-555-5555.  While I have compassion toward people struggling with addiction, my patience does not extend to the constant disruptions and unsafe conditions we are forced to experience due to your tenants and your inability or unwillingness to deal with this problem. As I have told you before, my kids should not have to see drugs change hands, dodge dozens of fast-moving cars per day, and witness overdoses on their own street.  I have attached photographs, records, and notarized statements from myself and multiple neighbors attesting to the incontrovertible drug activity going on in your rental property.  Please call and assure me that you are finally taking immediate action on this matter that is ruining lives and terrorizing our neighborhood. My next letter will be to an attorney.', 'Verified', NULL),
(4, 9, 'teja karre', 9848025344, 'meerpet, new balaji nagar,hno:762,', 'Street Fights', 'teja@gmail.com', ' I have noticed three goons of the town strolling through our street daily in the evening. They are always under the influence of liquor. Generally they come there to stand near a house, sing songs and abuse one another in vulgar language. A couple of days ago the house owner warned them against their unsocial behaviour and advised them not to do this again.  Last night the goondas came again. Obviously they had no intention of taking the advice. Rather the advice had just the opposite effect. Last night their number also increased to five. Singing cheap songs and abusing more loudly they tried to harass the occupants of the house.  The house owner could not put up with the insult. He thought to teach them a lesson. He consulted with everybody in his house as well as in the neighbourhood and hurriedly appeared before the goondas. He asked them to quit the street. One of the goondas caught hold of him by the arm. The house owner, a sturdy man, pushed him. This was perhaps a signal.  All the five goondas joined hands and started beating him. This was more than enough. About a dozen persons of the locality came rushing on the scene and tried to save the house owner. The goondas were bent upon making a mischief and abused others also. It was too much for everybody soon a free for all ensued. The goondas could not stand for long. They were beaten, pushed, kicked and driven away. Personally I feel they will never dare to come again and misbehave.', 'Received', NULL),
(9, 1, 'chandan rao', 9848025344, 'ammeerpet, sri nagar,hno:762,', 'Smuggling', 'chandan@gmail.com', 'I, chandan, a permanent resident of hyderabad, lived in the vicinity of your police station. I''m writing to notify you that on 19th September, 2022, I paid 92,000 for a laptop from a Amazon.com.   Like any other e-commerce website, it displayed a thumbnail of a branded phone along with full product details. So, as per the details, I completed the transaction by paying 92,000 using internet transfer (UPI) method.', 'Completed', NULL),
(10, 2, 'shravan', 9658742123, 'ammeerpet, sri nagar,hno:762,', 'Harassment', 'shravan@gmail.com', 'I, sender’s name, write this letter to you in deep sorrow. I am an independent working woman and a single mother; working at a call center on the night shift. I always take the same route on public transport to come back home. From the past week, I have been noticing that two men are following me after I leave work at 4 am. I ignored them as I did not want any further problems, but yesterday the situation got out of hand. They followed me to my house and starting ringing the bell as they closed the door hastily. The men began shouted abuses at me but left as my neighbors arrived after hearing this.  This incident has scared me regarding me, and my children’s safety. Therefore, I request you to view the CCTV footage of my usual route and arrest these men as soon as possible.', 'Verified', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `citizen_details`
--

CREATE TABLE IF NOT EXISTS `citizen_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `citizen_details`
--

INSERT INTO `citizen_details` (`user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'chandan ', 'reddyy', 'chandan@gmail.com', 'chanDAN123'),
(2, 'shravan', 'chowdary', 'shravan@gmail.com', 'SHRAvan123'),
(3, 'abhinav ', 'jakkaa', 'abhinav@gmail.com', 'ABHInav123'),
(4, 'saddam', 'uuddin', 'saddaam@gmail.com', 'SADdam123'),
(5, 'vinaay', 'reeddy', 'vinaay@gmail.com', 'VINnay123'),
(6, 'naseer', 'fasall', 'naseer@gmail.com', 'NASser123'),
(7, 'sharath', 'chandra', 'sharathh@gmail.com', 'SHArath123'),
(8, 'tharun', 'karree', 'tharun@gmail.com', 'THArun123'),
(9, 'saiteja', 'karree', 'teja@gmail.com', 'TEja123'),
(10, 'likitha', 'karree', 'likita@gmail.com', 'LIKItha123');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'adminapp', 'adminaddinformermodel'),
(9, 'adminapp', 'adminaddpolicemodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'citizenapp', 'citizenregistercomplaintmodel'),
(11, 'citizenapp', 'citizenregistermodel'),
(5, 'contenttypes', 'contenttype'),
(13, 'informerapp', 'informeraddinfomodel'),
(8, 'policeapp', 'policeaddmissingmodels'),
(7, 'policeapp', 'policeaddwantedmodel'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-22 07:46:28.818786'),
(2, 'auth', '0001_initial', '2022-03-22 07:46:41.224179'),
(3, 'admin', '0001_initial', '2022-03-22 07:46:43.919343'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-22 07:46:43.983760'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-22 07:46:44.029291'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-22 07:46:45.931061'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-22 07:46:47.038350'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-22 07:46:48.036336'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-22 07:46:48.120742'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-22 07:46:49.070850'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-22 07:46:49.143534'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-22 07:46:49.190015'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-22 07:46:50.231521'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-22 07:46:51.209456'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-22 07:46:52.107606'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-22 07:46:52.181335'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-22 07:46:53.007684'),
(18, 'sessions', '0001_initial', '2022-03-22 07:46:53.885372'),
(19, 'policeapp', '0001_initial', '2022-03-22 07:53:31.309762'),
(20, 'adminapp', '0001_initial', '2022-03-22 07:54:05.387112'),
(21, 'informerapp', '0001_initial', '2022-03-22 07:54:38.872819'),
(22, 'citizenapp', '0001_initial', '2022-03-22 07:55:01.759089'),
(23, 'citizenapp', '0002_alter_citizenregistercomplaintmodel_description', '2022-03-22 12:06:47.048266'),
(24, 'informerapp', '0002_alter_informeraddinfomodel_desc', '2022-03-23 06:10:10.858842'),
(25, 'policeapp', '0002_auto_20220323_1248', '2022-03-23 07:18:33.179894');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('arj71hgzfl4b8e20cw49bdifba0kx6d0', 'eyJ1c2VyX2lkIjo4fQ:1nWyCz:M5yYgXr-X-YbK8dSuTNDdq468vK6p6Ggh8FO2PNhzQQ', '2022-04-06 10:27:17.821282');

-- --------------------------------------------------------

--
-- Table structure for table `informer_add_info`
--

CREATE TABLE IF NOT EXISTS `informer_add_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `desc` longtext,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `informer_add_info`
--

INSERT INTO `informer_add_info` (`user_id`, `name`, `area`, `desc`) VALUES
(1, 'ramesh', 'bolaram', 'Many urban communities are now besieged by illegal drugs. Fears of gang violence and muggings keep frightened residents at home. Even at home, citizens feel insecure, for drug-related break-ins and burglaries threaten. Open dealing on the street stirs the community''s fears for its children. The police sometimes seem overwhelmed. Occasionally they are outgunned. More often, they are simply overmatched by the resilience of the drug commerce. Furthermore, their potential impact is neutralized by the incapacity of the courts and penal system to mete out deserved punishments. '),
(2, 'ramesh', 'bolaram', 'A third problem is that drug use undermines the health, economic well-being, and social responsibility of drug users. It is hard to stay in school, hold onto a job, or care for a child when one is spending all one''s money and attention on getting ~toned.~ The families and friends of drug users are also undermined as their resources are strained by obligations to care for the drug user or to assume responsibilities that the drug user has abandoned. '),
(3, 'nagesh ', 'balanagar', 'Transnational organized crime groups know this and take advantage of people’s desperation. They facilitate the passage of migrants with little or no regard for their safety and wellbeing. What matters is the money.  INTERPOL people smuggling operation Andes Operation Andes 2018 The United Nations Office on Drugs and Crime estimates that at least 2.5 million migrants were smuggled in 2016, generating nearly USD 7 billion for people smugglers.  People smuggling is closely tied to the use of fraudulent travel documents and is linked to other crimes such as illicit money flows, corruption, terrorism, trafficking in illicit goods and human trafficking.  '),
(4, 'sameer', 'medchal', 'murder, in criminal law, the unjustified killing of one person by another, usually distinguished from the crime of manslaughter by the element of malice .'),
(5, 'gopal', 'champapet', 'According to common law, robbery is defined as taking the property of another, with the intent to permanently deprive the person of that property, by means of force or fear; that is, it is a larceny or theft accomplished by an assault.');

-- --------------------------------------------------------

--
-- Table structure for table `police_add_missing`
--

CREATE TABLE IF NOT EXISTS `police_add_missing` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `features` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `police_add_missing`
--

INSERT INTO `police_add_missing` (`user_id`, `name`, `features`, `image`, `status`) VALUES
(1, 'chintu', '4 ft, brown, lean', 'images/m1.jpg', 'found'),
(2, 'chinky', '3.2 ft ,black, very lean', 'images/m2.jpg', 'missing'),
(3, 'akhil', '4.2ft, black, thin ', 'images/m3.jpg', 'found'),
(4, 'sneha', '5 ft, brown, lean', 'images/m4.jpg', 'missing'),
(5, 'ramya', '3.8 ft, black, lean', 'images/m5.jpg', 'missing'),
(6, 'abhishek', '5.11 ft, white, muscular', 'images/m6.jpg', 'missing'),
(8, 'jagan', '5.7 ft, white, lean', 'images/m8.jpg', 'missing'),
(9, 'yadamma', '5.6 ft, black,fat', 'images/m10.jpg', 'found');

-- --------------------------------------------------------

--
-- Table structure for table `police_add_wanted`
--

CREATE TABLE IF NOT EXISTS `police_add_wanted` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `features` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `police_add_wanted`
--

INSERT INTO `police_add_wanted` (`user_id`, `name`, `features`, `image`, `status`) VALUES
(1, 'wasim akram', '6 ft, fair, muscular', 'images/w1.jpg', 'found'),
(2, 'akash', '5.10ft, dark,muscular', 'images/w2.jpg', 'found'),
(3, 'john', '5.9 ft, brown, lean', 'images/w3.jpg', 'found'),
(4, 'lewin', '6.2 ft, black, muscular', 'images/w4.jpg', 'wanted'),
(5, 'ronald', '5.9 ft, nigro ,lean', 'images/w5.jpg', 'wanted'),
(6, 'Rakesh', '5.11 ft, white ,fat', 'images/w6.jpg', 'wanted'),
(7, 'rajesh lala', '5.8 ft, brown, very lean', 'images/w9.jpg', 'wanted'),
(8, 'samual', '5.11 ft, white, muscular', 'images/w10.jpg', 'found');

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
