-- Join Customers and Orders tables
SELECT c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Subquery to find customers with orders above $500
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > 500
);

-- Common Table Expression (CTE) to calculate total spent by each customer
WITH CustomerTotal AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT c.FirstName, c.LastName, ct.TotalSpent
FROM Customers c
JOIN CustomerTotal ct ON c.CustomerID = ct.CustomerID;

