-- Last updated for OpenCAD 0.2.6

CREATE TABLE IF NOT EXISTS `<DBPREFIX>citation_types` (
    `citation_id` INT(11)  AUTO_INCREMENT,
    `citation_description` VARCHAR(255) COMMENT 'Description of an often issued citation.',
    `citation_fine` DECIMAL(19, 2) COMMENT 'Reccomended fine for given citation.',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;



CREATE TABLE IF NOT EXISTS `<DBPREFIX>incident_types` (
    `id` INT(11) AUTO_INCREMENT,
    `code_id` VARCHAR(255) DEFAULT 'Radio code for given incident type.',
    `code_name` VARCHAR(255) COMMENT 'Name or description of incident.',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;



CREATE TABLE IF NOT EXISTS `<DBPREFIX>radio_codes` (
    `id` INT(11) AUTO_INCREMENT,
    `code` VARCHAR(10) COMMENT 'Radio code for statuses.',
    `code_description` VARCHAR(255) COMMENT 'Descriptio of status code.',
    `onCall` INT(11) COMMENT 'Execute onCall to clear unit from a call.',
    PRIMARY KEY(`id`),
    UNIQUE KEY `code`(`code`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;



CREATE TABLE IF NOT EXISTS `<DBPREFIX>warning_types` (
    `id` INT(11)  AUTO_INCREMENT,
    `warning_description` VARCHAR(255),
    `citation_fine` DECIMAL(19, 2) COMMENT 'Description of a frequently used warning type.',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;



CREATE TABLE IF NOT EXISTS `<DBPREFIX>warrant_types` (
    `id` INT(11) AUTO_INCREMENT,
    `warrant_type` VARCHAR(255) COMMENT 'Violent/Non-Violent.',
    `warrant_description` VARCHAR(255) COMMENT 'Description of a frequently used warrant type.',
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `dl_Issued_by` `dl_Issued_by` set('Government', 'Military') COLLATE 'latin1_swedish_ci' NULL AFTER `dl_class`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `dl_type` `dl_type` set('Not Issued','Learners','Provisional','Open','Identification Only')  DEFAULT 'Not Issued' AFTER `dl_status`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `dl_class` `dl_class` set('Not Applicable', 'Car','Light Rig','Heavy Rig','Boat','Motorbike','Military') DEFAULT 'Not Applicable' AFTER `dl_type`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `dl_Issued_by` `dl_Issued_by` set('Not Applicable', 'Government','Military') DEFAULT 'Not Applicable' AFTER `dl_class`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `weapon_permit` `weapon_permit` set('Unobtained','Vaild','Suspended','Expired','Canceled')  AFTER `build`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `weapon_permit_type` `weapon_permit_type` set('Small Arms','Specialised Weapon','Automatic Weapon','Semi-Automatic','Military Grade')  AFTER `weapon_permit`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `weapon_permit_Issued_by` `weapon_permit_Issued_by` set('Ammu-Nation','Government','Military') AFTER `weapon_permit_type`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `deceased` `deceased` set('NO','YES') DEFAULT 'NO' AFTER `organ_donor`;


ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `race` `race` set('Indian','Asian','Black or African American','Hispanic','Caucasian','Pacific Islander', 'White')  AFTER `gender`;



ALTER TABLE `<DBPREFIX>ncic_names` ADD `blood_type` set('A+','O+','B+','AB+','A-','O-','B-','AB-') AFTER `weapon_permit_Issued_by`;



ALTER TABLE `<DBPREFIX>ncic_names` ADD `organ_donor` set('NO','YES')  DEFAULT 'NO' AFTER `blood_type`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `build` `build` set('Average','Fit','Muscular','Overweight','Skinny','Thin') AFTER `hair_color`;



ALTER TABLE `<DBPREFIX>ncic_names` CHANGE `hair_color` `hair_color` set('Bald','Black','Blonde','Blue','Brown','Gray','Green','Orange','Pink','Purple','Red','Auburn','Sandy','Strawberry','White','Partially Gray') AFTER `dl_Issued_by`;



ALTER TABLE `<DBPREFIX>ncic_plates` CHANGE `veh_insurance` `veh_insurance` set('VALID','EXPIRED','CANCELED','SUSPENDED', 'Unknown') DEFAULT 'VALID' AFTER `veh_scolor`;



ALTER TABLE `<DBPREFIX>ncic_plates` CHANGE `veh_insurance type` `veh_insurance type` set('CTP','Third Party','Comprehensive') DEFAULT 'CTP' AFTER `veh_insurance`;



ALTER TABLE `<DBPREFIX>ncic_plates` CHANGE `flags` `flags` set('NONE','STOLEN','WANTED','SUSPENDED REGISTRATION','CANCELED REGISTRATION','EXPIRED REGISTRATION','INSURANCE FLAG','DRIVER FLAG','NO INSURANCE') AFTER `veh_insurance type`;



ALTER TABLE `<DBPREFIX>ncic_plates` CHANGE `veh_reg_state` `veh_reg_state` set('Los Santos','Blaine County','San Andreas')  AFTER `flags`;



ALTER TABLE `<DBPREFIX>ncic_weapons` CHANGE `weapon_notes` `notes` varchar(2048);



DROP TABLE IF EXISTS
    `<DBPREFIX>permissions`;

DROP TABLE IF EXISTS
    `<DBPREFIX>codes`;
DROP TABLE IF EXISTS
    `permissions`;

DROP TABLE IF EXISTS
    `codes`;