--Creating a database named "ECom_Sales" using system based database 'Master'.
CREATE DATABASE ECom_Sales
--Using Database "ECom_Sales" directly from database 'Master'.
USE ECom_Sales
--Importing a table "Cleaned_Data" from a csv file and displaying it.
SELECT * FROM Cleaned_Data;

--Now using this data set for QUERIES to find insights from Cleaned_Data.

--1) Finding total revenue generated and total quantity purchased.
SELECT
    SUM(Total_Price) AS Total_Revenue,
    SUM(Quantity) AS Total_Quantity_Purchased
FROM Cleaned_Data;

--2) Finding top 2 products with highest revenue and quantity purchased.
SELECT TOP 2
    Product,
    SUM(Quantity) AS Total_Purchase,
    SUM(Total_Price) AS Revenue
FROM Cleaned_Data
GROUP BY Product
ORDER BY Revenue DESC;

--3) Finding least purchased product with revenue.
SELECT TOP 1
    Product,
    SUM(Quantity) AS Total_Purchase,
    SUM(Total_Price) AS Revenue
FROM Cleaned_Data
GROUP BY Product
ORDER BY Revenue ASC;

--4) Finding which referral source has generated highest revenue.
SELECT TOP 1
    Referral_Source,
    SUM(Total_Price) AS Revenue
FROM Cleaned_Data
GROUP BY Referral_Source
ORDER BY Revenue DESC;

--Also finding total orders by each referral source.
SELECT
    Referral_Source,
    COUNT(*) AS Total_Orders
FROM Cleaned_Data
WHERE Total_Price > 1000
GROUP BY Referral_Source
ORDER BY Total_Orders DESC;

--5) Finding average quantity purchased by each product.
SELECT
    Product,
    AVG(CAST(Quantity AS DECIMAL(10,2))) AS Average_Quantity_Ordered
FROM Cleaned_Data
GROUP BY Product
ORDER BY Average_Quantity_Ordered DESC;

--6) Finding total numbers of Order placed and Order status.
SELECT COUNT (Order_Id) AS Total_Orders FROM Cleaned_Data;
SELECT Order_Status,COUNT(*) AS Total_Orders
FROM Cleaned_Data
GROUP BY Order_Status
ORDER BY Total_Orders DESC;

--7) Finding yearly sales.
SELECT
    YEAR([Date]) AS Order_Year,
    COUNT(*) AS Total_Orders,
    SUM(Total_Price) AS Total_Revenue
FROM Cleaned_Data
GROUP BY YEAR([Date])
ORDER BY Total_Revenue DESC;

--8) Finding average unit price.
SELECT
    AVG(Unit_Price) AS Average_Unit_Price
FROM Cleaned_Data;

--9) Finding number of orders with 'No Coupon'
SELECT COUNT(*) AS No_Coupon_Usage
FROM Cleaned_Data
WHERE Coupon_Code = 'NO_COUPON';

--10) Find the number of count of each payment method
SELECT
    Payment_Method,
    COUNT(*) AS Payment_Method_Count
FROM Cleaned_Data
GROUP BY  Payment_Method
ORDER BY Payment_Method_Count DESC;

--End of Analysis.