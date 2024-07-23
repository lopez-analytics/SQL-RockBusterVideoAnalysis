
WITH TopFiveCountries AS (
    SELECT Country, SUM(Amount) AS TotalPaid
    FROM Payments
    GROUP BY Country
    ORDER BY TotalPaid DESC
    LIMIT 5
),
TopFiveCities AS (
    SELECT City, SUM(Amount) AS TotalPaid
    FROM Payments
    WHERE Country IN (SELECT Country FROM TopFiveCountries)
    GROUP BY City
    ORDER BY TotalPaid DESC
    LIMIT 5
),
TopFiveCustomers AS (
    SELECT CustomerID, SUM(Amount) AS TotalPaid
    FROM Payments
    WHERE City IN (SELECT City FROM TopFiveCities)
    GROUP BY CustomerID
    ORDER BY TotalPaid DESC
    LIMIT 5
)
SELECT AVG(TotalPaid) AS AveragePaid
FROM TopFiveCustomers;
