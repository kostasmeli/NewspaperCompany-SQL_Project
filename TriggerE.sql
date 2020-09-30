DROP TRIGGER IF EXISTS  leafletSpaceAndNullDate;
DELIMITER $
CREATE TRIGGER leafletSpaceAndNullDate BEFORE INSERT ON Article FOR EACH ROW
BEGIN
DECLARE Selides INT;
DECLARE Sum INT;
SET selides=0;
SET Sum=0;
IF(NEW.Accepted_Date IS NOT NULL)
THEN
SET NEW.Accepted_Date=Null;
END IF;

SELECT SUM(Paper_number) INTO Sum  FROM Article WHERE Article.Number_of_Leaflet=New.Number_of_Leaflet ;

SELECT numberofpages INTO selides FROM Leaflet WHERE Leaflet.leaflet_number=New.Number_of_Leaflet;

IF(New.Paper_number>selides OR selides<(Sum+New.Paper_number))
THEN
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT="Error inserting Article";
END IF;
END $
DELIMITER ;
