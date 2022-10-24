SELECT ShipName, SUBSTR(ShipName, 0, INSTR(ShipName,'-')) 
FROM (
    SELECT DISTINCT ShipName 
    FROM 'Order' 
    WHERE ShipName LIKE '%-%') 
ORDER BY ShipName;