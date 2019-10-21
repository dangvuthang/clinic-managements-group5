CREATE DATABASE ClinicManagement;
GO
USE ClinicManagement;
GO

CREATE TABLE [User](
	CustomerId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username varchar(50),
	[Password] varchar(50),
	[Name] varchar(50),
	Phone int,
	[Address] varchar(255),
	[Status] bit,	
);
GO

CREATE TABLE [Admin](
	AdminId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username varchar(50),
	[Password] varchar(50),
	[Name] varchar(50),
);
GO

CREATE TABLE Type(
	TypeId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] varchar(50),
)
GO

CREATE TABLE Product_Group(
	Product_GroupId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] varchar(50)
);
GO

CREATE TABLE Disease(
	DiseaseId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	TypeId int FOREIGN KEY REFERENCES Type(TypeId),
	[Name] varchar(50),
	[Image] varchar(255),
	[Description] varchar(255),
);
GO

CREATE TABLE Product(
	ProductId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Product_GroupId int FOREIGN KEY REFERENCES Product_Group(Product_GroupId),
	[Name] varchar(50),
	Price double,
	[Image] varchar(255),
	[Description] varchar(255),
	Popularity int DEFAULT 0,
);
GO

CREATE TABLE [Order](
	OrderId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerId int FOREIGN KEY REFERENCES [User](CustomerId),
	Destination varchar(250),
	OrderDate date,
	OrderTime time,
	OrderStatus bit,
	OrderTotal double
);
GO

CREATE TABLE OrderDetail(
	OrderDetailId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderId int FOREIGN KEY REFERENCES [Order](OrderId),
	ProductId int FOREIGN KEY REFERENCES Product(ProductId),
	Quantity int,
	OrderDetailTotal double, 
);
GO


