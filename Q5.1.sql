SELECT 
    c.Name AS Customer_Name,
    c.Email AS Customer_Email,
    o.Order_number,
    o.Order_date,
    GROUP_CONCAT(p.Product_name) AS Product_List,
    o.Subtotal - o.Deduction_Promotion AS Total_Paid
FROM 
    CONSUMER AS c
JOIN 
    ORDERS AS o ON c.Email = o.Email
JOIN 
    includes AS i ON o.Order_number = i.Order_number
JOIN 
    PRODUCT AS p ON i.Product_number = p.Product_number
GROUP BY 
    c.Name, c.Email, o.Order_number, o.Order_date, o.Subtotal, o.Deduction_Promotion;