USE [master]
GO
/****** Object:  Database [bgroup4_prod]    Script Date: 19/08/2020 14:20:45 ******/
CREATE DATABASE [bgroup4_prod] ON  PRIMARY 
( NAME = N'bgroup4_prod', FILENAME = N'D:\Sql_Data\bgroup4_prod.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bgroup4_prod_log', FILENAME = N'D:\Sql_Data\bgroup4_prod_log.LDF' , SIZE = 10368KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bgroup4_prod] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bgroup4_prod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ARITHABORT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bgroup4_prod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bgroup4_prod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bgroup4_prod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bgroup4_prod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bgroup4_prod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bgroup4_prod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bgroup4_prod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bgroup4_prod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bgroup4_prod] SET RECOVERY FULL 
GO
ALTER DATABASE [bgroup4_prod] SET  MULTI_USER 
GO
ALTER DATABASE [bgroup4_prod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bgroup4_prod] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bgroup4_prod', N'ON'
GO
USE [bgroup4_prod]
GO
/****** Object:  User [bgroup4_DBuser]    Script Date: 19/08/2020 14:20:46 ******/
CREATE USER [bgroup4_DBuser] FOR LOGIN [bgroup4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bgroup4_DBuser]
GO
/****** Object:  Table [dbo].[categories_tbl]    Script Date: 19/08/2020 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories_tbl](
	[category_id] [nvarchar](32) NULL,
	[category_title] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorites_tbl]    Script Date: 19/08/2020 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites_tbl](
	[user_id] [nvarchar](50) NOT NULL,
	[item_id] [nvarchar](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items_tags_tbl]    Script Date: 19/08/2020 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items_tags_tbl](
	[item_id] [nvarchar](32) NULL,
	[tag_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items_tbl]    Script Date: 19/08/2020 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items_tbl](
	[item_title] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount_dollar] [float] NULL,
	[discount_percent] [float] NULL,
	[user_id] [nvarchar](50) NOT NULL,
	[item_image] [nvarchar](255) NULL,
	[item_description] [nvarchar](255) NULL,
	[item_id] [nvarchar](32) NULL,
	[receipt_id] [nvarchar](32) NULL,
	[category_id] [nvarchar](32) NULL,
	[sub_category_id] [nvarchar](32) NULL,
	[id_type] [nvarchar](10) NULL,
	[barcode] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receipts_tbl]    Script Date: 19/08/2020 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipts_tbl](
	[user_id] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[discount_dollar] [float] NULL,
	[discount_percent] [float] NULL,
	[to_show] [bit] NULL,
	[receipt_image] [nvarchar](255) NULL,
	[receipt_description] [nvarchar](255) NULL,
	[store_id] [nvarchar](32) NULL,
	[receipt_id] [nvarchar](32) NULL,
	[receipt_rank] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores_tbl]    Script Date: 19/08/2020 14:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores_tbl](
	[store_name] [nvarchar](50) NOT NULL,
	[lat] [float] NULL,
	[lon] [float] NULL,
	[store_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_categories_tbl]    Script Date: 19/08/2020 14:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_categories_tbl](
	[sub_category_id] [nvarchar](32) NULL,
	[sub_category_title] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags_tbl]    Script Date: 19/08/2020 14:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags_tbl](
	[tag_id] [nvarchar](32) NULL,
	[tag_title] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_tbl]    Script Date: 19/08/2020 14:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_tbl](
	[user_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](16) NOT NULL,
	[birthdate] [date] NOT NULL,
	[gender] [bit] NULL,
	[user_rank] [int] NULL,
	[state] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
 CONSTRAINT [PK_users_tbl] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'481b58fa05ed4e29843090cd8c6d2ecd', N'קרטיב')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'59570a5f4159470eb9bd2c7af3d16d0c', N'חטיף')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'994c280cf6ed47eea87ffc6a45097377', N'מאכל')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'4217321f9f4e46de9a32749eec3699d3', N'                                                  ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'd829e790758542b3a15382296975c8cb', N'משקה')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'96458e908cb449a8a772fa14addd9bd8', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'd300007e0e974485ae572f505d0991fa', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'1168fe58f7de41bd88aa6c80a361914b', N'                                                  ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'b148991d4a3342e1a9388d9c4736768f', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'cfb413f8a6e84623b846f6e820e5f27b', N'google                                            ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'8fcc72e59f45486dad45fdd42c2d3119', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'851a625f7fbe44ecb5fd78ec2c0179bd', N'Apparel & Accessories')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'a1395dd293c74d27a470c559ff957ea7', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'08437ccf6d3b4e20bd9b14204ada84e5', N'Electronics                                       ')
INSERT [dbo].[categories_tbl] ([category_id], [category_title]) VALUES (N'8e45b13343184edbb8d63b5405b307a6', N'                                                  ')
INSERT [dbo].[favorites_tbl] ([user_id], [item_id]) VALUES (N'admin@admin.com', N'fde5bebd5e664a31817cdf14081b2fff')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'fde5bebd5e664a31817cdf14081b2fff', N'ec9b91ec64d44f95845db21382fd55cb')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'fde5bebd5e664a31817cdf14081b2fff', N'7cf9e7db41e244e4a6eeac557236b536')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'fde5bebd5e664a31817cdf14081b2fff', N'ed14a963037148699e1314a312e47bc0')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'bdd14c12c6704552a1e09a5977629adb', N'fcd45256bfaa4d60be7ca23942b56193')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'bdd14c12c6704552a1e09a5977629adb', N'e3bcd64bc9e14005b245c54b800a43a0')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'bdd14c12c6704552a1e09a5977629adb', N'edf322340ea2477985dfcaecba68d004')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'bdd14c12c6704552a1e09a5977629adb', N'2cc6242f570942c9b921c1c7e3efe5fd')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'bdd14c12c6704552a1e09a5977629adb', N'41d06a322129482f968beee455f64120')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'38164d1456fa411384eada5fbb41e796', N'76806d1f446a44919bd7e58cfcd1ab3f')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'38164d1456fa411384eada5fbb41e796', N'60df9d9ffe444cbdbf080aaed84a07b2')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'38164d1456fa411384eada5fbb41e796', N'4574cbf9a78741499b5831b7ba2c5568')
INSERT [dbo].[items_tags_tbl] ([item_id], [tag_id]) VALUES (N'38164d1456fa411384eada5fbb41e796', N'098ee551177f40c3bbcec7c92d8de75f')
INSERT [dbo].[items_tbl] ([item_title], [price], [discount_dollar], [discount_percent], [user_id], [item_image], [item_description], [item_id], [receipt_id], [category_id], [sub_category_id], [id_type], [barcode]) VALUES (N'Xiaomi Redmi AirDots Wireless Bluetooth Headset - ', 139, 0, 100, N'ometz123@gmail.com', N'https://i5.walmartimages.com/asr/ba796508-b051-4b6e-845f-4e7da1a3c525_1.86290d364f6e26be037db3f6a14b170c.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff', N'Xiaomi Redmi AirDots Wireless Bluetooth Headset - Black

אוזניות מתנה בקניית מכשיר טלפון', N'38164d1456fa411384eada5fbb41e796', N'e4439949fdcf44bc8ebb91f1cd41a5fb', N'd300007e0e974485ae572f505d0991fa', N'4ecca3d004ce4936a1cd2db50c66f097', N'src       ', N'69341777009968')
INSERT [dbo].[items_tbl] ([item_title], [price], [discount_dollar], [discount_percent], [user_id], [item_image], [item_description], [item_id], [receipt_id], [category_id], [sub_category_id], [id_type], [barcode]) VALUES (N'Xiaomi Redmi Note 8 Pro 6gb Ram 128gb', 1189, 0, 0, N'ometz123@gmail.com', N'https://tshop.r10s.com/4e7/ad3/6174/6697/c0be/d046/31d6/1173eabfa40242ac110003.jpg?_ex=512x512', N'Condition: New Model: Redmi Note 8 Pro Date of Release: 2019, September 24 NETWORK Lock Status: Factory Unlocked SIM: Hybrid Dual SIM (Nano-SIM, dual stand-by) Thecnology: GSM / HSPA / LTE 2G (GSM 850 / 900 / 1800 / 1900 - SIM 1 & SIM 2) 3G (HSDPA 850 / 9', N'bdd14c12c6704552a1e09a5977629adb', N'e4439949fdcf44bc8ebb91f1cd41a5fb', N'96458e908cb449a8a772fa14addd9bd8', N'03098fb82c454daba61e7b30b897b5e5', N'src       ', NULL)
INSERT [dbo].[items_tbl] ([item_title], [price], [discount_dollar], [discount_percent], [user_id], [item_image], [item_description], [item_id], [receipt_id], [category_id], [sub_category_id], [id_type], [barcode]) VALUES (N'La Sportiva Thunder III GTX Hiking Boot - Men''s Br', 556, 0, 0, N'ometz123@gmail.com', N'http://www.6pm.com/images/z/2/5/2/4/1/0/2524105-p-2x.jpg', N'Get to your nights camp with fresh enough feet to find that perfect camp spot. The La Sportiva Men''s Thunder III GTX Hiking Boot has all the bells and whistles to support the weight of your pack, but with the comfort and lightness to save your feet the ad', N'fde5bebd5e664a31817cdf14081b2fff', N'fdd058d2458e493c8a136a2dcb458fab', NULL, N'c97af876190e484f8c7dc0fc8e685a67', N'src       ', NULL)
INSERT [dbo].[receipts_tbl] ([user_id], [date], [discount_dollar], [discount_percent], [to_show], [receipt_image], [receipt_description], [store_id], [receipt_id], [receipt_rank]) VALUES (N'ometz123@gmail.com', CAST(N'2017-12-18' AS Date), 0, 0, 1, N'http://proj.ruppin.ac.il/bgroup4/prod/server/UploadedFiles/3bede3111c894153ac3f52efeb0d666c.jpeg', N'רכשתי מהיבואן', N'721c0a7bbe56449ca383c1a25caf0ecb', N'fdd058d2458e493c8a136a2dcb458fab', 4)
INSERT [dbo].[receipts_tbl] ([user_id], [date], [discount_dollar], [discount_percent], [to_show], [receipt_image], [receipt_description], [store_id], [receipt_id], [receipt_rank]) VALUES (N'ometz123@gmail.com', CAST(N'2020-06-02' AS Date), 50.01, 0, 1, N'http://proj.ruppin.ac.il/bgroup4/prod/server/UploadedFiles/e4439949fdcf44bc8ebb91f1cd41a5fb.jpeg', N'הנחה על איסוף מהסניף', N'9952ef62f20440a48330b62438fa71c6', N'e4439949fdcf44bc8ebb91f1cd41a5fb', 7)
INSERT [dbo].[stores_tbl] ([store_name], [lat], [lon], [store_id]) VALUES (N'טוויסטר סחר בינלאומי בע"מ', 32.0896167, 34.8568041, N'721c0a7bbe56449ca383c1a25caf0ecb')
INSERT [dbo].[stores_tbl] ([store_name], [lat], [lon], [store_id]) VALUES (N'KSP טבריה, שמעון דהאן, טבריה, ישראל', 32.796038, 35.52692, N'9952ef62f20440a48330b62438fa71c6')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'8c10774e739843f4955bbe736b6ace4f', N'טילון')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'c26d0b13472f40d9a65f514196703c39', N'מלוח')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'd88f1e761fc74dacacda8cbc709c9a38', N'לחם')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'71b56f0ebfcf400f8cd179ac738ab509', N'עוגיות')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'40b97db2a0f64875bf4902387ece7412', N'חלב')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'6d044e2041df4fc8b540451f03c72f7d', N'Shoes                                             ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'03098fb82c454daba61e7b30b897b5e5', N'Communications                                    ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'4ecca3d004ce4936a1cd2db50c66f097', N'                                                  ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'ae647da9f7b74b968c9b7c8472159079', N'                                                  ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'b8ceaf1535e64027a94324202f5c25d8', N'Electronics Accessories                           ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'ad60406ef5014d36b54792620050673b', N'                                                  ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'07dbf873455f4a3484ad0a51f9452fdf', N'Electronics Accessories                           ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'a5ffca6c86a34706809fa5f649457476', N'Develop                                           ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'f3fa00eba07d4d35ab555059eda6a044', N'Electronics Accessories                           ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'4c2d7e8da4b440b5ad5f5a212464ce8b', N'מתוק')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'8a823ee2af414ff78ad3dc5bd812252c', N'Shoes                                             ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'c97af876190e484f8c7dc0fc8e685a67', N'Shoes                                             ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'04a250b3c71c4d89bac06871bd6dc7b8', N'                                                  ')
INSERT [dbo].[sub_categories_tbl] ([sub_category_id], [sub_category_title]) VALUES (N'afb342f47e2e4bed8d35cfe49bc5c495', N'Computers                                         ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'fcd45256bfaa4d60be7ca23942b56193', N'Xiaomi                                            ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'ac5af78ea6bd45ab888c9db5fe00ca1b', N'בצק')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'75d40b1b06b94762b46c63098829f879', N'קרטון')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'7281af9ad6334d6e9d379489fad26662', N'חלב')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'79f69ce43caf4c4a977fc0d4b2e7db23', N'3%')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'dd65f964c72f4ca9a77c320601fcb186', N'קצפת')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'cb39b3c362fb458bb33050e6b334db05', N'פרוס')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'89fb8e1fb9b9420f868eaa280f421e6a', N'מתוק')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'3426756ddde748fcb66291afca174000', N'שוקולד')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'e3bcd64bc9e14005b245c54b800a43a0', N'Cell Phone                                        ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'edf322340ea2477985dfcaecba68d004', N'Note                                              ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'2cc6242f570942c9b921c1c7e3efe5fd', N'128GB                                             ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'41d06a322129482f968beee455f64120', N'Gery                                              ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'76806d1f446a44919bd7e58cfcd1ab3f', N'Earbuds                                           ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'60df9d9ffe444cbdbf080aaed84a07b2', N'Black                                             ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'4574cbf9a78741499b5831b7ba2c5568', N'Wireless                                          ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'098ee551177f40c3bbcec7c92d8de75f', N'Bluetooth                                         ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'de84727b032544828df57ca406820096', N'test                                              ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'5d83bc98275644288826c6338ec717ac', N'google                                            ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'cd92d55ecdff44ffb8a70e6aa9f61790', N'GPU                                               ')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'1', N'Orange')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'2', N'Sour')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'3', N'Green')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'4', N'Food')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'5', N'White')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'6', N'Sweet')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'ed14a963037148699e1314a312e47bc0', N'Shoes')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'7cf9e7db41e244e4a6eeac557236b536', N'Treks')
INSERT [dbo].[tags_tbl] ([tag_id], [tag_title]) VALUES (N'ec9b91ec64d44f95845db21382fd55cb', N'GORE-TEX Waterproof')
INSERT [dbo].[users_tbl] ([user_id], [first_name], [last_name], [password], [birthdate], [gender], [user_rank], [state], [city]) VALUES (N'admin@admin.com', N'admin', N'admin', N'adminadmin', CAST(N'1990-12-16' AS Date), 1, 10000, N'admin', N'Ruppin                                            ')
INSERT [dbo].[users_tbl] ([user_id], [first_name], [last_name], [password], [birthdate], [gender], [user_rank], [state], [city]) VALUES (N'amithrpz@gmail.com', N'Amit', N'Harpaz', N'9bd1798e', CAST(N'1994-05-13' AS Date), 1, 1000, N'Lalala', N'lalala')
INSERT [dbo].[users_tbl] ([user_id], [first_name], [last_name], [password], [birthdate], [gender], [user_rank], [state], [city]) VALUES (N'ometz123@gmail.com', N'Omer', N'Tzafrir', N'd7cce283', CAST(N'1990-12-16' AS Date), 1, 1023, N'Israel', N'Jordan Valley                                     ')
/****** Object:  StoredProcedure [dbo].[SPCategory]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPCategory]
	-- Add the parameters for the stored procedure here
	(
	@id	nvarchar(32)= null,
	@title char(50)= null,
	@StatementType NVARCHAR(20) = ''
	)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
		BEGIN  
					INSERT INTO categories_tbl  
								( 
								category_id,
								category_title
								
								)  
					VALUES		(
								@id,
								@title
								)  
		END 
	
	ELSE IF @StatementType = 'Select'  --שליפת כל הקטגוריות 
		BEGIN  
					SELECT * FROM categories_tbl
		END 
 	ELSE IF @StatementType = 'SelectByTitle'  --שליפת כל התגיות 
    BEGIN  
            (
			SELECT		  
						c.category_id,
						c.category_title
			FROM		categories_tbl c
			WHERE c.category_title=@title
			)
			 
    END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPItems]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPItems]
	-- Add the parameters for the stored procedure here
	(
	@item_id nvarchar(32) = null, 
	@receipt_id	nvarchar(32) = null,
	@item_title	nvarchar(50) = null,
	@price float = null,
	@barcode varchar(20)=null,
	@discount_dollar float = null,
	@discount_percent float = null,
	@item_description nvarchar(255) = null,
	@user_id nvarchar(50) = null,
	@item_image nvarchar(255) = 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
	@id_type char(10) = null,
	@category_id nvarchar(32) = null,
	@sub_category_id nvarchar(32) = null,
	@StatementType NVARCHAR(20) = '',
	--מיקום
	@user_lat VARCHAR(10)= null,
	@user_lon VARCHAR(10)= null,
	@user_location GEOGRAPHY= null,
	@user_rank int=null,
	--@title_words
	@max_price FLOAT= null,
	@min_price FLOAT= null,
	--@store_location GEOGRAPHY= null,
	@max_distance tinyint= null--distnace in Km
	)

	/*
	item_id	char(30)
	receipt_id	char(30)
	item_title	nvarchar(50)
	price	float
	discount_dollar	float
	discount_percent	float
	description	nvarchar(255)
	user_id	nvarchar(50)
	image	nvarchar(255)
	id_type	char(10)
	
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO items_tbl  
						( item_id,
						  receipt_id,
						  item_title,
						  price,
						  discount_dollar,
						  discount_percent,
						  item_description,
						  user_id,
						  item_image,
						  id_type,
						  category_id,
						  sub_category_id,
						  barcode
						)  
            VALUES     (  @item_id,
						  @receipt_id,
						  isnull(@item_title,'No_Name'),
						  @price,
						  isnull( @discount_dollar,0),
						  isnull(@discount_percent,0),
						  isnull(@item_description,null),
						  @user_id,
						  isnull(@item_image,null),
						  @id_type,
						  @category_id,
						  @sub_category_id,
						  @barcode
						  )  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל האייטמים המותרים להצגה, כולל נתונים על חנות, והקבלה
    BEGIN  
			--SET @store_location = geography::Point(ISNULL(@store_lat,0), ISNULL(@store_lon,0), 4326)
			SET @user_location= geography::Point(ISNULL(@user_lat,0), ISNULL(@user_lon,0), 4326)
			
			--SET @store_location = geography::Point(ISNULL(@store_lat,0), ISNULL(@store_lon,0), 4326)
            (SELECT		 TOP (ISNULL (@user_rank,10))
						  items.item_id,
						  items.receipt_id,
						  items.item_title,
						  items.price,
						  items.discount_dollar,
						  items.discount_percent,
						  items.item_description,
						  items.user_id,
						  users.user_rank,
						  items.item_image,
						  items.id_type,
						  items.barcode,
						  --,receipts.date,
						  receipts.receipt_image,
						  receipts.receipt_description,
						  receipts.discount_dollar receipts_discount_dollar,
						  receipts.discount_percent receipts_discount_percent,
						  --stores.store_id,
						  stores.store_name,
						  stores.lat,
						  stores.lon,
						  @user_location.STDistance(geography::Point(ISNULL(stores.lat,0),ISNULL(stores.lon,0), 4326))/1000 as distance
						 FROM		receipts_tbl receipts	
						 inner join items_tbl items  on items.receipt_id= receipts.receipt_id
						 inner join stores_tbl stores on receipts.store_id= stores.store_id
						 inner join users_tbl users on users.user_id=receipts.user_id
		WHERE receipts.to_show=1
		and 
		(@user_location.STDistance(geography::Point(ISNULL(stores.lat,0), ISNULL(stores.lon,0), 4326)))/1000<=ISNULL(@max_distance,100)
		and
		items.price>= ISNULL(@min_price,0) and items.price<= ISNULL(NULLIF(@max_price,-1),
		(select TOP(1) i.price from items_tbl i order by i.price desc)
		)
		) 
		order by receipts.date,users.user_rank
		    END 
		ELSE IF @StatementType = 'SelectByItemId' 
    BEGIN  
            (
			SELECT		  items.item_id,
						  items.receipt_id,
						  items.item_title,
						  items.price,
						  items.discount_dollar,
						  items.discount_percent,
						  items.item_description,
						  items.user_id,
						  items.item_image,
						  items.id_type,
						  items.barcode,
						  --,item tags
						  --,receipts.date,
						  receipts.receipt_image,
						  receipts.receipt_description,
						  receipts.discount_dollar receipts_discount_dollar,
						  receipts.discount_percent receipts_discount_percent,
						  --stores.store_id,
						  stores.store_name
						  --stores.lat,
						  --stores.lon
						 FROM		receipts_tbl receipts	
						 inner join items_tbl items  on items.receipt_id= receipts.receipt_id
						 inner join stores_tbl stores on receipts.store_id= stores.store_id
		WHERE receipts.to_show=1 
		and items.item_id=@item_id
		) 
    END 
	--אין עדכון ומחיקה של פריט בודד. פקודות מחיקה אלה ועדכון יעברו אל סטור פרוסיג'ר של קבלה.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE receipts_tbl
	--		SET to_show = 0
	--		WHERE receipt_id= @receipt_id; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  

END
/*
DELETE ALL

DELETE FROM categories_tbl;
DELETE FROM items_tags_tbl;
DELETE FROM items_tbl;
DELETE FROM receipts_tbl;
DELETE FROM stores_tbl;
DELETE FROM sub_categories_tbl;
DELETE FROM tags_tbl;
DELETE FROM users_tbl;

*/
GO
/****** Object:  StoredProcedure [dbo].[SPItemsTags]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPItemsTags]
	-- Add the parameters for the stored procedure here
	(
	@item_id nvarchar(32)= null,
	@tag_id	nvarchar(32)= null,
	@StatementType NVARCHAR(20) = ''
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
        BEGIN  
            INSERT INTO items_tags_tbl  
						( item_id,
						  tag_id
						)  
            VALUES     (  @item_id,
						  @tag_id
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל התגיות 
    BEGIN  
            SELECT		
						items_tags.item_id,
						items_tags.tag_id
			FROM		
						items_tags_tbl items_tags
			 
    END 
		ELSE IF @StatementType = 'SelectByItemId'  --שליפת כל תגיות של מוצר 
    BEGIN  
            SELECT		items_tags.tag_id, tags.tag_title
			FROM		items_tags_tbl items_tags inner join tags_tbl tags on items_tags.tag_id= tags.tag_id
			WHERE		items_tags.item_id = @item_id
			 
    END 
 		ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל תגיות של מוצר 
    BEGIN  
            SELECT		items_tags.item_id
			FROM		items_tags_tbl items_tags
			WHERE		items_tags.tag_id = @tag_id
			 
    END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  
END
GO
/****** Object:  StoredProcedure [dbo].[SPReceipts]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPReceipts]
	-- Add the parameters for the stored procedure here
	(
	@receipt_id				nvarchar(32) = null,
	@user_id				varchar(50) = null,
	@date					date = null,
	@discount_dollar		float = null,
	@discount_percent		float = null,
	@to_show				bit = null,
	@receipt_image			nvarchar(255) = null,
	@store_id				nvarchar(32) = null,
	@receipt_description	nvarchar(255) = null,
	@receipt_rank			tinyint = null,
	@StatementType			NVARCHAR(20) = ''
	)

	/*
	@receipt_id	char(30) = null,
	@user_id	varchar(50) = null,
	@date	date = null,
	@discount_dollar	float = null,
	@discount_percent	float = null,
	@to_show	bit = null,
	@receipt_image	nvarchar(255) = null,
	@store_id	char(30) = null,
	@receipt_description	nvarchar(255) = null
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO receipts_tbl  
						( receipt_id,
						  user_id,
						  date,
						  discount_dollar,
						  discount_percent,
						  --to_show,
						  receipt_image,
						  store_id,
						  receipt_description,
						  receipt_rank
						  /*
						    receipt_id
							user_id
							date
							discount_dollar
							discount_percent
							--to_show
							receipt_image
							store_id
							receipt_description

						  */
						)  
            VALUES     (  @receipt_id,
						  @user_id,
						  @date,
						  isnull(@discount_dollar,null),
						  isnull(@discount_percent,null),
						  --@to_show,
						  @receipt_image,
						  @store_id,
						  isnull(@receipt_description,null),
						  @receipt_rank
						  )  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל הקבלות המותרות להצגה, והקבלה
    BEGIN  
            (SELECT		  
						  receipts.receipt_id,
						  receipts.user_id,
						  receipts.date,
						  receipts.discount_dollar,
						  receipts.discount_percent,
						  --to_show,
						  receipts.receipt_image,
						  receipts.store_id,
						  receipts.receipt_description
			FROM		
						  receipts_tbl receipts	
		WHERE receipts.to_show=1) 
    END 
		ELSE IF @StatementType = 'SelectByReceiptId'  --שליפת כל הקבלות המותרות להצגה, והקבלה
    BEGIN  
            (
			SELECT		  
						receipts.receipt_id,
						receipts.user_id,
						receipts.date,
						receipts.discount_dollar,
						receipts.discount_percent,
						--to_show,
						receipts.receipt_image,
						receipts.store_id,
						receipts.receipt_description,
						receipts.receipt_rank
			FROM		
						receipts_tbl receipts	
			WHERE		receipts.to_show=1 
						and
						receipts.receipt_id=@receipt_id
			) 
    END 
	--אין עדכון של קבלה, רק חיקוי מחיקה.

	ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
        BEGIN  
			UPDATE receipts_tbl
			SET to_show = @to_show
			WHERE receipt_id= @receipt_id; 
        END  
		ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
        BEGIN  
			DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
            DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	        END  

