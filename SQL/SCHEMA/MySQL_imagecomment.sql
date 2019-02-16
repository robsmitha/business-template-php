/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen
Date:			12/16/2017
Description:	Creates the imagecomment table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`imagecomment`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_imagecomment_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`imagecomment` (
Id INT AUTO_INCREMENT,
Comment VARCHAR(32768),
CustomerId INT,
ImageCommentStatusTypeId INT,
ImageId INT,
CreateDate DATETIME,
EditDate DATETIME,
CONSTRAINT pk_imagecomment_Id PRIMARY KEY (Id),
CONSTRAINT fk_imagecomment_CustomerId_customer_Id FOREIGN KEY (CustomerId) REFERENCES customer (Id),
CONSTRAINT fk_imagecomment_StatusTypeId_statustype_Id FOREIGN KEY (ImageCommentStatusTypeId) REFERENCES imagecommentstatustype (Id),
CONSTRAINT fk_imagecomment_ImageId_image_Id FOREIGN KEY (ImageId) REFERENCES image (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`imagecomment`.`Id` AS `Id`,
		`imagecomment`.`Comment` AS `Comment`,
		`imagecomment`.`CustomerId` AS `CustomerId`,
		`imagecomment`.`ImageCommentStatusTypeId` AS `ImageCommentStatusTypeId`,
		`imagecomment`.`ImageId` AS `ImageId`,
		`imagecomment`.`CreateDate` AS `CreateDate`,
		`imagecomment`.`EditDate` AS `EditDate`
	FROM `imagecomment`
	WHERE 		`imagecomment`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_LoadAll`
()
BEGIN
	SELECT
		`imagecomment`.`Id` AS `Id`,
		`imagecomment`.`Comment` AS `Comment`,
		`imagecomment`.`CustomerId` AS `CustomerId`,
		`imagecomment`.`ImageCommentStatusTypeId` AS `ImageCommentStatusTypeId`,
		`imagecomment`.`ImageId` AS `ImageId`,
		`imagecomment`.`CreateDate` AS `CreateDate`,
		`imagecomment`.`EditDate` AS `EditDate`
	FROM `imagecomment`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_Add`
(
	 IN paramComment VARCHAR(32768),
	 IN paramCustomerId INT,
	 IN paramImageCommentStatusTypeId INT,
	 IN paramImageId INT,
	 IN paramCreateDate DATETIME,
	 IN paramEditDate DATETIME
)
BEGIN
	INSERT INTO `imagecomment` (Comment,CustomerId,ImageCommentStatusTypeId,ImageId,CreateDate,EditDate)
	VALUES (paramComment, paramCustomerId, paramImageCommentStatusTypeId, paramImageId, paramCreateDate, paramEditDate);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_Update`
(
	IN paramId INT,
	IN paramComment VARCHAR(32768),
	IN paramCustomerId INT,
	IN paramImageCommentStatusTypeId INT,
	IN paramImageId INT,
	IN paramCreateDate DATETIME,
	IN paramEditDate DATETIME
)
BEGIN
	UPDATE `imagecomment`
	SET Comment = paramComment
		,CustomerId = paramCustomerId
		,ImageCommentStatusTypeId = paramImageCommentStatusTypeId
		,ImageId = paramImageId
		,CreateDate = paramCreateDate
		,EditDate = paramEditDate
	WHERE		`imagecomment`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `imagecomment`
	WHERE		`imagecomment`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_imagecomment_Search`
(
	IN paramId INT,
	IN paramComment VARCHAR(32768),
	IN paramCustomerId INT,
	IN paramImageCommentStatusTypeId INT,
	IN paramImageId INT,
	IN paramCreateDate DATETIME,
	IN paramEditDate DATETIME
)
BEGIN
	SELECT
		`imagecomment`.`Id` AS `Id`,
		`imagecomment`.`Comment` AS `Comment`,
		`imagecomment`.`CustomerId` AS `CustomerId`,
		`imagecomment`.`ImageCommentStatusTypeId` AS `ImageCommentStatusTypeId`,
		`imagecomment`.`ImageId` AS `ImageId`,
		`imagecomment`.`CreateDate` AS `CreateDate`,
		`imagecomment`.`EditDate` AS `EditDate`
	FROM `imagecomment`
	WHERE
		COALESCE(imagecomment.`Id`,0) = COALESCE(paramId,imagecomment.`Id`,0)
		AND COALESCE(imagecomment.`Comment`,'') = COALESCE(paramComment,imagecomment.`Comment`,'')
		AND COALESCE(imagecomment.`CustomerId`,0) = COALESCE(paramCustomerId,imagecomment.`CustomerId`,0)
		AND COALESCE(imagecomment.`ImageCommentStatusTypeId`,0) = COALESCE(paramImageCommentStatusTypeId,imagecomment.`ImageCommentStatusTypeId`,0)
		AND COALESCE(imagecomment.`ImageId`,0) = COALESCE(paramImageId,imagecomment.`ImageId`,0)
		AND COALESCE(CAST(imagecomment.`CreateDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramCreateDate AS DATE),CAST(imagecomment.`CreateDate` AS DATE), CAST(NOW() AS DATE))
		AND COALESCE(CAST(imagecomment.`EditDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramEditDate AS DATE),CAST(imagecomment.`EditDate` AS DATE), CAST(NOW() AS DATE));
END //
DELIMITER ;

