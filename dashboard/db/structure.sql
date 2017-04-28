-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: dashboard_development
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `test_result` int(11) DEFAULT NULL,
  `level_source_id` int(11) DEFAULT NULL,
  `lines` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_activities_on_level_source_id` (`level_source_id`) USING BTREE,
  KEY `index_activities_on_user_id_and_level_id` (`user_id`,`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1227 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authored_hint_view_requests`
--

DROP TABLE IF EXISTS `authored_hint_view_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authored_hint_view_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `script_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `hint_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hint_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hint_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prev_time` int(11) DEFAULT NULL,
  `prev_attempt` int(11) DEFAULT NULL,
  `prev_test_result` int(11) DEFAULT NULL,
  `prev_level_source_id` int(11) DEFAULT NULL,
  `next_time` int(11) DEFAULT NULL,
  `next_attempt` int(11) DEFAULT NULL,
  `next_test_result` int(11) DEFAULT NULL,
  `next_level_source_id` int(11) DEFAULT NULL,
  `final_time` int(11) DEFAULT NULL,
  `final_attempt` int(11) DEFAULT NULL,
  `final_test_result` int(11) DEFAULT NULL,
  `final_level_source_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_8f51960e09` (`level_id`) USING BTREE,
  KEY `index_authored_hint_view_requests_on_script_id_and_level_id` (`script_id`,`level_id`) USING BTREE,
  KEY `index_authored_hint_view_requests_on_all_related_ids` (`user_id`,`script_id`,`level_id`,`hint_id`) USING BTREE,
  CONSTRAINT `fk_rails_8f51960e09` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
  CONSTRAINT `fk_rails_a0c33be0c2` FOREIGN KEY (`script_id`) REFERENCES `scripts` (`id`),
  CONSTRAINT `fk_rails_f7ecfe986c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callouts`
--

DROP TABLE IF EXISTS `callouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `localization_key` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `script_level_id` int(11) DEFAULT NULL,
  `qtip_config` text COLLATE utf8_unicode_ci,
  `on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callout_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_tokens`
--

