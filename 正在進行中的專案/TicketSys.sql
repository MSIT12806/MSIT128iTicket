USE [master]
GO
/****** Object:  Database [TicketSys]    Script Date: 2020/11/25 上午 09:51:34 ******/
CREATE DATABASE [TicketSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSys', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketSys_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TicketSys] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSys] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TicketSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSys] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketSys] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketSys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketSys] SET QUERY_STORE = OFF
GO
USE [TicketSys]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[SellerID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](50) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Hostwords] [nvarchar](100) NOT NULL,
	[Map] [varchar](max) NULL,
	[ActivityStatusID] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityStatus]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityStatus](
	[ActivityStatusID] [int] NOT NULL,
	[ActivityStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityStatus] PRIMARY KEY CLUSTERED 
(
	[ActivityStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTitle] [nvarchar](50) NOT NULL,
	[ArticleContent] [nvarchar](max) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Picture] [varbinary](50) NULL,
	[ArticleCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategories]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategories](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ArticleCategories] PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanLIst]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanLIst](
	[BanId] [int] IDENTITY(1,1) NOT NULL,
	[BanMemberId] [int] NOT NULL,
	[AdminMemberId] [int] NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BanLIst] PRIMARY KEY CLUSTERED 
(
	[BanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentMemberID] [int] NOT NULL,
	[CommentActivityId] [int] NOT NULL,
	[CommentContent] [nvarchar](300) NOT NULL,
	[CommentScore] [int] NOT NULL,
	[CommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emotion](
	[EmotionId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_Emtion] PRIMARY KEY CLUSTERED 
(
	[EmotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmotionAction]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmotionAction](
	[EmotionActionId] [int] IDENTITY(1,1) NOT NULL,
	[EmotionActionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmotionAction] PRIMARY KEY CLUSTERED 
(
	[EmotionActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IDentityNumber] [char](10) NULL,
	[Passport] [varchar](20) NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Phone] [char](10) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Point] [int] NULL,
	[Address] [nvarchar](100) NULL,
	[MemberRoleId] [int] NOT NULL,
	[Icon] [nvarchar](max) NULL,
	[Sex] [bit] NULL,
	[DistrictId] [int] NULL,
	[RegisterCheckCode] [varchar](50) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberMissionStatusList]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMissionStatusList](
	[MissionStatusID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MissionID] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_MemberMissionStatusList] PRIMARY KEY CLUSTERED 
(
	[MissionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRole]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberRoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missions]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionID] [int] IDENTITY(1,1) NOT NULL,
	[MissionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Reward] [int] NOT NULL,
	[Difficulty] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Missions] PRIMARY KEY CLUSTERED 
