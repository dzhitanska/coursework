DELIMITER ;;
DROP PROCEDURE Delete_Service;
CREATE PROCEDURE Delete_Service 
( IN IDCLient_1 INT, IN Number_of_service_1 INT)
BEGIN
DECLARE Num, max_1, IDCLient_2, N INT;
SET Num =1;
SET max_1 = (SELECT MAX(№) FROM clients_and_services);
	WHILE Num <=max_1 DO 
    SET IDClient_2 = (SELECT IDClient FROM clients_and_services WHERE №=Num);
    SET N = (SELECT Number_of_service FROM clients_and_services WHERE №=Num);
    IF (IDCLient_2=IDCLient_1 AND N=Number_of_service_1) THEN 
		DELETE FROM clients_and_services WHERE (№=Num);
		UPDATE clients SET Cost_of_abonement = (SELECT Cost_of_abonement (IDCLient_1)) WHERE IDClients=IDCLient_1;
        SET Num=Num+1;
	ELSE SET Num=Num+1;
    END IF;
    END WHILE;
END;;




CALL Delete_Service(6,2); 
/*CALL Cost_of_abonement (7);
CALL Cost_of_abonement (12);
CALL Cost_of_abonement (6);*/