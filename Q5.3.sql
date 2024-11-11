WITH Sales AS (
    SELECT
        PRODUCT.Category AS Category,
        PRODUCT.Product_name AS Product_name,
        ROUND(SUM(INCLUDES.Quantity * PRODUCT.Price), 2) AS Total_sales
    FROM
        PRODUCT
    JOIN 
        INCLUDES ON PRODUCT.Product_number = INCLUDES.Product_number
    JOIN 
        ORDERS ON INCLUDES.Order_number = ORDERS.Order_number
    GROUP BY
        PRODUCT.Category, PRODUCT.Product_name
),
RankedSales AS (
    SELECT 
        Category,
        Product_name,
        Total_sales,
        RANK() OVER (PARTITION BY Category ORDER BY Total_sales DESC) AS Sales_rank
    FROM 
        Sales
)
SELECT
    Category,
    Product_name,
    Total_sales
FROM 
    RankedSales
WHERE 
    Sales_rank <= 2
ORDER BY 
    Category, Sales_rank;