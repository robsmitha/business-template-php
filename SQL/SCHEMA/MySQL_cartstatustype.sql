/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/9/2017
Description:	Creates the cartstatustype table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`cartstatustype`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_cartstatustype_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`cartstatustype` (
Id INT AUTO_INCREMENT,
Name VARCHAR(255),
Description VARCHAR(1025),
CONSTRAINT pk_cartstatustype_Id PRIMARY KEY (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`cartstatustype`.`Id` AS `Id`,
		`cartstatustype`.`Name` AS `Name`,
		`cartstatustype`.`Description` AS `Description`
	FROM `cartstatustype`
	WHERE 		`cartstatustype`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_LoadAll`
()
BEGIN
	SELECT
		`cartstatustype`.`Id` AS `Id`,
		`cartstatustype`.`Name` AS `Name`,
		`cartstatustype`.`Description` AS `Description`
	FROM `cartstatustype`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_Add`
(
	 IN paramName VARCHAR(255),
	 IN paramDescription VARCHAR(1025)
)
BEGIN
	INSERT INTO `cartstatustype` (Name,Description)
	VALUES (paramName, paramDescription);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_Update`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	UPDATE `cartstatustype`
	SET Name = paramName
		,Description = paramDescription
	WHERE		`cartstatustype`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `cartstatustype`
	WHERE		`cartstatustype`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartstatustype_Search`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	SELECT
		`cartstatustype`.`Id` AS `Id`,
		`cartstatustype`.`Name` AS `Name`,
		`cartstatustype`.`Description` AS `Description`
	FROM `cartstatustype`
	WHERE
		COALESCE(cartstatustype.`Id`,0) = COALESCE(paramId,cartstatustype.`Id`,0)
		AND COALESCE(cartstatustype.`Name`,'') = COALESCE(paramName,cartstatustype.`Name`,'')
		AND COALESCE(cartstatustype.`Description`,'') = COALESCE(paramDescription,cartstatustype.`Description`,'');
END //
DELIMITER ;


