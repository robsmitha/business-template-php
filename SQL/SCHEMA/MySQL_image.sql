/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/23/2017
Description:	Creates the image table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`image`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_image_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`image` (
Id INT AUTO_INCREMENT,
Name VARCHAR(255),
Description VARCHAR(1025),
ImgUrl VARCHAR(1025),
EventId INT,
Views INT,
IsFeaturedImage INT,
CONSTRAINT pk_image_Id PRIMARY KEY (Id),
CONSTRAINT fk_image_EventId_event_Id FOREIGN KEY (EventId) REFERENCES event (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`image`.`Id` AS `Id`,
		`image`.`Name` AS `Name`,
		`image`.`Description` AS `Description`,
		`image`.`ImgUrl` AS `ImgUrl`,
		`image`.`EventId` AS `EventId`,
		`image`.`Views` AS `Views`,
		`image`.`IsFeaturedImage` AS `IsFeaturedImage`
	FROM `image`
	WHERE 		`image`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_LoadAll`
()
BEGIN
	SELECT
		`image`.`Id` AS `Id`,
		`image`.`Name` AS `Name`,
		`image`.`Description` AS `Description`,
		`image`.`ImgUrl` AS `ImgUrl`,
		`image`.`EventId` AS `EventId`,
		`image`.`Views` AS `Views`,
		`image`.`IsFeaturedImage` AS `IsFeaturedImage`
	FROM `image`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_Add`
(
	 IN paramName VARCHAR(255),
	 IN paramDescription VARCHAR(1025),
	 IN paramImgUrl VARCHAR(1025),
	 IN paramEventId INT,
	 IN paramViews INT,
	 IN paramIsFeaturedImage INT
)
BEGIN
	INSERT INTO `image` (Name,Description,ImgUrl,EventId,Views,IsFeaturedImage)
	VALUES (paramName, paramDescription, paramImgUrl, paramEventId, paramViews, paramIsFeaturedImage);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_Update`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025),
	IN paramImgUrl VARCHAR(1025),
	IN paramEventId INT,
	IN paramViews INT,
	IN paramIsFeaturedImage INT
)
BEGIN
	UPDATE `image`
	SET Name = paramName
		,Description = paramDescription
		,ImgUrl = paramImgUrl
		,EventId = paramEventId
		,Views = paramViews
		,IsFeaturedImage = paramIsFeaturedImage
	WHERE		`image`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `image`
	WHERE		`image`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_image_Search`
(
	IN paramId INT,
	IN paramName VARCHAR(255),
	IN paramDescription VARCHAR(1025),
	IN paramImgUrl VARCHAR(1025),
	IN paramEventId INT,
	IN paramViews INT,
	IN paramIsFeaturedImage INT
)
BEGIN
	SELECT
		`image`.`Id` AS `Id`,
		`image`.`Name` AS `Name`,
		`image`.`Description` AS `Description`,
		`image`.`ImgUrl` AS `ImgUrl`,
		`image`.`EventId` AS `EventId`,
		`image`.`Views` AS `Views`,
		`image`.`IsFeaturedImage` AS `IsFeaturedImage`
	FROM `image`
	WHERE
		COALESCE(image.`Id`,0) = COALESCE(paramId,image.`Id`,0)
		AND COALESCE(image.`Name`,'') = COALESCE(paramName,image.`Name`,'')
		AND COALESCE(image.`Description`,'') = COALESCE(paramDescription,image.`Description`,'')
		AND COALESCE(image.`ImgUrl`,'') = COALESCE(paramImgUrl,image.`ImgUrl`,'')
		AND COALESCE(image.`EventId`,0) = COALESCE(paramEventId,image.`EventId`,0)
		AND COALESCE(image.`Views`,0) = COALESCE(paramViews,image.`Views`,0)
		AND COALESCE(image.`IsFeaturedImage`,0) = COALESCE(paramIsFeaturedImage,image.`IsFeaturedImage`,0);
END //
DELIMITER ;

