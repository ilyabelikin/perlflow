-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Wed Oct 15 13:38:59 2008
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `users`;
--
-- Table: `users`
--
CREATE TABLE `users` (
  `url` varchar(255) NOT NULL,
  `display` varchar(255) NOT NULL,
  PRIMARY KEY (`display`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `user_roles`;
--
-- Table: `user_roles`
--
CREATE TABLE `user_roles` (
  `user_id` integer NOT NULL,
  `role` varchar(50) NOT NULL,
  INDEX (`user_id`),
  PRIMARY KEY (`user_id`, `role`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`display`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

SET foreign_key_checks=1;

