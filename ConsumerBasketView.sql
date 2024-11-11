CREATE VIEW Consumer_Basket_View AS
SELECT 
    CONSUMER.Email AS Consumer_Email,
    CONSUMER.Name AS Consumer_Name,
    BASKET.Product_list AS Basket_Contents,
    BASKET.Basket_ID AS Basket_ID
FROM 
    CONSUMER
JOIN 
    BASKET ON CONSUMER.Email = BASKET.Email