WITH MonthlySales AS (
    SELECT
        STRFTIME('%Y', O.Order_date) AS Year,
        STRFTIME('%m', O.Order_date) AS Month,
        ROUND(SUM(O.Subtotal - COALESCE(R.Refund_total, 0)), 2) AS Total_sales
    FROM
        ORDERS O
    LEFT JOIN 
        RETURN R ON O.Order_number = R.Order_number
    GROUP BY
        Year, Month
),
SalesWithGrowth AS (
    SELECT
        Year,
        Month,
        Total_sales,
        LAG(Total_sales) OVER (ORDER BY Year, Month) AS Prev_month_sales
    FROM 
        MonthlySales
)
SELECT
    Year,
    Month,
    Total_sales,
    CASE
        WHEN Prev_month_sales IS NULL THEN NULL
        ELSE ROUND(((Total_sales - Prev_month_sales) / Prev_month_sales) * 100, 2)
    END AS Sales_growth_percentage
FROM 
    SalesWithGrowth
ORDER BY 
    Year, Month;