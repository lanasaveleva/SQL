-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bwjTRq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Customer` (
    `CustomerID` int  NOT NULL ,
    `Customer_name` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`
    )
);

CREATE TABLE `Invoices` (
    `invoice_ID` int  NOT NULL ,
    `CustomerID` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    `ProductID` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `invoice_ID`
    )
);

CREATE TABLE `Address` (
    `Address_id` int  NOT NULL ,
    `CustomerID` int  NOT NULL ,
    `Address_name` varchar(200)  NOT NULL ,
    `Quantity` int  NOT NULL ,
    PRIMARY KEY (
        `Address_id`,`CustomerID`
    )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE `SKU` (
    `ProductID` int  NOT NULL ,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    `product_name` varchar(200)  NOT NULL ,
    `product_group_id` varchar(20)  NOT NULL ,
    `price` int ,
    PRIMARY KEY (
        `ProductID`
    ),
    CONSTRAINT `uc_SKU_product_name` UNIQUE (
        `product_name`
    )
);

CREATE TABLE `Deliveries` (
    `Invoice_id` int  NOT NULL ,
    `Delivery_id` varchar(50)  NOT NULL ,
    `Driver_name` varchar(200)  NOT NULL ,
    `Date` date  NOT NULL ,
    PRIMARY KEY (
        `Invoice_id`
    )
);

CREATE TABLE `Product_group` (
    `Group_id` int  NOT NULL ,
    `Group_name` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `Group_id`
    ),
    CONSTRAINT `uc_Product_group_Group_name` UNIQUE (
        `Group_name`
    )
);

ALTER TABLE `Customer` ADD CONSTRAINT `fk_Customer_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `Address` (`CustomerID`);

ALTER TABLE `Invoices` ADD CONSTRAINT `fk_Invoices_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `Invoices` ADD CONSTRAINT `fk_Invoices_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `SKU` (`ProductID`);

ALTER TABLE `SKU` ADD CONSTRAINT `fk_SKU_product_group_id` FOREIGN KEY(`product_group_id`)
REFERENCES `Product_group` (`Group_id`);

ALTER TABLE `Deliveries` ADD CONSTRAINT `fk_Deliveries_Invoice_id` FOREIGN KEY(`Invoice_id`)
REFERENCES `Invoices` (`invoice_ID`);

CREATE INDEX `idx_Customer_Name`
ON `Customer` (`Name`);

