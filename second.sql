CREATE DATABASE ecommerce_project;
USE ecommerce_project;
CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(50),
    State VARCHAR(30),
    City VARCHAR(30)
);

CREATE TABLE Products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2)
);
INSERT INTO Customers
(Customer_ID, Customer_Name, State, City)
VALUES
('C001', 'Rahul', 'Telangana', 'Hyderabad'),
('C002', 'Anjali', 'Andhra Pradesh', 'Vijayawada'),
('C003', 'Kiran', 'Karnataka', 'Bangalore'),
('C004', 'Priya', 'Tamil Nadu', 'Chennai'),
('C005', 'Suresh', 'Telangana', 'Warangal'),
('C006', 'Meena', 'Maharashtra', 'Mumbai'),
('C007', 'Ravi', 'Telangana', 'Hyderabad'),
('C008', 'Divya', 'Andhra Pradesh', 'Visakhapatnam'),
('C009', 'Arjun', 'Karnataka', 'Mysore'),
('C010', 'Sneha', 'Telangana', 'Nizamabad');

SELECT * FROM Products;
INSERT INTO Orders
(Order_ID, Customer_ID, Product_ID, Order_Date, Quantity, Order_Status)
VALUES
('O001', 'C001', 'P001', '2026-01-05', 1, 'Completed'),
('O002', 'C002', 'P002', '2026-01-08', 2, 'Completed'),
('O003', 'C003', 'P003', '2026-01-12', 3, 'Completed'),
('O004', 'C004', 'P004', '2026-01-15', 1, 'Cancelled'),
('O005', 'C005', 'P005', '2026-01-20', 1, 'Completed'),
('O006', 'C006', 'P006', '2026-02-03', 2, 'Completed'),
('O007', 'C007', 'P007', '2026-02-07', 3, 'Completed'),
('O008', 'C008', 'P008', '2026-02-10', 1, 'Completed'),
('O009', 'C009', 'P009', '2026-02-18', 2, 'Cancelled'),
('O010', 'C010', 'P010', '2026-02-25', 4, 'Completed'),
('O011', 'C001', 'P002', '2026-03-02', 1, 'Completed'),
('O012', 'C002', 'P003', '2026-03-08', 2, 'Completed'),
('O013', 'C003', 'P008', '2026-03-12', 1, 'Completed'),
('O014', 'C004', 'P001', '2026-03-18', 1, 'Completed'),
('O015', 'C005', 'P006', '2026-03-22', 2, 'Cancelled'),
('O016', 'C006', 'P004', '2026-04-05', 1, 'Completed'),
('O017', 'C007', 'P005', '2026-04-10', 1, 'Completed'),
('O018', 'C008', 'P009', '2026-04-15', 2, 'Completed'),
('O019', 'C009', 'P010', '2026-04-20', 3, 'Completed'),
('O020', 'C010', 'P007', '2026-04-25', 2, 'Completed');

SELECT * 
FROM Orders;
SELECT 
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Orders o
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed';
SELECT COUNT(*) AS Total_Completed_Orders
FROM Orders
WHERE Order_Status = 'Completed';
SELECT 
    AVG(p.Price * o.Quantity) AS Average_Order_Value
FROM Orders o
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed';
SELECT 
    c.State,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY c.State
ORDER BY Total_Sales DESC;
SELECT 
    p.Product_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Products p
JOIN Orders o
    ON p.Product_ID = o.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC;
SELECT 
    p.Category,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Products p
JOIN Orders o
    ON p.Product_ID = o.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY p.Category
ORDER BY Total_Sales DESC;
SELECT 
    c.Customer_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 1;
SELECT 
    c.Customer_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT 
    DATE_FORMAT(o.Order_Date, '%Y-%m') AS Sales_Month,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Orders o
JOIN Products p
    ON o.Product_ID = p.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY DATE_FORMAT(o.Order_Date, '%Y-%m')
ORDER BY Sales_Month;
SELECT 
    Order_Status,
    COUNT(*) AS Order_Count
FROM Orders
GROUP BY Order_Status;
SELECT 
    c.Customer_Name,
    COUNT(o.Order_ID) AS Order_Count
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Order_Count DESC;
SELECT 
    c.Customer_Name,
    COUNT(o.Order_ID) AS Order_Count
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Order_Count DESC;
SELECT
    p.Product_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Products p
JOIN Orders o
    ON p.Product_ID = o.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY p.Product_ID, p.Product_Name
HAVING SUM(p.Price * o.Quantity) > (
    SELECT AVG(Product_Sales)
    FROM (
        SELECT
            SUM(p2.Price * o2.Quantity) AS Product_Sales
        FROM Products p2
        JOIN Orders o2
            ON p2.Product_ID = o2.Product_ID
        WHERE o2.Order_Status = 'Completed'
        GROUP BY p2.Product_ID
    ) AS Average_Sales
)
ORDER BY Total_Sales DESC;
SELECT
    p.Product_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales,
    CASE
        WHEN SUM(p.Price * o.Quantity) >= 50000 THEN 'High'
        WHEN SUM(p.Price * o.Quantity) >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM Products p
JOIN Orders o
    ON p.Product_ID = o.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Sales DESC;
SELECT
    c.Customer_Name,
    c.State,
    o.Order_ID,
    o.Order_Date,
    o.Order_Status
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
ORDER BY o.Order_Date;

SELECT
    p.Category,
    p.Product_Name,
    SUM(p.Price * o.Quantity) AS Total_Sales
FROM Products p
JOIN Orders o
    ON p.Product_ID = o.Product_ID
WHERE o.Order_Status = 'Completed'
GROUP BY p.Category, p.Product_Name
ORDER BY p.Category, Total_Sales DESC;