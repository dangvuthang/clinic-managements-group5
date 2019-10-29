CREATE DATABASE ClinicManagement;
GO
USE ClinicManagement;
GO

CREATE TABLE [User](
	UserId int NOT NULL PRIMARY KEY IDENTITY(1,1),
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

Create Table [Type] (
	TypeId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	TypeName varchar(255)
)


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


CREATE TABLE [Order](
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





CREATE TABLE Product(
	ProductId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Product_GroupId int FOREIGN KEY REFERENCES Product_Group(Product_GroupId),
	TypeId int FOREIGN KEY REFERENCES Type(TypeId),
	Code varchar(255),
	[Name] varchar(50),
	Price decimal,
	[Image] varchar(255),
	[Description] varchar(255),
	Popularity int DEFAULT 0,
);
GO
CREATE TABLE Feedback(
	FeedbackId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderId int FOREIGN KEY REFERENCES [Order](OrderId),
	ProductId int FOREIGN KEY REFERENCES [Product](ProductId),
	CustomerId int FOREIGN KEY REFERENCES [User](UserId),
	Content varchar(255)
)
CREATE TABLE OrderDetail(
	OrderDetailId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	OrderId int FOREIGN KEY REFERENCES [Order](OrderId),
	ProductId int FOREIGN KEY REFERENCES Product(ProductId),
	Quantity int,
	OrderDetailTotal int
);
GO

CREATE TABLE Speaker(
	SpeakerId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] varchar(255),
	Degree varchar(255),
	Occupation varchar(255)
)
GO

CREATE TABLE Workshop(
	WorkshopId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	SpeakerId int FOREIGN KEY REFERENCES Speaker(SpeakerId),
	[Description] varchar(255),
	WorkshopDate date,
	WorkshopTime time
)




--INSERT INTO Product_Group([Name])
--VALUES('Machine'),
--	  ('Medicine');
--GO

--INSERT INTO Type([Name])
--VALUES('Heart Disease'),
--	  ('Eyes Disease'),
--	  ('Allergies & Asthma'),
--	  ('Ear, nose & throat diseases');
--GO

--INSERT INTO Disease(TypeId, [Name], [Image], [Description])
--VALUES(1, 'Heart failure', 'heart-failure.jpg', 'If the heart’s pumping action can’t work effectively, your heart muscle can’t meet your body’s demand for blood and oxygen, and your body develops various different symptoms, like fatigue and shortness of breath. This is called heart failure because of the failure of your heart to work efficiently.'),
--	  (1, 'High blood pressure', 'heart-blood-pressure.jpg', 'A[ClinicManagement]nother condition which can affect the heart is high blood pressure or hypertension. Although it’s not a disease in itself, hypertension can lead to an increased risk of developing serious conditions such as coronary heart disease, heart attacks and strokes.'),
--	  (1, 'Arrhythmia', 'arrhythmia.jpg', 'The heart muscle has its own electrical system which helps to stimulate the heartbeat. If the electrical signals within your heart are interrupted or disturbed, your heart can beat too quickly (tachycardia), too slowly (bradycardia) and/or in an irregular way. This is called an arrhythmia.'),
--	  (2, 'Low Vision', 'low-vision.jpg', 'Whenever ordinary glasses or contact lenses do not produce clear vision, you are considered to have low vision.'),
--	  (2, 'Bulging Eyes', 'bulging-eyes.jpg', 'Bulging eyes, or proptosis, occurs when one or both eyes protrude from the eye sockets due to space taking lesions such as swelling of the muscles, fat, and tissue behind the eye. This causes more of the cornea to be exposed to air, making it more difficult to keep eyes moist and lubricated. In extreme cases, bulging eyes can create a large amount of pressure on the optic nerve, potentially leading to vision loss.'),
--	  (2, 'Cataracts', 'low-vision.jpg', 'The eye is natural crystalline lens helps us focus on people and things at varying distances. Unfortunately, as we grow older this lens often stiffens and hardens, and without its youthful suppleness it loses its ability to focus, creating vision problems. This condition — for most, a natural consequence of aging — is called presbyopia.'),
--	  (2, 'Low Vision', 'low-vision.jpg', 'Whenever ordinary glasses or contact lenses do not produce clear vision, you are considered to have low vision.'),
--	  (3, 'Food Allergy', 'food-allergy.jpg', 'A food allergy is a condition in which certain foods trigger an abnormal immune response.'),
--	  (3, 'Insect Allergy', 'insect-allergy.jpg', 'Bees, wasps, hornets, yellow jackets and fire ants are the most common stinging insects that cause an allergic reaction.'),
--	  (3, 'Pet Allergy', 'pet-allergy.jpg', 'Allergies to pets with fur are common. It is important to know that an allergy-free (hypoallergenic) breed of dog or cat does not exist.'),
--	  (4, 'Sleep Apnea', 'sleep-apnea.jpg', 'Apnea is a medical term meaning to stop breathing. Sleep apnea is a disorder causing one to stop breathing for brief periods of time while sleeping'),
--	  (4, 'Sinusitis', 'sinusitis.jpg', 'Sinusitis occurs when a germ finds its way into the hollow recesses of the skull that surround your eyes and nose. The infection can then become trapped there, causing inflammation, pressure, and pain.'),
--	  (4, 'Strep Throat', 'strep-throat.jpg', 'Strep is an abbreviation for a family of bacteria called "streptococci." Strep throat occurs when the throat and surrounding structures become infected with this germ. While strep throat is a common infection, many other infections have the same symptoms.')
--GO
