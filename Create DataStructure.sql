CREATE TABLE CONSUMER
(
  Email VARCHAR(20) NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Birth_date DATE NOT NULL,
  Phone_number INT NOT NULL,
  Password VARCHAR(20) NOT NULL,
  Country VARCHAR(50) NOT NULL,
  Street VARCHAR(50) NOT NULL,
  Postcode VARCHAR(10) NOT NULL,
  Building VARCHAR(20) NOT NULL,
  City VARCHAR(20) NOT NULL,
  PRIMARY KEY (Email)
);

CREATE TABLE PRODUCT
(
  Product_number INT NOT NULL,
  Product_name VARCHAR(100) NOT NULL,
  Colour VARCHAR(50) NOT NULL,
  Brand VARCHAR(50) NOT NULL,
  Depth NUMERIC(10, 2) NOT NULL,
  Width NUMERIC(10, 2) NOT NULL,
  Height NUMERIC(10, 2) NOT NULL,
  Weight NUMERIC(10, 2) NOT NULL,
  Price NUMERIC(10, 2) NOT NULL,
  Warranty_period INT NOT NULL,
  Category VARCHAR(100) NOT NULL,
  Description VARCHAR(300) NOT NULL,
  availability INT NOT NULL,
  Stock INT NOT NULL,
  PRIMARY KEY (Product_number)
);

CREATE TABLE PAYMENT
(
  Payment_ID INT NOT NULL,
  Payment_type VARCHAR(30) NOT NULL,
  Email VARCHAR(20) NOT NULL,
  PRIMARY KEY (Payment_ID),
  FOREIGN KEY (Email) REFERENCES CONSUMER(Email)
);

CREATE TABLE CREDIT_DEBIT
(
  Card_number INT NOT NULL,
  Verification_code INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Is_default INT NOT NULL,
  Expiry_date DATE NOT NULL,
  Payment_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID),
  FOREIGN KEY (Payment_ID) REFERENCES PAYMENT(Payment_ID),
  UNIQUE (Card_number)
);

CREATE TABLE VOUCHERS_GIFT
(
  Serial_number INT NOT NULL,
  Total_amount INT NOT NULL,
  Current_balance INT NOT NULL,
  Expiry_date DATE NOT NULL,
  Payment_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID),
  FOREIGN KEY (Payment_ID) REFERENCES PAYMENT(Payment_ID),
  UNIQUE (Serial_number)
);

CREATE TABLE BASKET
(
  Product_list VARCHAR(200) NOT NULL,
  Basket_ID INT NOT NULL,
  Email VARCHAR(20) NOT NULL,
  PRIMARY KEY (Basket_ID),
  FOREIGN KEY (Email) REFERENCES CONSUMER(Email)
);

CREATE TABLE ORDERS
(
  Order_number INT NOT NULL,
  Order_date DATE NOT NULL,
  Product VARCHAR NOT NULL,
  Subtotal NUMERIC(10,2) NOT NULL,
  Deduction_Promotion NUMERIC(10,2) NOT NULL,
  Email VARCHAR(20) NOT NULL,
  Payment_ID INT NOT NULL,
  PRIMARY KEY (Order_number),
  FOREIGN KEY (Email) REFERENCES CONSUMER(Email),
  FOREIGN KEY (Payment_ID) REFERENCES PAYMENT(Payment_ID)
);

CREATE TABLE DELIVERY
(
  Track_number INT NOT NULL,
  Delivery_date DATE NOT NULL,
  Customer_address VARCHAR(50) NOT NULL,
  Delivered INT NOT NULL,
  Postponed INT NOT NULL,
  Cancelled INT NOT NULL,
  Pending INT NOT NULL,
  Order_number INT NOT NULL,
  PRIMARY KEY (Track_number),
  FOREIGN KEY (Order_number) REFERENCES ORDERS(Order_number)
);

CREATE TABLE RETURN
(
  Ticket_number INT NOT NULL,
  Start_date DATE NOT NULL,
  Due_date DATE NOT NULL,
  Refund_total NUMERIC(10, 2) NOT NULL,
  Completed INT NOT NULL,
  Cancelled INT NOT NULL,
  Denied INT NOT NULL,
  Pending INT NOT NULL,
  Order_number INT NOT NULL,
  PRIMARY KEY (Ticket_number),
  FOREIGN KEY (Order_number) REFERENCES ORDERS(Order_number)
);

CREATE TABLE REVIEW
(
  Review_number INT NOT NULL,
  Review_date DATE NOT NULL,
  Product_name VARCHAR(20) NOT NULL,
  Text VARCHAR(200) NOT NULL,
  Ranking INT NOT NULL,
  Email VARCHAR(20) NOT NULL,
  Product_number INT NOT NULL,
  PRIMARY KEY (Review_number),
  FOREIGN KEY (Email) REFERENCES CONSUMER(Email),
  FOREIGN KEY (Product_number) REFERENCES PRODUCT(Product_number)
);

CREATE TABLE contains
(
  Respective_quantity INT NOT NULL,
  Basket_ID INT NOT NULL,
  Product_number INT NOT NULL,
  PRIMARY KEY (Basket_ID, Product_number),
  FOREIGN KEY (Basket_ID) REFERENCES BASKET(Basket_ID),
  FOREIGN KEY (Product_number) REFERENCES PRODUCT(Product_number)
);

CREATE TABLE includes
(
  Quantity INT NOT NULL,
  Order_number INT NOT NULL,
  Product_number INT NOT NULL,
  PRIMARY KEY (Order_number, Product_number),
  FOREIGN KEY (Order_number) REFERENCES ORDERS(Order_number),
  FOREIGN KEY (Product_number) REFERENCES PRODUCT(Product_number)
);