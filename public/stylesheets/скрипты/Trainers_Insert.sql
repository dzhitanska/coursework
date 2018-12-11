DELIMITER ;;
DROP PROCEDURE Trainers_INSERT;
CREATE Procedure Trainers_INSERT (
IN Name varchar(30), 
IN Surname varchar(40), 
IN Email varchar(40),
IN Telephone varchar(20), 
IN Salary int(11), 
IN About_trainer longtext,
IN Experience varchar(5),
IN Start_day date
)
BEGIN 
INSERT INTO trainers(Name, Surname, Email, Telephone, Salary, About_trainer, Experience, Start_day)
VALUES (Name, Surname, Email, Telephone, Salary, About_trainer, Experience, Start_day);
END ;;

CREATE FUNCTION Trainers_Salary (Experience_1 bool)
RETURNS INT DETERMINISTIC
BEGIN 
DECLARE Salary INT;
IF Experience_1 = FALSE THEN SET Salary = 200;
ELSE SET Salary =300;
END IF;
RETURN Salary;
END;;

DROP PROCEDURE INSERT_IN_Trainers;
CREATE Procedure INSERT_IN_Trainers (
IN Name varchar(30), 
IN Surname varchar(40), 
IN Email varchar(40),
IN Telephone varchar(20), 
IN About_trainer longtext,
IN Experience_1 bool,
IN Start_day date
) 
BEGIN
DECLARE Salary INT;
DECLARE Experience varchar(5);
SET Salary = (SELECT Trainers_Salary(Experience_1));
IF Experience_1=FALSE THEN SET Experience = 'no';
ELSE SET Experience = 'yes';
END IF;
CALL Trainers_INSERT(Name, Surname, Email, Telephone, Salary, About_trainer, Experience, Start_day);
END ;; 

CALL INSERT_IN_Trainers('Kolya', 'Parov', 'kolyan23@gmail.com', '380605044732', 'dgcshvbjnascjac',TRUE, '2018-12-04');