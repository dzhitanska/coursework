DELIMITER ;;
DROP PROCEDURE CLients_INSERT;
CREATE Procedure Clients_INSERT (
IN Name varchar(30), 
IN Surname varchar(40), 
IN Email varchar(40),
IN Telephone varchar(20), 
IN Abonement int(10),
IN Trainer varchar(5),
IN IDTrainer int(11), 
IN Registration_day date
)
BEGIN 
INSERT INTO clients(Name, Surname, Email, Telephone, Abonement, Trainer, IDTrainer, Registration_day)
VALUES (Name, Surname, Email, Telephone, Abonement, Trainer, IDTrainer, Registration_day);
END ;;

DROP FUNCTION INSERT_IDTrainer_IN_CLients;
CREATE FUNCTION INSERT_IDTrainer_IN_CLients (Trainer_1 bool, IDTrainer_1 int ) 
RETURNS INT DETERMINISTIC
BEGIN
DECLARE IDTrainer INTEGER; 
DECLARE m INTEGER;
SET m = (SELECT MIN(Number_of_clients) FROM trainers);
IF Trainer_1 = FALSE THEN SET IDTrainer = 0;
ELSE 
	IF IDTrainer_1>0 THEN SET IDTrainer=IDTrainer_1;
    UPDATE trainers SET Number_of_clients = Number_of_clients + 1 WHERE ID=IDTrainer; 
	UPDATE trainers SET Salary = Salary+500 WHERE ID=IDTrainer;
	ELSE
		SET IDTrainer = (SELECT ID FROM trainers WHERE (Number_of_clients = m) LIMIT 1) ;
		UPDATE trainers SET Number_of_clients = m+1 WHERE ID=IDTrainer; 
		UPDATE trainers SET Salary = Salary+500 WHERE ID=IDTrainer;
	END IF;
END IF;
RETURN IDTrainer;
END ;;

DROP PROCEDURE INSERT_IN_Clients;
CREATE PROCEDURE INSERT_IN_Clients(
IN Name varchar(30), 
IN Surname varchar(40), 
IN Email varchar(40),
IN Telephone varchar(20), 
IN Abonement int(10),
IN Trainer_1 bool, 
IN IDTrainer_1 int(11),
IN Registration_day date)
BEGIN
DECLARE IDTrainer INTEGER; 
DECLARE Trainer VARCHAR(10);
SET IDTrainer = (SELECT INSERT_IDTrainer_IN_CLients (Trainer_1, IDTrainer_1));
IF Trainer_1=0 THEN SET Trainer='N';
ELSE SET Trainer='Y';
END IF;
CALL Clients_INSERT(Name, Surname, Email, Telephone, Abonement, Trainer, IDTrainer, Registration_day); 
END ;;

/*CALL INSERT_IN_Clients('Vasya', 'Pupkin', 'vasyapupkin@gmail.com', '380956784321', 123, TRUE, 0, '2018-07-08');
CALL INSERT_IN_Clients('Valya', 'Matveeva', 'tanya24matveeva@gmail.com', '380960456939', 145, FALSE, 0 , '2018-08-23');
CALL INSERT_IN_Clients('Kristina', 'Yereva', 'krisyer@gmail.com', '380968764523', 1258, TRUE, 3, '2017-04-18'); */