END
GO
/****** Object:  StoredProcedure [dbo].[SPStores]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPStores]
	-- Add the parameters for the stored procedure here
	(
	@store_id nvarchar(32) = null,
	@store_name nvarchar(50) = null,
	@lat float = null,
	@lon float = null,
	@StatementType NVARCHAR(20) = ''

	)
	/*
	store_id	char(30)
	store_name	nvarchar(50)
	lat	float
	lon	float
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO stores_tbl  
						( 
						store_id,
						store_name,
						lat,
						lon
						)  
            VALUES		(  
						@store_id,
						@store_name,
						@lat,
						@lon
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל החנויות
    BEGIN  
            (
			SELECT		stores.store_id,
						stores.store_name,
						stores.lat,
						stores.lon
						  
			FROM		stores_tbl stores	
			) 
    END 
		ELSE IF @StatementType = 'SelectByStoreId'  --שליפת חנות לפי איידי
    BEGIN  
            (
			SELECT		stores.store_id,
						stores.store_name,
						stores.lat,
						stores.lon
						  
			FROM		stores_tbl stores
			WHERE stores.store_id=@store_id
			) 
    END 
	--אין עדכון ומחיקה של חנות.

	--ELSE IF @StatementType = 'Update'
 --       BEGIN  
	--		UPDATE stores_tbl
	--		SET to_show = 0
	--		WHERE receipt_id= @receipt_id; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'
 --       BEGIN  
	--		DELETE FROM stores_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  
	END

GO
/****** Object:  StoredProcedure [dbo].[SPSubCategory]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPSubCategory]
	-- Add the parameters for the stored procedure here
	(
	@id	nvarchar(32)= null,
	@title char(50)= null,
	@StatementType NVARCHAR(20) = ''
	)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
		BEGIN  
					INSERT INTO sub_categories_tbl  
								( 
								sub_category_id,
								sub_category_title
								)  
					VALUES		(
								@id,
								@title
								)  
		END 
	
	ELSE IF @StatementType = 'Select'  --שליפת כל הקטגוריות 
		BEGIN  
					SELECT * FROM sub_categories_tbl
		END 
 	--ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל התגיות 
  --  BEGIN  
  --          (
		--	SELECT		  
		--				tags.tag_id,
		--				tags.tag_title
		--	FROM		tags_tbl tags
		--	WHERE tags.tag_id=@tag_id
		--	)
			 
  --  END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPTags]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPTags]
	-- Add the parameters for the stored procedure here
	(
	@tag_id	nvarchar(32)= null,
	@tag_title char(50)= null,
	@item_id nvarchar(32)= null,
	@StatementType NVARCHAR(20) = ''
	)
	/*
	@item_id char(30)
	@tag_id	int
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
        BEGIN  
            INSERT INTO tags_tbl  
						( tag_id,
						  tag_title
						)  
            VALUES     (  @tag_id,
						  @tag_title
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל התגיות 
    BEGIN  
            SELECT		  
						tags.tag_id,
						tags.tag_title
						 FROM		tags_tbl tags
			 
    END 
 	ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל התגיות 
    BEGIN  
            (
			SELECT		  
						tags.tag_id,
						tags.tag_title
			FROM		tags_tbl tags
			WHERE tags.tag_id=@tag_id
			)
			 
    END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPUsers]    Script Date: 19/08/2020 14:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPUsers]
	-- Add the parameters for the stored procedure here
	(
	@user_id		varchar(50)	=null,
	@first_name		nvarchar(50)=null,	
	@last_name		nvarchar(50)=null,	
	@password		nvarchar(16)=null,	
	@birthdate		date=null,
	@gender			bit	=null,
	@state			nchar(50)	=null,
	@city			nchar(50)	=null,
	@user_rank		int	=null,
	@item_id		nvarchar(32) = null,
	@add_or_remove	bit=null,
	@field2Update	NVARCHAR(20) = '',
	@StatementType	NVARCHAR(20) = ''

	)

	/*
	@user_id	varchar(50)	=null,
	@first_name	nvarchar(50)=null,	
	@last_name	nvarchar(50)=null,	
	@password	nvarchar(16)=null,	
	@birthdate	date	=null,
	@gender	bit	=null,
	@state	nchar(50)	=null,
	@city	nchar(50)	=null,
	@user_rank	int	=null
		
	@user_id,
	@first_name,	
	@last_name,	
	@password,	
	@birthdate,
	@gender,
	@state,
	@city,
	@user_rank,

	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN  
			INSERT INTO users_tbl  
				( 
				user_id,
				first_name,	
				last_name,	
				password,	
				birthdate,
				gender,
				state,
				city,
				user_rank
				)  
			VALUES     
				(	
				@user_id,
				@first_name,	
				@last_name,	
				@password,	
				ISNULL(@birthdate,GETDATE()),
				@gender,
				@state,
				@city,
				@user_rank
				)  
		END  
	ELSE IF @StatementType = 'Select' 
		BEGIN  
			(
			SELECT 
				users.user_id
				--,users.first_name
				--,users.last_name
				--,users.password
				--,users.birthdate
				--,users.gender
				--,users.state
				--,users.city
				--,users.user_rank
			FROM 
				users_tbl users
			) 
		
		END 
	ELSE IF @StatementType = 'SelectByUserId' 
		BEGIN  
			(
			SELECT 
				users.user_id,
				users.first_name,	
				users.last_name,	
				users.password,	
				users.birthdate,
				users.gender,
				users.state,
				users.city,
				users.user_rank
			FROM 
				users_tbl users
			WHERE
				users.user_id=@user_id
			) 
		END 

	ELSE IF @StatementType = 'Update'
        BEGIN  
			UPDATE users_tbl
			SET user_rank+=@user_rank
			WHERE user_id= @user_id; 
        END  
	ELSE IF @StatementType = 'UpdateProfile' 
        BEGIN  
				 IF(@field2Update='name')
			BEGIN 
				UPDATE users_tbl
				SET first_name=@first_name ,last_name=@last_name
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='password')
			BEGIN 
				UPDATE users_tbl
				SET password=@password
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='birthdate')
			BEGIN 
				UPDATE users_tbl
				SET birthdate=ISNULL(@birthdate,GETDATE())
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='gender')
			BEGIN 
				UPDATE users_tbl
				SET gender=@gender
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='state')
			BEGIN 
				UPDATE users_tbl
				SET state=@state
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='city')
			BEGIN 
				UPDATE users_tbl
				SET city=@city
				WHERE user_id= @user_id; 
			END
			ELSE IF (@field2Update='favorites')
			BEGIN
			IF (@add_or_remove = 1)--add
				BEGIN
				INSERT INTO favorites_tbl VALUES(@user_id, @item_id)
				END
			ELSE IF (@add_or_remove = 0)--remove
				BEGIN
					DELETE FROM favorites_tbl
					WHERE user_id=@user_id and item_id=@item_id
				 END
			END
        END 
		ELSE IF @StatementType='selectUserFavorites'
		BEGIN
			SELECT * FROM favorites_tbl 
			WHERE user_id=@user_id
		END
		--ELSE IF @StatementType='selectAllUsersEmails'
		--BEGIN
		--	SELECT user_id
		--	FROM users_tbl 
		--END
	ELSE IF @StatementType ='verifyReceipts'
		BEGIN 
			SELECT 
				r.receipt_id,			r.user_id,			r.date, 
				r.discount_dollar receipts_discount_dollar,		r.discount_percent receipts_discount_percent,
				r.receipt_image,	r.receipt_description,	r.store_id,			
				i.item_title,			i.price,			i.discount_dollar,
				i.discount_percent,		i.id_type,			i.item_image,
				i.item_description,		i.item_id,			i.category_id,	
				i.sub_category_id,		
				s.store_name, i.barcode
			FROM receipts_tbl r inner join items_tbl i on r.receipt_id=i.receipt_id
								inner join stores_tbl s on r.store_id= s.store_id
			WHERE	r.receipt_id=	(	SELECT TOP 1 r.receipt_id
										FROM receipts_tbl r 
										WHERE r.to_show is null
										ORDER BY NEWID()	)
					and @user_id!= r.user_id
			GROUP BY	r.receipt_id,			r.user_id,			r.date, 
						r.discount_dollar,		r.discount_percent,	r.receipt_image,
						r.receipt_description,	r.store_id,			
						i.item_title,			i.price,			i.discount_dollar,
						i.discount_percent,		i.id_type,			i.item_image,
						i.item_description,		i.item_id,			i.category_id,	
						i.sub_category_id,s.store_name,i.barcode
		END
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  

END
GO
USE [master]
GO
ALTER DATABASE [bgroup4_prod] SET  READ_WRITE 
GO
