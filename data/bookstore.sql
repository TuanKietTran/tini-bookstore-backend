CREATE DATABASE bookstore;
USE bookstore;

------------------bang-------------------

create table Product_type--done
(
    Code                CHAR(6),
    P_Description       VARCHAR(300),
    constraint PK_Product_type Primary key (Code, P_Description)
);

create table Product --done
(
    UUID                CHAR(6),
    P_Name              VARCHAR(300) NOT NULL,
    Price               DECIMAL(10,2) NOT NULL,
    Discount            DECIMAL(2,2) NOT NULL,
    Amount              DECIMAL(10,0) NOT NULL,
    Cover               VARCHAR(300), 
    Product_type_code   CHAR(6) NOT NULL,
    constraint PK_Product primary key (UUID)
);

create table Book --done
(
    Book_UUID           CHAR(6),
    IBSN                CHAR(6),
    Authors             VARCHAR(300),
    Publishing_year     DATE,
    Publisher           VARCHAR(300),
    constraint PK_BOOK primary key (Book_UUID)
);

create table Stationery --done
(
    Stationery_UUID     CHAR(6),
    Barcode             VARCHAR(300),
    Distributor                 VARCHAR(300),
    constraint PK_Stationery    primary key (Stationery_UUID)
);

create table Included--done
(
    Product_UUID        CHAR(6),
    Bill_ID             CHAR(6),
    Quantity            DECIMAL(5,0) NOT NULL,
    constraint PK_Included Primary key (Product_UUID, Bill_ID)
);

create table Bill--done
(
    B_ID                CHAR(6),
    City                VARCHAR(300) NOT NULL,
    District            VARCHAR(300) NOT NULL,
    StreetNum           VARCHAR(300) NOT NULL,
    Status              VARCHAR(300) NOT NULL,
    Phone               CHAR(11) NOT NULL,
    Email               VARCHAR(300) NOT NULL,
    Customer_name       VARCHAR(300) NOT NULL,
    Payment_Method      VARCHAR(300) NOT NULL
    Customer_ID         CHAR(6) NOT NULL,
    constraint PK_Customer primary key (B_ID)
);

);

--------------Khoa ngoai ----------------------
ALTER TABLE Employee
    ADD (
            CONSTRAINT FK_Employee_Branch FOREIGN KEY(Branch_ID) REFERENCES Branch(B_ID)
        );
        
ALTER TABLE Product
    ADD (
            CONSTRAINT FK_Product_Product_type FOREIGN KEY(Product_type_code) REFERENCES Product_type(Code)
        );
        
ALTER TABLE Book
    ADD (
            CONSTRAINT FK_Book_Product FOREIGN KEY(Book_UUID) REFERENCES Product(UUID)
        );
        
ALTER TABLE Stationery
    ADD (
            CONSTRAINT FK_Stationery_Product FOREIGN KEY(Stationery_UUID) REFERENCES Product(UUID)
        );
         
        
ALTER TABLE Included
    ADD (
            CONSTRAINT FK_Included_Product FOREIGN KEY(Product_UUID) REFERENCES Product(UUID),
            CONSTRAINT FK_Included_Bill FOREIGN KEY(Bill_ID) REFERENCES Bill(B_ID)
        );
        
ALTER TABLE Bill
    ADD (
            CONSTRAINT FK_Bill_Customer FOREIGN KEY(Customer_ID) REFERENCES Customer(C_ID)
        );
        