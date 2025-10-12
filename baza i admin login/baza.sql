-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 31, 2018 at 02:34 AM
-- Server version: 5.5.60-0+deb8u1
-- PHP Version: 5.6.36-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gpanel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `status` text NOT NULL,
  `signature` text CHARACTER SET latin1 NOT NULL,
  `lastactivity` text CHARACTER SET latin1 NOT NULL,
  `boja` text CHARACTER SET latin1 NOT NULL,
  `login_session` text CHARACTER SET latin1 NOT NULL,
  `avatar` varchar(999) CHARACTER SET latin1 DEFAULT 'nema_avatar.png',
  `lastactivityname` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fname`, `lname`, `username`, `password`, `email`, `status`, `signature`, `lastactivity`, `boja`, `login_session`, `avatar`, `lastactivityname`) VALUES
(1, 'admin', 'admin', 'admin', '06cf5dd952f2ba75e08c26d43e14269113baf3f5', 'admin@admin.com', 'admin', '', '1546219809', '', '', 'nema_avatar.png', 'Pregled strane - Početna');

-- --------------------------------------------------------

--
-- Table structure for table `banovi`
--

CREATE TABLE IF NOT EXISTS `banovi` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `vreme` int(11) DEFAULT NULL,
  `razlog` text,
  `trajanje` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE IF NOT EXISTS `billing` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `iznos` double NOT NULL DEFAULT '0',
  `datum` text,
  `status` varchar(16) DEFAULT 'Na cekanju',
  `vreme` text NOT NULL,
  `invoice` varchar(60) NOT NULL DEFAULT '0',
  `transactionid` varchar(60) NOT NULL DEFAULT '0',
  `currency` int(2) NOT NULL DEFAULT '1',
  `description` varchar(60) NOT NULL DEFAULT '0',
  `paytype` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billing_currency`
--

