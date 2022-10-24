SELECT ProductName, CompanyName, ContactName
FROM (
    SELECT ProductName, CompanyName, ContactName, MIN(OrderDate)
    FROM Product, OrderDetail, 'Order', Customer
    WHERE Product.Id = ProductId AND OrderId = 'Order'.Id AND CustomerId = Customer.Id 
    GROUP BY ProductId
    HAVING Discontinued = 1)
ORDER BY ProductName;