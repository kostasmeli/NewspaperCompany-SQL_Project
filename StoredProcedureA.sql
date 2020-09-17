DROP PROCEDURE IF EXISTS newspaper1;
DELIMITER $
CREATE PROCEDURE newspaper1(IN arithmosfilou INT, IN onomaefimeridas VARCHAR(20), OUT EmptyPages INT)
BEGIN
DECLARE counter INT;
DECLARE flag INT;
DECLARE Titlos VARCHAR(30);
DECLARE onoma_ergazomenou  VARCHAR(20);
DECLARE epitheto_ergazomenou VARCHAR(30);
DECLARE hmeromhnia_egkrishs DATE;
DECLARE selida_ekkinishs INT;
DECLARE plithos_selidwn INT;
DECLARE selides_fillou INT;
DECLARE path_arthrou VARCHAR(100);
DECLARE search_cursor CURSOR FOR
SELECT Article.path,Article.Title,Employee.name,Employee.surname,Article.Accepted_Date,Article.Paper_order,Article.Paper_number
FROM Article
INNER JOIN Leaflet ON Leaflet.leaflet_number=Article.Number_of_Leaflet
INNER JOIN Submit ON Article.Path=Submit.article
INNER JOIN Journalist ON Submit.submiter=Journalist.email
INNER JOIN Employee ON Journalist.email=Employee.email
INNER JOIN Checks ON Checks.article=Article.Path
WHERE leaflet.leaflet_number=arithmosfilou
AND leaflet.newspaper_name=onomaefimeridas
AND Checks.Status='accepted'
ORDER BY Paper_order ASC;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag=1;

OPEN search_cursor;
SET flag=0;
SET counter=0;
FETCH search_cursor INTO path_arthrou,Titlos,onoma_ergazomenou,epitheto_ergazomenou,hmeromhnia_egkrishs,selida_ekkinishs,plithos_selidwn;
SELECT numberofpages INTO selides_fillou FROM Leaflet INNER JOIN Article on
Leaflet.leaflet_number = Article.Number_of_Leaflet WHERE Article.path = path_arthrou;

WHILE (flag=0)
DO
SELECT Titlos,onoma_ergazomenou,epitheto_ergazomenou,hmeromhnia_egkrishs,selida_ekkinishs,plithos_selidwn;
SET counter=counter+plithos_selidwn;
FETCH search_cursor INTO path_arthrou,Titlos,onoma_ergazomenou,epitheto_ergazomenou,hmeromhnia_egkrishs,selida_ekkinishs,plithos_selidwn;
END WHILE;
CLOSE search_cursor;
IF (counter<selides_fillou)
THEN
SET EmptyPages=selides_fillou-counter;
SELECT EmptyPages;
END IF;
END $
DELIMITER ;
