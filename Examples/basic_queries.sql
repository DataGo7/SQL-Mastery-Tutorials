-- Insert data into Customers table
INSERT INTO Customers (FirstName, LastName, Email)
VALUES ('John', 'Doe', 'john.doe@example.com'),
       ('Jane', 'Smith', 'jane.smith@example.com');

-- Select data from Customers table
SELECT * FROM Customers;

-- Update data in Customers table
UPDATE Customers
SET Email = 'john.newemail@example.com'
WHERE CustomerID = 1;

-- Delete data from Customers table
DELETE FROM Customers
WHERE CustomerID = 2;

