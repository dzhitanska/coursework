DELIMITER ;;

CREATE PROCEDURE Update_idtrainer_in_clients (
IN IDClients_update INT,
IN IDTrainer_old INT,
IN IDTrainer_new INT
) 
BEGIN 
UPDATE clients SET IDTrainer = IDTrainer_new WHERE IDClients=IDClients_update;
CALL Salary_deduct(IDTrainer_old);
CALL Salary_ADD(IDTrainer_new);
END;;

CALL Update_idtrainer_in_clients(7,5,3);