select * from online_retail;

SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalOrderValue
FROM online_retail
GROUP BY CustomerID
ORDER BY TotalOrderValue DESC;

SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProducts
FROM online_retail
GROUP BY CustomerID
ORDER BY UniqueProducts DESC;

SELECT CustomerID, COUNT(InvoiceNo) AS PurchaseCount
FROM online_retail
GROUP BY CustomerID
HAVING PurchaseCount = 1;

SELECT T1.StockCode AS Product1, T2.StockCode AS Product2, COUNT(*) AS PurchaseCount
FROM online_retail1
JOIN online_retai2
ON T1.InvoiceNo = T2.InvoiceNo AND T1.StockCode < T2.StockCode
GROUP BY Product1, Product2
ORDER BY PurchaseCount DESC;

-- advance
SELECT CustomerID,
       CASE 
           WHEN COUNT(InvoiceNo) > 50 THEN 'High'
           WHEN COUNT(InvoiceNo) BETWEEN 10 AND 50 THEN 'Medium'
           ELSE 'Low'
       END AS FrequencySegment
FROM online_retail
GROUP BY CustomerID;

SELECT Country, AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM online_retail
GROUP BY Country
ORDER BY AvgOrderValue DESC;

SELECT CustomerID, MAX(InvoiceDate) AS LastPurchaseDate
FROM online_retail
GROUP BY CustomerID
HAVING LastPurchaseDate < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT T1.StockCode AS Product1, T2.StockCode AS Product2, COUNT(*) AS Frequency
FROM Transactions T1
JOIN Transactions T2 ON T1.InvoiceNo = T2.InvoiceNo AND T1.StockCode < T2.StockCode
GROUP BY Product1, Product2
ORDER BY Frequency DESC;

SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, SUM(Quantity * UnitPrice) AS TotalSales
FROM online_retail
GROUP BY Year, Month
ORDER BY Year, Month;


