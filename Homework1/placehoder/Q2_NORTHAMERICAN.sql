SELECT Id, ShipCountry, area
FROM (
    SELECT *, 'NorthAmerican' AS Area 
    FROM 'Order' 
    WHERE ShipCountry = 'USA' OR ShipCountry = 'Mexico' OR ShipCountry = 'Canada'
    UNION
    SELECT *, 'OtherPlace' AS Area 
    FROM 'Order' 
    WHERE ShipCountry<>'USA' AND ShipCountry <> 'Mexico' AND ShipCountry <> 'Canada')
WHERE id>15444 AND id<15465
ORDER BY Id;