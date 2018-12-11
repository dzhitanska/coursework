DELIMITER ;;

DROP PROCEDURE Salary_ADD;
CREATE PROCEDURE Salary_ADD (IN IDTrainer_2 INT)
BEGIN
	UPDATE trainers SET Number_of_clients = Number_of_clients+1 WHERE ID=IDTrainer_2; 
	UPDATE trainers SET Salary = Salary+500 WHERE ID=IDTrainer_2;
END;; 

DROP PROCEDURE Salary_deduct;
CREATE PROCEDURE Salary_deduct (IN IDTrainer_d INT)
BEGIN 
	UPDATE trainers SET trainers.Number_of_clients = trainers.Number_of_clients - 1 WHERE trainers.ID = IDTrainer_d; 
	UPDATE trainers SET trainers.Salary = trainers.Salary - 500 WHERE trainers.ID = IDTrainer_d;
END;;