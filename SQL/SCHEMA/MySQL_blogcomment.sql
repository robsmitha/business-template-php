/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			12/16/2017
Description:	Creates the blogcomment table and respective stored procedures

*/


USE businesstemplate;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `businesstemplate`.`blogcomment`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_Load`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_LoadAll`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_Add`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_Update`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_Delete`;
DROP PROCEDURE IF EXISTS `businesstemplate`.`usp_blogcomment_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `businesstemplate`.`blogcomment` (
Id INT AUTO_INCREMENT,
Comment VARCHAR(32768),
CustomerId INT,
BlogCommentStatusTypeId INT,
BlogId INT,
CreateDate DATETIME,
EditDate DATETIME,
CONSTRAINT pk_blogcomment_Id PRIMARY KEY (Id),
CONSTRAINT fk_blogcomment_CustomerId_customer_Id FOREIGN KEY (CustomerId) REFERENCES customer (Id),
CONSTRAINT fk_blogcomment_BlogCommentStatusTypeId_blogcommentstatustype_Id FOREIGN KEY (BlogCommentStatusTypeId) REFERENCES blogcommentstatustype (Id),
CONSTRAINT fk_blogcomment_BlogId_blog_Id FOREIGN KEY (BlogId) REFERENCES blog (Id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_Load`
(
	 IN paramId INT
)
BEGIN
	SELECT
		`blogcomment`.`Id` AS `Id`,
		`blogcomment`.`Comment` AS `Comment`,
		`blogcomment`.`CustomerId` AS `CustomerId`,
		`blogcomment`.`BlogCommentStatusTypeId` AS `BlogCommentStatusTypeId`,
		`blogcomment`.`BlogId` AS `BlogId`,
		`blogcomment`.`CreateDate` AS `CreateDate`,
		`blogcomment`.`EditDate` AS `EditDate`
	FROM `blogcomment`
	WHERE 		`blogcomment`.`Id` = paramId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_LoadAll`
()
BEGIN
	SELECT
		`blogcomment`.`Id` AS `Id`,
		`blogcomment`.`Comment` AS `Comment`,
		`blogcomment`.`CustomerId` AS `CustomerId`,
		`blogcomment`.`BlogCommentStatusTypeId` AS `BlogCommentStatusTypeId`,
		`blogcomment`.`BlogId` AS `BlogId`,
		`blogcomment`.`CreateDate` AS `CreateDate`,
		`blogcomment`.`EditDate` AS `EditDate`
	FROM `blogcomment`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_Add`
(
	 IN paramComment VARCHAR(32768),
	 IN paramCustomerId INT,
	 IN paramBlogCommentStatusTypeId INT,
	 IN paramBlogId INT,
	 IN paramCreateDate DATETIME,
	 IN paramEditDate DATETIME
)
BEGIN
	INSERT INTO `blogcomment` (Comment,CustomerId,BlogCommentStatusTypeId,BlogId,CreateDate,EditDate)
	VALUES (paramComment, paramCustomerId, paramBlogCommentStatusTypeId, paramBlogId, paramCreateDate, paramEditDate);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_Update`
(
	IN paramId INT,
	IN paramComment VARCHAR(32768),
	IN paramCustomerId INT,
	IN paramBlogCommentStatusTypeId INT,
	IN paramBlogId INT,
	IN paramCreateDate DATETIME,
	IN paramEditDate DATETIME
)
BEGIN
	UPDATE `blogcomment`
	SET Comment = paramComment
		,CustomerId = paramCustomerId
		,BlogCommentStatusTypeId = paramBlogCommentStatusTypeId
		,BlogId = paramBlogId
		,CreateDate = paramCreateDate
		,EditDate = paramEditDate
	WHERE		`blogcomment`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_Delete`
(
	IN paramId INT
)
BEGIN
	DELETE FROM `blogcomment`
	WHERE		`blogcomment`.`Id` = paramId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_blogcomment_Search`
(
	IN paramId INT,
	IN paramComment VARCHAR(32768),
	IN paramCustomerId INT,
	IN paramBlogCommentStatusTypeId INT,
	IN paramBlogId INT,
	IN paramCreateDate DATETIME,
	IN paramEditDate DATETIME
)
BEGIN
	SELECT
		`blogcomment`.`Id` AS `Id`,
		`blogcomment`.`Comment` AS `Comment`,
		`blogcomment`.`CustomerId` AS `CustomerId`,
		`blogcomment`.`BlogCommentStatusTypeId` AS `BlogCommentStatusTypeId`,
		`blogcomment`.`BlogId` AS `BlogId`,
		`blogcomment`.`CreateDate` AS `CreateDate`,
		`blogcomment`.`EditDate` AS `EditDate`
	FROM `blogcomment`
	WHERE
		COALESCE(blogcomment.`Id`,0) = COALESCE(paramId,blogcomment.`Id`,0)
		AND COALESCE(blogcomment.`Comment`,'') = COALESCE(paramComment,blogcomment.`Comment`,'')
		AND COALESCE(blogcomment.`CustomerId`,0) = COALESCE(paramCustomerId,blogcomment.`CustomerId`,0)
		AND COALESCE(blogcomment.`BlogCommentStatusTypeId`,0) = COALESCE(paramBlogCommentStatusTypeId,blogcomment.`BlogCommentStatusTypeId`,0)
		AND COALESCE(blogcomment.`BlogId`,0) = COALESCE(paramBlogId,blogcomment.`BlogId`,0)
		AND COALESCE(CAST(blogcomment.`CreateDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramCreateDate AS DATE),CAST(blogcomment.`CreateDate` AS DATE), CAST(NOW() AS DATE))
		AND COALESCE(CAST(blogcomment.`EditDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramEditDate AS DATE),CAST(blogcomment.`EditDate` AS DATE), CAST(NOW() AS DATE));
END //
DELIMITER ;


