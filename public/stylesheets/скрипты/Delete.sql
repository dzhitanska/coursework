DELIMITER ;;


DROP PROCEDURE Trainers_DELETE;
CREATE PROCEDURE Trainers_DELETE (
IN ID_Trainer INT
)
BEGIN 
DECLARE num_min, idc_max, IDCLient_1, IDTrainer_1, IDT INT;
SET IDCLient_1 = 0;
SET idc_max = (SELECT MAX(IDCLients) FROM clients );
WHILE IDCLient_1 <= idc_max DO 
	SET num_min = (SELECT MIN(Number_of_clients) FROM trainers WHERE ID<>ID_Trainer);
    SET IDTrainer_1 = (SELECT IDTrainer FROM clients WHERE IDClients = IDCLient_1);
	IF IDTrainer_1 = ID_Trainer THEN 
		UPDATE clients SET IDTrainer = (SELECT ID FROM trainers WHERE Number_of_clients = num_min LIMIT 1) WHERE IDCLients=IDCLient_1;
        SET IDT = (SELECT IDTrainer FROM clients WHERE IDCLients=IDCLient_1);
        CALL Salary_ADD(IDT);
		SET IDClient_1= IDCLient_1 +1;
    ELSE SET IDClient_1= IDCLient_1 +1;
    END IF;
END WHILE;
DELETE FROM trainers WHERE ID=ID_Trainer;
END;; 

CALL Trainers_DELETE (2);





DROP PROCEDURE Clients_DELETE;
CREATE PROCEDURE Clients_DELETE (
IN ID_CLient INT
)
BEGIN 
DECLARE IDTrainer_1 INT; 
SET IDTrainer_1 = (SELECT IDTrainer FROM clients WHERE IDCLients = ID_CLient);
IF IDTrainer_1 = 0 THEN 
	DELETE FROM clients  WHERE IDCLients = ID_Client ;
	ELSE 
		CALL Salry_deduct(IDTrainer_1);
		DELETE FROM clients  WHERE IDCLients = ID_Client ; 
END IF;
END;; 

CALL Clients_DELETE(14); 
