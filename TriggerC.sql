CREATE TRIGGER NewSalary BEFORE INSERT ON Employee FOR EACH ROW
SET NEW.salary=650;
