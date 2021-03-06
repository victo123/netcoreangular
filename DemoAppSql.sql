USE [master]
GO
/****** Object:  Database [DemoApp]    Script Date: 09/12/2021 11:12:06 ******/
CREATE DATABASE [DemoApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoApp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoApp] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoApp] SET  MULTI_USER 
GO
ALTER DATABASE [DemoApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoApp] SET QUERY_STORE = OFF
GO
USE [DemoApp]
GO
/****** Object:  Table [dbo].[AppliedDiscount]    Script Date: 09/12/2021 11:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppliedDiscount](
	[AppliedDiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_AppliedDiscount] PRIMARY KEY CLUSTERED 
(
	[AppliedDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 09/12/2021 11:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](50) NOT NULL,
	[DiscountDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/12/2021 11:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductCost] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[productImageUrl] [nvarchar](500) NULL,
	[Packaging] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 09/12/2021 11:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[DeliveryCharges] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppliedDiscount] ON 

INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (1, 1, 1, 4)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (2, 2, 1, 3)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (4, 1, 2, 12)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (5, 2, 2, 2)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (6, 1, 3, 0)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (7, 2, 3, 5)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (8, 1, 4, 6)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (9, 2, 4, 8)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (10, 1, 5, 20)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (11, 2, 5, 25)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (12, 1, 6, 15)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (13, 2, 6, 10)
SET IDENTITY_INSERT [dbo].[AppliedDiscount] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [DiscountName], [DiscountDescription]) VALUES (1, N'Normal Day Discount', N'Daily Discount applicable on a product.')
INSERT [dbo].[Discount] ([DiscountId], [DiscountName], [DiscountDescription]) VALUES (2, N'Additional Independence Day Discount', N'Additional Independence Day Discount')
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (1, N'Mixer Grinder', 20, 7, N'https://rukminim1.flixcart.com/image/128/128/jwdupow0/mixer-grinder-juicer/x/p/h/bajaj-bravo-dlx-original-imafhfrzgzgzbknt.jpeg', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (2, N'Mircrowave', 50, 7, N'https://www.reliancedigital.in/medias/581108150-Package-1-1200Wx1200H-96Wx96H?context=bWFzdGVyfGltYWdlc3wxODE4MHxpbWFnZS9qcGVnfGltYWdlcy9oYjMvaGM4Lzg5NjM4NTA0Njk0MDYuanBnfDJiMDcyYWZkOTZiNTBiMTkxMDI4ZGVhMWVhYmJhOGRlM2I2YWQ3NDFlZmY3ZTU0NTY5MTdiZjIyYTVhYjVlMzE', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (3, N'Keyboard', 5, 7, N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVI-scE1BFn-BclSDW0oz167iu1dADH0Ha4Q&usqp=CAU', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (4, N'SD Card', 2, 7, N'https://images-na.ssl-images-amazon.com/images/I/61HKLHi9t4L._SL1100_.jpg', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (5, N'Recliner', 40, 7, N'https://rukminim1.flixcart.com/image/416/416/recliner/z/b/7/dr-single-leatherette-la-z-boy-black-original-imaehdtktva6mjvh.jpeg?q=70', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (6, N'Dining table', 36, 7, N'https://rukminim1.flixcart.com/image/416/416/jyhl1u80/dining-set/z/w/8/6-seater-na-rosewood-sheesham-tf-048-true-furniture-teak-finish-original-imafgpekuxjzvhgk.jpeg?q=70', N'')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (11, N'Ripe Blue Grape', 5, 1, N'/assets/Screen3/Untitled-1.png', N'Packet')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (13, N'Spinach', 2, 1, N'/assets/Screen3/Untitled-11.jpg', N'Packet')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (14, N'Salmon', 3, 1, N'/assets/Screen3/Untitled-7.png', N'Packet')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (15, N'Capsicum', 2, 1, N'/assets/Screen3/Untitled-5.png', N'Packet')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (17, N'Tomato', 3, 1, N'/assets/Screen3/Untitled-2.png', N'Packet')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl], [Packaging]) VALUES (18, N'Brocolli', 2, 1, N'/assets/Screen3/Untitled-10.jpg', N'Packet')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (1, N'Fruit & Veg', 150)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (2, N'Meat & Seafood', 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (3, N'Dairy & Chiled', 50)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (4, N'Bakery', 500)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (5, N'Baverages', 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (7, N'Others', 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
ALTER TABLE [dbo].[AppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_AppliedDiscount_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[AppliedDiscount] CHECK CONSTRAINT [FK_AppliedDiscount_Discount]
GO
ALTER TABLE [dbo].[AppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_AppliedDiscount_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[AppliedDiscount] CHECK CONSTRAINT [FK_AppliedDiscount_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [DemoApp] SET  READ_WRITE 
GO
