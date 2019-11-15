USE master
GO
CREATE DATABASE ClinicManagement;
GO
USE ClinicManagement;
GO

CREATE TABLE [User] (
	UserId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Email varchar(50),
	[Password] varchar(50),
	[Name] varchar(50),
	IsBoy bit,
	Phone varchar(50),
	[Address] varchar(255),
	Active bit DEFAULT 1,	
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
	--ProductType Machine OR Medicine
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

SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name]) VALUES (1, N'PhucAnh', N'123456789', N'Phuc')
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name]) VALUES (2, N'HuuThang', N'123456', N'Thang')
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name]) VALUES (5, N'Phuc', N'123456789', N'PhucEm')
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name]) VALUES (7, N'Aquarrrr', N'123456', N'Aqarrrr')
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name]) VALUES (8, N'Phuc123', N'123456', N'Phuc')


INSERT INTO Type(TypeName)
VALUES('Tablet'),
	  ('Capsules'),
	  ('Cream'),
	  ('Syrup'),
	  ('Spray')
GO


INSERT [dbo].[Product] ([ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) 
VALUES  ('Medicines', 1, '101', 'Felodipin Stada 5mg retad', 20, N'FelodipinStada5mgretad.png', N'Felodipine : 5mg', 100),

	    ('Medicines', 1, '103', 'Dorobay 50mg', 12, 'Dorobay.png', 'Acarbose 50mg', 25),

	    ('Medicines', 1, '104', 'Meflavon', 24, 'Meflavon.png', 'Rutin 500mg', 52),

	    ('Medicines', 1, '105', 'Tuspi', 30, 'Tuspi.png', 'Acetaminophen', 60),

	    ('Medicines', 2, N'113', N'Acebutolol Hydrochloride', 51, 'AcebutololHydrochloride.png', N'Acebutolol Hydrochloride 200mg/1', 22),

	    ('Medicines', 2, N'152', N'Aggrenox', 51, 'Aggrenox.png', 'Aspirin 25mg/1 Dipyridamole 200mg/1', 44),

		('Medicines', 2, N'153', N'Agi-Lanso', 11, N'Agi-Lanso.png', N'Lansoprazole 30mg', 72),

		('Medicines', 2, N'154', N'Agi-Tyfedol 500', 8, N'Agi-Tyfedol.png', N'Acetaminophen 500mg', 92),

		('Medicines', 2, N'155', N'Agicetam', 6, N'Agicetam.png', N'Piracetam 400mg', 87),

		('Medicines', 2, N'156', N'999 Ganmaoling', 12, N'999Ganmaoling.png', N'Acetaminophen 100mg/1 Caffeine 2mg/1 Chlorpheniramine Maleate 2mg/1', 62),

		('Medicines', 2, N'157', N'Agifamcin 300 ', 39, N'Agifamcin300.png', N'Rifampin 300mg', 55),
		(N'Medicines', 3, N'108', N'Cortipharm', 72, N'Cortipharm.png', N'Chloramphenicol 160mg,Dexamethasone Acetate 4mg', 55),

		(N'Medicines', 3, N'109', N'3Lab Aqua BB SPF 40 Broad Spectrum 01', 91, N'3LabAquaBBSPF40BroadSpectrum01.png', N'Titanium Dioxide 78,6mg/ml', 51),

		(N'Medicines', 3, N'111', N'3mCavilon Antifungal', 14, N'3mCavilonAntifungal.png', N'Miconazole Nitrate 2g/1000g,', 50),

		( N'Medicines', 3, N'116', N'Acella Hydrocortisone Acetate - Pramoxine Singles', 25, N'AcellaHydrocortisoneAcetate.png', N'Hydrocortionse Acetate 2.5g/100g, Pramoxine 1g/100g', 77),

		(N'Medicines', 3, N'142', N'Cyclovir Cream', 5, N'CyclovirCream.png', N'Acyclovir Sodium 250mg', 40),

		(N'Medicines', 3, N'149', N'Advanced Cell Boosting Ex Day', 7, N'AdvancedCellBoosting.png', N'Dimethicone 1,375/55mL', 25),

		(N'Medicines', 4, N'146', N'Adult Tussin ', 61, N'AdultTussin.png', N'Guaifenesin 100mg/5mL', 22),

		(N'Medicines', 4, N'147', N'Adult Tussin Cough ', 43, N'AdultTussinCough.png', N'Dextromethorphan Hydrobromide 30mg/10mL', 43),

		(N'Medicines', 4, N'163', N'Ahet-ho', 28, N'Ahet-ho.png', N'Pseudoephedrine Hydrochloride 360mg Chlorpheniramine Maleate 24mg Dextromethorphan Hydrobromide 120mg', 65),

		(N'Medicines', 4, N'171', N'Albuterol Sulfate ', 18, N'AlbuterolSulfate.png', N'Albuterol Sulfate 2mg/5mL', 51),

		(N'Medicines', 4, N'172', N'Aldermis', 33, N'Aldermis.png', N'Arginine Hydrochloride 1000mg/5mL', 72),

		(N'Medicines', 4, N'173', N'Alimemazin', 41, N'Alimemazin.png', N'Trimeprazine tartrate 0,05%', 89),

		(N'Medicines', 5, N'131', N'4 Way', 31, N'4Way.png', N'Phenylephrine Hydrochloride 10mg/mL', 50),

		(N'Medicines', 5, N'132', N'4 Way 1', 61, N'4Way1.png', N'Phenylephrine Hydrochcloride 0,01L/L', 50),

		(N'Medicines', 5, N'133', N'A.T Diosmectite', 80, N'A.TDiosmectite.png', N'Diosmectite 3g', 50),

		(N'Machines', NULL, N'123', N'Magnetom Essenza 1.5 Tesla', 5000, N'Magnetom.png', N'Low installation and power requirements, ultra short magnet, lightweight design, Zero Helium boil-off technology, Tim+Dot workflow suites and engines, the latest software platform and applications. MAGNETOM ESSENZA – a Tim+Dot system.', 2),

		(N'Machines', NULL, N'125', N'Traction System TM – 400', 2000, N'Traction.png', N'Eight traction modes, including Stepped Progressive and Stepped Regressive. Traction parameters can be adjusted during traction. Up to 30 user-defined protocols. Includes an 8 foot long traction cord for larger patients', 1),

		(N'Machines', NULL, N'127', N'CELL- DyN 3200 ', 3800, N'CELL.png', N'The CELL-DYN 3200 sets a new benchmark for innovative, compact design. MAPSS technology assures the highest level of result accuracy and precision. The CELL-DYN 3200 is a contemporary vision of hematology automation for today’s laboratory.', 1),

		(N'Machines', NULL, N'126', N'AU 400 OLYMPUS', 1200, N'AU400OLYMPUS.png', N' The AU series applies the standardization design, which helps to
			increase productivity
			reduce operating costs
			deliver fast, reliable results
		', 1)




