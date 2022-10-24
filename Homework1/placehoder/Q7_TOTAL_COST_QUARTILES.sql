WITH Expenditures AS (
    SELECT IFNULL(CompanyName,'MISSING_NAME') AS CompanyName, CustomerId, ROUND(SUM(Quantity*UnitPrice), 2) AS TotalExpenditures
    FROM 'Order' JOIN OrderDetail ON 'Order'.Id = OrderId LEFT JOIN Customer ON Customer.Id = CustomerId
    GROUP BY CustomerId)
SELECT CompanyName, CustomerId, TotalExpenditures
FROM (
    SELECT *, NTILE(4) OVER (ORDER BY TotalExpenditures) as Quartile
    FROM Expenditures)
WHERE Quartile = 1
ORDER BY TotalExpenditures;