CREATE TABLE IF NOT EXISTS `billing_currency` (
`cid` int(11) NOT NULL,
  `multiply` double NOT NULL DEFAULT '1',
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sign` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `zemlja` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_log`
--

CREATE TABLE IF NOT EXISTS `billing_log` (
`logid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `adminid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_sms`
--

CREATE TABLE IF NOT EXISTS `billing_sms` (
`id` int(11) NOT NULL,
  `username` text,
  `time` varchar(164) NOT NULL,
  `message` varchar(64) NOT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `price` varchar(64) DEFAULT NULL,
  `currency` varchar(64) DEFAULT NULL,
  `service_id` varchar(64) DEFAULT NULL,
  `message_id` varchar(64) DEFAULT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `shortcode` varchar(64) DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `billing_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `revenue` double(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_smszemlje`
--

CREATE TABLE IF NOT EXISTS `billing_smszemlje` (
`id` int(11) NOT NULL,
  `poruka` text NOT NULL,
  `broj` text NOT NULL,
  `cijena` text NOT NULL,
  `status` text NOT NULL,
  `zemlja` text NOT NULL,
  `currency` text NOT NULL,
  `dodatno` text NOT NULL,
  `disclaimer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE IF NOT EXISTS `box` (
`boxid` int(8) unsigned NOT NULL,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `routeip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `login` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `password` blob NOT NULL,
  `sshport` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ftpport` int(11) NOT NULL DEFAULT '21',
  `maxsrv` int(11) NOT NULL,
  `cache` blob,
  `box_load_5min` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `box_load` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boxdata`
--

CREATE TABLE IF NOT EXISTS `boxdata` (
`id` int(8) unsigned NOT NULL,
  `timestamp` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cache` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boxip`
--

CREATE TABLE IF NOT EXISTS `boxip` (
`ipid` int(8) unsigned NOT NULL,
  `boxid` int(8) unsigned NOT NULL,
  `ip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bug`
--

CREATE TABLE IF NOT EXISTS `bug` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `naslov` text,
  `text` text,
  `vrsta` int(11) DEFAULT NULL,
  `vreme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE IF NOT EXISTS `chat_messages` (
  `Text` text,
  `Autor` text NOT NULL,
  `Datum` text NOT NULL,
`ID` int(11) NOT NULL,
  `admin_id` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(10) unsigned NOT NULL,
  `admin_id` int(10) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `setting` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
`id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `string` varchar(255) DEFAULT NULL,
  `file` mediumtext,
  `line` int(11) DEFAULT NULL,
  `datum` mediumtext,
  `vrsta` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `friends_list`
--

CREATE TABLE IF NOT EXISTS `friends_list` (
`id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `friends_request`
--

CREATE TABLE IF NOT EXISTS `friends_request` (
`id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`invoice_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_status_id` tinyint(2) NOT NULL DEFAULT '1',
  `invoice_date_created` date NOT NULL,
  `invoice_date_modified` datetime NOT NULL,
  `invoice_date_due` date NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_terms` longtext NOT NULL,
  `invoice_url_key` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE IF NOT EXISTS `invoice_items` (
`item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL DEFAULT '0',
  `item_date_added` date NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` longtext NOT NULL,
  `item_quantity` decimal(10,2) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_order` int(2) NOT NULL DEFAULT '0',
  `item_popust` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `klijenti`
--

CREATE TABLE IF NOT EXISTS `klijenti` (
`klijentid` int(8) unsigned NOT NULL,
  `username` text NOT NULL,
  `sifra` text NOT NULL,
  `ime` text,
  `prezime` text,
  `email` text NOT NULL,
  `beleske` text,
  `novac` double NOT NULL DEFAULT '0',
  `currency` int(2) NOT NULL DEFAULT '1',
  `status` text NOT NULL,
  `lastlogin` datetime NOT NULL,
  `lastactivity` text NOT NULL,
  `lastip` text NOT NULL,
  `lasthost` text NOT NULL,
  `kreiran` date NOT NULL,
  `zemlja` text NOT NULL,
  `avatar` text NOT NULL,
  `cover` varchar(11) NOT NULL DEFAULT 'cover.jpg',
  `banovan` int(2) NOT NULL DEFAULT '0',
  `sigkod` int(11) NOT NULL,
  `token` text,
  `mail` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klijenti`
--

INSERT INTO `klijenti` (`klijentid`, `username`, `sifra`, `ime`, `prezime`, `email`, `beleske`, `novac`, `currency`, `status`, `lastlogin`, `lastactivity`, `lastip`, `lasthost`, `kreiran`, `zemlja`, `avatar`, `cover`, `banovan`, `sigkod`, `token`, `mail`) VALUES
(1, 'demo_nalog', '3a19ed530948e936ff4d25e9352b393ae6f63ce00770f93ffd74c428bd18e0faa489166b363759ba6bb26fbb7cb1bc361cd4c939c828e1260adbb8ff14b1ed29', 'Demo', 'Nalog', 'demo@demo.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1531602635', '~', '~', '2016-10-18', 'bih', 'default.png', 'cover.jpg', 0, 32660, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `klijenti_komentari`
--

CREATE TABLE IF NOT EXISTS `klijenti_komentari` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `profilid` int(11) DEFAULT NULL,
  `komentar` text,
  `vreme` text,
  `novo` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

CREATE TABLE IF NOT EXISTS `komentari` (
`id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `profilid` int(11) DEFAULT NULL,
  `komentar` text CHARACTER SET latin1,
  `vreme` text CHARACTER SET latin1,
  `novo` varchar(11) CHARACTER SET latin1 NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lgsl`
--

CREATE TABLE IF NOT EXISTS `lgsl` (
  `id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `c_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `q_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `s_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cache` text COLLATE utf8_unicode_ci NOT NULL,
  `cache_time` text COLLATE utf8_unicode_ci NOT NULL,
  `igraci` text COLLATE utf8_unicode_ci NOT NULL,
  `igraci_5min` text COLLATE utf8_unicode_ci NOT NULL,
  `rank_bodovi` float NOT NULL DEFAULT '0',
`idu` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logovi`
--

CREATE TABLE IF NOT EXISTS `logovi` (
`id` int(11) NOT NULL,
  `clientid` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `vreme` varchar(255) DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modovi`
--

CREATE TABLE IF NOT EXISTS `modovi` (
`id` int(11) NOT NULL,
  `putanja` text NOT NULL,
  `ime` text NOT NULL,
  `opis` mediumtext NOT NULL,
  `igra` text NOT NULL,
  `komanda` text NOT NULL,
  `sakriven` int(11) NOT NULL DEFAULT '1',
  `mapa` mediumtext,
  `cena` mediumtext NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modovi`
--

INSERT INTO `modovi` (`id`, `putanja`, `ime`, `opis`, `igra`, `komanda`, `sakriven`, `mapa`, `cena`) VALUES
(1, '/home/gamefiles/samp', 'Default', 'Mod: Default', '2', './samp03svr', 0, 'San Andreas', '||||'),
(2, '/home/gamefiles/cs', 'Public', 'Mod: Public', '1', './hlds_run -game cstrike +ip {$ip} +port {$port} +maxplayers {$slots} +sys_ticrate 300 +map {$map} +servercfgfile server.cfg', 0, 'de_dust2', '||||'),
(3, '/home/gamefiles/mc_1.7.9', 'Minecraft 1.7/1.8', '', '3', 'java -d64 -Xincgc -Xms1000M -Xmx1000M -XX:MaxPermSize=128M -XX:+DisableExplicitGC -XX:+AggressiveOpts -Dfile.encoding=UTF-8 -jar spigot.jar', 0, 'world', '||||');

-- --------------------------------------------------------

--
-- Table structure for table `obavestenja`
--

CREATE TABLE IF NOT EXISTS `obavestenja` (
`id` int(11) NOT NULL,
  `naslov` text,
  `poruka` text,
  `datum` text,
  `vrsta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online`
--

CREATE TABLE IF NOT EXISTS `online` (
  `online` varchar(2) DEFAULT NULL,
  `poruka` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE IF NOT EXISTS `paypal_ipn` (
`id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `raw` mediumtext NOT NULL,
  `time` int(11) NOT NULL,
  `invoice` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
`id` int(11) NOT NULL,
  `ime` text,
  `deskripcija` text,
  `prikaz` text,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reputacija`
--

CREATE TABLE IF NOT EXISTS `reputacija` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  `tiketid` int(11) DEFAULT NULL,
  `rep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serveri`
--

CREATE TABLE IF NOT EXISTS `serveri` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `rank` int(12) NOT NULL DEFAULT '99999',
  `mod` mediumtext NOT NULL,
  `map` text NOT NULL,
  `port` mediumtext NOT NULL,
  `fps` int(11) NOT NULL DEFAULT '300',
  `slotovi` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `istice` mediumtext NOT NULL,
  `status` text NOT NULL,
  `startovan` int(11) NOT NULL DEFAULT '0',
  `free` mediumtext,
  `uplatnica` mediumtext,
  `igra` mediumtext,
  `komanda` mediumtext NOT NULL,
  `cena` mediumtext NOT NULL,
  `boost` mediumtext NOT NULL,
  `cache` blob NOT NULL,
  `reinstaliran` int(11) NOT NULL,
  `backup` varchar(12) NOT NULL DEFAULT '0',
  `napomena` text NOT NULL,
  `autorestart` varchar(11) DEFAULT '-1',
  `backupstatus` varchar(30) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serveri_naruceni`
--

CREATE TABLE IF NOT EXISTS `serveri_naruceni` (
`id` int(11) NOT NULL,
  `klijentid` int(11) DEFAULT NULL,
  `igra` int(2) DEFAULT NULL,
  `lokacija` int(2) DEFAULT NULL,
  `slotovi` int(4) DEFAULT NULL,
  `meseci` int(3) DEFAULT NULL,
  `cena` varchar(8) DEFAULT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `server_backup`
--

CREATE TABLE IF NOT EXISTS `server_backup` (
`id` int(11) NOT NULL,
  `srvid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '0',
  `size` varchar(20) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slajdovi`
--

CREATE TABLE IF NOT EXISTS `slajdovi` (
`id` int(11) NOT NULL,
  `naslov` text,
  `text` text,
  `slika` text,
  `datum` text
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slajdovi`
--

INSERT INTO `slajdovi` (`id`, `naslov`, `text`, `slika`, `datum`) VALUES
(5, 'Uplata putem SMS-a', 'Samo kod nas možete uplatiti putem SMS-a bez provizije!', '/assets/img/slider/2.png', '18.09.2016');

-- --------------------------------------------------------

--
-- Table structure for table `smslog`
--

CREATE TABLE IF NOT EXISTS `smslog` (
`id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `message` varchar(64) NOT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `price` varchar(64) DEFAULT NULL,
  `revenue` varchar(11) NOT NULL DEFAULT '0',
  `currency` varchar(64) DEFAULT NULL,
  `service_id` varchar(64) DEFAULT NULL,
  `message_id` varchar(64) DEFAULT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `shortcode` varchar(64) DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `billing_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tiketi`
--

CREATE TABLE IF NOT EXISTS `tiketi` (
`id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` text,
  `prioritet` int(11) NOT NULL,
  `vrsta` int(11) NOT NULL,
  `datum` text,
  `naslov` text,
  `billing` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL,
  `otvoren` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tiketi_odgovori`
--

CREATE TABLE IF NOT EXISTS `tiketi_odgovori` (
`id` int(11) NOT NULL,
  `tiket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `odgovor` text NOT NULL,
  `vreme_odgovora` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banovi`
--
ALTER TABLE `banovi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_currency`
--
ALTER TABLE `billing_currency`
 ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `billing_log`
--
ALTER TABLE `billing_log`
 ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `billing_sms`
--
ALTER TABLE `billing_sms`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_smszemlje`
--
ALTER TABLE `billing_smszemlje`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box`
--
ALTER TABLE `box`
 ADD PRIMARY KEY (`boxid`);

--
-- Indexes for table `boxdata`
--
ALTER TABLE `boxdata`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boxip`
--
ALTER TABLE `boxip`
 ADD PRIMARY KEY (`ipid`);

--
-- Indexes for table `bug`
--
ALTER TABLE `bug`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
 ADD KEY `setting` (`setting`);

--
-- Indexes for table `error_log`
--
ALTER TABLE `error_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends_list`
--
ALTER TABLE `friends_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends_request`
--
ALTER TABLE `friends_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`invoice_id`), ADD UNIQUE KEY `invoice_url_key` (`invoice_url_key`), ADD KEY `user_id` (`client_id`,`invoice_date_created`,`invoice_date_due`,`invoice_number`), ADD KEY `invoice_status_id` (`invoice_status_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
 ADD PRIMARY KEY (`item_id`), ADD KEY `invoice_id` (`invoice_id`,`item_tax_rate_id`,`item_date_added`,`item_order`);

--
-- Indexes for table `klijenti`
--
ALTER TABLE `klijenti`
 ADD PRIMARY KEY (`klijentid`);

--
-- Indexes for table `klijenti_komentari`
--
ALTER TABLE `klijenti_komentari`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentari`
--
ALTER TABLE `komentari`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lgsl`
--
ALTER TABLE `lgsl`
 ADD PRIMARY KEY (`idu`), ADD KEY `rank_bodovi` (`rank_bodovi`);

--
-- Indexes for table `logovi`
--
ALTER TABLE `logovi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modovi`
--
ALTER TABLE `modovi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obavestenja`
--
ALTER TABLE `obavestenja`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reputacija`
--
ALTER TABLE `reputacija`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serveri`
--
ALTER TABLE `serveri`
 ADD PRIMARY KEY (`id`), ADD KEY `rank` (`rank`);

--
-- Indexes for table `serveri_naruceni`
--
ALTER TABLE `serveri_naruceni`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_backup`
--
ALTER TABLE `server_backup`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slajdovi`
--
ALTER TABLE `slajdovi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smslog`
--
ALTER TABLE `smslog`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiketi`
--
ALTER TABLE `tiketi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiketi_odgovori`
--
ALTER TABLE `tiketi_odgovori`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `banovi`
--
ALTER TABLE `banovi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_currency`
--
ALTER TABLE `billing_currency`
MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_log`
--
ALTER TABLE `billing_log`
MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_sms`
--
ALTER TABLE `billing_sms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_smszemlje`
--
ALTER TABLE `billing_smszemlje`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
MODIFY `boxid` int(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boxdata`
--
ALTER TABLE `boxdata`
MODIFY `id` int(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boxip`
--
ALTER TABLE `boxip`
MODIFY `ipid` int(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bug`
--
ALTER TABLE `bug`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `error_log`
--
ALTER TABLE `error_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friends_list`
--
ALTER TABLE `friends_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friends_request`
--
ALTER TABLE `friends_request`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `klijenti`
--
ALTER TABLE `klijenti`
MODIFY `klijentid` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `klijenti_komentari`
--
ALTER TABLE `klijenti_komentari`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `komentari`
--
ALTER TABLE `komentari`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lgsl`
--
ALTER TABLE `lgsl`
MODIFY `idu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logovi`
--
ALTER TABLE `logovi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modovi`
--
ALTER TABLE `modovi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `obavestenja`
--
ALTER TABLE `obavestenja`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reputacija`
--
ALTER TABLE `reputacija`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `serveri`
--
ALTER TABLE `serveri`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `serveri_naruceni`
--
ALTER TABLE `serveri_naruceni`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `server_backup`
--
ALTER TABLE `server_backup`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slajdovi`
--
ALTER TABLE `slajdovi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `smslog`
--
ALTER TABLE `smslog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tiketi`
--
ALTER TABLE `tiketi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tiketi_odgovori`
--
ALTER TABLE `tiketi_odgovori`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
