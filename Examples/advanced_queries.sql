-- Window function to calculate running total of orders
SELECT CustomerID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- Query optimization: Use indexes
CREATE INDEX idx_customer_id ON Orders (CustomerID);

-- Query execution plan
EXPLAIN SELECT c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
