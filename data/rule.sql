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
        