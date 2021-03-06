USE [master]
GO
/****** Object:  Database [JJMdb]    Script Date: 2020/11/12 下午 08:02:37 ******/
CREATE DATABASE [JJMdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JJMdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JJMdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JJMdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JJMdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JJMdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JJMdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JJMdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JJMdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JJMdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JJMdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JJMdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [JJMdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JJMdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JJMdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JJMdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JJMdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JJMdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JJMdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JJMdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JJMdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JJMdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JJMdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JJMdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JJMdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JJMdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JJMdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JJMdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JJMdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JJMdb] SET RECOVERY FULL 
GO
ALTER DATABASE [JJMdb] SET  MULTI_USER 
GO
ALTER DATABASE [JJMdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JJMdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JJMdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JJMdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JJMdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JJMdb', N'ON'
GO
ALTER DATABASE [JJMdb] SET QUERY_STORE = OFF
GO
USE [JJMdb]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [int] IDENTITY(1,1) NOT NULL,
	[b_name] [nvarchar](50) NULL,
	[b_cardnumber] [int] NULL,
	[b_expireMonth] [int] NULL,
	[b_expireYear] [int] NULL,
	[b_code] [int] NULL,
	[b_billing] [nvarchar](255) NULL,
	[memberID] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NULL,
	[c_nameText] [nvarchar](100) NULL,
	[c_intro] [nvarchar](100) NULL,
	[c_startTime] [date] NULL,
	[c_endTime] [date] NULL,
	[c_hourRate] [int] NULL,
	[c_registerStart] [date] NULL,
	[c_registerEnd] [date] NULL,
	[c_maxStudent] [int] NULL,
	[c_minStudent] [int] NULL,
	[c_student] [int] NULL,
	[c_location] [nvarchar](100) NULL,
	[c_price] [int] NULL,
	[c_onsaleStart] [date] NULL,
	[c_onsaleEnd] [date] NULL,
	[c_discount] [float] NULL,
	[c_level] [int] NULL,
	[c_requirement] [nvarchar](500) NULL,
	[c_rate] [float] NULL,
	[c_imgPath1] [nvarchar](100) NULL,
	[c_imgPath2] [nvarchar](100) NULL,
	[c_imgPath3] [nvarchar](100) NULL,
	[c_lable1] [nvarchar](20) NULL,
	[c_lable2] [nvarchar](20) NULL,
	[c_lable3] [nvarchar](20) NULL,
	[c_lable4] [nvarchar](20) NULL,
	[c_lable5] [nvarchar](20) NULL,
	[teacherID] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[memberID] [int] IDENTITY(1,1) NOT NULL,
	[m_firstName] [nvarchar](50) NULL,
	[m_lastName] [nvarchar](50) NULL,
	[m_birth] [date] NULL,
	[m_gender] [nvarchar](10) NULL,
	[m_email] [nvarchar](50) NULL,
	[m_password] [nvarchar](50) NULL,
	[m_phone] [nvarchar](50) NULL,
	[m_district] [nvarchar](255) NULL,
	[m_address] [nvarchar](255) NULL,
	[m_role] [int] NULL,
	[m_hobby] [nvarchar](255) NULL,
	[m_imgPath] [nvarchar](100) NULL,
	[m_Jpoint] [int] NULL,
 CONSTRAINT [PK_member] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[messageID] [int] IDENTITY(1,1) NOT NULL,
	[m_send] [nvarchar](50) NULL,
	[m_sendText] [nvarchar](500) NULL,
	[m_sendTime] [datetime] NULL,
	[m_reply] [nvarchar](50) NULL,
	[m_replyText] [nvarchar](500) NULL,
	[m_replyTime] [datetime] NULL,
	[m_status] [nvarchar](10) NULL,
	[memberID] [int] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[messageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] NOT NULL,
	[memberID] [int] NULL,
	[o_orderdate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[od_itemID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[classID] [int] NULL,
	[c_name] [nvarchar](50) NULL,
	[c_price] [int] NULL,
	[c_discount] [float] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[od_itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pay]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pay](
	[payID] [int] IDENTITY(1,1) NOT NULL,
	[p_priceTotal] [int] NULL,
	[p_getNow] [datetime] NULL,
	[p_memo] [nvarchar](50) NULL,
	[orderID] [int] NULL,
 CONSTRAINT [PK_Pay] PRIMARY KEY CLUSTERED 
(
	[payID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[shopID] [int] IDENTITY(1,1) NOT NULL,
	[classID] [int] NULL,
	[memberID] [int] NULL,
	[s_getNow] [datetime] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[shopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacherID] [int] IDENTITY(1,1) NOT NULL,
	[t_certificateImg] [nvarchar](max) NULL,
	[t_title] [nvarchar](255) NULL,
	[t_intro] [nvarchar](500) NULL,
	[t_messageTotal] [int] NULL,
	[t_moneyTotal] [int] NULL,
	[t_money] [int] NULL,
	[t_studentTotal] [int] NULL,
	[t_classTotal] [int] NULL,
	[t_rateAvg] [float] NULL,
	[t_socialMedia1] [nvarchar](500) NULL,
	[t_socialMedia2] [nvarchar](500) NULL,
	[t_socialMedia3] [nvarchar](500) NULL,
	[t_socialMedia4] [nvarchar](500) NULL,
	[memberID] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wish]    Script Date: 2020/11/12 下午 08:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wish](
	[WishID] [int] IDENTITY(1,1) NOT NULL,
	[classID] [int] NULL,
	[memberID] [int] NULL,
	[s_getNow] [datetime] NULL,
 CONSTRAINT [PK_Wish] PRIMARY KEY CLUSTERED 
(
	[WishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Member]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teacher] ([teacherID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Teacher]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Class]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Pay]  WITH CHECK ADD  CONSTRAINT [FK_Pay_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Pay] CHECK CONSTRAINT [FK_Pay_Order]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Class]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Member]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Member]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teacher] ([teacherID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Teacher]
GO
ALTER TABLE [dbo].[Wish]  WITH CHECK ADD  CONSTRAINT [FK_Wish_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Wish] CHECK CONSTRAINT [FK_Wish_Class]
GO
ALTER TABLE [dbo].[Wish]  WITH CHECK ADD  CONSTRAINT [FK_Wish_Member] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([memberID])
GO
ALTER TABLE [dbo].[Wish] CHECK CONSTRAINT [FK_Wish_Member]
GO
USE [master]
GO
ALTER DATABASE [JJMdb] SET  READ_WRITE 
GO
