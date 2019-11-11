USE [master]
GO
/****** Object:  Database [ClinicManagement]    Script Date: 11/10/2019 9:10:43 PM ******/
CREATE DATABASE [ClinicManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ClinicManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ClinicManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ClinicManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicManagement] SET QUERY_STORE = OFF
GO
USE [ClinicManagement]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Subject] [varchar](255) NULL,
	[Message] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
	[Content] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Destination] [varchar](250) NULL,
	[OrderDate] [date] NULL,
	[OrderTime] [time](7) NULL,
	[OrderStatus] [bit] NULL,
	[OrderTotal] [int] NULL,
	[Comment] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[OrderDetailTotal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](255) NULL,
	[TypeId] [int] NULL,
	[Code] [varchar](255) NULL,
	[Name] [varchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[Image] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[Popularity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speaker]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speaker](
	[SpeakerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Degree] [varchar](255) NULL,
	[Occupation] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpeakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[IsBoy] [bit] NULL,
	[Phone] [int] NULL,
	[Address] [varchar](255) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 11/10/2019 9:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[WorkshopId] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerId] [int] NULL,
	[WorkshopName] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[WorkshopDate] [date] NULL,
	[WorkshopTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkshopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name], [Role]) VALUES (1, N'PhucAnh', N'123456', N'Phuc', 1)
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name], [Role]) VALUES (2, N'HuuThang', N'123456', N'Thang', 0)
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name], [Role]) VALUES (3, N'VanVu', N'123456', N'Vu', 0)
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name], [Role]) VALUES (4, N'TheAnh', N'123456', N'Anh', 0)
INSERT [dbo].[Admin] ([AdminId], [Username], [Password], [Name], [Role]) VALUES (5, N'Phuc', N'123456', N'PhucEm', 0)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Product] ON  

