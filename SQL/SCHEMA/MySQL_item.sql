/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/12/2017
Description:	Creates the item table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`item`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_item_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`item` (
Id INT AUTO_INCREMENT,
Name VARCHAR(255),
Description VARCHAR(1025),
ImgUrl VARCHAR(1025),
Price DECIMAL(9),
ItemTypeId INT,
ItemStatusTypeId INT,
CreateDate DATETIME,
Rating DECIMAL(9),
CONSTRAINT pk_item_Id PRIMARY KEY (Id),
CONSTRAINT fk_item_ItemTypeId_itemtype_Id FOREIGN KEY (ItemTypeId) REFERENCES itemtype (Id),
CONSTRAINT fk_item_ItemStatusTypeId_itemstatustype_Id FOREIGN KEY (ItemStatusTypeId) REFERENCES itemstatustype (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`item`.`Id` AS `Id`,
		`item`.`Name` AS `Name`,
		`item`.`Description` AS `Description`,
		`item`.`ImgUrl` AS `ImgUrl`,
		`item`.`Price` AS `Price`,
		`item`.`ItemTypeId` AS `ItemTypeId`,
		`item`.`ItemStatusTypeId` AS `ItemStatusTypeId`,
		`item`.`CreateDate` AS `CreateDate`,
		`item`.`Rating` AS `Rating`
	FROM `item`
	WHERE 		`item`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_LoadAll`
()
BEGIN
	SELECT
		`item`.`Id` AS `Id`,
		`item`.`Name` AS `Name`,
		`item`.`Description` AS `Description`,
		`item`.`ImgUrl` AS `ImgUrl`,
		`item`.`Price` AS `Price`,
		`item`.`ItemTypeId` AS `ItemTypeId`,
		`item`.`ItemStatusTypeId` AS `ItemStatusTypeId`,
		`item`.`CreateDate` AS `CreateDate`,
		`item`.`Rating` AS `Rating`
	FROM `item`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_Add`
(
	 IN paramName VARCHAR(255),
	 IN paramDescription VARCHAR(1025),
	 IN paramImgUrl VARCHAR(1025),
	 IN paramPrice DECIMAL(9),
	 IN paramItemTypeId INT,
	 IN paramItemStatusTypeId INT,
	 IN paramCreateDate DATETIME,
	 IN paramRating DECIMAL(9)
)
BEGIN
	INSERT INTO `item` (Name,Description,ImgUrl,Price,ItemTypeId,ItemStatusTypeId,CreateDate,Rating)
	VALUES (paramName, paramDescription, paramImgUrl, paramPrice, paramItemTypeId, paramItemStatusTypeId, paramCreateDate, paramRating);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_Update`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025),
	IN paramImgUrl VARCHAR(1025),
	IN paramPrice DECIMAL(9),
	IN paramItemTypeId INT,
	IN paramItemStatusTypeId INT,
	IN paramCreateDate DATETIME,
	IN paramRating DECIMAL(9)
)
BEGIN
	UPDATE `item`
	SET Name = paramName
		,Description = paramDescription
		,ImgUrl = paramImgUrl
		,Price = paramPrice
		,ItemTypeId = paramItemTypeId
		,ItemStatusTypeId = paramItemStatusTypeId
		,CreateDate = paramCreateDate
		,Rating = paramRating
	WHERE		`item`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `item`
	WHERE		`item`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_item_Search`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025),
	IN paramImgUrl VARCHAR(1025),
	IN paramPrice DECIMAL(9),
	IN paramItemTypeId INT,
	IN paramItemStatusTypeId INT,
	IN paramCreateDate DATETIME,
	IN paramRating DECIMAL(9)
)
BEGIN
	SELECT
		`item`.`Id` AS `Id`,
		`item`.`Name` AS `Name`,
		`item`.`Description` AS `Description`,
		`item`.`ImgUrl` AS `ImgUrl`,
		`item`.`Price` AS `Price`,
		`item`.`ItemTypeId` AS `ItemTypeId`,
		`item`.`ItemStatusTypeId` AS `ItemStatusTypeId`,
		`item`.`CreateDate` AS `CreateDate`,
		`item`.`Rating` AS `Rating`
	FROM `item`
	WHERE
		COALESCE(item.`Id`,0) = COALESCE(paramId,item.`Id`,0)
		AND COALESCE(item.`Name`,'') = COALESCE(paramName,item.`Name`,'')
		AND COALESCE(item.`Description`,'') = COALESCE(paramDescription,item.`Description`,'')
		AND COALESCE(item.`ImgUrl`,'') = COALESCE(paramImgUrl,item.`ImgUrl`,'')
		AND COALESCE(item.`Price`,0) = COALESCE(paramPrice,item.`Price`,0)
		AND COALESCE(item.`ItemTypeId`,0) = COALESCE(paramItemTypeId,item.`ItemTypeId`,0)
		AND COALESCE(item.`ItemStatusTypeId`,0) = COALESCE(paramItemStatusTypeId,item.`ItemStatusTypeId`,0)
		AND COALESCE(CAST(item.`CreateDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramCreateDate AS DATE),CAST(item.`CreateDate` AS DATE), CAST(NOW() AS DATE))
		AND COALESCE(item.`Rating`,0) = COALESCE(paramRating,item.`Rating`,0);
END //
DELIMITER ;