DROP TABLE IF EXISTS `channel_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_channel_tokens_on_user_id_and_level_id` (`user_id`,`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cohorts`
--

DROP TABLE IF EXISTS `cohorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cutoff_date` datetime DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cohorts_on_name` (`name`) USING BTREE,
  KEY `index_cohorts_on_program_type` (`program_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cohorts_deleted_users`
--

DROP TABLE IF EXISTS `cohorts_deleted_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohorts_deleted_users` (
  `user_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  KEY `index_cohorts_deleted_users_on_cohort_id_and_user_id` (`cohort_id`,`user_id`) USING BTREE,
  KEY `index_cohorts_deleted_users_on_user_id_and_cohort_id` (`user_id`,`cohort_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cohorts_districts`
--

DROP TABLE IF EXISTS `cohorts_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohorts_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cohort_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `max_teachers` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cohorts_districts_on_cohort_id_and_district_id` (`cohort_id`,`district_id`) USING BTREE,
  KEY `index_cohorts_districts_on_district_id_and_cohort_id` (`district_id`,`cohort_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cohorts_users`
--

DROP TABLE IF EXISTS `cohorts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohorts_users` (
  `user_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  KEY `index_cohorts_users_on_cohort_id_and_user_id` (`cohort_id`,`user_id`) USING BTREE,
  KEY `index_cohorts_users_on_user_id_and_cohort_id` (`user_id`,`cohort_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concepts`
--

DROP TABLE IF EXISTS `concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_concepts_on_video_id` (`video_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concepts_levels`
--

DROP TABLE IF EXISTS `concepts_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepts_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_concepts_levels_on_concept_id` (`concept_id`) USING BTREE,
  KEY `index_concepts_levels_on_level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contained_level_answers`
--

DROP TABLE IF EXISTS `contained_level_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contained_level_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `level_id` int(11) NOT NULL,
  `answer_number` int(11) NOT NULL,
  `answer_text` text COLLATE utf8_unicode_ci,
  `correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contained_level_answers_on_level_id` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contained_levels`
--

DROP TABLE IF EXISTS `contained_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contained_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `level_group_level_id` int(11) NOT NULL,
  `contained_level_id` int(11) NOT NULL,
  `contained_level_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contained_level_page` int(11) NOT NULL,
  `contained_level_position` int(11) NOT NULL,
  `contained_level_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_contained_levels_on_level_group_level_id` (`level_group_level_id`),
  KEY `index_contained_levels_on_contained_level_id` (`contained_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_districts_on_contact_id` (`contact_id`) USING BTREE,
  KEY `index_districts_on_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts_users`
--

DROP TABLE IF EXISTS `districts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts_users` (
  `user_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  KEY `index_districts_users_on_district_id_and_user_id` (`district_id`,`user_id`) USING BTREE,
  KEY `index_districts_users_on_user_id_and_district_id` (`user_id`,`district_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experiments`
--

DROP TABLE IF EXISTS `experiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `min_user_id` int(11) DEFAULT NULL,
  `max_user_id` int(11) DEFAULT NULL,
  `overflow_max_user_id` int(11) DEFAULT NULL,
  `earliest_section_at` datetime DEFAULT NULL,
  `latest_section_at` datetime DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_experiments_on_section_id` (`section_id`),
  KEY `index_experiments_on_min_user_id` (`min_user_id`),
  KEY `index_experiments_on_max_user_id` (`max_user_id`),
  KEY `index_experiments_on_overflow_max_user_id` (`overflow_max_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facilitators_workshops`
--

DROP TABLE IF EXISTS `facilitators_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilitators_workshops` (
  `workshop_id` int(11) NOT NULL,
  `facilitator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_followers_on_student_user_id` (`student_user_id`) USING BTREE,
  KEY `index_followers_on_section_id_and_student_user_id` (`section_id`,`student_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gallery_activities`
--

DROP TABLE IF EXISTS `gallery_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_level_id` int(11) DEFAULT NULL,
  `level_source_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `autosaved` tinyint(1) DEFAULT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'turtle',
  PRIMARY KEY (`id`),
  KEY `index_gallery_activities_on_app_and_autosaved` (`app`,`autosaved`) USING BTREE,
  KEY `index_gallery_activities_on_level_source_id` (`level_source_id`),
  KEY `index_gallery_activities_on_user_level_id` (`user_level_id`),
  KEY `index_gallery_activities_on_user_id_and_level_source_id` (`user_id`,`level_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_games_on_intro_video_id` (`intro_video_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hint_view_requests`
--

DROP TABLE IF EXISTS `hint_view_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hint_view_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `feedback_type` int(11) DEFAULT NULL,
  `feedback_xml` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hint_view_requests_on_script_id_and_level_id` (`script_id`,`level_id`) USING BTREE,
  KEY `index_hint_view_requests_on_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_rails_a7a0a1e17d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `level_concept_difficulties`
--

DROP TABLE IF EXISTS `level_concept_difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_concept_difficulties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sequencing` int(11) DEFAULT NULL,
  `debugging` int(11) DEFAULT NULL,
  `repeat_loops` int(11) DEFAULT NULL,
  `repeat_until_while` int(11) DEFAULT NULL,
  `for_loops` int(11) DEFAULT NULL,
  `events` int(11) DEFAULT NULL,
  `variables` int(11) DEFAULT NULL,
  `functions` int(11) DEFAULT NULL,
  `functions_with_params` int(11) DEFAULT NULL,
  `conditionals` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_level_concept_difficulties_on_level_id` (`level_id`) USING BTREE,
  CONSTRAINT `fk_rails_a0c952d68b` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2772 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `level_source_images`
--

DROP TABLE IF EXISTS `level_source_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_source_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_source_id` int(11) DEFAULT NULL,
  `image` mediumblob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_level_source_images_on_level_source_id` (`level_source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `level_sources`
--

DROP TABLE IF EXISTS `level_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(20000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_level_sources_on_level_id_and_md5` (`level_id`,`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2277 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `level_sources_multi_types`
--

DROP TABLE IF EXISTS `level_sources_multi_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_sources_multi_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_source_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `md5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_level_sources_multi_types_on_level_source_id` (`level_source_id`),
  KEY `index_level_sources_multi_types_on_level_id` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `level_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ideal_level_source_id` int(11) DEFAULT NULL,
  `solution_level_source_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_levels_on_game_id` (`game_id`) USING BTREE,
  KEY `index_levels_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `levels_script_levels`
--

DROP TABLE IF EXISTS `levels_script_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels_script_levels` (
  `level_id` int(11) NOT NULL,
  `script_level_id` int(11) NOT NULL,
  KEY `index_levels_script_levels_on_level_id` (`level_id`) USING BTREE,
  KEY `index_levels_script_levels_on_script_level_id` (`script_level_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `computed_on` date NOT NULL,
  `computed_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metric_on` date NOT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breakdown` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metric` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `submetric` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paired_user_levels`
--

DROP TABLE IF EXISTS `paired_user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paired_user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_user_level_id` int(11) DEFAULT NULL,
  `navigator_user_level_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_paired_user_levels_on_driver_user_level_id` (`driver_user_level_id`),
  KEY `index_paired_user_levels_on_navigator_user_level_id` (`navigator_user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_accepted_programs`
--

DROP TABLE IF EXISTS `pd_accepted_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_accepted_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `workshop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `teacher_application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_attendances`
--

DROP TABLE IF EXISTS `pd_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pd_session_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `pd_enrollment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pd_attendances_on_pd_session_id_and_teacher_id` (`pd_session_id`,`teacher_id`),
  KEY `index_pd_attendances_on_pd_enrollment_id` (`pd_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_course_facilitators`
--

DROP TABLE IF EXISTS `pd_course_facilitators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_course_facilitators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facilitator_id` int(11) NOT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_course_facilitators_on_course` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_district_payment_terms`
--

DROP TABLE IF EXISTS `pd_district_payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_district_payment_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_district_id` int(11) DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_district_payment_terms_school_district_course` (`school_district_id`,`course`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_enrollment_notifications`
--

DROP TABLE IF EXISTS `pd_enrollment_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_enrollment_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pd_enrollment_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_enrollment_notifications_on_pd_enrollment_id` (`pd_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_enrollments`
--

DROP TABLE IF EXISTS `pd_enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_enrollments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pd_workshop_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `survey_sent_at` datetime DEFAULT NULL,
  `completed_survey_id` int(11) DEFAULT NULL,
  `school_info_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pd_enrollments_on_code` (`code`),
  KEY `index_pd_enrollments_on_pd_workshop_id` (`pd_workshop_id`) USING BTREE,
  KEY `index_pd_enrollments_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_facilitator_program_registrations`
--

DROP TABLE IF EXISTS `pd_facilitator_program_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_facilitator_program_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `form_data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `teachercon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pd_fac_prog_reg_on_user_id_and_teachercon` (`user_id`,`teachercon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_facilitator_teachercon_attendances`
--

DROP TABLE IF EXISTS `pd_facilitator_teachercon_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_facilitator_teachercon_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tc1_arrive` date DEFAULT NULL,
  `tc1_depart` date DEFAULT NULL,
  `fit1_arrive` date DEFAULT NULL,
  `fit1_depart` date DEFAULT NULL,
  `fit1_course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc2_arrive` date DEFAULT NULL,
  `tc2_depart` date DEFAULT NULL,
  `fit2_arrive` date DEFAULT NULL,
  `fit2_depart` date DEFAULT NULL,
  `fit2_course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc3_arrive` date DEFAULT NULL,
  `tc3_depart` date DEFAULT NULL,
  `fit3_arrive` date DEFAULT NULL,
  `fit3_depart` date DEFAULT NULL,
  `fit3_course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_facilitator_teachercon_attendances_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_payment_terms`
--

DROP TABLE IF EXISTS `pd_payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_payment_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regional_partner_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_payment_terms_on_regional_partner_id` (`regional_partner_id`),
  CONSTRAINT `fk_rails_02741f937a` FOREIGN KEY (`regional_partner_id`) REFERENCES `regional_partners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_regional_partner_program_registrations`
--

DROP TABLE IF EXISTS `pd_regional_partner_program_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_regional_partner_program_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `form_data` text COLLATE utf8_unicode_ci,
  `teachercon` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_reg_part_prog_reg_on_user_id_and_teachercon` (`user_id`,`teachercon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_sessions`
--

DROP TABLE IF EXISTS `pd_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pd_workshop_id` int(11) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pd_sessions_on_pd_workshop_id` (`pd_workshop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_teacher_applications`
--

DROP TABLE IF EXISTS `pd_teacher_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_teacher_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `primary_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secondary_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `application` text COLLATE utf8_unicode_ci NOT NULL,
  `regional_partner_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pd_teacher_applications_on_user_id` (`user_id`),
  KEY `index_pd_teacher_applications_on_primary_email` (`primary_email`),
  KEY `index_pd_teacher_applications_on_secondary_email` (`secondary_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_workshop_material_orders`
--

DROP TABLE IF EXISTS `pd_workshop_material_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_workshop_material_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pd_enrollment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_or_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apartment_or_suite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_attempted_at` datetime DEFAULT NULL,
  `ordered_at` datetime DEFAULT NULL,
  `order_response` text COLLATE utf8_unicode_ci,
  `order_error` text COLLATE utf8_unicode_ci,
  `order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_status_last_checked_at` datetime DEFAULT NULL,
  `order_status_changed_at` datetime DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pd_workshop_material_orders_on_pd_enrollment_id` (`pd_enrollment_id`),
  UNIQUE KEY `index_pd_workshop_material_orders_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_workshops`
--

DROP TABLE IF EXISTS `pd_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organizer_id` int(11) NOT NULL,
  `location_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed_location` text COLLATE utf8_unicode_ci,
  `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `section_id` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `regional_partner_id` int(11) DEFAULT NULL,
  `on_map` tinyint(1) DEFAULT NULL COMMENT 'Should this workshop appear on the ''Find a Workshop'' map?',
  `funded` tinyint(1) DEFAULT NULL COMMENT 'Should this workshop''s attendees be reimbursed?',
  PRIMARY KEY (`id`),
  KEY `index_pd_workshops_on_organizer_id` (`organizer_id`) USING BTREE,
  KEY `index_pd_workshops_on_regional_partner_id` (`regional_partner_id`),
  CONSTRAINT `fk_rails_61e51c855f` FOREIGN KEY (`regional_partner_id`) REFERENCES `regional_partners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_workshops_facilitators`
--

DROP TABLE IF EXISTS `pd_workshops_facilitators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_workshops_facilitators` (
  `pd_workshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `index_pd_workshops_facilitators_on_pd_workshop_id` (`pd_workshop_id`) USING BTREE,
  KEY `index_pd_workshops_facilitators_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peer_reviews`
--

DROP TABLE IF EXISTS `peer_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peer_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitter_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `from_instructor` tinyint(1) NOT NULL DEFAULT '0',
  `script_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level_source_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_peer_reviews_on_level_id` (`level_id`) USING BTREE,
  KEY `index_peer_reviews_on_level_source_id` (`level_source_id`) USING BTREE,
  KEY `index_peer_reviews_on_reviewer_id` (`reviewer_id`) USING BTREE,
  KEY `index_peer_reviews_on_script_id` (`script_id`) USING BTREE,
  KEY `index_peer_reviews_on_submitter_id` (`submitter_id`) USING BTREE,
  CONSTRAINT `fk_rails_2c1fb49615` FOREIGN KEY (`script_id`) REFERENCES `scripts` (`id`),
  CONSTRAINT `fk_rails_59ff113f4e` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
  CONSTRAINT `fk_rails_79bf467107` FOREIGN KEY (`submitter_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_89cf1ffcc5` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_afcb8b7aac` FOREIGN KEY (`level_source_id`) REFERENCES `level_sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_course_units`
--

DROP TABLE IF EXISTS `plc_course_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_course_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plc_course_id` int(11) DEFAULT NULL,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `script_id` int(11) DEFAULT NULL,
  `started` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_plc_course_units_on_plc_course_id` (`plc_course_id`) USING BTREE,
  KEY `index_plc_course_units_on_script_id` (`script_id`) USING BTREE,
  CONSTRAINT `fk_rails_05b3c38464` FOREIGN KEY (`script_id`) REFERENCES `scripts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_courses`
--

DROP TABLE IF EXISTS `plc_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_enrollment_module_assignments`
--

DROP TABLE IF EXISTS `plc_enrollment_module_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_enrollment_module_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plc_enrollment_unit_assignment_id` int(11) DEFAULT NULL,
  `plc_learning_module_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_assignment_enrollment_index` (`plc_enrollment_unit_assignment_id`) USING BTREE,
  KEY `module_assignment_lm_index` (`plc_learning_module_id`) USING BTREE,
  KEY `index_plc_enrollment_module_assignments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_enrollment_unit_assignments`
--

DROP TABLE IF EXISTS `plc_enrollment_unit_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_enrollment_unit_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plc_user_course_enrollment_id` int(11) DEFAULT NULL,
  `plc_course_unit_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_unit_assignment_course_unit_index` (`plc_course_unit_id`) USING BTREE,
  KEY `enrollment_unit_assignment_course_enrollment_index` (`plc_user_course_enrollment_id`) USING BTREE,
  KEY `index_plc_enrollment_unit_assignments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_learning_modules`
--

DROP TABLE IF EXISTS `plc_learning_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_learning_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `plc_course_unit_id` int(11) NOT NULL,
  `module_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plc_learning_modules_on_plc_course_unit_id` (`plc_course_unit_id`) USING BTREE,
  KEY `index_plc_learning_modules_on_stage_id` (`stage_id`) USING BTREE,
  CONSTRAINT `fk_rails_ebb473f33b` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_learning_modules_tasks`
--

DROP TABLE IF EXISTS `plc_learning_modules_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_learning_modules_tasks` (
  `plc_learning_module_id` int(11) NOT NULL,
  `plc_task_id` int(11) NOT NULL,
  KEY `index_plc_learning_modules_tasks_on_plc_learning_module_id` (`plc_learning_module_id`) USING BTREE,
  KEY `index_plc_learning_modules_tasks_on_plc_task_id` (`plc_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_tasks`
--

DROP TABLE IF EXISTS `plc_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Plc::Task',
  `properties` text COLLATE utf8_unicode_ci,
  `script_level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plc_tasks_on_script_level_id` (`script_level_id`) USING BTREE,
  CONSTRAINT `fk_rails_539c17b12c` FOREIGN KEY (`script_level_id`) REFERENCES `script_levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plc_user_course_enrollments`
--

DROP TABLE IF EXISTS `plc_user_course_enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plc_user_course_enrollments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plc_course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_plc_user_course_enrollments_on_user_id_and_plc_course_id` (`user_id`,`plc_course_id`) USING BTREE,
  KEY `index_plc_user_course_enrollments_on_plc_course_id` (`plc_course_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prize_providers`
--

DROP TABLE IF EXISTS `prize_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_provider_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prizes_on_prize_provider_id` (`prize_provider_id`) USING BTREE,
  KEY `index_prizes_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puzzle_ratings`
--

DROP TABLE IF EXISTS `puzzle_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puzzle_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_puzzle_ratings_on_user_id_and_script_id_and_level_id` (`user_id`,`script_id`,`level_id`) USING BTREE,
  KEY `index_puzzle_ratings_on_script_id_and_level_id` (`script_id`,`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_partner_program_managers`
--

DROP TABLE IF EXISTS `regional_partner_program_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_partner_program_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_manager_id` int(11) NOT NULL,
  `regional_partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_regional_partner_program_managers_on_program_manager_id` (`program_manager_id`),
  KEY `index_regional_partner_program_managers_on_regional_partner_id` (`regional_partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_partners`
--

DROP TABLE IF EXISTS `regional_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `urban` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_regional_partners_on_name_and_contact_id` (`name`,`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_partners_school_districts`
--

DROP TABLE IF EXISTS `regional_partners_school_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_partners_school_districts` (
  `regional_partner_id` int(11) NOT NULL,
  `school_district_id` int(11) NOT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Course for a given workshop',
  `workshop_days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Days that the workshop will take place',
  KEY `index_regional_partners_school_districts_on_partner_id` (`regional_partner_id`),
  KEY `index_regional_partners_school_districts_on_school_district_id` (`school_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_districts`
--

DROP TABLE IF EXISTS `school_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_school_districts_on_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=7800033 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_infos`
--

DROP TABLE IF EXISTS `school_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_district_id` int(11) DEFAULT NULL,
  `school_district_other` tinyint(1) DEFAULT '0',
  `school_district_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `school_other` tinyint(1) DEFAULT '0',
  `school_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This column appears to be redundant with pd_enrollments.school and users.school, therefore validation rules must be used to ensure that any user or enrollment with a school_info has its school name stored in the correct place.',
  `full_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This column appears to be redundant with users.full_address, therefore validation rules must be used to ensure that any user with a school_info has its school address stored in the correct place.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `validation_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'full',
  PRIMARY KEY (`id`),
  KEY `fk_rails_951bceb7e3` (`school_district_id`),
  KEY `index_school_infos_on_school_id` (`school_id`),
  CONSTRAINT `fk_rails_951bceb7e3` FOREIGN KEY (`school_district_id`) REFERENCES `school_districts` (`id`),
  CONSTRAINT `fk_rails_c96826e231` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` bigint(20) NOT NULL COMMENT 'NCES public school ID',
  `school_district_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `school_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  UNIQUE KEY `index_schools_on_id` (`id`),
  KEY `index_schools_on_school_district_id` (`school_district_id`),
  CONSTRAINT `fk_rails_52efc866e9` FOREIGN KEY (`school_district_id`) REFERENCES `school_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `script_levels`
--

DROP TABLE IF EXISTS `script_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `script_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `script_id` int(11) NOT NULL,
  `chapter` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `assessment` tinyint(1) DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `named_level` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_script_levels_on_script_id` (`script_id`) USING BTREE,
  KEY `index_script_levels_on_stage_id` (`stage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17671 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `wrapup_video_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `login_required` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_scripts_on_name` (`name`) USING BTREE,
  KEY `index_scripts_on_wrapup_video_id` (`wrapup_video_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secret_pictures`
--

DROP TABLE IF EXISTS `secret_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_secret_pictures_on_name` (`name`) USING BTREE,
  UNIQUE KEY `index_secret_pictures_on_path` (`path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secret_words`
--

DROP TABLE IF EXISTS `secret_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_secret_words_on_word` (`word`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `section_hidden_stages`
--

DROP TABLE IF EXISTS `section_hidden_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_hidden_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_section_hidden_stages_on_section_id` (`section_id`),
  KEY `index_section_hidden_stages_on_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `deleted_at` datetime DEFAULT NULL,
  `stage_extras` tinyint(1) NOT NULL DEFAULT '0',
  `section_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sections_on_code` (`code`) USING BTREE,
  KEY `index_sections_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_segments_on_end` (`end`) USING BTREE,
  KEY `index_segments_on_start` (`start`) USING BTREE,
  KEY `index_segments_on_workshop_id` (`workshop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sign_ins`
--

DROP TABLE IF EXISTS `sign_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_ins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sign_in_at` datetime NOT NULL,
  `sign_in_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sign_ins_on_user_id` (`user_id`),
  KEY `index_sign_ins_on_sign_in_at` (`sign_in_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `absolute_position` int(11) DEFAULT NULL,
  `script_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `flex_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lockable` tinyint(1) DEFAULT NULL,
  `relative_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stages_on_script_id` (`script_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studio_people`
--

DROP TABLE IF EXISTS `studio_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_results`
--

DROP TABLE IF EXISTS `survey_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_results_on_kind` (`kind`) USING BTREE,
  KEY `index_survey_results_on_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_rails_7298f2296a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_bonus_prizes`
--

DROP TABLE IF EXISTS `teacher_bonus_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_bonus_prizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_provider_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teacher_bonus_prizes_on_prize_provider_id` (`prize_provider_id`) USING BTREE,
  KEY `index_teacher_bonus_prizes_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_prizes`
--

DROP TABLE IF EXISTS `teacher_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_prizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_provider_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teacher_prizes_on_prize_provider_id` (`prize_provider_id`) USING BTREE,
  KEY `index_teacher_prizes_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_profiles`
--

DROP TABLE IF EXISTS `teacher_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_person_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facilitator` tinyint(1) DEFAULT NULL,
  `teaching` tinyint(1) DEFAULT NULL,
  `pd_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_pd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_teacher_profiles_on_studio_person_id` (`studio_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unexpected_teachers_workshops`
--

DROP TABLE IF EXISTS `unexpected_teachers_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unexpected_teachers_workshops` (
  `workshop_id` int(11) NOT NULL,
  `unexpected_teacher_id` int(11) NOT NULL,
  KEY `index_unexpected_teachers_workshops_on_unexpected_teacher_id` (`unexpected_teacher_id`) USING BTREE,
  KEY `index_unexpected_teachers_workshops_on_workshop_id` (`workshop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_geos`
--

DROP TABLE IF EXISTS `user_geos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_geos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `indexed_at` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_geos_on_user_id` (`user_id`),
  KEY `index_user_geos_on_indexed_at` (`indexed_at`),
  CONSTRAINT `fk_rails_18b1f364bd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `best_result` int(11) DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `level_source_id` int(11) DEFAULT NULL,
  `submitted` tinyint(1) DEFAULT NULL,
  `readonly_answers` tinyint(1) DEFAULT NULL,
  `unlocked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_levels_on_user_id_and_level_id_and_script_id` (`user_id`,`level_id`,`script_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_module_task_assignments`
--

DROP TABLE IF EXISTS `user_module_task_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_module_task_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_enrollment_module_assignment_id` int(11) DEFAULT NULL,
  `professional_learning_task_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_assignment_to_task_index` (`professional_learning_task_id`) USING BTREE,
  KEY `task_assignment_to_module_assignment_index` (`user_enrollment_module_assignment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_permissions_on_user_id_and_permission` (`user_id`,`permission`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_proficiencies`
--

DROP TABLE IF EXISTS `user_proficiencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_proficiencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_progress_at` datetime DEFAULT NULL,
  `sequencing_d1_count` int(11) DEFAULT '0',
  `sequencing_d2_count` int(11) DEFAULT '0',
  `sequencing_d3_count` int(11) DEFAULT '0',
  `sequencing_d4_count` int(11) DEFAULT '0',
  `sequencing_d5_count` int(11) DEFAULT '0',
  `debugging_d1_count` int(11) DEFAULT '0',
  `debugging_d2_count` int(11) DEFAULT '0',
  `debugging_d3_count` int(11) DEFAULT '0',
  `debugging_d4_count` int(11) DEFAULT '0',
  `debugging_d5_count` int(11) DEFAULT '0',
  `repeat_loops_d1_count` int(11) DEFAULT '0',
  `repeat_loops_d2_count` int(11) DEFAULT '0',
  `repeat_loops_d3_count` int(11) DEFAULT '0',
  `repeat_loops_d4_count` int(11) DEFAULT '0',
  `repeat_loops_d5_count` int(11) DEFAULT '0',
  `repeat_until_while_d1_count` int(11) DEFAULT '0',
  `repeat_until_while_d2_count` int(11) DEFAULT '0',
  `repeat_until_while_d3_count` int(11) DEFAULT '0',
  `repeat_until_while_d4_count` int(11) DEFAULT '0',
  `repeat_until_while_d5_count` int(11) DEFAULT '0',
  `for_loops_d1_count` int(11) DEFAULT '0',
  `for_loops_d2_count` int(11) DEFAULT '0',
  `for_loops_d3_count` int(11) DEFAULT '0',
  `for_loops_d4_count` int(11) DEFAULT '0',
  `for_loops_d5_count` int(11) DEFAULT '0',
  `events_d1_count` int(11) DEFAULT '0',
  `events_d2_count` int(11) DEFAULT '0',
  `events_d3_count` int(11) DEFAULT '0',
  `events_d4_count` int(11) DEFAULT '0',
  `events_d5_count` int(11) DEFAULT '0',
  `variables_d1_count` int(11) DEFAULT '0',
  `variables_d2_count` int(11) DEFAULT '0',
  `variables_d3_count` int(11) DEFAULT '0',
  `variables_d4_count` int(11) DEFAULT '0',
  `variables_d5_count` int(11) DEFAULT '0',
  `functions_d1_count` int(11) DEFAULT '0',
  `functions_d2_count` int(11) DEFAULT '0',
  `functions_d3_count` int(11) DEFAULT '0',
  `functions_d4_count` int(11) DEFAULT '0',
  `functions_d5_count` int(11) DEFAULT '0',
  `functions_with_params_d1_count` int(11) DEFAULT '0',
  `functions_with_params_d2_count` int(11) DEFAULT '0',
  `functions_with_params_d3_count` int(11) DEFAULT '0',
  `functions_with_params_d4_count` int(11) DEFAULT '0',
  `functions_with_params_d5_count` int(11) DEFAULT '0',
  `conditionals_d1_count` int(11) DEFAULT '0',
  `conditionals_d2_count` int(11) DEFAULT '0',
  `conditionals_d3_count` int(11) DEFAULT '0',
  `conditionals_d4_count` int(11) DEFAULT '0',
  `conditionals_d5_count` int(11) DEFAULT '0',
  `basic_proficiency_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_proficiencies_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_d11e94e769` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_scripts`
--

DROP TABLE IF EXISTS `user_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `script_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `assigned_at` datetime DEFAULT NULL,
  `last_progress_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_scripts_on_user_id_and_script_id` (`user_id`,`script_id`) USING BTREE,
  KEY `index_user_scripts_on_script_id` (`script_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_person_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en-US',
  `birthday` date DEFAULT NULL,
  `user_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_address` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_info_id` int(11) DEFAULT NULL,
  `total_lines` int(11) NOT NULL DEFAULT '0',
  `prize_earned` tinyint(1) DEFAULT '0',
  `prize_id` int(11) DEFAULT NULL,
  `teacher_prize_earned` tinyint(1) DEFAULT '0',
  `teacher_prize_id` int(11) DEFAULT NULL,
  `teacher_bonus_prize_earned` tinyint(1) DEFAULT '0',
  `teacher_bonus_prize_id` int(11) DEFAULT NULL,
  `prize_teacher_id` int(11) DEFAULT NULL,
  `secret_picture_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hashed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `secret_words` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci,
  `invitation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invitation_created_at` datetime DEFAULT NULL,
  `invitation_sent_at` datetime DEFAULT NULL,
  `invitation_accepted_at` datetime DEFAULT NULL,
  `invitation_limit` int(11) DEFAULT NULL,
  `invited_by_id` int(11) DEFAULT NULL,
  `invited_by_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invitations_count` int(11) DEFAULT '0',
  `terms_of_service_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_invitation_token` (`invitation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_prize_id_and_deleted_at` (`prize_id`,`deleted_at`) USING BTREE,
  UNIQUE KEY `index_users_on_provider_and_uid_and_deleted_at` (`provider`,`uid`,`deleted_at`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token_and_deleted_at` (`reset_password_token`,`deleted_at`) USING BTREE,
  UNIQUE KEY `index_users_on_teacher_bonus_prize_id_and_deleted_at` (`teacher_bonus_prize_id`,`deleted_at`) USING BTREE,
  UNIQUE KEY `index_users_on_teacher_prize_id_and_deleted_at` (`teacher_prize_id`,`deleted_at`) USING BTREE,
  UNIQUE KEY `index_users_on_username_and_deleted_at` (`username`,`deleted_at`) USING BTREE,
  KEY `index_users_on_email_and_deleted_at` (`email`,`deleted_at`) USING BTREE,
  KEY `index_users_on_hashed_email_and_deleted_at` (`hashed_email`,`deleted_at`) USING BTREE,
  KEY `index_users_on_invitations_count` (`invitations_count`) USING BTREE,
  KEY `index_users_on_invited_by_id` (`invited_by_id`) USING BTREE,
  KEY `index_users_on_studio_person_id` (`studio_person_id`),
  KEY `index_users_on_birthday` (`birthday`),
  KEY `index_users_on_school_info_id` (`school_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `download` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workshop_attendance`
--

DROP TABLE IF EXISTS `workshop_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `segment_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_workshop_attendance_on_segment_id` (`segment_id`) USING BTREE,
  KEY `index_workshop_attendance_on_teacher_id` (`teacher_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workshop_cohorts`
--

DROP TABLE IF EXISTS `workshop_cohorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_cohorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workshops`
--

DROP TABLE IF EXISTS `workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workshops_on_name` (`name`) USING BTREE,
  KEY `index_workshops_on_program_type` (`program_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'dashboard_development'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 12:25:32
INSERT INTO schema_migrations (version) VALUES
('20130805234034'),
('20130806164104'),
('20130807003020'),
('20130807003353'),
('20130807003420'),
('20130809171623'),
('20130812211107'),
('20130814220316'),
('20130819225704'),
('20130820000039'),
('20130821224522'),
('20130829173755'),
('20130905172548'),
('20130910211350'),
('20130916185149'),
('20130916211033'),
('20130918175553'),
('20130923191413'),
('20130923221027'),
('20130925002516'),
('20130926002241'),
('20130926160659'),
('20130926175258'),
('20131001000034'),
('20131001212524'),
('20131003234949'),
('20131011162818'),
('20131012033115'),
('20131017184341'),
('20131023191746'),
('20131024160434'),
('20131028173738'),
('20131028214911'),
('20131028230240'),
('20131028232222'),
('20131029225428'),
('20131029230227'),
('20131029233853'),
('20131107193049'),
('20131113000531'),
('20131113200812'),
('20131113210752'),
('20131113213733'),
('20131113213947'),
('20131113214500'),
('20131204191708'),
('20131206164614'),
('20131212190308'),
('20131213225940'),
('20131220021230'),
('20140114221932'),
('20140123194957'),
('20140124190423'),
('20140128224947'),
('20140205192227'),
('20140205220657'),
('20140212235319'),
('20140213193759'),
('20140213224051'),
('20140214162623'),
('20140217213747'),
('20140221220547'),
('20140303212153'),
('20140303235248'),
('20140311174509'),
('20140313200618'),
('20140313204247'),
('20140314184624'),
('20140317181138'),
('20140319211127'),
('20140321234151'),
('20140326010029'),
('20140327210419'),
('20140401010539'),
('20140401200822'),
('20140402181900'),
('20140403001037'),
('20140403195643'),
('20140403195709'),
('20140403195947'),
('20140404171120'),
('20140404172409'),
('20140408202946'),
('20140418194705'),
('20140424172830'),
('20140425004033'),
('20140428224457'),
('20140430005159'),
('20140505181834'),
('20140505193822'),
('20140508232012'),
('20140515184041'),
('20140515223058'),
('20140530211735'),
('20140604004005'),
('20140604221441'),
('20140611195616'),
('20140616231428'),
('20140617004257'),
('20140617004611'),
('20140617175147'),
('20140624194226'),
('20140624203113'),
('20140701110702'),
('20140701110734'),
('20140701111104'),
('20140716003220'),
('20140716003232'),
('20140716205716'),
('20140724174000'),
('20140724174011'),
('20140725174937'),
('20140801164511'),
('20140807225726'),
('20140811094030'),
('20140815005249'),
('20140815210045'),
('20140826161349'),
('20140826173434'),
('20140902190725'),
('20140917171128'),
('20140923193912'),
('20141003211241'),
('20141014222914'),
('20141016193651'),
('20141017173937'),
('20141017233919'),
('20141119223233'),
('20141124180534'),
('20141204030319'),
('20141204214536'),
('20150105225416'),
('20150108195830'),
('20150128022616'),
('20150206010844'),
('20150206025555'),
('20150206185854'),
('20150206192655'),
('20150210190212'),
('20150303201527'),
('20150303220711'),
('20150305214953'),
('20150306000000'),
('20150312000253'),
('20150313155049'),
('20150323201349'),
('20150331173141'),
('20150406193626'),
('20150414173537'),
('20150416231806'),
('20150423215833'),
('20150423215834'),
('20150429215735'),
('20150507195442'),
('20150521231522'),
('20150527001533'),
('20150529230732'),
('20150713220709'),
('20150724232749'),
('20150727190540'),
('20150730233042'),
('20150804174622'),
('20150804213021'),
('20151013224202'),
('20151022174100'),
('20151118184650'),
('20151124014528'),
('20151207223210'),
('20160118192602'),
('20160130084049'),
('20160205205103'),
('20160208215234'),
('20160208215258'),
('20160208215354'),
('20160208215424'),
('20160208215641'),
('20160208215727'),
('20160210194205'),
('20160217231723'),
('20160217231759'),
('20160217232135'),
('20160217232559'),
('20160217232651'),
('20160217232904'),
('20160218230143'),
('20160218230254'),
('20160219013831'),
('20160223214912'),
('20160225192540'),
('20160301213220'),
('20160310003314'),
('20160315195700'),
('20160315215912'),
('20160324173226'),
('20160325004717'),
('20160326070943'),
('20160404233038'),
('20160406004158'),
('20160406190753'),
('20160407173756'),
('20160408183812'),
('20160408190000'),
('20160411090000'),
('20160413225640'),
('20160415003613'),
('20160418185704'),
('20160426210000'),
('20160427181822'),
('20160428020044'),
('20160502025309'),
('20160502025310'),
('20160502025400'),
('20160502025401'),
('20160502025402'),
('20160503010123'),
('20160504000000'),
('20160504205902'),
('20160505010203'),
('20160509143719'),
('20160509202648'),
('20160509222318'),
('20160510000000'),
('20160510210339'),
('20160511000000'),
('20160511224350'),
('20160512220646'),
('20160512224559'),
('20160517131521'),
('20160517163154'),
('20160517220519'),
('20160519000515'),
('20160526000000'),
('20160527181440'),
('20160603144608'),
('20160603181349'),
('20160606154934'),
('20160606183120'),
('20160608000000'),
('20160609211248'),
('20160614000000'),
('20160617163547'),
('20160621213729'),
('20160630000000'),
('20160630000001'),
('20160706041025'),
('20160706173136'),
('20160707171413'),
('20160713190603'),
('20160715015742'),
('20160721221335'),
('20160726015145'),
('20160804153118'),
('20160805190505'),
('20160812010138'),
('20160815010139'),
('20160818190145'),
('20160818232419'),
('20160818234153'),
('20160824002113'),
('20160830235908'),
('20160831010327'),
('20160901180359'),
('20160912174004'),
('20160913212311'),
('20160913230138'),
('20160929123700'),
('20161003202755'),
('20161003232500'),
('20161007172920'),
('20161011013910'),
('20161012121318'),
('20161015135354'),
('20161021202609'),
('20161024154201'),
('20161024164952'),
('20161024200011'),
('20161103222851'),
('20161103222852'),
('20161104075248'),
('20161108095700'),
('20161109165252'),
('20161109195217'),
('20161112200033'),
('20161114020106'),
('20161212222541'),
('20161213212403'),
('20161213221222'),
('20161214163958'),
('20161214190338'),
('20170103162230'),
('20170103164735'),
('20170103170401'),
('20170110003303'),
('20170112235804'),
('20170117185757'),
('20170118223108'),
('20170126175815'),
('20170131165950'),
('20170201010203'),
('20170202090015'),
('20170206173655'),
('20170207004002'),
('20170209010013'),
('20170210150621'),
('20170214161503'),
('20170215003000'),
('20170215183924'),
('20170221004101'),
('20170222192220'),
('20170224150102'),
('20170306220504'),
('20170306221423'),
('20170306221907'),
('20170307020200'),
('20170307160737'),
('20170307224649'),
('20170307232707'),
('20170308012502'),
('20170320174048'),
('20170324200221'),
('20170330214255'),
('20170331235243'),
('20170403224005'),
('20170404194722'),
('20170406215340'),
('20170407201709'),
('20170410181336'),
('20170410203353'),
('20170410231011'),
('20170412065832'),
('20170413183424'),
('20170413194726'),
('20170414010203'),
('20170417182609'),
('20170418193132'),
('20170421012552'),
('20170424010203'),
('20170426001230');


