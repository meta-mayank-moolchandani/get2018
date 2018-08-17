CREATE DATABASE storefront;

USE storefront;

CREATE TABLE USER_(
    UserID INT AUTO_INCREMENT,
    Email VARCHAR(100) NOT NULL UNIQUE,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DOB DATE,
    Password VARCHAR(25),
    Role VARCHAR(10) DEFAULT "shopper",
    PRIMARY KEY (UserID)
);

CREATE TABLE ADDRESS(
AddressID INT PRIMARY KEY,
City VARCHAR(50),
Location VARCHAR(500),
ZipCode INT,
PhoneNo VARCHAR(10),
State VARCHAR(30)
);


CREATE TABLE SHOPPER(
  ShopperID INT PRIMARY KEY AUTO_INCREMENT,
  UserID   INT  UNIQUE KEY,
  FOREIGN KEY (UserID) REFERENCES User_(UserID)
  );
  
CREATE TABLE ADDRESS_SHOPPER(
ID INT PRIMARY KEY,
AddressID INT,
ShopperID INT,
FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID),
FOREIGN KEY (ShopperID) REFERENCES SHOPPER(ShopperID)
);

CREATE TABLE CATEGORY(
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(100),
    ParentCategory INT DEFAULT 0
);


CREATE TABLE PRODUCT(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Brand VARCHAR(100),
    Cost FLOAT(10,2) NOT NULL,
    Quantity INT,
    Description VARCHAR(300),
    IsActive BOOLEAN DEFAULT false
);


CREATE TABLE PRODUCT_CATEGORY(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE IMAGE(
   ImageID INT AUTO_INCREMENT PRIMARY KEY,
   ImageURL VARCHAR(100),
   ImageName VARCHAR(50)
   );
   
CREATE TABLE PRODUCT_IMAGE(
   ID INT AUTO_INCREMENT PRIMARY KEY,
   ProductID INT NOT NULL,
   ImageID INT NOT NULL,
   FOREIGN KEY (ImageID) REFERENCES IMAGE(ImageID),
   FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);


CREATE TABLE ORDER_(
   OrderID INT AUTO_INCREMENT PRIMARY KEY,
   PlacedDate DATE,
   ExpectedDeliveryDate DATE,
   ShopperID INT,
   FOREIGN KEY (ShopperID) REFERENCES SHOPPER(ShopperID)
   );
   

CREATE TABLE PRODUCT_ORDER(
   ID INT PRIMARY KEY AUTO_INCREMENT,
   OrderID INT,
   ProductID INT,
   ProductDeliveryTime DATE,
   ProductActualDeliveryTime DATE,
   IsDelivered BOOLEAN DEFAULT false,
   State VARCHAR(15) DEFAULT "Order Placed",
    FOREIGN KEY (OrderID) REFERENCES ORDER_(OrderID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

SHOW tables;

DROP TABLE PRODUCT_CATEGORY;
DROP TABLE PRODUCT_ORDER;
DROP TABLE PRODUCT_IMAGE;
DROP TABLE PRODUCT;

SHOW tables;

CREATE TABLE PRODUCT(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Brand VARCHAR(100),
    Cost FLOAT(10,2) NOT NULL,
    Quantity INT,
    Description VARCHAR(300)
);


CREATE TABLE PRODUCT_CATEGORY(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE PRODUCT_IMAGE(
   ID INT AUTO_INCREMENT PRIMARY KEY,
   ProductID INT NOT NULL,
   ImageID INT NOT NULL,
   FOREIGN KEY (ImageID) REFERENCES IMAGE(ImageID),
   FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE PRODUCT_ORDER(
   ID INT PRIMARY KEY AUTO_INCREMENT,
   OrderID INT,
ProductID INT,

   ProductDeliveryTime DATE,
   ProductActualDeliveryTime DATE,
   IsDelivered BOOLEAN DEFAULT false,
   State VARCHAR(15) DEFAULT "Order Placed",
   FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
   FOREIGN KEY (OrderID) REFERENCES ORDER_(OrderID)
);

SHOW tables;