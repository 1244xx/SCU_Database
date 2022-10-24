SELECT Id, OrderDate, PreOrderDate, ROUND(julianday(OrderDate)-julianday(PreOrderDate), 2)
FROM (
    SELECT Id, OrderDate, LAG(OrderDate, 1, OrderDate) OVER (ORDER BY OrderDate ASC) AS PreOrderDate
    FROM 'Order'
    WHERE CustomerId='BLONP'
    LIMIT 10)
ORDER BY OrderDate;