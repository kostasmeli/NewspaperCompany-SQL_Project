DROP TRIGGER IF EXISTS dhmosiografos_arxisuntakths;
DELIMITER $
CREATE TRIGGER dhmosiografos_arxisuntakths AFTER INSERT ON Submit  FOR EACH ROW
BEGIN
DECLARE tempemail VARCHAR(30);
SELECT email INTO tempemail FROM ChiefEditor WHERE email=New.submiter;
IF(tempemail IS NOT NULL)
THEN
INSERT INTO checks VALUES(New.submiter,New.article,NULL,"accepted",New.dateofsubmit);
UPDATE Article SET Accepted_Date=New.dateofsubmit WHERE NEW.article=path;
END IF;
END$
DELIMITER ;
