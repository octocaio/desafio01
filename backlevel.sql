-- legacy_procs.sql
-- SQL Server 2022 compatible stored procedures

USE [YourDatabase]
GO

-- Updated procedure using TOP clause instead of deprecated SET ROWCOUNT
CREATE PROCEDURE GetTopCustomers
AS
BEGIN
    SELECT TOP (10) CustomerID, CompanyName, ContactName
    FROM Customers
    ORDER BY CustomerID
END
GO

-- Procedure using VARCHAR(MAX) instead of deprecated TEXT datatype
CREATE PROCEDURE InsertLogEntry
    @LogText VARCHAR(MAX)
AS
BEGIN
    INSERT INTO LogTable (LogEntry)
    VALUES (@LogText)
END
GO

-- Procedure using modern explicit JOIN syntax
CREATE PROCEDURE GetOrderDetails
    @OrderID INT
AS
BEGIN
    SELECT o.OrderID, o.OrderDate, c.CustomerID, c.CompanyName
    FROM Orders o
    INNER JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE o.OrderID = @OrderID
END
GO

-- Procedure using SCOPE_IDENTITY() instead of deprecated @@IDENTITY
CREATE PROCEDURE AddNewProduct
    @ProductName NVARCHAR(50),
    @UnitPrice MONEY,
    @NewProductID INT OUTPUT
AS
BEGIN
    INSERT INTO Products (ProductName, UnitPrice)
    VALUES (@ProductName, @UnitPrice)
    
    SET @NewProductID = SCOPE_IDENTITY()
END
GO
