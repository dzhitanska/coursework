DROP VIEW Trainers_and_clients;
CREATE VIEW Trainers_and_clients AS 
SELECT concat(concat(T.Name, ' ' ,T.Surname),' trains ',concat(C.Name, ' ' ,C.Surname)) AS Trainers_and_clients
FROM trainers T JOIN clients C 
ON (C.IDTrainer=T.ID)
ORDER BY T.ID;

SELECT * FROM Trainers_and_clients;

DROP VIEW Cost;
CREATE VIEW Cost AS 
SELECT CS.IDClient, CS.CLients_Name, CS.CLients_Surname, CS.Number_of_service, S.Cost, S.Service
FROM clients_and_services CS JOIN services S 
ON(CS.Number_of_service = S.Abonement)
ORDER BY IDCLient;

SELECT * FROM cost;

