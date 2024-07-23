
WITH TopFiveCustomers AS (
    SELECT CustomerID, SUM(Amount) AS TotalPaid
    FROM Payments
    GROUP BY CustomerID
    ORDER BY SUM(Amount) DESC
    LIMIT 5
)
SELECT AVG(TotalPaid) AS AveragePaid
FROM TopFiveCustomers;
