WITH res AS (
    SELECT ROW_NUMBER() OVER (ORDER BY Id) AS i, ProductName
    FROM (
        SELECT Product.Id AS id, ProductName
        FROM Product, 'Order', OrderDetail, Customer
        WHERE 'Order'.Id = OrderId AND CustomerId = Customer.Id AND ProductId = Product.Id 
        AND CompanyName = 'Queen Cozinha' AND date(OrderDate) = '2014-12-25'
        GROUP BY Product.Id)),
RESULT AS (
    SELECT i, ProductName
    FROM res
    WHERE i = 1
    UNION ALL
    SELECT res.i, RESULT.ProductName||', '||res.ProductName
    FROM res, RESULT
    WHERE res.i = RESULT.i+1)
SELECT ProductName
FROM RESULT
WHERE i = (SELECT COUNT(*) FROM res);