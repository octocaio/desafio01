-- legacy_procs.sql
-- SQL Server 2000 style stored procedures

USE [YourDatabase]
GO

-- Old-style procedure with deprecated SET ROWCOUNT
CREATE PROCEDURE GetTopCustomers
AS
BEGIN
    SET ROWCOUNT 10
    SELECT CustomerID, CompanyName, ContactName
    FROM Customers
    ORDER BY CustomerID
    SET ROWCOUNT 0
END
GO

-- Procedure using text datatype (deprecated)
CREATE PROCEDURE InsertLogEntry
    @LogText TEXT
AS
BEGIN
    INSERT INTO LogTable (LogEntry)
    VALUES (@LogText)
END
GO

-- Procedure using old JOIN syntax
CREATE PROCEDURE GetOrderDetails
    @OrderID INT
AS
BEGIN
    SELECT o.OrderID, o.OrderDate, c.CustomerID, c.CompanyName
    FROM Orders o, Customers c
    WHERE o.OrderID = @OrderID AND o.CustomerID = c.CustomerID
END
GO

-- Procedure using @@IDENTITY (deprecated in favor of SCOPE_IDENTITY())
CREATE PROCEDURE AddNewProduct
    @ProductName NVARCHAR(50),
    @UnitPrice MONEY
AS
BEGIN
    INSERT INTO Products (ProductName, UnitPrice)
    VALUES

