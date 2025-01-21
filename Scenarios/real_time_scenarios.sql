-- Real-world scenario: Retrieve customers with no orders
SELECT *
FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
);

-- Real-world scenario: Calculate monthly revenue
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(TotalAmount) AS Revenue
FROM Orders
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

-- Real-world scenario: Find top 3 customers by spending
WITH CustomerSpending AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT c.FirstName, c.LastName, cs.TotalSpent
FROM Customers c
JOIN CustomerSpending cs ON c.CustomerID = cs.CustomerID
ORDER BY cs.TotalSpent DESC
LIMIT 3;
