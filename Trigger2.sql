CREATE TRIGGER check_gift_card_balance_before_order
BEFORE INSERT ON ORDERS
FOR EACH ROW
WHEN (SELECT Payment_type FROM PAYMENT WHERE Payment_ID = NEW.Payment_ID) = 'VOUCHERS_GIFT'
BEGIN
    SELECT CASE
        WHEN (SELECT Current_balance FROM VOUCHERS_GIFT WHERE Payment_ID = NEW.Payment_ID) < NEW.Subtotal - NEW.Deduction_Promotion THEN
            RAISE(ABORT, 'Order total exceeds the gift card balance.')
    END;
END;