(
	[MissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[OrderStatus] [bit] NOT NULL,
	[OrderGuid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[ReplyID] [int] IDENTITY(1,1) NOT NULL,
	[ReplyContent] [nvarchar](50) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ReplyDate] [datetime] NOT NULL,
	[ArticleID] [int] NOT NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply_Report]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply_Report](
	[Reply_ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[ReplyId] [int] NOT NULL,
 CONSTRAINT [PK_Reply_Report] PRIMARY KEY CLUSTERED 
(
	[Reply_ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] NOT NULL,
	[ReportReason] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[TaxIDNumber] [char](8) NOT NULL,
	[SellerHomePage] [nvarchar](50) NULL,
	[SellerPhone] [nvarchar](50) NOT NULL,
	[SellerDeccription] [nvarchar](max) NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ShoppingCartID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortMessage]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShortMessage](
	[ShortMessageID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MessageContent] [text] NOT NULL,
 CONSTRAINT [PK_ShortMessage] PRIMARY KEY CLUSTERED 
(
	[ShortMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SearchedTime] [int] NOT NULL,
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[SubcribeID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
 CONSTRAINT [PK_Subscribes] PRIMARY KEY CLUSTERED 
(
	[SubcribeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCategory]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCategory](
	[TicketCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[TicketCategoryName] [nvarchar](5) NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketCategory] PRIMARY KEY CLUSTERED 
(
	[TicketCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketGroupDetail]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGroupDetail](
	[TicketGroupDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TicketGroupId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketGroupDetail] PRIMARY KEY CLUSTERED 
(
	[TicketGroupDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketGroups]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketGroups](
	[TicketGroupId] [int] IDENTITY(1,1) NOT NULL,
	[TicketGroupName] [nvarchar](50) NOT NULL,
	[TicketGroupDiscount] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_TicketGroups] PRIMARY KEY CLUSTERED 
(
	[TicketGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketQRCodes]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketQRCodes](
	[QRCodeId] [int] IDENTITY(1,1) NOT NULL,
	[QRCode] [nvarchar](50) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_TicketQRCodes] PRIMARY KEY CLUSTERED 
(
	[QRCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketCategoryId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
	[TicketTimeId] [int] NOT NULL,
	[Discount] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTimes]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTimes](
	[TicketTimeId] [int] IDENTITY(1,1) NOT NULL,
	[TicketTime] [datetime] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_TicketTimes] PRIMARY KEY CLUSTERED 
(
	[TicketTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (1, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (2, N'臺中電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 1, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 2)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (3, N'臺南電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 3)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (4, N'臺東電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 4)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (5, N'臺西電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 4, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 5)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (6, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 5, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (7, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 6, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (8, N'臺南電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 7, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (9, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 8, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (10, N'臺中電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 9, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (11, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (12, N'臺西電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 11, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (13, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (14, N'臺東電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 13, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (15, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 14, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (16, N'臺中電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (17, N'臺南電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 16, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (18, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 17, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (19, N'臺中電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (20, N'臺西電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 19, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (21, N'臺東電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 20, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (22, N'臺南電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (23, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 22, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (24, N'臺西電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 23, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (25, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 24, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (26, N'臺東電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 1, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (27, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 2, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (28, N'臺南電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'taibeigame.jpg', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (29, N'臺東電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 4, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (30, N'臺北電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'zelda.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 5, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
INSERT [dbo].[Activity] ([ActivityID], [ActivityName], [SellerID], [Description], [Address], [Picture], [Information], [SubCategoryId], [Hostwords], [Map], [ActivityStatusID], [DistrictId]) VALUES (31, N'臺西電玩展', 3, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展首度於2021年雙軌並行，舉辦線上暨線下展覽，誓言將為全球產業人士與玩家帶來全方位的最新遊戲體驗', N'台北南港展覽館1館', N'neneka.png', N'<h2><span style="color: #ff6600;"><strong>【展覽概要】</strong></span></h2>
                        <h4><strong><span style="color: #008000;">台北國際電玩展 Taipei Game Show 2021</span></strong></h4>
                        <p style="text-align: left;"><span style="color: #000000;"><strong><span style="color: #008000;">展覽日期</span> ：</strong></span></p>
                        <ul style="list-style-type: disc;">
                            <li style="text-align: left;"><span style="color: #000000;">B2B ZONE商務區（共2天） 2021年1月28日至1月29日&nbsp;</span></li>
                            <li style="text-align: left;"><span style="color: #000000;">B2C ZONE玩家區（共4天） 2021年1月28日至1月31日</span></li>
                        </ul>
                        <p><span style="color: #000000;"><span style="color: #008000;"><strong>展覽地點</strong></span>：台北南港展覽館1館</span></p>', 6, N'由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.3358991066652!2d121.61592721495893!3d25.056601883961658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ab57f02092dd%3A0x87862fa2121f7e46!2z5Y-w5YyX5Y2X5riv5bGV6Ka96aSoMemkqA!5e0!3m2!1szh-TW!2stw!4v1604582263941!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 1, 1)
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (0, N'未審核')
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (1, N'上架')
INSERT [dbo].[ActivityStatus] ([ActivityStatusID], [ActivityStatusName]) VALUES (2, N'下架')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'類別1')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'類別2')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'類別3')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (8, N'類別4')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (9, N'類別5')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (10, N'類別6')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (11, N'類別7')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (12, N'類別8')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'台北')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'台中')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'台南')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (4, N'高雄')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (2, 1, 1, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (3, 1, 2, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (4, 1, 3, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (5, 1, 4, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (6, 1, 5, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (7, 1, 6, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (8, 1, 7, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (9, 1, 8, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (10, 1, 9, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (11, 1, 10, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (12, 1, 11, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (13, 1, 12, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (14, 1, 13, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (15, 1, 14, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (16, 1, 15, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (17, 1, 16, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (18, 1, 17, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (19, 1, 18, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (20, 1, 19, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (21, 1, 20, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (22, 1, 21, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (23, 1, 22, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (24, 1, 23, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (25, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (26, 1, 25, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (27, 1, 26, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (28, 1, 28, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (29, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (30, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (31, 1, 1, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (32, 1, 2, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (33, 1, 3, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (34, 1, 4, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (35, 1, 5, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (36, 1, 6, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (37, 1, 7, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (38, 1, 8, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (39, 1, 9, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (40, 1, 10, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (41, 1, 11, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (42, 1, 12, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (43, 1, 13, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (44, 1, 14, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (45, 1, 15, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (46, 1, 16, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (47, 1, 17, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (48, 1, 18, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (49, 1, 19, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (50, 1, 20, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (51, 1, 21, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (52, 1, 22, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (53, 1, 23, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (54, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (55, 1, 25, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (56, 1, 26, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (57, 1, 28, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (58, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (59, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (60, 1, 1, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (61, 1, 2, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (62, 1, 3, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (63, 1, 4, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (64, 1, 5, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (65, 1, 6, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (66, 1, 7, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (67, 1, 8, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (68, 1, 9, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (69, 1, 10, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (70, 1, 11, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (71, 1, 12, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (72, 1, 13, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (73, 1, 14, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (74, 1, 15, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (75, 1, 16, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (76, 1, 17, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (77, 1, 18, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (78, 1, 19, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (79, 1, 20, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (80, 1, 21, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (81, 1, 22, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (82, 1, 23, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (83, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (84, 1, 25, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (85, 1, 26, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (86, 1, 28, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (87, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (88, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (89, 1, 1, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (90, 1, 2, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (91, 1, 3, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (92, 1, 4, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (93, 1, 5, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (94, 1, 6, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (95, 1, 7, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (96, 1, 8, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (97, 1, 9, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (98, 1, 10, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (99, 1, 11, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (100, 1, 12, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
GO
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (101, 1, 13, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (102, 1, 14, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (103, 1, 15, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (104, 1, 16, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (105, 1, 17, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (106, 1, 18, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (107, 1, 19, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 3, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (108, 1, 20, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (109, 1, 21, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (110, 1, 22, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 2, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (111, 1, 23, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (112, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (113, 1, 25, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (114, 1, 26, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (115, 1, 28, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 1, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (116, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 4, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (117, 1, 24, N'你要我買1萬塊的游戲主機,我不如玩我免費的手游', 5, CAST(N'2020-11-16T21:13:56.987' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (119, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:56:37.287' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (120, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:56:43.150' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (121, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:56:48.173' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (122, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:56:54.213' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (123, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:56:59.887' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (124, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:06.370' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (125, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:11.990' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (126, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:18.577' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (127, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:24.880' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (128, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:29.490' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (129, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:33.267' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (130, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:37.350' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (131, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:40.980' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (132, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:48.433' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (133, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:52.413' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (134, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:57.287' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (135, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:57.923' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (136, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T21:57:58.860' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (137, 1, 1, N'jioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjdjioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjdjioaiosdjojodjoasjdoiajodjoasjdoijaosjdoiasjodiajsodaoisjdoijasodijoasjd', 1, CAST(N'2020-11-17T22:42:09.543' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (138, 1, 1, N'測試評論上傳功能', 5, CAST(N'2020-11-17T23:09:14.033' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (139, 1, 1, N'測試評論上傳功能2', 5, CAST(N'2020-11-17T23:09:34.997' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (140, 1, 1, N'測試評論', 5, CAST(N'2020-11-17T23:13:38.467' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (141, 1, 1, N'測試測試測試測試測試測試測試測試測試測試測試測試測試測試', 5, CAST(N'2020-11-17T23:14:23.933' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (142, 1, 1, N'test
test
test', 5, CAST(N'2020-11-17T23:15:26.133' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (143, 1, 1, N'test
test
test', 5, CAST(N'2020-11-17T23:15:56.807' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (145, 1, 1, N'台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展 台北電玩', 5, CAST(N'2020-11-17T23:20:35.090' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (146, 1, 1, N'台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展測試用評論台北電玩展 台北電玩', 5, CAST(N'2020-11-17T23:20:55.693' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (147, 1, 1, N'fewfwefwwfwfwefewfewfeffwweffewefefwewefewfefwefefwewfewfefw', 5, CAST(N'2020-11-17T23:21:25.197' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (148, 1, 3, N'jiojaisodjoajdoijaoijdoajodsj', 5, CAST(N'2020-11-17T23:31:16.447' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (149, 1, 5, N'sdfsadfsdfsdfsdsdfsdfds', 5, CAST(N'2020-11-17T23:32:28.957' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (150, 1, 5, N'sdsdfsdfdssdsd', 5, CAST(N'2020-11-17T23:33:37.140' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (151, 1, 25, N'fdsfsdfasdfwafwaewefwefwefweffew', 5, CAST(N'2020-11-17T23:37:50.577' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (152, 1, 25, N'egggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', 5, CAST(N'2020-11-17T23:38:04.680' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (153, 1, 25, N'dfsgdfsgsfdvsadjfoijsiodjfiosjdovncwincowineoinocwnociwneocnow', 5, CAST(N'2020-11-17T23:38:40.857' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (154, 1, 17, N'wfwefwefwef32trhrtg3434334344', 5, CAST(N'2020-11-17T23:39:22.737' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (155, 1, 17, N'wfwefwefwef32trhrtg3434334344gggggggggggggggggggggggggggg', 5, CAST(N'2020-11-17T23:39:32.960' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (156, 1, 21, N'jdsioafjiojsdoifncwniofncioweodjciowjeocnoiweoijjonoweinoinweoifnoicwe', 5, CAST(N'2020-11-17T23:41:35.827' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (157, 1, 21, N'jioqjiodjoiqwjiodjoqiwjodijqoj0-3290238902323', 5, CAST(N'2020-11-17T23:42:09.617' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (158, 1, 21, N'esttest', 5, CAST(N'2020-11-17T23:43:35.663' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (159, 1, 5, N'測試用評論', 5, CAST(N'2020-11-17T23:44:56.923' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (160, 1, 22, N'dsdbdfgervgerverererger', 5, CAST(N'2020-11-17T23:45:37.920' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (161, 1, 29, N'hello world', 5, CAST(N'2020-11-17T23:46:40.427' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (162, 1, 28, N'erergerreferfergegrthrtttrhrtrt', 5, CAST(N'2020-11-17T23:47:46.807' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (163, 1, 4, N'rgregregrewervgfwerfwrfgerggdfssfaswfwefwwefwef', 5, CAST(N'2020-11-18T12:27:13.173' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (164, 1, 22, N'retgergregergykuyukyutyutkykjyu11122222', 5, CAST(N'2020-11-18T13:42:58.277' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (165, 1, 6, N'ewfregesrgerea', 5, CAST(N'2020-11-18T13:54:14.767' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (166, 1, 16, N'112233344444', 5, CAST(N'2020-11-18T13:58:12.527' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (167, 1, 7, N'drthrdthrthrthoipppppppppppppppppppppppppppppppppppppp', 5, CAST(N'2020-11-18T13:58:29.980' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (168, 1, 6, N'000000000000000000000000000000000000000000000000', 0, CAST(N'2020-11-18T14:10:41.470' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (169, 1, 6, N'1111111111111111111111111111111111111111111111', 1, CAST(N'2020-11-18T14:11:02.867' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (170, 1, 29, N'hello world2', 4, CAST(N'2020-11-18T14:16:52.983' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (171, 1, 29, N'hello world3', 2, CAST(N'2020-11-18T14:17:13.403' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (172, 1, 29, N'hello world4', 4, CAST(N'2020-11-18T14:18:43.277' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (173, 1, 29, N'hello world5', 5, CAST(N'2020-11-18T14:19:16.603' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (174, 1, 29, N'hello world6', 4, CAST(N'2020-11-18T14:19:40.300' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (175, 1, 2, N'dfsrgesrgregresgergresger', 5, CAST(N'2020-11-18T14:22:19.507' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (176, 1, 2, N'rgersgwafvewafweftrhrhrthrtshbr', 1, CAST(N'2020-11-18T14:22:27.597' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (177, 1, 4, N'rtwrtrthbrthrt', 3, CAST(N'2020-11-18T14:45:15.610' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (178, 1, 4, N'222222222222222222222222222222222222222222222222', 2, CAST(N'2020-11-18T14:46:10.157' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (179, 1, 4, N'3333333333333333333333333333333333333333333', 3, CAST(N'2020-11-18T14:46:34.997' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (180, 1, 15, N'fyhjyndrhndrtbhnryhnjdrtyhnjrtydhnjdrtyhnj', 4, CAST(N'2020-11-18T20:53:35.087' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (181, 1, 1, N'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', 2, CAST(N'2020-11-19T12:53:44.420' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (182, 1, 2, N'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 4, CAST(N'2020-11-19T12:54:33.907' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (183, 1, 1, N'fefsfewfcewfwe', 0, CAST(N'2020-11-20T20:39:18.700' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (184, 1, 1, N'hjnrthterhbregwegergerger', 4, CAST(N'2020-11-20T20:46:11.257' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (185, 2, 2, N'jisdjofjiosdjfiojsdoijfodsijfoidsjoijfoids', 0, CAST(N'2020-11-20T20:48:53.313' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (186, 2, 2, N'dsfdsfrefewkopkopkweop', 4, CAST(N'2020-11-20T20:49:39.113' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (187, 1, 1, N'123', 3, CAST(N'2020-11-22T16:10:38.020' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (188, 1, 29, N'jiojfsodiwenoincoiwioefooooooo', 3, CAST(N'2020-11-22T16:45:42.617' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (189, 1, 29, N'1111111star hahahaha', 1, CAST(N'2020-11-22T16:46:01.223' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (190, 1, 29, N'ooooppppyyyyuuuuuu', 4, CAST(N'2020-11-22T16:46:29.863' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (191, 1, 1, N'測試上傳評論5星!!!!!!!!!!!!!!!!!!', 0, CAST(N'2020-11-22T16:50:36.090' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (192, 1, 1, N'測試上傳評論5星2!!!!!!', 5, CAST(N'2020-11-22T16:51:00.173' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (193, 1, 1, N'1123455555', 2, CAST(N'2020-11-22T16:51:36.670' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (194, 1, 1, N'我是垃圾評論', 3, CAST(N'2020-11-22T22:55:21.857' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (195, 1, 1, N'1212333112', 5, CAST(N'2020-11-22T23:10:41.357' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (196, 1, 1, N'joijaiodjuhweifiweicowejojojdojas', 4, CAST(N'2020-11-23T21:08:43.153' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [CommentMemberID], [CommentActivityId], [CommentContent], [CommentScore], [CommentDate]) VALUES (197, 1, 1, N'iojweojfoijewaoifjoijawofisdf', 2, CAST(N'2020-11-23T21:09:05.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (1, N'中正區', N'123', 1)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (2, N'中山區', N'345', 1)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (3, N'大安區', N'125', 2)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (4, N'桃園區', N'543', 2)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (5, N'淡水區', N'973', 3)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (6, N'蘆竹區', N'278', 3)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (7, N'新宿區', N'121', 4)
INSERT [dbo].[Districts] ([DistrictId], [DistrictName], [PostCode], [CityId]) VALUES (8, N'澀谷區', N'763', 4)
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [Email], [Name], [IDentityNumber], [Passport], [NickName], [BirthDate], [Phone], [Password], [Point], [Address], [MemberRoleId], [Icon], [Sex], [DistrictId], [RegisterCheckCode]) VALUES (1, N'fantasysdo@yahoo.co.jp', N'admin', NULL, NULL, N'admin', NULL, NULL, N'admin', 100, NULL, 3, NULL, NULL, 1, NULL)
INSERT [dbo].[Member] ([MemberID], [Email], [Name], [IDentityNumber], [Passport], [NickName], [BirthDate], [Phone], [Password], [Point], [Address], [MemberRoleId], [Icon], [Sex], [DistrictId], [RegisterCheckCode]) VALUES (2, N'sjx@yahoo.co.jp', N'Guest', NULL, NULL, N'Guest', NULL, NULL, N'Aa1!admin', NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberRole] ON 

INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (1, N'未驗證')
INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (2, N'普通會員')
INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberRoleName]) VALUES (3, N'商家')
SET IDENTITY_INSERT [dbo].[MemberRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([OrderDetailID], [TicketId], [OrderID], [Quantity], [Discount]) VALUES (24, 1, 4, 1, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Order_Detail] ([OrderDetailID], [TicketId], [OrderID], [Quantity], [Discount]) VALUES (25, 4, 4, 1, CAST(0.30 AS Numeric(3, 2)))
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [MemberID], [OrderDate], [Name], [Email], [DistrictId], [Address], [OrderStatus], [OrderGuid]) VALUES (4, 1, CAST(N'2020-11-25T02:02:49.670' AS DateTime), N'名無しさん', N'fantasysdo@yahoo.co.jp', 1, N'台北市復興南路', 0, N'e1038516524f4c588c6f')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([SellerID], [CompanyName], [TaxIDNumber], [SellerHomePage], [SellerPhone], [SellerDeccription], [MemberId]) VALUES (3, N'Google', N'12345   ', N'www.google.com', N'12345', N'12345', 1)
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 

INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (1, N'子類別1', 5, 49)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (2, N'子類別2', 5, 106)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (3, N'子類別3', 5, 92)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (4, N'子類別4', 6, 35)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (5, N'子類別5', 6, 15)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (6, N'子類別6', 6, 17)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (7, N'子類別7', 7, 18)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (8, N'子類別8', 7, 12)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (9, N'子類別9', 7, 8)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (10, N'子類別10', 8, 13)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (11, N'子類別11', 8, 12)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (12, N'子類別12', 8, 8)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (13, N'子類別13', 9, 9)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (14, N'子類別14', 9, 10)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (15, N'子類別15', 9, 7)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (16, N'子類別16', 10, 12)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (17, N'子類別17', 10, 7)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (18, N'子類別18', 10, 6)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (19, N'子類別19', 11, 16)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (20, N'子類別20', 11, 38)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (21, N'子類別21', 11, 14)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (22, N'子類別22', 12, 18)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (23, N'子類別23', 12, 58)
INSERT [dbo].[SubCategories] ([SubCategoryId], [SubCategoryName], [CategoryId], [SearchedTime]) VALUES (24, N'子類別24', 12, 18)
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketCategory] ON 

INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (1, N'貧窮票', 1)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (2, N'普通票', 1)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (3, N'貴族票', 1)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (4, N'死宅票', 2)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (5, N'高富帥票', 2)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (6, N'死宅票', 4)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (7, N'高富帥票', 4)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (8, N'死宅票', 5)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (9, N'高富帥票', 5)
INSERT [dbo].[TicketCategory] ([TicketCategoryId], [TicketCategoryName], [ActivityId]) VALUES (10, N'白富美票', 5)
SET IDENTITY_INSERT [dbo].[TicketCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketGroupDetail] ON 

INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (15, 1, 1)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (16, 1, 2)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (17, 1, 4)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (18, 1, 5)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (19, 2, 1)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (20, 2, 3)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (21, 2, 11)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (22, 3, 1)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (23, 3, 21)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (24, 4, 1)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (25, 4, 22)
INSERT [dbo].[TicketGroupDetail] ([TicketGroupDetailId], [TicketGroupId], [ActivityId]) VALUES (26, 4, 15)
SET IDENTITY_INSERT [dbo].[TicketGroupDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketGroups] ON 

INSERT [dbo].[TicketGroups] ([TicketGroupId], [TicketGroupName], [TicketGroupDiscount]) VALUES (1, N'旅行套票', CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[TicketGroups] ([TicketGroupId], [TicketGroupName], [TicketGroupDiscount]) VALUES (2, N'音樂套票', CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[TicketGroups] ([TicketGroupId], [TicketGroupName], [TicketGroupDiscount]) VALUES (3, N'熱情套票', CAST(0.40 AS Numeric(3, 2)))
INSERT [dbo].[TicketGroups] ([TicketGroupId], [TicketGroupName], [TicketGroupDiscount]) VALUES (4, N'死宅套票', CAST(0.35 AS Numeric(3, 2)))
SET IDENTITY_INSERT [dbo].[TicketGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (1, 1, 150, 15, 1, 1, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (2, 1, 150, 21, 1, 2, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (3, 1, 200, 10, 1, 3, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (4, 2, 300, 22, 1, 1, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (5, 2, 300, 13, 1, 2, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (6, 2, 400, 5, 1, 3, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (7, 3, 5000, 6, 1, 1, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (9, 3, 6000, 40, 1, 3, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (10, 4, 300, 2, 2, 6, CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (11, 4, 200, 11, 2, 7, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (12, 5, 40, 25, 2, 6, CAST(0.00 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (13, 5, 400, 27, 2, 7, CAST(0.35 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (14, 6, 120, 22, 4, 8, CAST(0.30 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (15, 6, 350, 12, 4, 9, CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (16, 7, 300, 29, 4, 8, CAST(0.50 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (17, 7, 500, 10, 4, 9, CAST(0.25 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (18, 8, 550, 21, 5, 10, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (19, 8, 320, 15, 5, 11, CAST(0.10 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (20, 9, 123, 15, 5, 10, CAST(0.25 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (21, 9, 200, 19, 5, 11, CAST(0.35 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (22, 10, 230, 20, 5, 10, CAST(0.15 AS Numeric(3, 2)))
INSERT [dbo].[Tickets] ([TicketID], [TicketCategoryId], [Price], [UnitsInStock], [ActivityID], [TicketTimeId], [Discount]) VALUES (23, 10, 330, 33, 5, 11, CAST(0.20 AS Numeric(3, 2)))
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketTimes] ON 

INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (1, CAST(N'2020-12-25T09:00:00.000' AS DateTime), 1)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (2, CAST(N'2020-12-25T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (3, CAST(N'2020-12-25T15:00:00.000' AS DateTime), 1)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (6, CAST(N'2020-11-23T10:00:00.000' AS DateTime), 2)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (7, CAST(N'2020-11-23T12:00:00.000' AS DateTime), 2)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (8, CAST(N'2020-11-30T12:00:00.000' AS DateTime), 4)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (9, CAST(N'2020-12-01T12:00:00.000' AS DateTime), 4)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (10, CAST(N'2020-11-24T19:00:00.000' AS DateTime), 5)
INSERT [dbo].[TicketTimes] ([TicketTimeId], [TicketTime], [ActivityId]) VALUES (11, CAST(N'2020-11-25T20:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[TicketTimes] OFF
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_ActivityStatusID]  DEFAULT ((0)) FOR [ActivityStatusID]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_CommentDate]  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_Point]  DEFAULT ((100)) FOR [Point]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderStatus]  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[SubCategories] ADD  CONSTRAINT [DF_SubCategories_SearchedTime]  DEFAULT ((0)) FOR [SearchedTime]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ActivityStatus] FOREIGN KEY([ActivityStatusID])
REFERENCES [dbo].[ActivityStatus] ([ActivityStatusID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ActivityStatus]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Districts]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SellerID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Seller]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_SubCategories]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategories] FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategories] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategories]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Member]
GO
ALTER TABLE [dbo].[BanLIst]  WITH CHECK ADD  CONSTRAINT [FK_BanLIst_Member] FOREIGN KEY([BanMemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[BanLIst] CHECK CONSTRAINT [FK_BanLIst_Member]
GO
ALTER TABLE [dbo].[BanLIst]  WITH CHECK ADD  CONSTRAINT [FK_BanLIst_Member1] FOREIGN KEY([AdminMemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[BanLIst] CHECK CONSTRAINT [FK_BanLIst_Member1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Activity] FOREIGN KEY([CommentActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Activity]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Member] FOREIGN KEY([CommentMemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Member]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Districts] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Districts]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Article]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_EmotionAction] FOREIGN KEY([ActionId])
REFERENCES [dbo].[EmotionAction] ([EmotionActionId])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_EmotionAction]
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_Member]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Districts]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_MemberRole] FOREIGN KEY([MemberRoleId])
REFERENCES [dbo].[MemberRole] ([MemberRoleId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_MemberRole]
GO
ALTER TABLE [dbo].[MemberMissionStatusList]  WITH CHECK ADD  CONSTRAINT [FK_MemberMissionStatusList_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberMissionStatusList] CHECK CONSTRAINT [FK_MemberMissionStatusList_Member]
GO
ALTER TABLE [dbo].[MemberMissionStatusList]  WITH CHECK ADD  CONSTRAINT [FK_MemberMissionStatusList_Missions] FOREIGN KEY([MissionID])
REFERENCES [dbo].[Missions] ([MissionID])
GO
ALTER TABLE [dbo].[MemberMissionStatusList] CHECK CONSTRAINT [FK_MemberMissionStatusList_Missions]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Orders]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Tickets1] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Tickets1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Districts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Member]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Article]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Member]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Member]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Reply] FOREIGN KEY([ReplyId])
REFERENCES [dbo].[Reply] ([ReplyID])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Reply]
GO
ALTER TABLE [dbo].[Reply_Report]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Report_Report] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([ReportId])
GO
ALTER TABLE [dbo].[Reply_Report] CHECK CONSTRAINT [FK_Reply_Report_Report]
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Seller] CHECK CONSTRAINT [FK_Seller_Member]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Member]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Tickets]
GO
ALTER TABLE [dbo].[ShortMessage]  WITH CHECK ADD  CONSTRAINT [FK_ShortMessage_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ShortMessage] CHECK CONSTRAINT [FK_ShortMessage_Member]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_Categories]
GO
ALTER TABLE [dbo].[Subscribes]  WITH CHECK ADD  CONSTRAINT [FK_Subscribes_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Subscribes] CHECK CONSTRAINT [FK_Subscribes_Member]
GO
ALTER TABLE [dbo].[Subscribes]  WITH CHECK ADD  CONSTRAINT [FK_Subscribes_Seller] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Seller] ([SellerID])
GO
ALTER TABLE [dbo].[Subscribes] CHECK CONSTRAINT [FK_Subscribes_Seller]
GO
ALTER TABLE [dbo].[TicketCategory]  WITH CHECK ADD  CONSTRAINT [FK_TicketCategory_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketCategory] CHECK CONSTRAINT [FK_TicketCategory_Activity]
GO
ALTER TABLE [dbo].[TicketGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TicketGroupDetail_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketGroupDetail] CHECK CONSTRAINT [FK_TicketGroupDetail_Activity]
GO
ALTER TABLE [dbo].[TicketGroupDetail]  WITH CHECK ADD  CONSTRAINT [FK_TicketGroupDetail_TicketGroups] FOREIGN KEY([TicketGroupId])
REFERENCES [dbo].[TicketGroups] ([TicketGroupId])
GO
ALTER TABLE [dbo].[TicketGroupDetail] CHECK CONSTRAINT [FK_TicketGroupDetail_TicketGroups]
GO
ALTER TABLE [dbo].[TicketQRCodes]  WITH CHECK ADD  CONSTRAINT [FK_TicketQRCodes_Order_Detail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[Order_Detail] ([OrderDetailID])
GO
ALTER TABLE [dbo].[TicketQRCodes] CHECK CONSTRAINT [FK_TicketQRCodes_Order_Detail]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Activity]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketCategory] FOREIGN KEY([TicketCategoryId])
REFERENCES [dbo].[TicketCategory] ([TicketCategoryId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketCategory]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketTimes] FOREIGN KEY([TicketTimeId])
REFERENCES [dbo].[TicketTimes] ([TicketTimeId])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketTimes]
GO
ALTER TABLE [dbo].[TicketTimes]  WITH CHECK ADD  CONSTRAINT [FK_TicketTimes_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[TicketTimes] CHECK CONSTRAINT [FK_TicketTimes_Activity]
GO
/****** Object:  Trigger [dbo].[OrderDetail_Delete]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[OrderDetail_Delete] on [dbo].[Order_Detail]
for delete as
update tickets set UnitsInStock = (UnitsInStock+deleted.quantity)
from tickets join deleted on tickets.ticketId = deleted.TicketId
GO
ALTER TABLE [dbo].[Order_Detail] ENABLE TRIGGER [OrderDetail_Delete]
GO
/****** Object:  Trigger [dbo].[OrderDetail_Insert]    Script Date: 2020/11/25 上午 09:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[OrderDetail_Insert] on [dbo].[Order_Detail]
for insert as
update tickets set UnitsInStock = (UnitsInStock-inserted.quantity)
from tickets join inserted on tickets.TicketID = inserted.TicketId
GO
ALTER TABLE [dbo].[Order_Detail] ENABLE TRIGGER [OrderDetail_Insert]
GO
USE [master]
GO
ALTER DATABASE [TicketSys] SET  READ_WRITE 
GO
