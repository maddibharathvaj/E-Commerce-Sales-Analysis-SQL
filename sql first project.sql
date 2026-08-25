CREATE DATABASE employee_project;
USE employee_project;
CREATE TABLE Employees (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30),
    Experience INT
);
INSERT INTO Employees 
(Employee_ID, Employee_Name, Department, Salary, City, Experience)
VALUES
('E001', 'Anjali', 'HR', 45000, 'Hyderabad', 2),
('E002', 'Kiran', 'IT', 95000, 'Bangalore', 5),
('E003', 'Priya', 'IT', 85000, 'Hyderabad', 4),
('E004', 'Ravi', 'Finance', 60000, 'Chennai', 3),
('E005', 'Suresh', 'IT', 75000, 'Pune', 2),
('E006', 'Meena', 'HR', 50000, 'Hyderabad', 3),
('E007', 'Ravi', 'Sales', 55000, 'Mumbai', 4);

SELECT * FROM Employees;
SELECT *
FROM Employees
WHERE Department = 'IT';
SELECT MAX(Salary) AS Highest_Salary
FROM Employees;
SELECT Employee_Name, Department, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1;
SELECT Employee_Name, Department, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1;
SELECT AVG(Salary) AS Average_Salary
FROM Employees;
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department;
SELECT Department, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department;
SELECT Employee_Name, Department, Salary
FROM Employees
WHERE Salary > 70000;
SELECT Employee_Name, Department, Salary
FROM Employees
WHERE Salary BETWEEN 50000 AND 80000;
SELECT Employee_Name, Department, Salary, City
FROM Employees
WHERE City = 'Hyderabad';
SELECT Employee_Name, Department, Salary
FROM Employees
ORDER BY Salary DESC;
SELECT MIN(Salary) AS Lowest_Salary
FROM Employees;
SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department;
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 60000;
SELECT Department, MAX(Salary) AS Highest_Salary
FROM Employees
GROUP BY Department;
SELECT City, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY City
ORDER BY Employee_Count DESC;
SELECT Employee_Name, Department, Experience, Salary
FROM Employees
WHERE Experience >= 4;
SELECT 
    Employee_Name,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN 'High'
        WHEN Salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM Employees;
SELECT Employee_Name, Department, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);