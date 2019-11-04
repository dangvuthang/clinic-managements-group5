CREATE DATABASE ClinicManagement;
GO
USE ClinicManagement;
GO

CREATE TABLE [User] (
	UserId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username varchar(50),
	[Password] varchar(50),
	[Name] varchar(50),
	Phone int,
	[Address] varchar(255),
	[Active] bit DEFAULT 1,	
);
GO

CREATE TABLE [Admin](
	AdminId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username varchar(50),
	[Password] varchar(50),
	[Name] varchar(50),
);
GO

Create Table [Type] (
	TypeId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	TypeName varchar(255)
)


 
CREATE TABLE [Order] (
	OrderId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	UserId int FOREIGN KEY REFERENCES [User](UserId),
	Destination varchar(250),
	OrderDate date,
	OrderTime time,
	OrderStatus bit,
	OrderTotal int,
	Comment varchar(255)
);
GO



CREATE TABLE Product (
	ProductId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductType varchar(255),
	TypeId int FOREIGN KEY REFERENCES Type(TypeId),
	Code varchar(255),
	[Name] varchar(50),
	Price decimal,
	[Image] varchar(255),
	[Description] varchar(255),
	Popularity int DEFAULT 0,
);
GO

CREATE TABLE Feedback (
	FeedbackId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderId int FOREIGN KEY REFERENCES [Order](OrderId),
	ProductId int FOREIGN KEY REFERENCES [Product](ProductId),
	CustomerId int FOREIGN KEY REFERENCES [User](UserId),
	Content varchar(255)
)
GO
CREATE TABLE OrderDetail (
	OrderDetailId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderId int FOREIGN KEY REFERENCES [Order](OrderId),
	ProductId int FOREIGN KEY REFERENCES Product(ProductId),
	Quantity int,
	OrderDetailTotal int
);
GO

CREATE TABLE Speaker (
	SpeakerId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] varchar(255),
	Degree varchar(255),
	Occupation varchar(255)
)
GO

CREATE TABLE Workshop (
	WorkshopId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	SpeakerId int FOREIGN KEY REFERENCES Speaker(SpeakerId),
	WorkshopName varchar(255),
	[Description] varchar(255),
	WorkshopDate date,
	WorkshopTime time
)

CREATE TABLE Contact (
	ContactId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	UserId int FOREIGN KEY REFERENCES [User](UserId),
	[Subject] varchar(255),
	[Message] varchar(255)
)
GO




INSERT INTO Type(TypeName)
VALUES('Tablet'),
	  ('Capsules'),
	  ('Liquid'),
	  ('Drops');
GO


