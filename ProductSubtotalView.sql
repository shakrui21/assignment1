CREATE VIEW Product_Subtotal_View AS
SELECT 
    Product_number,
    Product_name,
    Price AS Base_Price,
    Price * 1.2 AS Subtotal  -- Adds £5 shipping and applies 20% VAT
FROM 
    PRODUCT;