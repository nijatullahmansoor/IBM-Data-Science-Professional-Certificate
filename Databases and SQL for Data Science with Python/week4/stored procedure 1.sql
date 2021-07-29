DELIMITER &&  
CREATE PROCEDURE UPDATE_SALEPRICE (
IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5))  
BEGIN 
	
    IF Animal_Health = 'BAD' THEN                     -- Start of conditional statement
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
        
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;

    END IF;                         
    
END &&  
DELIMITER ;  