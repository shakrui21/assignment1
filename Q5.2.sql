SELECT 
    CONSUMER.Email AS Customer_Email,
    CONSUMER.Name AS Customer_Name,
    CONSUMER.Birth_date AS Birthday,
    VOUCHERS_GIFT.Current_balance AS Gift_Card_Balance,
    BASKET.Product_list AS Basket_Products
FROM 
    CONSUMER
LEFT JOIN 
    PAYMENT ON CONSUMER.Email = PAYMENT.Email
LEFT JOIN 
    VOUCHERS_GIFT ON PAYMENT.Payment_ID = VOUCHERS_GIFT.Payment_ID
JOIN 
    BASKET ON CONSUMER.Email = BASKET.Email
WHERE 
    BASKET.Product_list IS NOT NULL;