/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			1/4/2018
Description:	Creates the portfoliocategory table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`portfoliocategory`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_portfoliocategory_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`portfoliocategory` (
Id INT AUTO_INCREMENT,
Name VARCHAR(255),
Description VARCHAR(1025),
CONSTRAINT pk_portfoliocategory_Id PRIMARY KEY (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`portfoliocategory`.`Id` AS `Id`,
		`portfoliocategory`.`Name` AS `Name`,
		`portfoliocategory`.`Description` AS `Description`
	FROM `portfoliocategory`
	WHERE 		`portfoliocategory`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_LoadAll`
()
BEGIN
	SELECT
		`portfoliocategory`.`Id` AS `Id`,
		`portfoliocategory`.`Name` AS `Name`,
		`portfoliocategory`.`Description` AS `Description`
	FROM `portfoliocategory`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_Add`
(
	 IN paramName VARCHAR(255),
	 IN paramDescription VARCHAR(1025)
)
BEGIN
	INSERT INTO `portfoliocategory` (Name,Description)
	VALUES (paramName, paramDescription);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_Update`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	UPDATE `portfoliocategory`
	SET Name = paramName
		,Description = paramDescription
	WHERE		`portfoliocategory`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `portfoliocategory`
	WHERE		`portfoliocategory`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_portfoliocategory_Search`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025)
)
BEGIN
	SELECT
		`portfoliocategory`.`Id` AS `Id`,
		`portfoliocategory`.`Name` AS `Name`,
		`portfoliocategory`.`Description` AS `Description`
	FROM `portfoliocategory`
	WHERE
		COALESCE(portfoliocategory.`Id`,0) = COALESCE(paramId,portfoliocategory.`Id`,0)
		AND COALESCE(portfoliocategory.`Name`,'') = COALESCE(paramName,portfoliocategory.`Name`,'')
		AND COALESCE(portfoliocategory.`Description`,'') = COALESCE(paramDescription,portfoliocategory.`Description`,'');
END //
DELIMITER ;


