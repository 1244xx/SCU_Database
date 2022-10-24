WITH res AS (
    SELECT *
    FROM 'Order' 
    WHERE Shipper.Id = 'Order'.ShipVia)
SELECT CompanyName, ROUND(
    100. * (
        SELECT COUNT(*) 
        FROM res
        WHERE ShippedDate > RequiredDate
    ) / (
        SELECT COUNT(*) 
        FROM res
    ), 2) AS DelayPercentage
FROM Shipper
ORDER BY DelayPercentage DESC;