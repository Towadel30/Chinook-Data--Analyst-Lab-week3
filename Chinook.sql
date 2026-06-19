SELECT * 
FROM Customer;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


SELECT TOP 5 *
FROM Customer;
SELECT TOP 5 *
FROM Invoice;
SELECT TOP 5 *
FROM InvoiceLine;
SELECT TOP 5 *
FROM Track;
SELECT TOP 5 *
FROM Album;
SELECT TOP 5 *
FROM Artist;
SELECT TOP 5 *
FROM Genre;
SELECT TOP 5 *
FROM Employee;
SELECT TOP 5 *
FROM MediaType;
SELECT TOP 5 *
FROM Playlist;
SELECT TOP 5 *
FROM PlaylistTrack;



SELECT 
    InvoiceId, 
    CustomerId, 
    InvoiceDate, 
    BillingCountry, 
    Total
FROM Invoice
WHERE Total > 10
ORDER BY Total DESC;



SELECT 
    BillingCountry,
    SUM(Total) AS Total_Revenue,
    AVG(Total) AS Average_Order_Value,
    COUNT(InvoiceId) AS Total_Orders
FROM Invoice
GROUP BY BillingCountry
ORDER BY Total_Revenue DESC;



SELECT 
    BillingCountry,
    SUM(Total) AS Total_Revenue,
    COUNT(InvoiceId) AS Total_Orders
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100
ORDER BY Total_Revenue DESC;


SELECT 
    c.CustomerId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i 
    ON c.CustomerId = i.CustomerId
ORDER BY i.Total DESC;

SELECT
    c.CustomerId,
    c.FirstName,
    i.InvoiceId
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId;

SELECT *
FROM Invoice
WHERE Total >
(
    SELECT AVG(Total)
    FROM Invoice
);


WITH CustomerSpending AS (
    SELECT 
        c.Country,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        SUM(i.Total) AS TotalSpent
    FROM Customer c
    INNER JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.Country, c.FirstName, c.LastName
)
SELECT 
    Country,
    CustomerName,
    TotalSpent,
    RANK() OVER (PARTITION BY Country ORDER BY TotalSpent DESC) AS SpendRankWithinCountry
FROM CustomerSpending
ORDER BY Country ASC, SpendRankWithinCountry ASC;


SELECT
    CustomerId,
    Total,
    ROW_NUMBER() OVER
    (
        ORDER BY Total DESC
    ) AS RowNum
FROM Invoice;


SELECT TOP 10
    t.Name AS TrackName,
    g.Name AS GenreName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue,
    COUNT(il.InvoiceLineId) AS TotalUnitsSold
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY t.Name, g.Name
ORDER BY TotalRevenue DESC;


CREATE INDEX idx_customer_country
ON Customer(Country);


SELECT name
FROM sys.indexes
WHERE object_id = OBJECT_ID('Customer');