INSERT [dbo].[Feedback] ([FeedbackId], [OrderId], [ProductId], [CustomerId], [Content]) VALUES (1, 1, 4, 1, N'You have a good service')
INSERT [dbo].[Feedback] ([FeedbackId], [OrderId], [ProductId], [CustomerId], [Content]) VALUES (2, 2, 22, 2, N'This place is a heave for clinics')
INSERT [dbo].[Feedback] ([FeedbackId], [OrderId], [ProductId], [CustomerId], [Content]) VALUES (3, 3, 18, 3, N'I need more services')
INSERT [dbo].[Feedback] ([FeedbackId], [OrderId], [ProductId], [CustomerId], [Content]) VALUES (4, 4, 63, 4, N'I''m glad to be here')
INSERT [dbo].[Feedback] ([FeedbackId], [OrderId], [ProductId], [CustomerId], [Content]) VALUES (5, 5, 34, 5, N'This is have a lot of things for my clinic')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [UserId], [Destination], [OrderDate], [OrderTime], [OrderStatus], [OrderTotal], [Comment]) VALUES (1, 1, N'590 CMT8', CAST(N'2019-05-10' AS Date), CAST(N'19:00:00' AS Time), 1, 5, N'I''m glad to be here')
INSERT [dbo].[Order] ([OrderId], [UserId], [Destination], [OrderDate], [OrderTime], [OrderStatus], [OrderTotal], [Comment]) VALUES (2, 2, N'200 CMT8', CAST(N'2019-11-10' AS Date), CAST(N'15:10:00' AS Time), 1, 6, N'')
INSERT [dbo].[Order] ([OrderId], [UserId], [Destination], [OrderDate], [OrderTime], [OrderStatus], [OrderTotal], [Comment]) VALUES (3, 3, N'1101 CMT8', CAST(N'2019-01-11' AS Date), CAST(N'12:52:11' AS Time), 0, 10, N'')
INSERT [dbo].[Order] ([OrderId], [UserId], [Destination], [OrderDate], [OrderTime], [OrderStatus], [OrderTotal], [Comment]) VALUES (4, 4, N'22 Doi Cung', CAST(N'2019-12-11' AS Date), CAST(N'13:22:02' AS Time), 0, 4, N'')
INSERT [dbo].[Order] ([OrderId], [UserId], [Destination], [OrderDate], [OrderTime], [OrderStatus], [OrderTotal], [Comment]) VALUES (5, 5, N'43 Lanh Binh Thang ', CAST(N'2019-08-11' AS Date), CAST(N'09:12:22' AS Time), 1, 1, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OrderDetailTotal]) VALUES (1, 1, 4, 5, 60)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OrderDetailTotal]) VALUES (2, 2, 22, 6, 72)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OrderDetailTotal]) VALUES (3, 3, 18, 10, 100)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OrderDetailTotal]) VALUES (4, 4, 63, 4, 162)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OrderDetailTotal]) VALUES (9, 5, 34, 1, 5000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (4, N'Medicines', 1, N'101', N'Felodipin Stada 5mg retad', CAST(15 AS Decimal(18, 0)), N'Felodipin Stada 5mg retad', N'Felodipine : 5mg', 100)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (5, N'Medicines', 3, N'102', N'Esogas 40mg F', CAST(20 AS Decimal(18, 0)), N'Esogas 40mg F', N'Esomeprazole Sodium', 75)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (6, N'Medicines', 1, N'103', N'Dorobay 50mg', CAST(22 AS Decimal(18, 0)), N'Dorobay 50mg', N'Acarbose 50mg', 25)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (7, N'Medicines', 1, N'104', N'Meflavon', CAST(14 AS Decimal(18, 0)), N'Meflavon', N'Rutin 500mg', 52)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (8, N'Medicines', 1, N'105', N'Tuspi', CAST(15 AS Decimal(18, 0)), N'Tuspi', N'Acetaminophen', 60)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (9, N'Medicines', 1, N'106', N'Terpin-Codein 15', CAST(34 AS Decimal(18, 0)), N'Terpin-Codein 15', N'Codein 5mg,Terpin Hydrate 100mg', 55)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (10, N'Medicines', 1, N'107', N'Naphacogyl-EX', CAST(20 AS Decimal(18, 0)), N'Naphacogyl-EX', N'Metronidazole:125mg,Spyramycin I Acetate 4mg', 40)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (11, N'Medicines', 6, N'108', N'Cortipharm', CAST(25 AS Decimal(18, 0)), N'Cortipharm', N'Chloramphenicol 160mg,Dexamethasone Acetate 4mg', 55)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (12, N'Medicines', 6, N'109', N'3Lab Aqua BB SPF 40 Broad Spectrum 01', CAST(27 AS Decimal(18, 0)), N'3Lab Aqua BB SPF 40 Broad Spectrum 01', N'Titanium Dioxide 78,6mg/ml', 51)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (17, N'Medicines', 7, N'110', N'3MAvagard Instant Hand Antiseptic', CAST(11 AS Decimal(18, 0)), N'3MAvagard Instant Hand Antiseptic', N'Alcohol 577,7mg/ml', 92)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (18, N'Medicines', 6, N'111', N'3mCavilon Antifungal', CAST(10 AS Decimal(18, 0)), N'3mCavilon Antifungal', N'Miconazole Nitrate 2g/1000g,', 50)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (19, N'Medicines', 3, N'112', N'5% Glucose Injection 500ml:25g', CAST(13 AS Decimal(18, 0)), N'5% Glucose Injection 500ml:25g', N'Dextrose Monohydrate 5%', 95)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (20, N'Medicines', 5, N'113', N'Acebutolol Hydrochloride', CAST(24 AS Decimal(18, 0)), N'Acebutolol Hydrochloride', N'Acebutolol Hydrochloride 200mg/1', 22)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (21, N'Medicines', 9, N'114', N'Acehasan 100', CAST(34 AS Decimal(18, 0)), N'Acehasan 100', N'Acetylcysteine 100mg', 57)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (22, N'Medicines', 9, N'115', N'Acehasan 200', CAST(12 AS Decimal(18, 0)), N'Acehasan 200', N'Acetylcysteine 200mg', 90)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (23, N'Medicines', 6, N'116', N'Acella Hydrocortisone Acetate - Pramoxine Singles', CAST(16 AS Decimal(18, 0)), N'Acella Hydrocortisone Acetate - Pramoxine Singles', N'Hydrocortionse Acetate 2.5g/100g, Pramoxine 1g/100g', 77)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (24, N'Medicines', 9, N'117', N'Acepron 325mg', CAST(35 AS Decimal(18, 0)), N'Acepron 325mg', N'Acetaminophen 325mg', 93)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (25, N'Medicines', 3, N'118', N'Acer Negundo Pollen ', CAST(37 AS Decimal(18, 0)), N'Acer Negundo Pollen ', N'Acer Negundo Pollen 0,1g/ml', 82)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (26, N'Medicines', 11, N'119', N'Acetaminophen', CAST(26 AS Decimal(18, 0)), N'Acetaminophen', N'Acetominophen 120mg/1', 83)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (27, N'Medicines', 13, N'120', N'Acetaminophen and Codeine Posphate', CAST(31 AS Decimal(18, 0)), N'Acetaminophen and Codeine Posphate', N'Acetaminphoen 120mg/ml,Codeine Phosphate 12mg/ml', 85)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (28, N'Medicines', 2, N'121', N'Aclaro', CAST(29 AS Decimal(18, 0)), N'Aclaro', N'Hydroquinone 40mg/g', 81)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (29, N'Medicines', 2, N'122', N'Aclovate', CAST(30 AS Decimal(18, 0)), N'Aclovate', N'Alclometasone Dipropionate 0.5mg/g', 89)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (30, N'Machines', 14, N'123', N'Magnetom Essenza 1.5 Tesla', CAST(5000 AS Decimal(18, 0)), N'Magnetom Essenza 1.5 Tesla', N'Low installation and power requirements, ultra short magnet, lightweight design, Zero Helium boil-off technology, Tim+Dot workflow suites and engines, the latest software platform and applications. MAGNETOM ESSENZA – a Tim+Dot system.', 2)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (31, N'Machines', 15, N'124', N'4D Voluson 730', CAST(5000 AS Decimal(18, 0)), N'4D Voluson 730', N'    Year of manufacture: 2012
    Monitor: 15''''''''  CRT
    Touch integrated control panel: NA
    Software version: 5.4.6
    Specialization: Genaral Imaging
    Product condition: Refurbished', 1)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (34, N'Machines', 16, N'125', N'Traction System TM – 400', CAST(5000 AS Decimal(18, 0)), N'Traction System TM – 400', N'Eight traction modes, including Stepped Progressive and Stepped Regressive.
Traction parameters can be adjusted during traction
Up to 30 user-defined protocols.
Includes an 8 foot long traction cord for larger patients', 1)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (35, N'Machines', 17, N'126', N'AU 400 OLYMPUS', CAST(5000 AS Decimal(18, 0)), N'AU 400 OLYMPUS', N' The AU series applies the standardization design, which helps to

    increase productivity
    reduce operating costs
    deliver fast, reliable results
', 1)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (36, N'Machines', 18, N'127', N'CELL- DyN 3200 ', CAST(5000 AS Decimal(18, 0)), N'CELL- DyN 3200 ', N'The CELL-DYN 3200 sets a new benchmark for innovative, compact design. MAPSS technology assures the highest level of result accuracy and precision. The CELL-DYN 3200 is a contemporary vision of hematology automation for today’s laboratory.', 1)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (40, N'Medicines', 9, N'128', N'4 in 1 Pressed Mineral SPF SPF 15 Medium Dark', CAST(34 AS Decimal(18, 0)), N'4 in 1 Pressed Mineral SPF SPF 15 Medium Dark', N'Titanium Dioxide 0,72g/8g', 20)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (41, N'Medicines', 9, N'129', N'4 in 1 Pressed Mineral SPF SPF 15 Porcelain', CAST(41 AS Decimal(18, 0)), N'4 in 1 Pressed Mineral SPF SPF 15 Porcelain', N'Titanum Dioxide 0,387g/4,3g', 30)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (42, N'Medicines', 9, N'130', N'4 in 1 Pressed Mineral SPF SPF 15 Tan', CAST(16 AS Decimal(18, 0)), N'4 in 1 Pressed Mineral SPF SPF 15 Tan', N'Titanium Dioxide', 30)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (43, N'Medicines', 10, N'131', N'4 Way', CAST(15 AS Decimal(18, 0)), N'4 Way', N'Phenylephrine Hydrochloride 10mg/mL', 50)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (44, N'Medicines', 10, N'132', N'4 Way 1', CAST(19 AS Decimal(18, 0)), N'4 Way', N'Phenylephrine Hydrochcloride 0,01L/L', 50)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (45, N'Medicines', 10, N'133', N'A.T Diosmectite', CAST(18 AS Decimal(18, 0)), N'A.T Diosmectite', N'Diosmectite 3g', 50)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (46, N'Medicines', 3, N'134', N'A.T Famotidine 40 INJ', CAST(24 AS Decimal(18, 0)), N'A.T Famotidine 40 INJ', N'Famotidine 40mg/5ml', 60)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (47, N'Medicines', 3, N'135', N'A.T Furosemid INJ', CAST(29 AS Decimal(18, 0)), N'A.T Furosemid INJ', N'Furosemid 20mg/2ml', 70)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (48, N'Medicines', 3, N'136', N'A.T Tobramycin INJ', CAST(23 AS Decimal(18, 0)), N'A.T Tobramycin INJ', N'Tobramycin 80mg/2ml', 70)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (49, N'Medicines', 3, N'137', N'Ablavar', CAST(21 AS Decimal(18, 0)), N'Ablavar', N'Gadofosveset Trisodium 244mg/mL', 20)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (50, N'Medicines', 10, N'138', N'Sunscreen Continuous Broad Spectrum SPF 50', CAST(27 AS Decimal(18, 0)), N'Sunscreen Continuous Broad Spectrum SPF 50', N'Avobenzone 30mg/mL Octocrylene 100mg/mL Oxybenzone 50mg/mL', 40)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (51, N'Medicines', 10, N'139', N'Acebis - 1,5g', CAST(22 AS Decimal(18, 0)), N'Acebis - 1,5g', N'Sulbactam Sodium 0,5g Cefoperazone Sodium 1g', 60)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (52, N'Medicines', 11, N'140', N'Acetaminophen 1 ', CAST(15 AS Decimal(18, 0)), N'Acetaminophen', N'Acetaminophen 120mg/1', 50)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (53, N'Medicines', 2, N'141', N'Acyclovir', CAST(21 AS Decimal(18, 0)), N'Acyclovir', N'Acyclovir 50mg/g', 80)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (54, N'Medicines', 6, N'142', N'Cyclovir Cream', CAST(31 AS Decimal(18, 0)), N'Cyclovir Cream', N'Acyclovir Sodium 250mg', 40)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (55, N'Medicines', 7, N'143', N'Aczone ', CAST(35 AS Decimal(18, 0)), N'Aczone ', N'Dapsone 50mg/g', 23)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (56, N'Medicines', 7, N'144', N'Adapalene', CAST(34 AS Decimal(18, 0)), N'Adapalene', N'Adapalene 3mg/g', 26)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (57, N'Medicines', 11, N'145', N'Adult Glycerin Laxative', CAST(36 AS Decimal(18, 0)), N'Adult Glycerin Laxative', N'Glycerin 2g/1', 30)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (58, N'Medicines', 4, N'146', N'Adult Tussin ', CAST(32 AS Decimal(18, 0)), N'Adult Tussin ', N'Guaifenesin 100mg/5mL', 22)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (59, N'Medicines', 4, N'147', N'Adult Tussin Cough ', CAST(38 AS Decimal(18, 0)), N'Adult Tussin Cough ', N'Dextromethorphan Hydrobromide 30mg/10mL', 43)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (60, N'Medicines', 7, N'148', N'Advanced Ecolab', CAST(39 AS Decimal(18, 0)), N'Advanced Ecolab', N'alcohol 70kg/100L', 82)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (61, N'Medicines', 6, N'149', N'Advanced Cell Boosting Ex Day', CAST(19 AS Decimal(18, 0)), N'Advanced Cell Boosting Ex Day', N'Dimethicone 1,375/55mL', 25)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (62, N'Medicines', 2, N'150', N'Advanced Healing ', CAST(18 AS Decimal(18, 0)), N'Advanced Healing ', N'Petrolatum 0,34g/g', 16)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (63, N'Medicines', 2, N'151', N'Advanced Relief A and D', CAST(42 AS Decimal(18, 0)), N'Advanced Relief A and D', N'Petrolatum 937,5mg/g', 22)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (64, N'Medicines', 5, N'152', N'Aggrenox', CAST(41 AS Decimal(18, 0)), N'Aggrenox', N'Aspirin 25mg/1 Dipyridamole 200mg/1', 44)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (65, N'Medicines', 5, N'153', N'Agi-Lanso', CAST(47 AS Decimal(18, 0)), N'Agi-Lanso', N'Lansoprazole 30mg', 72)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (66, N'Medicines', 5, N'154', N'Agi-Tyfedol 500', CAST(41 AS Decimal(18, 0)), N'Agi-Tyfedol 500', N'Acetaminophen 500mg', 92)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (67, N'Medicines', 5, N'155', N'Agicetam', CAST(32 AS Decimal(18, 0)), N'Agicetam', N'Piracetam 400mg', 87)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (68, N'Medicines', 5, N'156', N'999 Ganmaoling', CAST(25 AS Decimal(18, 0)), N'999 Ganmaoling', N'Acetaminophen 100mg/1 Caffeine 2mg/1 Chlorpheniramine Maleate 2mg/1', 62)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (69, N'Medicines', 5, N'157', N'Agifamcin 300 ', CAST(26 AS Decimal(18, 0)), N'Agifamcin 300 ', N'Rifampin 300mg', 55)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (70, N'Medicines', 8, N'158', N' AHC Hydration Special Gen Mask', CAST(24 AS Decimal(18, 0)), N' AHC Hydration Special Gen Mask', N'Adenosine 12,8mg/32g', 64)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (71, N'Medicines', 8, N'159', N'AHC Hydration Special Gen Serum', CAST(27 AS Decimal(18, 0)), N'AHC Hydration Special Gen Serum', N'Adenosine 12mg/30mL', 70)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (72, N'Medicines', 8, N'160', N'AHC Hydration Special Gen Solution', CAST(23 AS Decimal(18, 0)), N'AHC Hydration Special Gen Solution', N'ADenosine 54mg/135mL', 72)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (73, N'Medicines', 8, N'161', N'AHC Revitalizing Special Gen Solution', CAST(24 AS Decimal(18, 0)), N'AHC Revitalizing Special Gen Solution', N'Adenosine 12mg/30mL Niacinamide 6g/30mL', 77)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (74, N'Medicines', 8, N'162', N'AHC Vital Complex C-15 Ampoule', CAST(25 AS Decimal(18, 0)), N'AHC Vital Complex C-15 Ampoule', N'Adenosine 12mg/30mL Arbutin 6g/30mL', 88)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (75, N'Medicines', 4, N'163', N'Ahet-ho', CAST(14 AS Decimal(18, 0)), N'Ahet-ho', N'Pseudoephedrine Hydrochloride 360mg Chlorpheniramine Maleate 24mg Dextromethorphan Hydrobromide 120mg', 65)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (76, N'Medicines', 12, N'164', N'Air', CAST(15 AS Decimal(18, 0)), N'Air', N'Oxygen 210mL/L', 41)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (77, N'Medicines', 12, N'165', N'Air Compressed ', CAST(13 AS Decimal(18, 0)), N'Air Compressed ', N'Oxygen 20L/100L', 99)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (78, N'Medicines', 7, N'166', N'Akneyash Gel', CAST(35 AS Decimal(18, 0)), N'Akneyash Gel', N'Adapalene 30mg', 88)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (79, N'Medicines', 13, N'167', N'Albuked', CAST(32 AS Decimal(18, 0)), N'Albuked', N'Albumin Human 2,5g/50mL', 91)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (80, N'Medicines', 13, N'168', N'Albumin(Human)', CAST(25 AS Decimal(18, 0)), N'Albumin(Human)', N'Albumin Human 10g/50mL', 89)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (81, N'Medicines', 13, N'169', N'Albuminar-20', CAST(23 AS Decimal(18, 0)), N'Albuminar-20', N'Albumin Human 20g/100mL', 90)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (82, N'Medicines', 13, N'170', N'AlbuRx', CAST(29 AS Decimal(18, 0)), N'AlbuRx', N'Albumin Human 12.5g/250mL', 94)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (83, N'Medicines', 4, N'171', N'Albuterol Sulfate ', CAST(24 AS Decimal(18, 0)), N'Albuterol Sulfate ', N'Albuterol Sulfate 2mg/5mL', 51)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (84, N'Medicines', 4, N'172', N'Aldermis', CAST(26 AS Decimal(18, 0)), N'Aldermis', N'Arginine Hydrochloride 1000mg/5mL', 72)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (85, N'Medicines', 4, N'173', N'Alimemazin', CAST(21 AS Decimal(18, 0)), N'Alimemazin', N'Trimeprazine tartrate 0,05%', 89)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (86, N'Medicines', 11, N'174', N'Ducolax', CAST(20 AS Decimal(18, 0)), N'Ducolax', N'Relieves constipation and irregularity fast
Comfort-shaped medicated suppository for rectal use only
The #1 doctor recommended stimulant laxative brand', 35)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (87, N'Medicines', 11, N'175', N'Laxative', CAST(10 AS Decimal(18, 0)), N'Laxative', N'Laxative Suppositories Bisacodyl USP 10 mg 100 By Graxcell Pharma', 72)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (88, N'Medicines', 11, N'176', N'ANUSOLTM
 Suppository', CAST(11 AS Decimal(18, 0)), N'ANUSOLTM
 Suppository', N'Designed for comfort in mind, it contains a gentle astringent to reduce swelling, giving your hemorrhoids a better chance to heal. ', 88)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (89, N'Medicines', 12, N'177', N' ProAir HFA (albuterol sulfate) Inhaler Rx ', CAST(13 AS Decimal(18, 0)), N' ProAir HFA (albuterol sulfate) Inhaler Rx ', N'
    Fast acting relief from the symptoms of asthma
    For dogs and cats
    Most effective when used with the AeroKat or AeroDawg Aerosol Chamber  
', 77)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (90, N'Medicines', 12, N'178', N'Vicks', CAST(15 AS Decimal(18, 0)), N'Vicks', N'Menthol 197mg, Camphor 197mg. Camphor + Menthol', 87)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (93, N'Medicines', 12, N'179', N'Salbutamol Inhaler', CAST(17 AS Decimal(18, 0)), N'Salbutamol Inhaler', N'Inhaled doses of Salbutamol are fast acting, making breathing easier within minutes
Salbutamol relaxes muscles in the air passages of the lungs helping to keep the airways open, making it easier to breathe', 90)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (96, N'Medicines', 12, N'180', N'Ventolin Evohaler 100mcg Inhaler', CAST(18 AS Decimal(18, 0)), N'Ventolin Evohaler 100mcg Inhaler', N'Detailed advice on how to take, store and clean can be found in the Patient Information Leaflet that comes with this medicine
Ventolin contains: HFA 134a and Salbutamol', 76)
INSERT [dbo].[Product] ([ProductId], [ProductType], [TypeId], [Code], [Name], [Price], [Image], [Description], [Popularity]) VALUES (98, N'Medicines', 12, N'181', N'Inhaler / Spacer Combo Packs', CAST(19 AS Decimal(18, 0)), N'Inhaler / Spacer Combo Packs', N'Standard combo packs are supplied with 5 reusable spacers
Economy combo packs are supplied with 10 disposable spacers
All combo packs are supplied with two emergency inhalers as standard', 33)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Speaker] ON 

INSERT [dbo].[Speaker] ([SpeakerId], [Name], [Degree], [Occupation]) VALUES (1, N'Phuc', N'Bachelor ', N'Doctor')
INSERT [dbo].[Speaker] ([SpeakerId], [Name], [Degree], [Occupation]) VALUES (2, N'Thang', N'Bachelor', N'Doctor')
INSERT [dbo].[Speaker] ([SpeakerId], [Name], [Degree], [Occupation]) VALUES (3, N'Vu', N'Bachelor', N'Doctor')
SET IDENTITY_INSERT [dbo].[Speaker] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (1, N'Tablet')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (2, N'Ointment')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (3, N'Injection')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (4, N'Syrup')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (5, N'Capsule')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (6, N'Cream')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (7, N'Gel')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (8, N'Paste')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (9, N'Powder')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (10, N'Spray')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (11, N'Suppository')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (12, N'Inhaler')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (13, N'Solution')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (14, N'Magnetom Essenza 1.5 Tesla')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (15, N'4D Voluson 730')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (16, N'Traction System TM – 400')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (17, N'AU 400 OLYMPUS')
INSERT [dbo].[Type] ([TypeId], [TypeName]) VALUES (18, N'CELL- DyN 3200 ')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Name], [IsBoy], [Phone], [Address], [Active]) VALUES (1, N'phucem123@gmail.com', N'123456', N'Phúc', 1, 123456789, N'590 CMT8 ', 1)
INSERT [dbo].[User] ([UserId], [Email], [Password], [Name], [IsBoy], [Phone], [Address], [Active]) VALUES (2, N'huuthang123@gmail.com', N'123456', N'Thang', 1, 123446789, N'200 CMT8', 1)
INSERT [dbo].[User] ([UserId], [Email], [Password], [Name], [IsBoy], [Phone], [Address], [Active]) VALUES (3, N'vanvu123@gmail.com', N'123456', N'Vu', 1, 123345678, N'1101 CMT8', 1)
INSERT [dbo].[User] ([UserId], [Email], [Password], [Name], [IsBoy], [Phone], [Address], [Active]) VALUES (4, N'aquar123@gmail.com', N'123456', N'Aquar', 0, 122223345, N'22 Doi Cung', 0)
INSERT [dbo].[User] ([UserId], [Email], [Password], [Name], [IsBoy], [Phone], [Address], [Active]) VALUES (5, N'em222@gmail.com', N'123456', N'Em', 0, 112312452, N'43 Lanh Binh Thang', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([WorkshopId], [SpeakerId], [WorkshopName], [Description], [WorkshopDate], [WorkshopTime]) VALUES (1, 1, N'Basic about Doctor', N'1 Nguyen Hue ', CAST(N'2019-11-15' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Workshop] ([WorkshopId], [SpeakerId], [WorkshopName], [Description], [WorkshopDate], [WorkshopTime]) VALUES (2, 2, N'Patients', N'1 Nguyen Hue', CAST(N'2019-11-18' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[Workshop] ([WorkshopId], [SpeakerId], [WorkshopName], [Description], [WorkshopDate], [WorkshopTime]) VALUES (3, 3, N'How to be a good Doctor', N'1 Nguyen Hue', CAST(N'2018-11-20' AS Date), CAST(N'12:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Workshop] OFF
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Popularity]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD FOREIGN KEY([SpeakerId])
REFERENCES [dbo].[Speaker] ([SpeakerId])
GO
USE [master]
GO
ALTER DATABASE [ClinicManagement] SET  READ_WRITE 
GO
Alter table
