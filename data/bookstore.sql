CREATE DATABASE bookstore;
USE bookstore;

------------------ Tạo bảng-------------------

CREATE TABLE Employee
(
    E_ID                CHAR(3) NOT NULL
    SSN                 CHAR(12) NOT NULL UNIQUE,
    E_Name              VARCHAR(50) NOT NULL,
    City                VARCHAR(50) NOT NULL,
    District            VARCHAR(50) NOT NULL,
    StreetNum           VARCHAR(50) NOT NULL,
    E_Role              VARCHAR(50) NOT NULL,
    Email               VARCHAR(50) NOT NULL,
    Rate                DECIMAL(6,2) NOT NULL,
    Branch_ID           CHAR(6) NOT NULL,
    Phone               VARCHAR(50) NOT NULL,
    CONSTRAINT PK_SSN PRIMARY KEY (E_ID)
);

CREATE TABLE Branch
(
    B_ID                CHAR(3),
    City                VARCHAR(50) NOT NULL,
    District            VARCHAR(50) NOT NULL,
    StreetNum           VARCHAR(50) NOT NULL,
    Constraint PK_ID PRIMARY KEY (B_ID)
);

create table Is_stored
(
    Product_UUID        CHAR(3),
    Branch_ID           CHAR(3),
    Constraint PK_IS_STORED PRIMARY KEY (Product_UUID, Branch_ID)
);


create table Product_type
(
    Code                CHAR(6),
    P_Description       VARCHAR(50),
    constraint PK_Product_type Primary key (Code, P_Description)
);

create table Product
(
    UUID                CHAR(6),
    P_Name              VARCHAR(50) NOT NULL,
    Price               DECIMAL(10,2) NOT NULL,
    Discount            DECIMAL(2,2) NOT NULL,
    Amount              DECIMAL(10,0) NOT NULL,
    Product_type_code   CHAR(6) NOT NULL,
    constraint PK_Product primary key (UUID)
);

create table Book
(
    Book_UUID           CHAR(6),
    IBSN                CHAR(6),
    Publishing_year     DATE,
    Publisher           VARCHAR(50),
    constraint PK_BOOK primary key (Book_UUID)
);

create table Stationery
(
    Stationery_UUID     CHAR(6),
    Barcode             VARCHAR(50),
    Distributor         VARCHAR(50),
    constraint PK_Stationery primary key (Stationery_UUID)
);

create table Book_author
(
    UUID                CHAR(6),
    Author              VARCHAR(50),
    constraint PK_Book_Author primary key (UUID, Author)
);

create table Included
(
    Product_UUID        CHAR(6),
    Bill_ID             CHAR(6),
    Quantity            DECIMAL(5,0) NOT NULL,
    constraint PK_Included Primary key (Product_UUID, Bill_ID)
);

create table Bill
(
    B_ID                CHAR(6),
    City                VARCHAR(50) NOT NULL,
    District            VARCHAR(50) NOT NULL,
    StreetNum           VARCHAR(50) NOT NULL,
    Status              VARCHAR(50) NOT NULL,
    Phone               CHAR(11) NOT NULL,
    Email               VARCHAR(50) NOT NULL,
    Customer_name       VARCHAR(50) NOT NULL,
    Payment_Method      VARCHAR(50) NOT NULL,
    Total               DECIMAL(5,0) NOT NULL,
    Customer_ID         CHAR(6) NOT NULL,
    constraint PK_Customer primary key (B_ID)
);

create table Customer
(
    C_ID                CHAR(6),
    C_Name              VARCHAR(50) NOT NULL,
    City                VARCHAR(50) NOT NULL,
    District            VARCHAR(50) NOT NULL,
    StreetNum           VARCHAR(50) NOT NULL,
    Phone               CHAR(11) NOT NULL,
    constraint PK_Customer primary key (C_ID)
);

create table C_Account
(
    UserName            VARCHAR(50),
    C_Password          VARCHAR(50) NOT NULL,
    C_ID                CHAR(6) NOT NULL,
    constraint PK_Account primary key (UserName)
);

-------------- Tạo khoá ngoại ----------------------
ALTER TABLE Employee
    ADD (
            CONSTRAINT FK_Employee_Branch FOREIGN KEY(Branch_ID) REFERENCES Branch(B_ID)
        );
        
ALTER TABLE Is_stored
    ADD (
            CONSTRAINT FK_Is_stored_Branch FOREIGN KEY(Branch_ID) REFERENCES Branch(B_ID),
            CONSTRAINT FK_Is_stored_Product FOREIGN KEY(Product_UUID) REFERENCES Product(UUID)
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
        
ALTER TABLE Book_author
    ADD (
            CONSTRAINT FK_Book_Author_Book FOREIGN KEY(UUID) REFERENCES Book(Book_UUID)
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
        
ALTER TABLE C_Account
    ADD (
            CONSTRAINT FK_C_Account_Customer FOREIGN KEY(C_ID) REFERENCES Customer(C_ID)
        ); 