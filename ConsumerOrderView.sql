CREATE VIEW ConsumerOrderView AS
SELECT 
    C.Email,
    C.Name,
    C.Country,
    C.Street,
    C.Postcode,
    C.Building,
    C.City,
    O.Order_number,
    O.Order_date,
    O.Product AS Product_list,
    O.Subtotal,
    O.Deduction_Promotion,
    O.Subtotal - O.Deduction_Promotion AS Grand_Total,
    O.Payment_ID
FROM 
    CONSUMER C
JOIN 
    ORDERS O ON C.Email = O.Email;