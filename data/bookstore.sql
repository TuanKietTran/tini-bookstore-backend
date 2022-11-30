CREATE DATABASE bookstore;
USE bookstore;

------------------ T?o b?ng-------------------

CREATE TABLE Employee
(
    SSN         CHAR(6),
    E_Name      VARCHAR(255) NOT NULL,
    City    VARCHAR(255) NOT NULL,
    District        VARCHAR(255) NOT NULL,
    StreetNum     VARCHAR(255) NOT NULL,
    E_Role      VARCHAR(255) NOT NULL,
    Email       VARCHAR(255) NOT NULL,
    Rate        DECIMAL(6,2) NOT NULL,
    Branch_ID   CHAR(6) NOT NULL,
    Phone       Varchar(255) NOT NULL,
    CONSTRAINT PK_SSN PRIMARY KEY (SSN)
);

CREATE TABLE Branch
(
    B_ID        CHAR(6),
    City    varchar(255) NOT NULL,
    District        varchar(255) NOT NULL,
    StreetNum     varchar(255) NOT NULL,
    Constraint PK_ID PRIMARY KEY (B_ID)
);

create table Is_stored
(
    Product_UUID    Char(6),
    Branch_ID       Char(6),
    Constraint PK_IS_STORED PRIMARY KEY (Product_UUID, Branch_ID)
);


create table Product_type
(
    Code    char(6),
    P_Description varchar(255),
    constraint PK_Product_type Primary key (Code, P_Description)
);

create table Product
(
    UUID        Char(6),
    P_Name      Varchar(255) NOT NULL,
    Price       decimal(10,2) NOT NULL,
    Discount    decimal(2,2) NOT NULL,
    Amount      decimal(10,0) NOT NULL,
    Product_type_code   char(6) NOT NULL,
    constraint PK_Product primary key (UUID)
);

create table Book
(
    Book_UUID char(6),
    IBSN    char(6),
    Publishing_year date,
    Publisher   varchar(255),
    constraint PK_BOOK primary key (Book_UUID)
);

create table Stationery
(
    Stationery_UUID char(6),
    Barcode    varchar(255),
    Distributor   varchar(255),
    constraint PK_Stationery primary key (Stationery_UUID)
);

create table Book_author
(
    UUID char(6),
    Author   varchar(255),
    constraint PK_Book_Author primary key (UUID, Author)
);

create table Included
(
    Product_UUID    char(6),
    Bill_ID char(6),
    Quantity decimal(5,0) NOT NULL,
    constraint PK_Included Primary key (Product_UUID, Bill_ID)
);

create table Bill
(
    B_ID char(6),
    City    VARCHAR(255) NOT NULL,
    District        VARCHAR(255) NOT NULL,
    StreetNum     VARCHAR(255) NOT NULL,
    Status      varchar(255) NOT NULL,
    Phone       char(11) NOT NULL,
    Email       varchar(255) NOT NULL,
    Customer_name varchar(255) NOT NULL,
    Payment_Method  varchar(255) NOT NULL,
    Total       decimal(5,0) NOT NULL,
    Customer_ID char(6) NOT NULL,
    constraint PK_Customer primary key (B_ID)
);

create table Customer
(
    C_ID char(6),
    C_Name    varchar(255) NOT NULL,
    City    VARCHAR(255) NOT NULL,
    District        VARCHAR(255) NOT NULL,
    StreetNum     VARCHAR(255) NOT NULL,
    Phone   char(11) NOT NULL,
    constraint PK_Customer primary key (C_ID)
);

create table C_Account
(
    UserName varchar(255),
    C_Password    varchar(255) NOT NULL,
    C_ID   char(6) NOT NULL,
    constraint PK_Account primary key (UserName)
);

-------------- T?o kh�a ngo?i ----------------------
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