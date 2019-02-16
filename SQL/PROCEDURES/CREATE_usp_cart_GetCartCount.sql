use businesstemplate;
DELIMITER //
CREATE PROCEDURE `businesstemplate`.`usp_cartitem_GetCartCount`
(
	 IN paramCartId INT
)
BEGIN
	SELECT
		COUNT(*) AS 'NumberOfItems'
	FROM `cartitem`
	WHERE 		`cartitem`.`cartId` = paramCartId;
END //
DELIMITER ;