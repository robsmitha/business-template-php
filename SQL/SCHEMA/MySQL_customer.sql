/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/9/2017
Description:	Creates the customer table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`customer`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_customer_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`customer` (
Id INT AUTO_INCREMENT,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Email VARCHAR(255),
Password VARCHAR(255),
CreateDate DATETIME,
CONSTRAINT pk_customer_Id PRIMARY KEY (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`customer`.`Id` AS `Id`,
		`customer`.`FirstName` AS `FirstName`,
		`customer`.`LastName` AS `LastName`,
		`customer`.`Email` AS `Email`,
		`customer`.`Password` AS `Password`,
		`customer`.`CreateDate` AS `CreateDate`
	FROM `customer`
	WHERE 		`customer`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_LoadAll`
()
BEGIN
	SELECT
		`customer`.`Id` AS `Id`,
		`customer`.`FirstName` AS `FirstName`,
		`customer`.`LastName` AS `LastName`,
		`customer`.`Email` AS `Email`,
		`customer`.`Password` AS `Password`,
		`customer`.`CreateDate` AS `CreateDate`
	FROM `customer`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_Add`
(
	 IN paramFirstName VARCHAR(255),
	 IN paramLastName VARCHAR(255),
	 IN paramEmail VARCHAR(255),
	 IN paramPassword VARCHAR(255),
	 IN paramCreateDate DATETIME
)
BEGIN
	INSERT INTO `customer` (FirstName,LastName,Email,Password,CreateDate)
	VALUES (paramFirstName, paramLastName, paramEmail, paramPassword, paramCreateDate);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_Update`
(
	IN paramId INT,
	IN paramFirstName VARCHAR(255),
	IN paramLastName VARCHAR(255),
	IN paramEmail VARCHAR(255),
	IN paramPassword VARCHAR(255),
	IN paramCreateDate DATETIME
)
BEGIN
	UPDATE `customer`
	SET FirstName = paramFirstName
		,LastName = paramLastName
		,Email = paramEmail
		,Password = paramPassword
		,CreateDate = paramCreateDate
	WHERE		`customer`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `customer`
	WHERE		`customer`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_customer_Search`
(
	IN paramId INT,
	IN paramFirstName VARCHAR(255),
	IN paramLastName VARCHAR(255),
	IN paramEmail VARCHAR(255),
	IN paramPassword VARCHAR(255),
	IN paramCreateDate DATETIME
)
BEGIN
	SELECT
		`customer`.`Id` AS `Id`,
		`customer`.`FirstName` AS `FirstName`,
		`customer`.`LastName` AS `LastName`,
		`customer`.`Email` AS `Email`,
		`customer`.`Password` AS `Password`,
		`customer`.`CreateDate` AS `CreateDate`
	FROM `customer`
	WHERE
		COALESCE(customer.`Id`,0) = COALESCE(paramId,customer.`Id`,0)
		AND COALESCE(customer.`FirstName`,'') = COALESCE(paramFirstName,customer.`FirstName`,'')
		AND COALESCE(customer.`LastName`,'') = COALESCE(paramLastName,customer.`LastName`,'')
		AND COALESCE(customer.`Email`,'') = COALESCE(paramEmail,customer.`Email`,'')
		AND COALESCE(customer.`Password`,'') = COALESCE(paramPassword,customer.`Password`,'')
		AND COALESCE(CAST(customer.`CreateDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramCreateDate AS DATE),CAST(customer.`CreateDate` AS DATE), CAST(NOW() AS DATE));
END //
DELIMITER ;


