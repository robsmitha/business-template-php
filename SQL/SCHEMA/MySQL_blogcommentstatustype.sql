/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/16/2017
Description:	Creates the blogcommentstatustype table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`blogcommentstatustype`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcommentstatustype_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`blogcommentstatustype` (
Id INT AUTO_INCREMENT,
Name VARCHAR(255),
Description VARCHAR(1025),
CONSTRAINT pk_blogcommentstatustype_Id PRIMARY KEY (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`blogcommentstatustype`.`Id` AS `Id`,
		`blogcommentstatustype`.`Name` AS `Name`,
		`blogcommentstatustype`.`Description` AS `Description`
	FROM `blogcommentstatustype`
	WHERE 		`blogcommentstatustype`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_LoadAll`
()
BEGIN
	SELECT
		`blogcommentstatustype`.`Id` AS `Id`,
		`blogcommentstatustype`.`Name` AS `Name`,
		`blogcommentstatustype`.`Description` AS `Description`
	FROM `blogcommentstatustype`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_Add`
(
	 IN paramName VARCHAR(255),
	 IN paramDescription VARCHAR(1025)
)
BEGIN
	INSERT INTO `blogcommentstatustype` (Name,Description)
	VALUES (paramName, paramDescription);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_Update`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	UPDATE `blogcommentstatustype`
	SET Name = paramName
		,Description = paramDescription
	WHERE		`blogcommentstatustype`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `blogcommentstatustype`
	WHERE		`blogcommentstatustype`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcommentstatustype_Search`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	SELECT
		`blogcommentstatustype`.`Id` AS `Id`,
		`blogcommentstatustype`.`Name` AS `Name`,
		`blogcommentstatustype`.`Description` AS `Description`
	FROM `blogcommentstatustype`
	WHERE
		COALESCE(blogcommentstatustype.`Id`,0) = COALESCE(paramId,blogcommentstatustype.`Id`,0)
		AND COALESCE(blogcommentstatustype.`Name`,'') = COALESCE(paramName,blogcommentstatustype.`Name`,'')
		AND COALESCE(blogcommentstatustype.`Description`,'') = COALESCE(paramDescription,blogcommentstatustype.`Description`,'');
END //
DELIMITER ;

