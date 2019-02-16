-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`company` ;

CREATE TABLE IF NOT EXISTS `mydb`.`company` (
  `id` INT NOT NULL,
  `company` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`contact_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`contact_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(60) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`province` ;

CREATE TABLE IF NOT EXISTS `mydb`.`province` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `province` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`district` ;

CREATE TABLE IF NOT EXISTS `mydb`.`district` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `district` VARCHAR(255) NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_district_province1_idx` (`province_id` ASC) VISIBLE,
  CONSTRAINT `fk_district_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `mydb`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`electorate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`electorate` ;

CREATE TABLE IF NOT EXISTS `mydb`.`electorate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `electorate` VARCHAR(255) NULL,
  `district_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_electorate_district1_idx` (`district_id` ASC) VISIBLE,
  CONSTRAINT `fk_electorate_district1`
    FOREIGN KEY (`district_id`)
    REFERENCES `mydb`.`district` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`profile` ;

CREATE TABLE IF NOT EXISTS `mydb`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `NIC` VARCHAR(100) NULL,
  `address` VARCHAR(255) NULL,
  `email` VARCHAR(150) NULL,
  `birthday` DATE NULL,
  `company_id` INT NOT NULL,
  `contact_type_id` INT NOT NULL,
  `electorate_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_company1_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_profile_contact_type1_idx` (`contact_type_id` ASC) VISIBLE,
  INDEX `fk_profile_electorate1_idx` (`electorate_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_contact_type1`
    FOREIGN KEY (`contact_type_id`)
    REFERENCES `mydb`.`contact_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_electorate1`
    FOREIGN KEY (`electorate_id`)
    REFERENCES `mydb`.`electorate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`number_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`number_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`number_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contact_number`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`contact_number` ;

CREATE TABLE IF NOT EXISTS `mydb`.`contact_number` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) NULL,
  `number_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_phone_number_number_type1_idx` (`number_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_number_number_type1`
    FOREIGN KEY (`number_type_id`)
    REFERENCES `mydb`.`number_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`meeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`meeting` ;

CREATE TABLE IF NOT EXISTS `mydb`.`meeting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `refno` VARCHAR(100) NULL,
  `date` DATE NULL,
  `appointment_time` TIMESTAMP NULL,
  `arrival_time` TIMESTAMP NULL,
  `reason` VARCHAR(255) NULL,
  `visitors_count` INT NULL,
  `added_sys` TINYINT(1) NULL COMMENT 'Pending entry or not, if all the data has been entered, it\'s true',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`visitor_has_meeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`visitor_has_meeting` ;

CREATE TABLE IF NOT EXISTS `mydb`.`visitor_has_meeting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `visitor_id` INT NOT NULL,
  `meeting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_visitor_has_meeting_visitor1_idx` (`visitor_id` ASC) VISIBLE,
  INDEX `fk_visitor_has_meeting_meeting1_idx` (`meeting_id` ASC) VISIBLE,
  CONSTRAINT `fk_visitor_has_meeting_visitor1`
    FOREIGN KEY (`visitor_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visitor_has_meeting_meeting1`
    FOREIGN KEY (`meeting_id`)
    REFERENCES `mydb`.`meeting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`publisher_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`publisher_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`publisher_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NULL COMMENT 'newspaper, TV , radio ... etc',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`language` ;

CREATE TABLE IF NOT EXISTS `mydb`.`language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(60) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`publisher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`publisher` (
  `id` INT NOT NULL,
  `publisher` VARCHAR(150) NULL COMMENT 'Company name',
  `publisher_type_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_publisher_publisher_type1_idx` (`publisher_type_id` ASC) VISIBLE,
  INDEX `fk_publisher_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_publisher_publisher_type1`
    FOREIGN KEY (`publisher_type_id`)
    REFERENCES `mydb`.`publisher_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publisher_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `mydb`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`news` ;

CREATE TABLE IF NOT EXISTS `mydb`.`news` (
  `id` INT NOT NULL,
  `positive` TINYINT(1) NULL,
  `direct` TINYINT(1) NULL,
  `no_of_posts` INT NULL,
  `publisher_id` INT NOT NULL,
  `date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_news_publisher1_idx` (`publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_news_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`correspondance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`correspondance` ;

CREATE TABLE IF NOT EXISTS `mydb`.`correspondance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reference_no` VARCHAR(100) NULL,
  `sent` TINYINT(1) NULL COMMENT 'inbox da sentbox da ?',
  `subject` VARCHAR(255) NULL,
  `regarding` VARCHAR(255) NULL,
  `receiver_from` INT NOT NULL,
  `date` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_correspondance_profile1_idx` (`receiver_from` ASC) VISIBLE,
  CONSTRAINT `fk_correspondance_profile1`
    FOREIGN KEY (`receiver_from`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `NIC` VARCHAR(45) NULL,
  `name` VARCHAR(150) NULL,
  `birthday` DATE NULL,
  `password` VARCHAR(150) NULL,
  `email` VARCHAR(150) NULL,
  `referred` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`privileges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`privileges` ;

CREATE TABLE IF NOT EXISTS `mydb`.`privileges` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `privilege` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`activity_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`activity_log` ;

CREATE TABLE IF NOT EXISTS `mydb`.`activity_log` (
  `id` INT NOT NULL,
  `log` VARCHAR(200) NULL,
  `users_id` INT NOT NULL,
  `time` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_server_log_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_server_log_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profile_has_correspondance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`profile_has_correspondance` ;

CREATE TABLE IF NOT EXISTS `mydb`.`profile_has_correspondance` (
  `profile_id` INT NOT NULL,
  `correspondance_id` INT NOT NULL,
  INDEX `fk_profile_has_correspondance_profile1_idx` (`profile_id` ASC) VISIBLE,
  INDEX `fk_profile_has_correspondance_correspondance1_idx` (`correspondance_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_correspondance_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_has_correspondance_correspondance1`
    FOREIGN KEY (`correspondance_id`)
    REFERENCES `mydb`.`correspondance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cc` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `correspondance_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cc_correspondance1_idx` (`correspondance_id` ASC) VISIBLE,
  INDEX `fk_cc_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_cc_correspondance1`
    FOREIGN KEY (`correspondance_id`)
    REFERENCES `mydb`.`correspondance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cc_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_privileges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_has_privileges` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_has_privileges` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `privileges_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_privileges_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_user_has_privileges_privileges1_idx` (`privileges_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_privileges_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_privileges_privileges1`
    FOREIGN KEY (`privileges_id`)
    REFERENCES `mydb`.`privileges` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consultant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`consultant` ;

CREATE TABLE IF NOT EXISTS `mydb`.`consultant` (
  `idcondsultant` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `speciality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcondsultant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`meeting_has_consultants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`meeting_has_consultants` ;

CREATE TABLE IF NOT EXISTS `mydb`.`meeting_has_consultants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `consultant_idcondsultant` INT NOT NULL,
  `meeting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meeting_has_consultants_consultant1_idx` (`consultant_idcondsultant` ASC) VISIBLE,
  INDEX `fk_meeting_has_consultants_meeting1_idx` (`meeting_id` ASC) VISIBLE,
  CONSTRAINT `fk_meeting_has_consultants_consultant1`
    FOREIGN KEY (`consultant_idcondsultant`)
    REFERENCES `mydb`.`consultant` (`idcondsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meeting_has_consultants_meeting1`
    FOREIGN KEY (`meeting_id`)
    REFERENCES `mydb`.`meeting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cl_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cl_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cl_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`check_list` ;

CREATE TABLE IF NOT EXISTS `mydb`.`check_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `note` VARCHAR(255) NULL,
  `date_created` DATE NULL,
  `cl_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_list_cl_type1_idx` (`cl_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_list_cl_type1`
    FOREIGN KEY (`cl_type_id`)
    REFERENCES `mydb`.`cl_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`component` ;

CREATE TABLE IF NOT EXISTS `mydb`.`component` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `component` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check_list_column`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`check_list_column` ;

CREATE TABLE IF NOT EXISTS `mydb`.`check_list_column` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `column` VARCHAR(200) NULL,
  `check_list_id` INT NOT NULL,
  `component_id` INT NOT NULL,
  `order` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_list_column_check_list1_idx` (`check_list_id` ASC) VISIBLE,
  INDEX `fk_check_list_column_component1_idx` (`component_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_list_column_check_list1`
    FOREIGN KEY (`check_list_id`)
    REFERENCES `mydb`.`check_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_list_column_component1`
    FOREIGN KEY (`component_id`)
    REFERENCES `mydb`.`component` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check_list_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`check_list_data` ;

CREATE TABLE IF NOT EXISTS `mydb`.`check_list_data` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_list_column_id` INT NOT NULL,
  `data` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_list_data_check_list_column1_idx` (`check_list_column_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_list_data_check_list_column1`
    FOREIGN KEY (`check_list_column_id`)
    REFERENCES `mydb`.`check_list_column` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`check_list_has_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`check_list_has_users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`check_list_has_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_list_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `admin` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_list_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_check_list_has_users_check_list1_idx` (`check_list_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_list_has_users_check_list1`
    FOREIGN KEY (`check_list_id`)
    REFERENCES `mydb`.`check_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_list_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`respon_ppl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`respon_ppl` ;

CREATE TABLE IF NOT EXISTS `mydb`.`respon_ppl` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `check_list_data_id` INT NOT NULL,
  `check_list_has_users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_check_list_data_has_check_list_has_users_check_list_has__idx` (`check_list_has_users_id` ASC) VISIBLE,
  INDEX `fk_check_list_data_has_check_list_has_users_check_list_data_idx` (`check_list_data_id` ASC) VISIBLE,
  CONSTRAINT `fk_check_list_data_has_check_list_has_users_check_list_data1`
    FOREIGN KEY (`check_list_data_id`)
    REFERENCES `mydb`.`check_list_data` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_list_data_has_check_list_has_users_check_list_has_us1`
    FOREIGN KEY (`check_list_has_users_id`)
    REFERENCES `mydb`.`check_list_has_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`member_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`member_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`member_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JSS_members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`JSS_members` ;

CREATE TABLE IF NOT EXISTS `mydb`.`JSS_members` (
  `id` INT NOT NULL,
  `membership_id` VARCHAR(255) NULL,
  `profile_id` INT NOT NULL,
  `member_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_JSS_members_profile1_idx` (`profile_id` ASC) VISIBLE,
  INDEX `fk_JSS_members_member_type1_idx` (`member_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_JSS_members_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JSS_members_member_type1`
    FOREIGN KEY (`member_type_id`)
    REFERENCES `mydb`.`member_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Problems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Problems` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Problems` (
  `id` INT NOT NULL,
  `Problem` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JSS_members_has_Problems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`JSS_members_has_Problems` ;

CREATE TABLE IF NOT EXISTS `mydb`.`JSS_members_has_Problems` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `JSS_members_id` INT NOT NULL,
  `Problems_id` INT NOT NULL,
  INDEX `fk_JSS_members_has_Problems_Problems1_idx` (`Problems_id` ASC) VISIBLE,
  INDEX `fk_JSS_members_has_Problems_JSS_members1_idx` (`JSS_members_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_JSS_members_has_Problems_JSS_members1`
    FOREIGN KEY (`JSS_members_id`)
    REFERENCES `mydb`.`JSS_members` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JSS_members_has_Problems_Problems1`
    FOREIGN KEY (`Problems_id`)
    REFERENCES `mydb`.`Problems` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`combo_val`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`combo_val` ;

CREATE TABLE IF NOT EXISTS `mydb`.`combo_val` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(255) NULL,
  `check_list_column_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_combo_val_check_list_column1_idx` (`check_list_column_id` ASC) VISIBLE,
  CONSTRAINT `fk_combo_val_check_list_column1`
    FOREIGN KEY (`check_list_column_id`)
    REFERENCES `mydb`.`check_list_column` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transfer_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`transfer_log` ;

CREATE TABLE IF NOT EXISTS `mydb`.`transfer_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `from` INT NOT NULL,
  `to` INT NOT NULL,
  `JSS_members_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transfer_log_company1_idx` (`from` ASC) VISIBLE,
  INDEX `fk_transfer_log_company2_idx` (`to` ASC) VISIBLE,
  INDEX `fk_transfer_log_JSS_members1_idx` (`JSS_members_id` ASC) VISIBLE,
  CONSTRAINT `fk_transfer_log_company1`
    FOREIGN KEY (`from`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_log_company2`
    FOREIGN KEY (`to`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_log_JSS_members1`
    FOREIGN KEY (`JSS_members_id`)
    REFERENCES `mydb`.`JSS_members` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`archive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`archive` ;

CREATE TABLE IF NOT EXISTS `mydb`.`archive` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `JSS_members_id` INT NOT NULL,
  `check_list_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_JSS_members_has_check_list_check_list1_idx` (`check_list_id` ASC) VISIBLE,
  INDEX `fk_JSS_members_has_check_list_JSS_members1_idx` (`JSS_members_id` ASC) VISIBLE,
  CONSTRAINT `fk_JSS_members_has_check_list_JSS_members1`
    FOREIGN KEY (`JSS_members_id`)
    REFERENCES `mydb`.`JSS_members` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JSS_members_has_check_list_check_list1`
    FOREIGN KEY (`check_list_id`)
    REFERENCES `mydb`.`check_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`events` ;

CREATE TABLE IF NOT EXISTS `mydb`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event` VARCHAR(255) NULL,
  `start_time` TIMESTAMP NULL,
  `end_time` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dead_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`dead_line` ;

CREATE TABLE IF NOT EXISTS `mydb`.`dead_line` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dead_line` DATE NULL,
  `check_list_column_id` INT NOT NULL,
  `check_list_data_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dead_line_check_list_column1_idx` (`check_list_column_id` ASC) VISIBLE,
  INDEX `fk_dead_line_check_list_data1_idx` (`check_list_data_id` ASC) VISIBLE,
  CONSTRAINT `fk_dead_line_check_list_column1`
    FOREIGN KEY (`check_list_column_id`)
    REFERENCES `mydb`.`check_list_column` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dead_line_check_list_data1`
    FOREIGN KEY (`check_list_data_id`)
    REFERENCES `mydb`.`check_list_data` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shared_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`shared_events` ;

CREATE TABLE IF NOT EXISTS `mydb`.`shared_events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `events_id` INT NOT NULL,
  `hosted` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_events_has_users_events1_idx` (`events_id` ASC) VISIBLE,
  CONSTRAINT `fk_events_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_users_events1`
    FOREIGN KEY (`events_id`)
    REFERENCES `mydb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`secretary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`secretary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`secretary` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `secretary` INT NOT NULL,
  `boss` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_secretary_users1_idx` (`secretary` ASC) VISIBLE,
  INDEX `fk_secretary_users2_idx` (`boss` ASC) VISIBLE,
  CONSTRAINT `fk_secretary_users1`
    FOREIGN KEY (`secretary`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_secretary_users2`
    FOREIGN KEY (`boss`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`repeat_by`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`repeat_by` ;

CREATE TABLE IF NOT EXISTS `mydb`.`repeat_by` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `period` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`repeat_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`repeat_events` ;

CREATE TABLE IF NOT EXISTS `mydb`.`repeat_events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `events_id` INT NOT NULL,
  `how_long` INT NULL,
  `repeat_by_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_has_repeat_events1_idx` (`events_id` ASC) VISIBLE,
  INDEX `fk_events_has_repeat_repeat_by1_idx` (`repeat_by_id` ASC) VISIBLE,
  CONSTRAINT `fk_events_has_repeat_events1`
    FOREIGN KEY (`events_id`)
    REFERENCES `mydb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_repeat_repeat_by1`
    FOREIGN KEY (`repeat_by_id`)
    REFERENCES `mydb`.`repeat_by` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`company_has_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`company_has_address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`company_has_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  INDEX `fk_company_has_address_address1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_company_has_address_company1_idx` (`company_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_company_has_address_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_has_address_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profile_has_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`profile_has_address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`profile_has_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_has_address_address1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_profile_has_address_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_address_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_has_address_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`relation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `relation` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`family` ;

CREATE TABLE IF NOT EXISTS `mydb`.`family` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id1` INT NOT NULL,
  `profile_id2` INT NOT NULL,
  `relation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_family_profile1_idx` (`profile_id2` ASC) VISIBLE,
  INDEX `fk_family_profile2_idx` (`profile_id1` ASC) VISIBLE,
  INDEX `fk_family_relation1_idx` (`relation_id` ASC) VISIBLE,
  CONSTRAINT `fk_family_profile1`
    FOREIGN KEY (`profile_id2`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_profile2`
    FOREIGN KEY (`profile_id1`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_family_relation1`
    FOREIGN KEY (`relation_id`)
    REFERENCES `mydb`.`relation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`company_has_contact_number`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`company_has_contact_number` ;

CREATE TABLE IF NOT EXISTS `mydb`.`company_has_contact_number` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NOT NULL,
  `contact_number_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_has_contact_number_contact_number1_idx` (`contact_number_id` ASC) VISIBLE,
  INDEX `fk_company_has_contact_number_company1_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_company_has_contact_number_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_has_contact_number_contact_number1`
    FOREIGN KEY (`contact_number_id`)
    REFERENCES `mydb`.`contact_number` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profile_has_contact_number`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`profile_has_contact_number` ;

CREATE TABLE IF NOT EXISTS `mydb`.`profile_has_contact_number` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `contact_number_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_has_contact_number_contact_number1_idx` (`contact_number_id` ASC) VISIBLE,
  INDEX `fk_profile_has_contact_number_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_contact_number_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_has_contact_number_contact_number1`
    FOREIGN KEY (`contact_number_id`)
    REFERENCES `mydb`.`contact_number` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qualifications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`qualifications` ;

CREATE TABLE IF NOT EXISTS `mydb`.`qualifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `OL` TINYINT(1) NULL,
  `AL` TINYINT(1) NULL,
  `graduate` TINYINT(1) NULL,
  `masters` TINYINT(1) NULL,
  `PhD` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`subject` ;

CREATE TABLE IF NOT EXISTS `mydb`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(100) NULL,
  `qualifications_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subject_qualifications1_idx` (`qualifications_id` ASC) VISIBLE,
  CONSTRAINT `fk_subject_qualifications1`
    FOREIGN KEY (`qualifications_id`)
    REFERENCES `mydb`.`qualifications` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`result`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`result` ;

CREATE TABLE IF NOT EXISTS `mydb`.`result` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `result` VARCHAR(95) NULL,
  `subject_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_result_subject1_idx` (`subject_id` ASC) VISIBLE,
  INDEX `fk_result_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_result_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `mydb`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_result_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `mydb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`al_scheme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`al_scheme` ;

CREATE TABLE IF NOT EXISTS `mydb`.`al_scheme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `scheme` VARCHAR(150) NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_scheme_subject1_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_scheme_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `mydb`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`events_has_meeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`events_has_meeting` ;

CREATE TABLE IF NOT EXISTS `mydb`.`events_has_meeting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `events_id` INT NOT NULL,
  `visitor_has_meeting_id` INT NOT NULL,
  INDEX `fk_events_has_visitor_has_meeting_visitor_has_meeting1_idx` (`visitor_has_meeting_id` ASC) VISIBLE,
  INDEX `fk_events_has_visitor_has_meeting_events1_idx` (`events_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_events_has_visitor_has_meeting_events1`
    FOREIGN KEY (`events_id`)
    REFERENCES `mydb`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_visitor_has_meeting_visitor_has_meeting1`
    FOREIGN KEY (`visitor_has_meeting_id`)
    REFERENCES `mydb`.`visitor_has_meeting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
