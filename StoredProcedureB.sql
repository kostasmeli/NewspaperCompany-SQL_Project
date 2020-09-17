DROP PROCEDURE IF EXISTS misthos;
DELIMITER $
CREATE PROCEDURE misthos(IN email_dhmosiografou VARCHAR(30))
BEGIN
DECLARE hmeromhnia DATE;
DECLARE mhnes INT;
DECLARE prouphresia INT;
DECLARE hmeromhnia_proslipsis DATE;
DECLARE misthos FLOAT;
SET hmeromhnia=CURDATE();
SELECT employment_date,working_experience_on_registration,salary INTO hmeromhnia_proslipsis,prouphresia,misthos
FROM Employee INNER JOIN Journalist  on Employee.email=Journalist.email
WHERE Journalist.email = email_dhmosiografou;
SET mhnes= datediff(hmeromhnia,hmeromhnia_proslipsis)/30 + prouphresia;
SET misthos=misthos + (misthos*0.005*mhnes);
UPDATE Employee SET Employee.salary=misthos WHERE Employee.email=email_dhmosiografou;
END$
DELIMITER ;
