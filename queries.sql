-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Product.ProductName, Category.CategoryName
--
FROM Product --Initial table
    JOIN Category -- Secondary Table to attatch
    ON Product.CategoryId = Category.Id
-- Which field in 'Product' matches 'Category' Field: Set them to eachother

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].Id, Shipper.CompanyName
FROM [Order]
    JOIN Shipper
    ON [Order].ShipVia = Shipper.Id
-- ShipVia = ShipperId
WHERE [Order].OrderDate < '2012-08-09';
--Find dates before 2012-08-09

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, [OrderDetail].Quantity
FROM [OrderDetail]
    JOIN Product
    ON Product.Id = [OrderDetail].ProductId
-- Find matching id's to connect tables
WHERE [OrderDetail].OrderId = '10251'
--Show only products with OrderId of 10251
ORDER BY Product.ProductName
-- Sort by ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id, Customer.CompanyName, Employee.LastName
FROM [Order]
    JOIN Customer ON Customer.id = [Order].CustomerId -- Find matching ID from Customer table to Order table 
    JOIN Employee ON Employee.Id = [Order].EmployeeId; -- Find matching ID from Employee table to Order table: ALWAYS BASE OFF OF FIRST PARENT TABLE