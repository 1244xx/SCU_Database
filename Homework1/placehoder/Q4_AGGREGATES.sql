SELECT CategoryName, COUNT(*), ROUND(AVG(UnitPrice), 2), MIN(UnitPrice), MAX(UnitPrice), SUM(UnitsOnOrder)
FROM Product, Category
WHERE CategoryId = Category.Id
GROUP BY CategoryId
HAVING COUNT(*) > 10
ORDER BY CategoryId;