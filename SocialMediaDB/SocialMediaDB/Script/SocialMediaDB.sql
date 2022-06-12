﻿USE [master]
GO
/****** Object:  Database [SOCIAL_MEDIA]    Script Date: 12.06.2022 16:22:37 ******/
CREATE DATABASE [SOCIAL_MEDIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SOCIAL_MEDIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SOCIAL_MEDIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SOCIAL_MEDIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SOCIAL_MEDIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SOCIAL_MEDIA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SOCIAL_MEDIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET RECOVERY FULL 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET  MULTI_USER 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SOCIAL_MEDIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SOCIAL_MEDIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SOCIAL_MEDIA', N'ON'
GO
ALTER DATABASE [SOCIAL_MEDIA] SET QUERY_STORE = OFF
GO
USE [SOCIAL_MEDIA]
GO
/****** Object:  Schema [User]    Script Date: 12.06.2022 16:22:37 ******/
CREATE SCHEMA [User]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
	[SurName] [nchar](100) NULL,
	[Email] [nchar](100) NULL,
	[Password] [nchar](100) NULL,
	[UserName] [nchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Comments]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CommentBody] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[PostId] [int] NOT NULL,
	[CommentCaption] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[FriendConfirmation]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[FriendConfirmation](
	[FriendConfirmationId] [int] IDENTITY(1,1) NOT NULL,
	[SourceId] [int] NULL,
	[TargetId] [int] NULL,
	[IsAccepted] [bit] NULL,
	[SentDate] [datetime2](7) NULL,
 CONSTRAINT [PK_FriendConfirmation] PRIMARY KEY CLUSTERED 
(
	[FriendConfirmationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Friends]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Friends](
	[UserFriendId] [int] IDENTITY(1,1) NOT NULL,
	[SourceId] [int] NULL,
	[TargetId] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[UserFriendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[GroupMessages]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[GroupMessages](
	[GroupMessagesId] [int] IDENTITY(1,1) NOT NULL,
	[MessageTypeId] [int] NULL,
	[MessageBody] [nvarchar](max) NULL,
	[SentDate] [datetime2](7) NULL,
	[SenderId] [int] NULL,
	[RecieverId] [int] NULL,
 CONSTRAINT [PK_GroupMessages] PRIMARY KEY CLUSTERED 
(
	[GroupMessagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[Main]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Main](
	[UserId] [int] NOT NULL,
	[Name] [nchar](100) NULL,
	[SurName] [nchar](100) NULL,
	[Email] [nchar](100) NULL,
	[Password] [nchar](100) NULL,
	[UserName] [nchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Message]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Message](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageTitle] [nchar](100) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[SentDate] [datetime2](7) NULL,
	[MessageTypeId] [int] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[MessageHistory]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[MessageHistory](
	[MessageHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NULL,
	[MessageTypeId] [int] NULL,
	[MessageBody] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_MessageHistory] PRIMARY KEY CLUSTERED 
(
	[MessageHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [User].[MessageType]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[MessageType](
	[MessageTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MessageTypeName] [nchar](10) NULL,
 CONSTRAINT [PK_MessageType] PRIMARY KEY CLUSTERED 
(
	[MessageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[PostLikes]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[PostLikes](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_PostLikes] PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User].[Posts]    Script Date: 12.06.2022 16:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nchar](100) NULL,
	[Body] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [User].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostId])
REFERENCES [User].[Posts] ([PostId])
GO
ALTER TABLE [User].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [User].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [User].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
ALTER TABLE [User].[FriendConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_FriendConfirmation_Friends] FOREIGN KEY([SourceId])
REFERENCES [User].[Friends] ([UserFriendId])
GO
ALTER TABLE [User].[FriendConfirmation] CHECK CONSTRAINT [FK_FriendConfirmation_Friends]
GO
ALTER TABLE [User].[FriendConfirmation]  WITH CHECK ADD  CONSTRAINT [FK_FriendConfirmation_Friends1] FOREIGN KEY([TargetId])
REFERENCES [User].[Friends] ([UserFriendId])
GO
ALTER TABLE [User].[FriendConfirmation] CHECK CONSTRAINT [FK_FriendConfirmation_Friends1]
GO
ALTER TABLE [User].[GroupMessages]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessages_MessageType] FOREIGN KEY([MessageTypeId])
REFERENCES [User].[MessageType] ([MessageTypeId])
GO
ALTER TABLE [User].[GroupMessages] CHECK CONSTRAINT [FK_GroupMessages_MessageType]
GO
ALTER TABLE [User].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_MessageType] FOREIGN KEY([MessageTypeId])
REFERENCES [User].[MessageType] ([MessageTypeId])
GO
ALTER TABLE [User].[Message] CHECK CONSTRAINT [FK_Message_MessageType]
GO
ALTER TABLE [User].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [User].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
ALTER TABLE [User].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [User].[Message] CHECK CONSTRAINT [FK_Message_User1]
GO
ALTER TABLE [User].[MessageHistory]  WITH CHECK ADD  CONSTRAINT [FK_MessageHistory_Message] FOREIGN KEY([MessageId])
REFERENCES [User].[Message] ([MessageId])
GO
ALTER TABLE [User].[MessageHistory] CHECK CONSTRAINT [FK_MessageHistory_Message]
GO
ALTER TABLE [User].[MessageHistory]  WITH CHECK ADD  CONSTRAINT [FK_MessageHistory_MessageType] FOREIGN KEY([MessageTypeId])
REFERENCES [User].[MessageType] ([MessageTypeId])
GO
ALTER TABLE [User].[MessageHistory] CHECK CONSTRAINT [FK_MessageHistory_MessageType]
GO
ALTER TABLE [User].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_PostLikes_Posts] FOREIGN KEY([PostId])
REFERENCES [User].[Posts] ([PostId])
GO
ALTER TABLE [User].[PostLikes] CHECK CONSTRAINT [FK_PostLikes_Posts]
GO
ALTER TABLE [User].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_PostLikes_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [User].[PostLikes] CHECK CONSTRAINT [FK_PostLikes_User]
GO
ALTER TABLE [User].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [User].[Posts] CHECK CONSTRAINT [FK_Posts_User]
GO
USE [master]
GO
ALTER DATABASE [SOCIAL_MEDIA] SET  READ_WRITE 
GO
