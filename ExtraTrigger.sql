DROP TRIGGER IF EXISTS ChecksAccept;
DELIMITER $
CREATE TRIGGER ChecksAccept AFTER INSERT ON Checks FOR EACH ROW
BEGIN
DECLARE temp VARCHAR(100);
SELECT path INTO temp FROM Article  WHERE path=NEW.article;
IF(temp IS NOT NULL)
THEN
IF(NEW.status="accepted")
THEN
UPDATE Article SET Accepted_Date=NEW.Dateofcheck WHERE path=NEW.article;
END IF;
END IF;
END $
DELIMITER ;
