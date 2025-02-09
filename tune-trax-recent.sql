USE [master]
GO
/****** Object:  Database [TuneTrax]    Script Date: 07/07/2024 1:55:07 pm ******/
CREATE DATABASE [TuneTrax]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TuneTrax', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TuneTrax.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TuneTrax_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TuneTrax_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TuneTrax] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TuneTrax].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TuneTrax] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TuneTrax] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TuneTrax] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TuneTrax] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TuneTrax] SET ARITHABORT OFF 
GO
ALTER DATABASE [TuneTrax] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TuneTrax] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TuneTrax] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TuneTrax] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TuneTrax] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TuneTrax] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TuneTrax] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TuneTrax] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TuneTrax] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TuneTrax] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TuneTrax] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TuneTrax] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TuneTrax] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TuneTrax] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TuneTrax] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TuneTrax] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TuneTrax] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TuneTrax] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TuneTrax] SET  MULTI_USER 
GO
ALTER DATABASE [TuneTrax] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TuneTrax] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TuneTrax] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TuneTrax] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TuneTrax] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TuneTrax] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TuneTrax] SET QUERY_STORE = ON
GO
ALTER DATABASE [TuneTrax] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TuneTrax]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/07/2024 1:55:07 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[ArtistId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistGenre]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistGenre](
	[ArtistId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_ArtistGenre] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CountryId] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistTrack]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistTrack](
	[ArtistId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
 CONSTRAINT [PK_ArtistTrack] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[ActorUsername] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenreTrack]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreTrack](
	[GenreId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
 CONSTRAINT [PK_GenreTrack] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvalidTokens]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvalidTokens](
	[TokenId] [uniqueidentifier] NOT NULL,
	[AddedAt] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_InvalidTokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessLevel] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistTrack]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistTrack](
	[PlaylistId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Duration] [int] NOT NULL,
	[CoverImage] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[AudioFile] [nvarchar](300) NOT NULL,
	[AlbumId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[UseCaseName] [nvarchar](100) NOT NULL,
	[UseCaseData] [nvarchar](1500) NOT NULL,
	[AttemptedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 07/07/2024 1:55:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([Id], [ReleaseDate], [ArtistId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (1, CAST(N'2019-05-05T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-25T11:57:53.5871387' AS DateTime2), NULL, NULL, 1, N'Album A')
INSERT [dbo].[Albums] ([Id], [ReleaseDate], [ArtistId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2022-07-12T00:00:00.0000000' AS DateTime2), 2, CAST(N'2024-06-25T11:57:53.5871441' AS DateTime2), NULL, NULL, 1, N'Album B')
INSERT [dbo].[Albums] ([Id], [ReleaseDate], [ArtistId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2002-10-10T00:00:00.0000000' AS DateTime2), 2, CAST(N'2024-06-25T14:45:23.5424152' AS DateTime2), CAST(N'2024-06-25T14:45:45.3548449' AS DateTime2), CAST(N'2024-06-25T14:45:45.3547231' AS DateTime2), 0, N'Album1232')
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (1, 1)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (2, 1)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (3, 1)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (1, 2)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (3, 2)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (3, 3)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (2, 4)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (4, 4)
INSERT [dbo].[ArtistGenre] ([ArtistId], [GenreId]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([Id], [FirstName], [LastName], [DateOfBirth], [Image], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (1, N'Brzi', N'Gonzales', CAST(N'2000-10-10' AS Date), NULL, 1, 0, CAST(N'2024-06-25T11:57:53.5871392' AS DateTime2), NULL, NULL, 1, N'Brzi123')
INSERT [dbo].[Artists] ([Id], [FirstName], [LastName], [DateOfBirth], [Image], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (2, N'Miki', N'Maus', CAST(N'2001-10-10' AS Date), NULL, 2, 0, CAST(N'2024-06-25T11:57:53.5871444' AS DateTime2), NULL, NULL, 1, N'Miki511')
INSERT [dbo].[Artists] ([Id], [FirstName], [LastName], [DateOfBirth], [Image], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (3, N'Pink', N'Panter', CAST(N'2001-11-11' AS Date), NULL, 3, 0, CAST(N'2024-06-25T11:57:53.5871473' AS DateTime2), NULL, NULL, 1, N'pinky2')
INSERT [dbo].[Artists] ([Id], [FirstName], [LastName], [DateOfBirth], [Image], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (4, N'Artist', N'Artist', CAST(N'2000-10-10' AS Date), NULL, 2, 0, CAST(N'2024-06-25T14:50:19.4504322' AS DateTime2), NULL, NULL, 1, N'Artist')
SET IDENTITY_INSERT [dbo].[Artists] OFF
GO
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 1)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 1)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 3)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 4)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 4)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 5)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 5)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 7)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 7)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 8)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 8)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (1, 9)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 10)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 10)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (1, 11)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (2, 12)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 12)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (3, 13)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (1, 14)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (1, 15)
INSERT [dbo].[ArtistTrack] ([ArtistId], [TrackId]) VALUES (1, 16)
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-25T11:57:53.5871396' AS DateTime2), NULL, NULL, 1, N'Finland')
INSERT [dbo].[Countries] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2024-06-25T11:57:53.5871446' AS DateTime2), NULL, NULL, 1, N'Egypt')
INSERT [dbo].[Countries] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2024-06-25T11:57:53.5871475' AS DateTime2), NULL, NULL, 1, N'Peru')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (1, CAST(N'2024-06-25T11:57:53.5871399' AS DateTime2), NULL, NULL, 1, N'Rock')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (2, CAST(N'2024-06-25T11:57:53.5871403' AS DateTime2), NULL, NULL, 1, N'HipHop')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (3, CAST(N'2024-06-25T11:57:53.5871406' AS DateTime2), NULL, NULL, 1, N'Pop')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (4, CAST(N'2024-06-25T11:57:53.5871449' AS DateTime2), NULL, NULL, 1, N'Reggae')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (5, CAST(N'2024-06-25T11:57:53.5871451' AS DateTime2), NULL, NULL, 1, N'Funk')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (6, CAST(N'2024-06-25T11:57:53.5871454' AS DateTime2), NULL, NULL, 1, N'Jazz')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 1)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 3)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (6, 3)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 4)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 4)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 5)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 5)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (5, 6)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 7)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 7)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 8)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 8)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (4, 9)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 10)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 10)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (1, 11)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 12)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (3, 12)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (2, 13)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (1, 14)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (1, 15)
INSERT [dbo].[GenreTrack] ([GenreId], [TrackId]) VALUES (1, 16)
GO
INSERT [dbo].[InvalidTokens] ([TokenId], [AddedAt], [UserId]) VALUES (N'edcbc114-61ff-473d-a80a-2b14102dde40', CAST(N'2024-06-25T14:49:08.2136311' AS DateTime2), 1)
INSERT [dbo].[InvalidTokens] ([TokenId], [AddedAt], [UserId]) VALUES (N'1986f0f0-b4d3-4e97-bcd3-2b2b740d7351', CAST(N'2024-06-25T14:49:35.8073213' AS DateTime2), 2)
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (1, 0, 1, CAST(N'2024-06-25T14:44:36.3291958' AS DateTime2), CAST(N'2024-07-07T09:14:43.2974352' AS DateTime2), NULL, 1, N'play2')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (2, 1, 1, CAST(N'2024-07-06T10:36:37.3690250' AS DateTime2), NULL, NULL, 1, N'play3233')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (3, 0, 4, CAST(N'2024-07-07T10:32:20.5067474' AS DateTime2), CAST(N'2024-07-07T10:32:38.0738564' AS DateTime2), CAST(N'2024-07-07T10:32:38.0738046' AS DateTime2), 0, N'play123')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (4, 0, 4, CAST(N'2024-07-07T10:32:31.5225917' AS DateTime2), CAST(N'2024-07-07T10:32:39.9600981' AS DateTime2), CAST(N'2024-07-07T10:32:39.9600501' AS DateTime2), 0, N'play1234')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (5, 0, 4, CAST(N'2024-07-07T10:37:39.1160022' AS DateTime2), CAST(N'2024-07-07T10:37:45.1253468' AS DateTime2), CAST(N'2024-07-07T10:37:45.1251005' AS DateTime2), 0, N'play123')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (6, 0, 4, CAST(N'2024-07-07T10:37:43.8062607' AS DateTime2), CAST(N'2024-07-07T10:37:47.5037168' AS DateTime2), CAST(N'2024-07-07T10:37:47.5036199' AS DateTime2), 0, N'play1232')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (7, 0, 4, CAST(N'2024-07-07T10:37:55.2465151' AS DateTime2), CAST(N'2024-07-07T11:36:41.8725094' AS DateTime2), CAST(N'2024-07-07T11:36:41.8717812' AS DateTime2), 0, N'my play')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (8, 0, 4, CAST(N'2024-07-07T10:44:55.0090258' AS DateTime2), NULL, NULL, 1, N'play123')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (9, 0, 4, CAST(N'2024-07-07T11:19:01.7556955' AS DateTime2), CAST(N'2024-07-07T11:19:53.9870825' AS DateTime2), CAST(N'2024-07-07T11:19:53.9868895' AS DateTime2), 0, N'pera')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (10, 0, 4, CAST(N'2024-07-07T11:19:47.7816378' AS DateTime2), CAST(N'2024-07-07T11:19:54.6058714' AS DateTime2), CAST(N'2024-07-07T11:19:54.6058250' AS DateTime2), 0, N'Per')
INSERT [dbo].[Playlists] ([Id], [AccessLevel], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [Name]) VALUES (11, 0, 4, CAST(N'2024-07-07T11:19:51.6378379' AS DateTime2), CAST(N'2024-07-07T11:19:56.7245203' AS DateTime2), CAST(N'2024-07-07T11:19:56.7244751' AS DateTime2), 0, N'Pere')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (1, 14)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (2, 15)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (8, 16)
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (1, N'Song3', 230, NULL, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), N'default.mp3', NULL, CAST(N'2024-06-25T11:57:53.5871470' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (2, N'Song1', 157, NULL, CAST(N'2020-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', 1, CAST(N'2024-06-25T11:57:53.5871088' AS DateTime2), CAST(N'2024-06-25T14:48:59.6090437' AS DateTime2), NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (3, N'Song2', 230, NULL, CAST(N'2023-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', 2, CAST(N'2024-06-25T11:57:53.5871439' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (4, N'Title1', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:53:40.1514094' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (5, N'Title51', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', NULL, CAST(N'2024-06-25T14:53:54.6405843' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (6, N'Title11', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:54:42.1982780' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (7, N'Title12', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', 1, CAST(N'2024-06-25T14:54:57.3785866' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (8, N'Title13', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:55:06.9824452' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (9, N'Title14', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', 1, CAST(N'2024-06-25T14:55:16.0405251' AS DateTime2), CAST(N'2024-06-25T14:56:31.9546112' AS DateTime2), NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (10, N'Title15', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:55:21.6636049' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (11, N'Title16', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', 1, CAST(N'2024-06-25T14:55:29.6784137' AS DateTime2), CAST(N'2024-06-25T14:56:14.8533313' AS DateTime2), NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (12, N'Title17', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:55:38.5532949' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (13, N'Title18', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', NULL, CAST(N'2024-06-25T14:55:47.5027944' AS DateTime2), CAST(N'2024-06-25T14:57:22.1676716' AS DateTime2), NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (14, N'Title19', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:56:00.8301468' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (15, N'Title20', 230, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default.mp3', NULL, CAST(N'2024-06-25T14:57:47.0263725' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Tracks] ([Id], [Title], [Duration], [CoverImage], [ReleaseDate], [AudioFile], [AlbumId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (16, N'Title1', 157, NULL, CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), N'default2.mp3', NULL, CAST(N'2024-06-25T14:58:01.7141208' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:43:46.2044307' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:43:46.3008958' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (3, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T14:43:57.7491820' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (4, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T14:43:57.8391931' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (5, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T14:44:20.8375175' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (6, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T14:44:23.6128958' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (7, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:44:30.5528763' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (8, N'admin123', N'Create playlist command', N'{"Name":"play2","AccessLevel":0}', CAST(N'2024-06-25T14:44:36.2835224' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (9, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:44:36.3516091' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (10, N'admin123', N'Add track to playlists', N'{"Playlists":[1],"TrackId":2}', CAST(N'2024-06-25T14:44:39.0138635' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (11, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:44:42.7122110' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (12, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[2]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:44:42.7553950' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (13, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:44:55.7648142' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (14, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:44:57.2152506' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (15, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:44:57.2169962' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (16, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:00.8809934' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (17, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[2]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:00.8944485' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (18, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:01.8906127' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (19, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:07.0322591' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (20, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:09.8958442' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (21, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:14.1584509' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (22, N'admin123', N'Create album', N'{"ArtistId":1,"Name":"Album123","ReleaseDate":"2002-10-10T00:00:00"}', CAST(N'2024-06-25T14:45:23.5265350' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (23, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:23.5685119' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (24, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:30.5236989' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (25, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:31.3917403' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (26, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:45:31.3925361' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (27, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:31.3895941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (28, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:35.8577068' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (29, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:37.2316277' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (30, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:38.1457563' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (31, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:39.5835094' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (32, N'admin123', N'Find Album', N'3', CAST(N'2024-06-25T14:45:39.5984799' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (33, N'admin123', N'Update album', N'{"Id":3,"ArtistId":2,"Name":"Album1232","ReleaseDate":"2002-10-10T00:00:00"}', CAST(N'2024-06-25T14:45:43.0557217' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (34, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:43.1041823' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (35, N'admin123', N'Delete album', N'3', CAST(N'2024-06-25T14:45:45.3454834' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (36, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:45.3616850' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (37, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:45:46.2066614' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (38, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:48.0209554' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (39, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:49.2624901' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (40, N'admin123', N'Delete track', N'2', CAST(N'2024-06-25T14:45:53.1617834' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (41, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:53.2262430' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (42, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:54.8098360' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (43, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:45:54.8102153' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (44, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T14:45:55.3802476' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (45, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T14:45:55.4178059' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (46, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:45:58.7926543' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (47, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:46:00.4749626' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (48, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:47:20.1424700' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (49, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:47:31.8219161' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (50, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:47:31.8237942' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (51, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:47:31.8263652' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (52, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T14:47:31.8625637' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (53, N'admin123', N'Update track', N'{"Id":2,"Title":"Song1","Duration":200,"CoverImage":null,"ReleaseDate":"2020-10-10T00:00:00","AudioFile":"bd39f389-eae1-4209-ac10-25fa38d27bf9.mp3","Genres":[3],"Artists":[2],"AlbumId":1}', CAST(N'2024-06-25T14:47:44.2912817' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (54, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:47:44.3838586' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (55, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:47:49.1967723' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (56, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:47:50.5148454' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (57, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:47:50.5163756' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (58, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[3]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:47:55.0633848' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (59, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:47:58.2476756' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (60, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,3,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:03.9155946' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (61, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,3,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:04.3859808' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (62, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:06.1440613' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (63, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:09.6865861' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (64, N'admin123', N'Saerch tracks', N'{"Title":"ss","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:10.1273790' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (65, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:11.2659789' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (66, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:11.8930012' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (67, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:14.9177930' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (68, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:48:14.9175961' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (69, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:41.8654139' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (70, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:45.7471042' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (71, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:48:45.7480373' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (72, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T14:48:46.5522678' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (73, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:51.7943763' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (74, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:56.7508388' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (75, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:48:56.7512027' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (76, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:58.0332892' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (77, N'admin123', N'Delete track', N'2', CAST(N'2024-06-25T14:48:59.6002998' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (78, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:48:59.6164719' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (79, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:49:01.8643433' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (80, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:49:08.9392631' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (81, N'unauthorized', N'Registration', N'{"Username":"user123","Email":"user@gmail.com","Password":"user123U","DateOfBirth":"2002-10-10","CountryId":1,"Gender":0}', CAST(N'2024-06-25T14:49:26.4294925' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (82, N'user123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:49:33.5738906' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (83, N'user123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:49:33.5739046' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (84, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:49:44.2470760' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (85, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:49:44.2479246' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (86, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:49:46.5282623' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (87, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:49:48.7756479' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (88, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:49:49.9816008' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (89, N'admin123', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:49:49.9825818' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (90, N'admin123', N'Create artist', N'{"Image":null,"DateOfBirth":"2000-10-10","FirstName":"Artist","LastName":"Artist","Gender":0,"Name":"Artist","CountryId":2,"Genres":[4]}', CAST(N'2024-06-25T14:50:19.4144941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (91, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:50:19.4793061' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (92, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:50:25.7053096' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (93, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:50:27.2338339' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (94, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:50:27.2343192' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (95, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:50:27.2359665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (96, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:50:42.9723454' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (97, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:51:09.7763513' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (98, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:51:11.1090965' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (99, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:51:11.1097009' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (100, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:51:11.1105109' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (101, N'admin123', N'Create track', N'{"Title":"Title51","Duration":117,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"9d5e472c-3bfb-4fd2-b541-4cea393c8d63.mp3","Genres":[2],"Artists":[2],"AlbumId":0}', CAST(N'2024-06-25T14:52:04.8572050' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (102, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:52:48.0803480' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (103, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:52:48.0814032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (104, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:52:48.0813143' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (105, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:52:59.3248140' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (106, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:52:59.3259492' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (107, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:52:59.3267539' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (108, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:01.5770137' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (109, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:01.5785514' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (110, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:01.5790890' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (111, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:03.8082450' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (112, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:03.8094843' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (113, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:03.8094843' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (114, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:16.3851313' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (115, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:16.3851263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (116, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:16.3865168' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (117, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:23.5270554' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (118, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:23.5275738' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (119, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:23.5287342' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (120, N'admin123', N'Create track', N'{"Title":"Title1","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"7b8e30eb-2985-42b2-b1fe-7a5915928212.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:53:40.1097572' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (121, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:53:40.1979485' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (122, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:45.4922827' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (123, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:45.4922830' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (124, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:45.4939491' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (125, N'admin123', N'Create track', N'{"Title":"Title51","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"8ec06575-c1d3-46ec-bd27-ac117fee0605.mp3","Genres":[2,3],"Artists":[3],"AlbumId":null}', CAST(N'2024-06-25T14:53:54.6332324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (126, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:53:54.6678956' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (127, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:55.5906418' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (128, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:53:55.5916413' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (129, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:53:55.5919220' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (130, N'admin123', N'Create track', N'{"Title":"Title11","Duration":123,"CoverImage":"6d21a7cb-eb49-4d25-9927-3f21318c9fbb.jpg","ReleaseDate":"2022-10-10T00:00:00","AudioFile":"c5ce68c5-bfa5-488e-9dd5-2ce12ac5b6c5.mp3","Genres":[5],"Artists":[4],"AlbumId":null}', CAST(N'2024-06-25T14:54:42.1782880' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (131, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:54:42.2307332' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (132, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:54:44.0854509' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (133, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:54:44.0864526' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (134, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:54:44.0872462' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (135, N'admin123', N'Create track', N'{"Title":"Title12","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"97dd61c8-2c1e-483f-83fc-97531042a5d4.mp3","Genres":[2,3],"Artists":[3,4],"AlbumId":1}', CAST(N'2024-06-25T14:54:57.3682299' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (136, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:54:57.4093409' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (137, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:54:59.5787711' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (138, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:54:59.5798683' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (139, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:54:59.5864961' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (140, N'admin123', N'Create track', N'{"Title":"Title13","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"d78d2dd1-52d8-4fd8-9c6b-d1372834b333.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:06.9763607' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (141, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:07.0094664' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (142, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:09.1019916' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (143, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:09.1028306' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (144, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:09.1031177' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (145, N'admin123', N'Create track', N'{"Title":"Title14","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"b99fa6ca-5a32-4e6d-92ac-ad3b22e0bffe.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:16.0323341' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (146, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:16.0653252' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (147, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:17.1383781' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (148, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:17.1395763' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (149, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:17.1417750' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (150, N'admin123', N'Create track', N'{"Title":"Title15","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"6e663da2-ce2d-45a6-9ac0-40d15fa60304.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:21.6562310' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (151, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:21.6883563' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (152, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:23.2616822' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (153, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:23.2626787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (154, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:23.2635204' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (155, N'admin123', N'Create track', N'{"Title":"Title16","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"8518ddf1-8399-4db4-952f-b58fbf6a8f17.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:29.6569280' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (156, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:29.7093961' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (157, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:31.5954794' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (158, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:31.5966330' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (159, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:31.5966340' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (160, N'admin123', N'Create track', N'{"Title":"Title17","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"2b391ad6-811d-4e22-80ee-bb3a53a42c9c.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:38.5470467' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (161, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:38.5809396' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (162, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:41.6862350' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (163, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:41.6861769' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (164, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:41.6873846' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (165, N'admin123', N'Create track', N'{"Title":"Title18","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"a88ed326-8b49-4447-95dc-149a88e67c76.mp3","Genres":[2,3],"Artists":[1,2],"AlbumId":null}', CAST(N'2024-06-25T14:55:47.4962787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (166, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:55:47.5334923' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (167, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:50.8037131' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (168, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:55:50.8044104' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (169, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:55:50.8056036' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (170, N'admin123', N'Create track', N'{"Title":"Title19","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"905ad5e5-3f59-45bf-b11d-71eb90c8c4b8.mp3","Genres":[1],"Artists":[2,3],"AlbumId":null}', CAST(N'2024-06-25T14:56:00.8238817' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (171, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:56:00.8531760' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (172, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:56:06.7380192' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (173, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:56:06.7398445' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (174, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:56:06.7407248' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (175, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T14:56:06.7604702' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (176, N'admin123', N'Update track', N'{"Id":11,"Title":"Title16","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"31000dfa-0a38-46f7-a607-723e070d12ca.mp3","Genres":[1],"Artists":[1],"AlbumId":1}', CAST(N'2024-06-25T14:56:14.8320110' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (177, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:56:14.8920015' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (178, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:56:18.1958475' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (179, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:56:18.1969807' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (180, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:56:18.1983805' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (181, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T14:56:18.2184287' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (182, N'admin123', N'Update track', N'{"Id":9,"Title":"Title14","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"9cce0a94-a53b-4d16-aec4-200e5852e9e1.mp3","Genres":[4],"Artists":[1],"AlbumId":0}', CAST(N'2024-06-25T14:56:26.2326429' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (183, N'admin123', N'Update track', N'{"Id":9,"Title":"Title14","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"9cce0a94-a53b-4d16-aec4-200e5852e9e1.mp3","Genres":[4],"Artists":[1],"AlbumId":1}', CAST(N'2024-06-25T14:56:31.9313560' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (184, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:56:31.9858946' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (185, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:57:09.6183215' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (186, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:15.2245164' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (187, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:57:15.2251034' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (188, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:15.2262221' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (189, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T14:57:15.2596889' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (190, N'admin123', N'Update track', N'{"Id":13,"Title":"Title18","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"1f400363-6a8f-4229-a60f-137964f58064.mp3","Genres":[2],"Artists":[3],"AlbumId":null}', CAST(N'2024-06-25T14:57:22.1607565' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (191, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:57:22.1970203' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (192, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:32.3613025' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (193, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:57:32.3644088' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (194, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:32.3659458' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (195, N'admin123', N'Create track', N'{"Title":"Title20","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"ce8df0d4-fed4-452e-b395-a805c0101775.mp3","Genres":[1],"Artists":[3],"AlbumId":null}', CAST(N'2024-06-25T14:57:47.0081632' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (196, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:57:47.0555559' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (197, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:54.0269717' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (198, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:57:54.0298008' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (199, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:57:54.0309770' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (200, N'admin123', N'Create track', N'{"Title":"Title1","Duration":123,"CoverImage":null,"ReleaseDate":"2022-10-10T00:00:00","AudioFile":"902b09db-31c8-419f-8450-22ff4cfe55e2.mp3","Genres":[1],"Artists":[2],"AlbumId":null}', CAST(N'2024-06-25T14:58:01.7054464' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (201, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:58:01.7506593' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (202, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T14:58:10.6006270' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (203, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:58:11.9431039' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (204, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T14:58:11.9443878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (205, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T14:58:14.5346044' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (206, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:58:16.6560769' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (207, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T14:58:56.2057220' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (208, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:59:03.1517111' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (209, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T14:59:07.4265890' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (210, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:00:30.6098580' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (211, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:05.8436139' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (212, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:28.4136239' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (213, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:33.7234066' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (214, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:40.0213400' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (215, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:51.7457382' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (216, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:01:56.6723777' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (217, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:02:15.8437334' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (218, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:02:20.3558187' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (219, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:02:20.3573219' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (220, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":10}', CAST(N'2024-06-25T15:02:23.7270590' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (221, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:30.3476598' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (222, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:02:30.3478758' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (223, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:02:32.1598927' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (224, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:02:34.0166903' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (225, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:37.0740417' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (226, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:02:37.0759892' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (227, N'admin123', N'Saerch tracks', N'{"Title":"1","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:40.3159216' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (228, N'admin123', N'Saerch tracks', N'{"Title":"12","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:40.3670195' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (229, N'admin123', N'Saerch tracks', N'{"Title":"1","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:41.4063986' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (230, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:41.8884249' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (231, N'admin123', N'Saerch tracks', N'{"Title":"2","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:41.9890469' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (232, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:44.6895990' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (233, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:48.7888151' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (234, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,3,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:02:55.5083638' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (235, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:03:03.9868465' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (236, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4]","Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:03:06.1921532' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (237, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4]","Ids":null,"Sorts":[{"SortType":0,"PropertyName":"releaseDate"}],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:03:08.3459664' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (238, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4]","Ids":null,"Sorts":[{"SortType":0,"PropertyName":"releaseDate"}],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:03:10.6793768' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (239, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4]","Ids":null,"Sorts":[{"SortType":0,"PropertyName":"title"}],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:03:13.6366831' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (240, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:03:17.4878958' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (241, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:03:17.8199442' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (242, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:03:18.4773697' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (243, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:03:20.0877066' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (244, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:05:09.4474634' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (245, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:05:14.9308939' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (246, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:05:14.9331414' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (247, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:05:16.7289595' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (248, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:05:19.1318474' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (249, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:05:19.8332630' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (250, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:05:23.3314129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (251, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:05:25.5289297' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (252, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:05:25.5294595' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (253, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:05:29.4166216' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (254, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:05:32.5594125' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (255, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:05:39.8960342' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (256, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:07:34.9533708' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (257, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:07:36.0029546' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (258, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:07:36.0035499' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (259, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:07:37.3017540' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (260, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:09:53.2177656' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (261, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:09:53.2177518' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (262, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:09:54.4638478' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (263, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:09:55.9177859' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (264, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:10:07.1293241' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (265, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:10:33.2727216' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (266, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:10:33.4129787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (267, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:10:38.9180390' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (268, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:10:39.0567484' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (269, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:10:44.1920226' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (270, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:10:47.4984585' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (271, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:10:48.3102536' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (272, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:10:49.8543128' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (273, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:10:55.9638309' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (274, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:11:00.0755611' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (275, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:11:00.1064956' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (276, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:11:00.1403546' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (277, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:11:00.2082916' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (278, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:11:00.2344910' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (279, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:11:00.3293446' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (280, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:11:03.2288294' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (281, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:11:03.2488726' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (282, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:11:03.2866784' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (283, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:11:03.3751207' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (284, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:11:06.5868964' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (285, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:11:06.6103256' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (286, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:11:06.6394528' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (287, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:11:06.7284946' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (288, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:11:09.9416149' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (289, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:11:09.9662631' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (290, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:11:10.0003564' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (291, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:11:15.3116368' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (292, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:11:15.3118174' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (293, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:11:32.5072967' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (294, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:11:32.5097640' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (295, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:11:52.8583270' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (296, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:11:52.8583142' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (297, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:11:55.2372399' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (298, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:11:55.2383075' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (299, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:11:56.1276905' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (300, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:12:01.6291030' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (301, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:12:03.1850560' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (302, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:12:05.3873655' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (303, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:12:06.5135683' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (304, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:12:06.5135604' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (305, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:07.6318797' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (306, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:12:09.1246177' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (307, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:15.3203234' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (308, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:17.2387232' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (309, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:12:24.2437651' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (310, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:12:24.2447565' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (311, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:25.3749319' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (312, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:27.0453276' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (313, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:29.1822860' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (314, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:12:31.1171183' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (315, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:12:31.1968584' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (316, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:12:32.9880816' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (317, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:12:33.0246394' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (318, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:12:33.0523147' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (319, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:12:33.0881314' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (320, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:12:35.9413579' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (321, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:12:35.9624253' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (322, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:12:35.9954212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (323, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:12:36.1212514' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (324, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:12:36.1904922' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (325, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:12:37.7977367' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (326, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:12:37.8589603' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (327, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:12:37.9041179' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (328, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:12:37.9942242' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (329, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:12:39.2705181' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (330, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:45.1983917' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (331, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:46.5003959' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (332, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:49.9970727' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (333, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:12:52.4736438' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (334, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:12:52.4739833' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (335, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:12:53.9606897' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (336, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:13:02.1145907' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (337, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:13:28.1643941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (338, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:13:28.1647943' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (339, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:13:29.4237740' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (340, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:13:30.5501773' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (341, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:13:31.6709922' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (342, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:13:34.1827065' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (343, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:13:35.1410368' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (344, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:13:35.9737776' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (345, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:13:36.4013243' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (346, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:13:37.0871702' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (347, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:13:38.0220282' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (348, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:13:41.7921847' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (349, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:14:25.1251948' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (350, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:14:25.1251896' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (351, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:14:39.5996079' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (352, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:14:39.5996127' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (353, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:14:40.2230070' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (354, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:14:42.1981069' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (355, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:14:42.9788378' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (356, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:14:43.6862025' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (357, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:14:43.8376835' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (358, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:14:43.9827970' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (359, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:14:44.1255263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (360, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:14:44.2657183' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (361, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:14:46.0536288' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (362, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:14:46.9388186' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (363, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:14:47.3728019' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (364, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:14:48.4301930' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (365, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:14:48.6377956' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (366, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:14:48.8272730' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (367, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:14:49.7345070' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (368, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:14:51.2308057' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (369, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:14:54.5978638' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (370, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:14:55.4385127' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (371, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:14:57.3984522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (372, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:15:11.5649262' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (373, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:15:17.6971490' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (374, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:15:20.7111333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (375, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:15:23.0983504' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (376, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:15:23.1185087' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (377, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:15:24.1263302' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (378, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:15:25.2076533' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (379, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:15:25.3765839' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (380, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:15:25.4078121' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (381, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:15:26.3866292' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (382, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:15:32.2941324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (383, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:15:32.2957174' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (384, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:15:33.9172881' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (385, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:15:42.8702304' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (386, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:15:42.9180368' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (387, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:15:45.2111098' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (388, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:15:45.3515006' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (389, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:15:47.8926613' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (390, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:15:48.0340537' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (391, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:15:48.4720234' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (392, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:15:48.6248342' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (393, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:15:48.9909456' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (394, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:15:49.1272085' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (395, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:15:49.5996810' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (396, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:15:49.7416328' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (397, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:15:49.8703770' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (398, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:15:50.5988503' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (399, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:15:50.7429006' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (400, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:15:50.9185023' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (401, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:15:51.0587941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (402, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:15:51.1342036' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (403, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:15:51.2864637' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (404, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:15:51.3610653' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (405, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:15:51.4899923' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (406, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:15:51.5105859' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (407, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:15:51.5835103' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (408, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:15:51.7288928' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (409, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:15:51.8066863' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (410, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:15:51.9332855' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (411, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:15:52.0224244' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (412, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:15:52.1478939' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (413, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:15:52.3292643' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (414, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:15:54.0786418' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (415, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:15:54.0805860' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (416, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:15:55.0395874' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (417, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:15:56.3381807' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (418, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:15:56.4821111' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (419, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:15:59.5873734' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (420, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:15:59.7258042' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (421, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:16:02.5877236' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (422, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:16:02.7341444' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (423, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:16:04.7449341' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (424, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:16:04.7664114' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (425, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:16:05.6190151' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (426, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:16:06.6013648' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (427, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:16:06.6828959' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (428, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:16:07.6307398' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (429, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:16:07.7092088' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (430, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:16:08.0790241' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (431, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:16:08.2267650' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (432, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:16:08.3040003' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (433, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:16:08.3834465' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (434, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:16:08.4379937' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (435, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:16:08.5636731' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (436, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:16:08.6647419' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (437, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:16:08.7325516' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (438, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:16:08.8564279' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (439, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:16:08.9050363' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (440, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:16:08.9692301' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (441, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:16:09.0190986' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (442, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:16:09.0969952' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (443, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:16:09.1685409' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (444, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:16:09.3038864' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (445, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:16:09.4389127' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (446, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:16:11.3985078' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (447, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:16:11.3998570' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (448, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:17:11.7100980' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (449, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:17:11.7449536' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (450, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:17:21.9777621' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (451, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:17:23.3483617' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (452, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:17:24.7120941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (453, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:17:25.8754350' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (454, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:17:32.0622927' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (455, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:17:33.6107838' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (456, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:17:33.6672559' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (457, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:17:33.8419644' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (458, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:17:34.4054012' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (459, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:17:34.4620854' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (460, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:17:34.5103303' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (461, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:17:34.6038324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (462, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:17:34.6615470' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (463, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:17:34.7775889' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (464, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:17:34.9443731' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (465, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:17:35.6210330' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (466, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:17:39.4221494' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (467, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:17:41.0933623' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (468, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:17:41.1520739' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (469, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:17:41.7306211' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (470, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:17:41.7826868' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (471, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:17:41.9044181' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (472, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:17:42.1642556' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (473, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:17:42.2188051' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (474, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:17:42.9286288' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (475, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:17:42.9865915' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (476, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:17:43.4912904' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (477, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:17:43.5500153' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (478, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:17:43.9714727' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (479, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:17:44.1582574' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (480, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:17:44.7991589' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (481, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:17:44.8499491' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (482, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:17:44.9559250' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (483, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:17:45.6455724' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (484, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:17:45.6917628' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (485, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:17:45.7454069' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (486, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:17:45.8582596' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (487, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:17:46.7322125' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (488, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:17:47.0994252' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (489, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:17:47.1596267' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (490, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:17:47.2134266' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (491, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:17:47.2679933' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (492, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:17:47.4306654' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (493, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:17:48.1163796' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (494, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:17:49.6042044' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (495, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:18:10.2064102' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (496, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:18:20.1578514' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (497, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:18:22.4463616' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (498, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:18:28.8786153' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (499, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:18:31.4121029' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (500, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:18:35.4440434' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (501, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:18:35.5083419' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (502, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:18:37.1290826' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (503, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:18:37.1821314' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (504, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:18:37.2379905' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (505, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:18:37.3446530' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (506, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:18:38.0780858' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (507, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:18:40.7031818' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (508, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:18:52.0711534' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (509, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:18:54.4940340' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (510, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:19:16.8267012' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (511, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:19:20.4152756' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (512, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:19:24.1691114' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (513, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:19:24.2971176' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (514, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:19:25.5399346' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (515, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:19:26.5892854' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (516, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:19:26.6702852' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (517, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:19:26.7285573' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (518, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:19:27.5515551' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (519, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:19:27.6094424' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (520, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:19:27.6985108' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (521, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:19:28.1559671' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (522, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:19:28.2034071' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (523, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:19:28.3269894' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (524, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:19:28.3908323' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (525, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:19:29.0084745' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (526, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:19:29.3934979' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (527, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:19:30.1626001' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (528, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:22:31.9100812' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (529, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:22:37.0242243' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (530, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:22:37.1331111' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (531, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:22:38.4909296' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (532, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:22:38.6117237' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (533, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:22:40.0467043' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (534, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:22:40.1570288' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (535, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:22:40.7127807' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (536, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:22:40.7786206' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (537, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:22:41.1419245' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (538, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:22:41.2459519' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (539, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:22:42.0317954' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (540, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:22:42.1533184' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (541, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:22:42.4249155' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (542, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:22:42.5246343' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (543, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:23:16.1025965' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (544, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:24:47.1163121' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (545, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:24:48.4264060' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (546, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:24:48.5014710' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (547, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:24:49.5487899' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (548, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:24:53.7220486' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (549, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:24:59.2293097' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (550, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:25:01.2131344' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (551, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:25:55.2068848' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (552, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:25:58.1872671' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (553, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:26:16.0681719' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (554, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:26:17.3976771' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (555, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:26:17.5052551' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (556, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:26:27.7027858' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (557, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:26:41.2771093' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (558, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:27:07.7809053' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (559, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:27:13.0060329' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (560, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:27:15.0654599' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (561, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:27:15.1132261' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (562, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:27:15.1665299' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (563, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:27:15.2687300' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (564, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:27:15.3391499' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (565, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:27:16.2596609' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (566, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:27:16.3284873' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (567, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:27:16.6445651' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (568, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:27:16.7174499' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (569, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:27:16.8397263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (570, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:27:17.5802679' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (571, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:27:18.0923666' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (572, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:27:18.7507949' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (573, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:27:18.8073357' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (574, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:27:18.9249795' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (575, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:27:19.6284477' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (576, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:27:19.6832474' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (577, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:27:20.6349181' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (578, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:27:20.6898544' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (579, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:27:21.4946379' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (580, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:27:21.5683016' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (581, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:27:22.0297921' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (582, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:27:25.7394200' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (583, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:27:30.8518718' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (584, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:27:42.1535396' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (585, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:27:44.6455873' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (586, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:27:44.7253943' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (587, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:27:46.1411476' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (588, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:27:46.2075762' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (589, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:27:46.2670929' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (590, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:27:46.9270517' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (591, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:27:46.9753899' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (592, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:27:47.5595809' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (593, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:27:47.6160773' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (594, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:27:47.8105950' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (595, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:27:48.0734109' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (596, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:27:52.7575252' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (597, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:28:13.7975281' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (598, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:28:24.4760415' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (599, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:28:26.8929996' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (600, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:28:33.0941073' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (601, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:28:35.0491040' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (602, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:28:36.5042622' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (603, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:28:36.5604021' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (604, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:28:36.6175004' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (605, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:28:37.0084989' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (606, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:28:37.0741420' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (607, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:28:37.4869335' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (608, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:28:37.5396811' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (609, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:28:37.5890962' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (610, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:28:37.6958388' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (611, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:28:38.5614807' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (612, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:28:38.6098023' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (613, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:28:39.1926441' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (614, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:28:39.2492894' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (615, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:28:40.1282118' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (616, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:28:40.1769827' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (617, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:28:40.2281084' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (618, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:28:40.7645667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (619, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:28:40.8123237' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (620, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:28:40.8682585' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (621, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:28:40.9164171' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (622, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:28:41.2506470' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (623, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:28:46.1630665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (624, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:29:07.2872379' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (625, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:29:09.4719935' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (626, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:29:09.5335362' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (627, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:29:09.5816194' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (628, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:29:10.1741504' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (629, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:29:10.2276445' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (630, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:29:10.2765555' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (631, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:29:10.7586635' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (632, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:29:11.0907899' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (633, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:29:25.3013531' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (634, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:29:36.7096659' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (635, N'admin123', N'Find track', N'8', CAST(N'2024-06-25T15:29:39.4037367' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (636, N'admin123', N'Find track', N'7', CAST(N'2024-06-25T15:29:39.4536422' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (637, N'admin123', N'Find track', N'6', CAST(N'2024-06-25T15:29:40.2482948' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (638, N'admin123', N'Find track', N'5', CAST(N'2024-06-25T15:29:40.3026311' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (639, N'admin123', N'Find track', N'4', CAST(N'2024-06-25T15:29:40.3574068' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (640, N'admin123', N'Find track', N'1', CAST(N'2024-06-25T15:29:40.8911265' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (641, N'admin123', N'Find track', N'3', CAST(N'2024-06-25T15:29:40.9387584' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (642, N'admin123', N'Find track', N'2', CAST(N'2024-06-25T15:29:41.3869787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (643, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:29:41.4356141' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (644, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:29:42.1341290' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (645, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:29:42.1964613' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (646, N'admin123', N'Find track', N'13', CAST(N'2024-06-25T15:29:42.8164199' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (647, N'admin123', N'Find track', N'12', CAST(N'2024-06-25T15:29:42.8822462' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (648, N'admin123', N'Find track', N'11', CAST(N'2024-06-25T15:29:42.9364084' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (649, N'admin123', N'Find track', N'10', CAST(N'2024-06-25T15:29:43.1181037' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (650, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:29:43.4134613' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (651, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:29:45.8124860' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (652, N'admin123', N'Find track', N'9', CAST(N'2024-06-25T15:32:23.8115020' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (653, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:32:25.0888652' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (654, N'unauthorized', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:34.5613387' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (655, N'unauthorized', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:32:34.5622061' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (656, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:49.5909324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (657, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:32:49.5925465' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (658, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:32:54.7401345' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (659, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:58.9022447' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (660, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:32:58.9022398' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (661, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:59.8615958' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (662, N'admin123', N'Saerch tracks', N'{"Title":"as","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:59.9586707' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (663, N'admin123', N'Saerch tracks', N'{"Title":"asd","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:32:59.9800474' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (664, N'admin123', N'Saerch tracks', N'{"Title":"asda","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:00.1354325' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (665, N'admin123', N'Saerch tracks', N'{"Title":"asdas","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:00.2045703' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (666, N'admin123', N'Saerch tracks', N'{"Title":"asdasd","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:00.2459298' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (667, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:00.6746633' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (668, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:33:00.6796377' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (669, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:33:10.5126507' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (670, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:10.5126593' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (671, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:11.2207317' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (672, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:33:19.3080377' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (673, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:33:19.3085866' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (674, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:33:20.4494024' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (675, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:23.5879767' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (676, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:33:23.5885217' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (677, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:23.5894240' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (678, N'admin123', N'Find track', N'16', CAST(N'2024-06-25T15:33:23.6199847' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (679, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:33:27.1464103' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (680, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:33:29.3642176' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (681, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:29.3642008' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (682, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:29.3649542' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (683, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:33:29.3815053' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (684, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:31.7845080' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (685, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:33:34.2439777' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (686, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:33:35.0998511' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (687, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:34:46.3967504' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (688, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:46.9768466' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (689, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:47.5616882' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (690, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:48.6808787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (691, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:34:50.0428003' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (692, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:53.9021111' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (693, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:34:54.4331862' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (694, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:55.5770010' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (695, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:34:56.3527651' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (696, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:34:56.8330542' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (697, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:34:58.6648263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (698, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:35:00.4561632' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (699, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:35:01.6649541' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (700, N'admin123', N'Get artists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:35:03.9701905' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (701, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:35:04.9457281' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (702, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:35:07.3231319' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (703, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:35:07.3231265' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (704, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:36:09.4054741' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (705, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:36:09.4054803' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (706, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:36:26.1178708' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (707, N'admin123', N'Get albums', N'{"Name":null,"Artist":null,"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:36:27.2428706' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (708, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:36:27.6011272' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (709, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:36:29.2583865' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (710, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:36:30.6750273' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (711, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:36:30.6750189' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (712, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:36:32.6563938' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (713, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:36:37.6940928' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (714, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:36:47.7605486' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (715, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:36:49.9083574' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (716, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:36:49.9083522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (717, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:36:50.5168413' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (718, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:36:50.5366663' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (719, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:37:00.1967170' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (720, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:37:00.1973516' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (721, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:37:00.8153563' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (722, N'admin123', N'Find track', N'15', CAST(N'2024-06-25T15:37:00.8608017' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (723, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:37:01.4361919' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (724, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:37:03.5008987' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (725, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:37:03.5015263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (726, N'admin123', N'Get track queue', N'{"NumberOfTracks":0}', CAST(N'2024-06-25T15:37:04.1166268' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (727, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:37:04.1440199' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (728, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:37:37.6855744' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (729, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:38:06.9478696' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (730, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:39:21.9896526' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (731, N'admin123', N'Find track', N'14', CAST(N'2024-06-25T15:39:48.3465996' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (732, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:39:53.5048839' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (733, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:39:53.5164851' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (734, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:39:57.4199610' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (735, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:40:31.8108363' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (736, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:40:31.8116442' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (737, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:40:34.8255088' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (738, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:40:55.4623859' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (739, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:40:56.6251997' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (740, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:40:57.2594990' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (741, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-06-25T15:41:03.9236046' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (742, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":50}', CAST(N'2024-06-25T15:41:07.5508238' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (743, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:41:08.0006136' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (744, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:41:08.0032147' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (745, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:09.9419798' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (746, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:14.1831344' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (747, N'admin123', N'Saerch tracks', N'{"Title":"ss","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:14.4204284' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (748, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:16.7864113' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (749, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:18.1449070' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (750, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:18.6611987' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (751, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:19.6696246' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (752, N'admin123', N'Saerch tracks', N'{"Title":"S","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:25.8724843' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (753, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:28.8683228' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (754, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:41:35.5045821' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (755, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:42:08.4605564' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (756, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:25.4591704' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (757, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:29.7346154' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (758, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:38.4604892' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (759, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:38.5651138' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (760, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:42:40.9011230' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (761, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:42.0431221' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (762, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:42:44.1591095' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (763, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:42:45.9674455' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (764, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:42:46.1890027' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (765, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:42:48.4160627' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (766, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:00.4815973' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (767, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:44:00.4815929' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (768, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:25.9591659' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (769, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:44:25.9601998' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (770, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:31.2822061' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (771, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:44:31.2830620' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (772, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:44:40.6039403' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (773, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:40.6039460' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (774, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:41.7734166' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (775, N'admin123', N'Saerch tracks', N'{"Title":"sd","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:42.1967257' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (776, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:43.3081632' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (777, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:43.8510272' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (778, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:44.7058610' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (779, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:44:44.7063577' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (780, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:44:46.5255634' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (781, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:47.9101221' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (782, N'admin123', N'Saerch tracks', N'{"Title":"so","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:49.4024055' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (783, N'admin123', N'Saerch tracks', N'{"Title":"son","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:49.6602423' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (784, N'admin123', N'Saerch tracks', N'{"Title":"song","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:49.7298745' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (785, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:44:50.6734268' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (786, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:53.4909423' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (787, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:44:58.2951573' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (788, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:44:59.3398427' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (789, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:45:00.6349268' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (790, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[3,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:45:04.5202919' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (791, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:45:52.8038133' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (792, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:45:52.8058045' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (793, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:45:54.0930170' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (794, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:45:55.3051289' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (795, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:45:55.3051345' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (796, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:45:57.2924134' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (797, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:45:58.2779139' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (798, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:00.0843205' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (799, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:46:00.0851895' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (800, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:46:38.4584795' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (801, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:38.4584909' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (802, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:46.7959804' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (803, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:46:46.7963170' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (804, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:46:48.7973415' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (805, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:49.5313285' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (806, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:46:50.2907951' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (807, N'admin123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:51.7764423' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (808, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:46:55.2812081' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (809, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:46:55.2818070' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (810, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:47:31.6160234' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (811, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:47:31.6184212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (812, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:47:34.0022082' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (813, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:47:34.0043793' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (814, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:47:36.3321355' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (815, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:47:37.1078665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (816, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:48:22.7336980' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (817, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:22.7337045' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (818, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:48:24.7566450' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (819, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:26.2904882' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (820, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:48:27.4588066' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (821, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[2,3,4]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:31.4323592' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (822, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:38.2873720' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (823, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:40.5545895' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (824, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:41.1792222' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (825, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:41.5868251' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (826, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:41.9151825' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (827, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":"[1,2,3,4,5]","Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:48:42.7472917' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (828, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:09.5286955' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (829, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:49:09.5286419' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (830, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:19.9566932' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (831, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:49:19.9606614' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (832, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:21.3166755' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (833, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:23.8276703' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (834, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:24.3711695' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (835, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:24.7545184' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (836, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:25.1897288' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (837, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:49:25.8680393' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (838, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:50:04.0592441' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (839, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:50:04.0591942' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (840, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:50:08.5106526' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (841, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:50:10.6936466' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (842, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:50:11.4703918' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (843, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:51:34.4233613' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (844, N'admin123', N'Get genres', N'{"Page":1,"PerPage":100}', CAST(N'2024-06-25T15:51:34.4233534' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (845, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:51:37.3557757' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (846, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:39.3231736' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (847, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:51:41.3702545' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (848, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:45.8872036' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (849, N'admin123', N'Saerch tracks', N'{"Title":"tt","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:48.2402051' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (850, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:51.0741402' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (851, N'admin123', N'Saerch tracks', N'{"Title":"ti","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:51.5896591' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (852, N'admin123', N'Saerch tracks', N'{"Title":"t","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:52.0841335' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (853, N'admin123', N'Saerch tracks', N'{"Title":"ti","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:53.3126183' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (854, N'admin123', N'Saerch tracks', N'{"Title":"tit","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:53.6101233' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (855, N'admin123', N'Saerch tracks', N'{"Title":"titl","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:53.8120794' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (856, N'admin123', N'Saerch tracks', N'{"Title":"title","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:54.5750736' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (857, N'admin123', N'Saerch tracks', N'{"Title":"title1","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:56.1521856' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (858, N'admin123', N'Saerch tracks', N'{"Title":"title","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:57.0530021' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (859, N'admin123', N'Saerch tracks', N'{"Title":"title1","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:51:59.3339522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (860, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":2,"PerPage":12}', CAST(N'2024-06-25T15:52:00.9127375' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (861, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":12}', CAST(N'2024-06-25T15:52:04.0874373' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1625, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:21:22.6416886' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1626, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:21:25.3524357' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1627, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:27:51.4500219' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1628, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:29:26.5385769' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1629, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:30:40.5893209' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1630, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:30:41.3763248' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1631, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:31:50.3882278' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1632, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:34:58.9148365' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1633, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:35:38.4379546' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1634, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:36:48.0230970' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1635, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:38:04.9025475' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1636, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:45:02.6020917' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1637, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:48:40.1246163' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1638, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:50:02.5267584' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1639, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:51:02.5596861' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1640, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:53:09.1020172' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1641, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T16:53:57.5919905' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1642, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T17:02:13.2153136' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1643, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:20:29.7586863' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1644, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:21:50.5359439' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1645, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:22:28.3395021' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1646, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:26:11.7217198' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1647, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:28:46.2057930' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1648, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:29:36.5183498' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1649, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-04T18:33:45.2552728' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1650, N'unauthorized', N'Find track', N'4', CAST(N'2024-07-05T08:43:00.7837616' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1651, N'unauthorized', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T08:44:26.4903004' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1652, N'unauthorized', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T08:44:30.5694566' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1653, N'unauthorized', N'Find track', N'5', CAST(N'2024-07-05T08:44:33.7962186' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1654, N'unauthorized', N'Find track', N'3', CAST(N'2024-07-05T08:44:37.9123565' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1655, N'unauthorized', N'Find track', N'4', CAST(N'2024-07-05T08:47:32.9419939' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1656, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:02:28.4183277' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1657, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:29:56.0185941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1658, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:31:13.6188495' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1659, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:31:49.6910333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1660, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:36:34.4774884' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1661, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:37:13.1735910' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1662, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:40:22.5672307' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1663, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:41:20.2561107' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1664, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:42:41.5909668' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1665, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:44:26.2053259' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1666, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:45:06.3067096' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1667, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:45:36.0776358' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1668, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:46:27.7143407' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1669, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:48:04.7540547' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1670, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:50:22.7394809' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1671, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:52:18.9499967' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1672, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:52:55.1900233' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1673, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:53:44.9150324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1674, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:54:22.3523043' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1675, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:54:49.6961444' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1676, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:56:46.8884001' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1677, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T09:58:53.6065745' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1678, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:02:03.3149785' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1679, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:04:24.7871186' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1680, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:05:55.4941823' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1681, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:06:43.7036438' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1682, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:07:40.1175620' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1683, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:07:49.4899126' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1684, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:07:52.1924369' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1685, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:07:52.3198260' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1686, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:07:52.5769791' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1687, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:49.6736222' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1688, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:54.3473453' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1689, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:54.6898893' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1690, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:55.9806251' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1691, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:57.2168294' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1692, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:57.5455645' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1693, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:57.8648362' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1694, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:58.2993662' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1695, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:58.8809007' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1696, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:08:59.4150816' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1697, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:00.6010721' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1698, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:00.9885024' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1699, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:05.2726538' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1700, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:05.6081769' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1701, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:05.7521886' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1702, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:05.9925954' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1703, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:35.6615012' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1704, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:09:41.6779835' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1705, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:10:19.1124196' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1706, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:10:25.0842640' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1707, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:10:35.7849537' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1708, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:10:40.4467751' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1709, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:12:48.7856001' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1710, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:12:54.3515832' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1711, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:13:01.7859518' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1712, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:15:46.4512767' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1713, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:15:53.0194625' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1714, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:15:54.3388224' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1715, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:15:57.5942263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1716, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:02.0013489' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1717, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:02.6692416' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1718, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:04.0408906' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1719, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:05.0723528' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1720, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:07.0942896' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1721, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:18.5495991' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1722, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:29.5115518' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1723, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:16:50.4758147' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1724, N'admin123', N'Saerch tracks', N'{"Title":"asdas41","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:08.5822749' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1725, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:16.0778878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1726, N'admin123', N'Saerch tracks', N'{"Title":"smr","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:17.6639079' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1727, N'admin123', N'Saerch tracks', N'{"Title":"smrda","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:18.0817210' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1728, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:20.0850258' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1729, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:20.7861550' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1730, N'admin123', N'Saerch tracks', N'{"Title":"ad","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:21.1038910' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1731, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:22.5562946' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1732, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:22.9099590' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1733, N'admin123', N'Saerch tracks', N'{"Title":"title","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:23.6242760' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1734, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:25.3812525' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1735, N'admin123', N'Saerch tracks', N'{"Title":"song","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:17:26.0138884' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1736, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:18:26.1424896' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1737, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:19:06.0705502' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1738, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:19:18.4748911' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1739, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:19:25.3195151' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1740, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:20:01.1148444' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1741, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:30:23.9307085' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1742, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:31:29.8841555' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1743, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:32:39.4848724' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1744, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:40:59.0899648' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1745, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:41:02.9998852' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1746, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:41:55.0580572' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1747, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:41:58.6958637' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1748, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:42:19.8865378' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1749, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:43:04.1943085' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1750, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:43:09.7537299' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1751, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:43:59.9519178' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1752, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:44:06.0715116' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1753, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:44:37.6910829' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1754, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:44:45.9669848' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1755, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:45:22.4440533' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1756, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:45:34.4551664' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1757, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:45:56.0019085' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1758, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:46:01.5383181' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1759, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:47:16.7182506' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1760, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:47:22.3427513' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1761, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:48:31.5133252' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1762, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:48:41.7401248' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1763, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-05T10:50:46.9600014' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1764, N'admin123', N'Find track', N'16', CAST(N'2024-07-05T10:50:51.7065461' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1765, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:30:15.1320300' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1766, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:30:22.2093641' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1767, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:31:12.7301093' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1768, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:31:13.0250337' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1769, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:07.4173737' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1770, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:07.5751849' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1771, N'admin123', N'Find track', N'16', CAST(N'2024-07-06T09:32:18.0487818' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1772, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:26.5352405' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1773, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:26.6957744' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1774, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:39.6083752' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1775, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:32:39.8070449' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1776, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:33:07.0374359' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1777, N'admin123', N'Add track to playlist', N'{"Tracks":[3,1],"PlaylistId":2}', CAST(N'2024-07-06T09:33:15.2366751' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1778, N'admin123', N'Add track to playlist', N'{"Tracks":[3,1],"PlaylistId":1}', CAST(N'2024-07-06T09:33:22.3796130' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1779, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:33:25.6640169' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1780, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:33:35.1567280' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1781, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:33:35.3121686' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1782, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:33:39.6555245' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1783, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:34:29.0867245' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1784, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:34:29.2598839' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1785, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:34:46.9328318' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1786, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:34:47.1576227' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1787, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:35:10.8568555' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1788, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:35:11.0036237' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1789, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:36:24.7479531' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1790, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:36:24.9216422' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1791, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:36:38.9892009' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1792, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:36:39.1335565' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1793, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:38:51.6634733' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1794, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T09:38:51.8704288' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1795, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:12:27.7110203' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1796, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:12:27.8583594' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1797, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:12:46.8935528' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1798, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:12:47.0192380' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1799, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:13:57.4603200' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1800, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:13:57.6108878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1801, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:15:42.6568988' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1802, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:15:42.8054617' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1803, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:15:50.0400868' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1804, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:16:06.8318324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1805, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:17:02.6755173' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1806, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:17:02.8442501' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1807, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:17:07.0227770' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1808, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:18:55.7381023' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1809, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:18:55.8937547' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1810, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:18:59.6266684' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1811, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:00.8715441' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1812, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:05.0077202' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1813, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:06.1858982' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1814, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:25.6289598' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1815, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:25.7681878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1816, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:33.4904659' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1817, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:34.8455899' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1818, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:34.8695456' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1819, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:59.6807539' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1820, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:19:59.7438352' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1821, N'admin123', N'Saerch tracks', N'{"Title":"as","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:05.2324522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1822, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:06.8278865' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1823, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:09.5711821' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1824, N'admin123', N'Saerch tracks', N'{"Title":"r","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:10.3818339' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1825, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:11.4554152' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1826, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:12.3825666' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1827, N'admin123', N'Saerch tracks', N'{"Title":"aw","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:17.3956635' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1828, N'admin123', N'Saerch tracks', N'{"Title":"a","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:18.8901330' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1829, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:19.6161537' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1830, N'admin123', N'Saerch tracks', N'{"Title":"song","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:20.4809243' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1831, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:22.7225743' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1832, N'admin123', N'Saerch tracks', N'{"Title":"title","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:23.4413350' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1833, N'admin123', N'Saerch tracks', N'{"Title":"title3","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:24.9239789' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1834, N'admin123', N'Saerch tracks', N'{"Title":"title2","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:26.2966626' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1835, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:20:30.1250907' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1836, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:31:25.0482471' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1837, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:31:25.1955573' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1838, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:31:35.8555236' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1839, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:34:43.1720582' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1840, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:34:43.3302856' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1841, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:35:10.1038539' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1842, N'admin123', N'Create playlist command', N'{"Name":"play3233","AccessLevel":1}', CAST(N'2024-07-06T10:36:37.3358237' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1843, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:36:46.4533008' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1844, N'admin123', N'Add track to playlist', N'{"Tracks":[4,1],"PlaylistId":1}', CAST(N'2024-07-06T10:37:02.1898536' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1845, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:37:11.0344625' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1846, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:37:11.1828721' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1847, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:37:20.2647239' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1848, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:17.4076488' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1849, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:17.5546726' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1850, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:21.9191123' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1851, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:39.8571167' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1852, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:40.0053295' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1853, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:38:43.5108614' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1854, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:17.0756827' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1855, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:17.2073207' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1856, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:22.5572812' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1857, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:49.7695839' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1858, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:49.9143146' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1859, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:39:53.2994687' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1860, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:41:13.6436166' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1861, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:41:13.7871781' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1862, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:41:26.2672114' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1863, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:41:26.4255103' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1864, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:41:31.0374873' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1865, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:43:04.1951670' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1866, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:43:04.3474430' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1867, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:43:07.8058736' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1868, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:10.5658209' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1869, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:10.7110795' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1870, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:14.1933535' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1871, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:37.4143025' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1872, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:37.5478862' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1873, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:44:43.3201349' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1874, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:05.2379869' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1875, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:05.3885338' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1876, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:10.0832555' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1877, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:34.0623118' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1878, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:34.2571316' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1879, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:46:38.3237164' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1880, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:47:11.2417956' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1881, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:47:11.3900124' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1882, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:47:14.9090129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1883, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:47:58.8598516' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1884, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:47:59.0207020' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1885, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:48:02.9844972' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1886, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:49:44.0057969' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1887, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:49:44.1563148' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1888, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:49:48.2495821' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1889, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:51:34.8599779' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1890, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:51:35.0060512' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1891, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:51:38.6199424' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1892, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:52:01.9237578' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1893, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:52:02.0718665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1894, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[1,3,4]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-06T10:52:07.2375485' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1895, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:16:06.3814325' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1896, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:16:06.8868737' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1897, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:16:13.2939195' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1898, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:06.6646694' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1899, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:06.8218118' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1900, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:10.6148824' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1901, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:19.9105192' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1902, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:19.9406655' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1903, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:18:23.7227259' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1904, N'admin123', N'Get track playlists', N'2', CAST(N'2024-07-07T08:36:56.1574335' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1905, N'admin123', N'Get track playlists', N'5', CAST(N'2024-07-07T08:37:01.0433180' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1906, N'admin123', N'Get track playlists', N'1', CAST(N'2024-07-07T08:37:42.8104707' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1907, N'admin123', N'Get track playlists', N'3', CAST(N'2024-07-07T08:37:54.9729575' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1908, N'admin123', N'Get track playlists', N'5', CAST(N'2024-07-07T08:38:01.9509674' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1909, N'admin123', N'Get track playlists', N'4', CAST(N'2024-07-07T08:38:22.4762719' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1910, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:20.4632060' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1911, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:20.8171336' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1912, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:24.5972137' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1913, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:44.3089549' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1914, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:44.5371662' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1915, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:51.6337187' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1916, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:41:51.6748154' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1917, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:00.1340344' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1918, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:38.1197830' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1919, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:38.3926186' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1920, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:51.8573977' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1921, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:51.9302043' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1922, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:42:55.6320045' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1923, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:42:57.0617173' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1924, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:44:28.0239784' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1925, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:44:28.2449143' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1926, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:44:32.9483087' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1927, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:44:36.0402601' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1928, N'admin123', N'Get track playlists', N'4', CAST(N'2024-07-07T08:48:16.4813328' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1929, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:48:50.4041930' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1930, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:48:50.7320897' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1931, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:48:54.6614569' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1932, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:48:56.8293272' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1933, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:49:20.9278362' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1934, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:49:21.0658385' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1935, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:49:24.8865382' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1936, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:49:24.9012111' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1937, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:37.6510345' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1938, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:37.7843273' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1939, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:41.8264333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1940, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:51:41.8389587' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1941, N'admin123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":2}', CAST(N'2024-07-07T08:51:45.7647815' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1942, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:45.8540395' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1943, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:45.8753603' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1944, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:51:50.8106889' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1945, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:51:50.8212071' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1946, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:52:38.1801224' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1947, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:52:38.3182813' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1948, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:52:42.3599949' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1949, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:52:42.3760358' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1950, N'admin123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":2}', CAST(N'2024-07-07T08:53:00.1690129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1951, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:53:00.1854956' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1952, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:53:00.2094032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1953, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T08:53:03.7536032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1954, N'admin123', N'Get track playlists', N'16', CAST(N'2024-07-07T08:53:03.7643611' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1955, N'admin123', N'Delete playlist', N'1', CAST(N'2024-07-07T08:54:56.6880991' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1956, N'admin123', N'Delete playlist', N'1', CAST(N'2024-07-07T08:54:58.3546716' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1957, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:13:20.0197248' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1958, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:13:20.2015962' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1959, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:13:23.5013592' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1960, N'admin123', N'Delete playlist', N'1', CAST(N'2024-07-07T09:13:41.0165979' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1961, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:14:36.4467843' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1962, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:14:36.5943361' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1963, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:14:41.2611930' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1964, N'admin123', N'Delete playlist', N'1', CAST(N'2024-07-07T09:14:43.2927156' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1965, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:14:44.9502200' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1966, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:14:44.9680204' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1967, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:26:36.8272071' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1968, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:26:36.9882486' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1969, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:26:40.9649283' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1970, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:22.4108093' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1971, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:22.5678635' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1972, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:26.8399071' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1973, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:33.4609863' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1974, N'admin123', N'Get track playlists', N'15', CAST(N'2024-07-07T09:30:33.4724423' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1975, N'admin123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":2}', CAST(N'2024-07-07T09:30:36.4839347' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1976, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:36.5070007' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1977, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:36.5288939' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1978, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:41.2937714' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1979, N'admin123', N'Get track playlists', N'13', CAST(N'2024-07-07T09:30:41.3046735' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1980, N'admin123', N'Add track to playlist', N'{"Tracks":[13],"PlaylistId":2}', CAST(N'2024-07-07T09:30:43.1483158' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1981, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:43.1859135' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1982, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:43.2189897' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1983, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[13,15,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:30:47.2031208' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1984, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:00.9235637' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1985, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[13,15,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:00.9481778' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1986, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:32.0119411' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1987, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:32.2087103' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1988, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:37.3584612' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1989, N'admin123', N'Get track playlists', N'14', CAST(N'2024-07-07T09:31:37.3740498' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1990, N'admin123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":1}', CAST(N'2024-07-07T09:31:41.1242040' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1991, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:41.1493405' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1992, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:41.1692291' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1993, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:44.6480212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1994, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[13,15,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:31:44.7259108' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1995, N'admin123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":2}', CAST(N'2024-07-07T09:31:53.5183238' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1996, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:02.5713305' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1997, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:02.5923241' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1998, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[13,15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:02.6233669' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (1999, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:03.7233664' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2000, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:03.7324989' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2001, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[13,15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:03.7433833' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2002, N'admin123', N'Remove tracks from playlist', N'{"Tracks":[13],"PlaylistId":2}', CAST(N'2024-07-07T09:32:04.5462360' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2003, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:05.7702694' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2004, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:05.7810739' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2005, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:05.7928478' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2006, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:58.3762446' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2007, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:32:58.5256549' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2008, N'admin123', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:33:05.2571362' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2009, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:38:46.7524825' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2010, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:40:18.2845319' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2011, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:45:12.3464511' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2012, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:46:19.8345189' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2013, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:48:15.2247035' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2014, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:49:57.0354274' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2015, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:53:15.6429945' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2016, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:54:40.9911665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2017, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:55:04.9559118' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2018, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:56:25.5836235' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2019, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:56:43.9872283' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2020, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:58:47.6796065' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2021, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T09:59:31.0170643' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2022, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:01:11.3852392' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2023, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:01:44.6061865' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2024, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:02:36.6446024' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2025, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:03:51.1159631' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2026, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:05:05.5746745' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2027, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:06:21.0981034' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2028, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:08:20.5400399' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2029, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:09:02.3906814' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2030, N'unauthorized', N'Registration', N'{"Username":"Pera123","Email":"test123@gmail.com","Password":"Lozinka123!","DateOfBirth":"2002-10-10","CountryId":1,"Gender":1}', CAST(N'2024-07-07T10:13:33.9252847' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2031, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:15:53.0524287' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2032, N'unauthorized', N'Registration', N'{"Username":"Pera123","Email":"test123@gmail.com","Password":"Lozinka123!","DateOfBirth":"2002-10-10","CountryId":1,"Gender":0}', CAST(N'2024-07-07T10:15:57.9246764' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2033, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:18:43.2129516' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2034, N'unauthorized', N'Get countries', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:19:20.5392674' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2035, N'unauthorized', N'Registration', N'{"Username":"Pera1235","Email":"test1235@gmail.com","Password":"Lozinka123!","DateOfBirth":"2002-10-10","CountryId":2,"Gender":1}', CAST(N'2024-07-07T10:19:29.7986325' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2036, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:19:49.8847395' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2037, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:19:49.9391512' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2038, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:19:55.2835077' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2039, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T10:19:55.2926224' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2040, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:20:08.1926735' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2041, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:20:08.2148426' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2042, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:20:13.4095606' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2043, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:26:21.5683554' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2044, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:26:21.7181110' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2045, N'Pera123', N'Find track', N'16', CAST(N'2024-07-07T10:26:29.4989806' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2046, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:28.0224925' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2047, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:28.1705157' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2048, N'Pera123', N'Find track', N'16', CAST(N'2024-07-07T10:28:32.2855129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2049, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:34.5719602' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2050, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:34.5902880' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2051, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:56.4122120' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2052, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:28:56.5725916' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2053, N'Pera123', N'Find track', N'16', CAST(N'2024-07-07T10:29:01.0804170' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2054, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:29:04.0585058' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2055, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:29:04.0904869' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2056, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:29:17.4636825' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2057, N'admin123', N'Create playlist command', N'{"Name":"play3233","AccessLevel":0}', CAST(N'2024-07-07T10:30:50.1716900' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2058, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:31:08.5347975' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2059, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:31:08.6928357' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2060, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:31:14.6929322' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2061, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:31:14.8138793' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2062, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:09.9166965' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2063, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:10.0745397' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2064, N'Pera123', N'Create playlist command', N'{"Name":"play123","AccessLevel":0}', CAST(N'2024-07-07T10:32:20.4962923' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2065, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:23.2527824' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2066, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:26.5913375' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2067, N'Pera123', N'Create playlist command', N'{"Name":"play1234","AccessLevel":0}', CAST(N'2024-07-07T10:32:31.5196287' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2068, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:34.1299231' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2069, N'Pera123', N'Delete playlist', N'3', CAST(N'2024-07-07T10:32:38.0692601' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2070, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:39.0064812' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2071, N'Pera123', N'Delete playlist', N'4', CAST(N'2024-07-07T10:32:39.9573415' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2072, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:32:40.3338814' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2073, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:33:29.2483078' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2074, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:33:29.3930548' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2075, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:41.0575655' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2076, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:42.9444711' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2077, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:44.3654386' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2078, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:45.8139244' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2079, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:45.9806774' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2080, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:46.1281740' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2081, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:46.2932901' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2082, N'Pera123', N'Create playlist command', N'{"Name":"Play123","AccessLevel":0}', CAST(N'2024-07-07T10:33:53.4432796' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2083, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:34:19.6737656' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2084, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:34:19.8180818' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2085, N'Pera123', N'Create playlist command', N'{"Name":"play123","AccessLevel":0}', CAST(N'2024-07-07T10:34:30.3354802' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2086, N'Pera123', N'Create playlist command', N'{"Name":"play123","AccessLevel":0}', CAST(N'2024-07-07T10:34:34.5076263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2087, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:24.7916821' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2088, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:25.4639675' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2089, N'Pera123', N'Create playlist command', N'{"Name":"play123","AccessLevel":0}', CAST(N'2024-07-07T10:37:39.0721174' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2090, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:39.1525239' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2091, N'Pera123', N'Create playlist command', N'{"Name":"play1232","AccessLevel":0}', CAST(N'2024-07-07T10:37:43.8022175' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2092, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:43.8150913' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2093, N'Pera123', N'Delete playlist', N'5', CAST(N'2024-07-07T10:37:45.0991541' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2094, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:46.7768720' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2095, N'Pera123', N'Delete playlist', N'6', CAST(N'2024-07-07T10:37:47.4965859' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2096, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:48.3122020' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2097, N'Pera123', N'Create playlist command', N'{"Name":"my play","AccessLevel":0}', CAST(N'2024-07-07T10:37:55.2398255' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2098, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:37:55.2562149' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2099, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:40:22.5205504' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2100, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:40:22.6728033' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2101, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:22.6622562' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2102, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:22.8307802' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2103, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:34.3505789' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2104, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:34.4894827' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2105, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:53.3919933' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2106, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:41:53.5294646' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2107, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:14.3172578' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2108, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:14.4667249' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2109, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:35.9581438' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2110, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:36.0948993' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2111, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:59.5723228' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2112, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:42:59.7041428' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2113, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:43:34.3975025' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2114, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:43:34.5587156' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2115, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:02.4275184' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2116, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:02.5594602' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2117, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:15.0775256' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2118, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:15.2204908' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2119, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:40.3539731' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2120, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:40.5485223' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2121, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:47.5830657' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2122, N'Pera123', N'Create playlist command', N'{"Name":"play123","AccessLevel":0}', CAST(N'2024-07-07T10:44:55.0039901' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2123, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:44:55.0182087' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2124, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:09.9517412' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2125, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:10.0901321' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2126, N'Pera123', N'Find track', N'16', CAST(N'2024-07-07T10:45:27.3600529' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2127, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:29.2245579' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2128, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:29.2680681' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2129, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:32.1315483' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2130, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T10:45:32.1440756' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2131, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:45:35.5344099' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2132, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:35.6113014' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2133, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:35.6451560' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2134, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:45:40.1190176' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2135, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T10:45:40.1309672' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2136, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":2}', CAST(N'2024-07-07T10:45:49.4439212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2137, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T10:46:00.3890889' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2138, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:00.4018788' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2139, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:00.4410944' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2140, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:04.6624949' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2141, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:04.7972780' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2142, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T10:46:12.2657171' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2143, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:13.4539157' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2144, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:13.4676169' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2145, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T10:46:16.4869281' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2146, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:17.4861775' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2147, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:17.4961276' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2148, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:46:19.0446415' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2149, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:46:20.2292120' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2150, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T10:46:59.0730046' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2151, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:27.8661144' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2152, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:28.0210534' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2153, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:38.9288724' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2154, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T10:47:38.9518718' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2155, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:47:41.5772135' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2156, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:41.6000086' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2157, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:41.6333315' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2158, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:46.4405116' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2159, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T10:47:46.4505445' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2160, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":7}', CAST(N'2024-07-07T10:47:48.7006441' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2161, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:48.7120444' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2162, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:48.7377478' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2163, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:52.5841817' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2164, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T10:47:52.5940289' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2165, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:54.7577615' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2166, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:54.8010138' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2167, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:59.0355881' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2168, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:47:59.1466611' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2169, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:00.8610223' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2170, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:00.8756944' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2171, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:00.8854622' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2172, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:01.5972904' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2173, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:01.6056803' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2174, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:01.6152722' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2175, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:48:07.8472465' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2176, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:15.4291546' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2177, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:15.4403233' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2178, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:15.7162598' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2179, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:15.7271442' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2180, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.2844453' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2181, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.2929043' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2182, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.4616331' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2183, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.4716374' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2184, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.7491453' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2185, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.7577780' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2186, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.8939145' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2187, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:16.9024447' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2188, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.0843470' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2189, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.0940876' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2190, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.2529391' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2191, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.2615261' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2192, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.3967603' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2193, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.4192112' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2194, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.5573074' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2195, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.5668007' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2196, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.6925030' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2197, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.7014539' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2198, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.8201863' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2199, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.8290896' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2200, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.9653806' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2201, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:17.9737168' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2202, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.1325486' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2203, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.1417980' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2204, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.2765010' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2205, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.2862697' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2206, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.4526048' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2207, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:18.4611289' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2208, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":7}', CAST(N'2024-07-07T10:48:24.1312714' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2209, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:48:28.1643707' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2210, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:48:28.5483275' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2211, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:48:28.6832962' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2212, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T10:48:28.8119452' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2213, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T10:48:29.2525038' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2214, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:00:42.7976717' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2215, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:00:43.5596377' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2216, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:16.2821270' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2217, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:01:16.3007560' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2218, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:01:19.0027843' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2219, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:19.0956355' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2220, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:19.1234098' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2221, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:23.4719691' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2222, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:01:23.6168147' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2223, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:01:26.4481641' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2224, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:26.4642519' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2225, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:26.5047620' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2226, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:31.6133869' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2227, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:01:38.4963032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2228, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:44.4482269' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2229, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:44.4989959' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2230, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:46.1264273' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2231, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:46.1380741' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2232, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:01:48.9207274' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2233, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:53.5497689' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2234, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:55.1087690' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2235, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:55.8861124' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2236, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:56.4767401' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2237, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:56.6360263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2238, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:56.7880105' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2239, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:56.9239993' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2240, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:57.0760532' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2241, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:01:57.2748719' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2242, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:01.3568865' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2243, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:01.5081508' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2244, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:01.6520579' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2245, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:01.7884871' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2246, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:01.9327959' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2247, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.0769457' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2248, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.2126375' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2249, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.3403822' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2250, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.4842795' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2251, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.6305751' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2252, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.7398674' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2253, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:02.8839201' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2254, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:03.0285669' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2255, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:03.1643375' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2256, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:03.2994033' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2257, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:03.4354136' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2258, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:03.5155135' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2259, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:06.7741941' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2260, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:02:06.7817836' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2261, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:02:08.4684396' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2262, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:08.4797147' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2263, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:08.5078755' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2264, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:12.4150123' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2265, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:15.6241137' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2266, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:15.6359953' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2267, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:16.1573756' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2268, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:16.1696561' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2269, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:22.7189857' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2270, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:02:22.7289535' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2271, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:02:25.7159802' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2272, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:25.7273954' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2273, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:25.7700032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2274, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:29.0842618' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2275, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:29.1858423' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2276, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:02:31.5089722' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2277, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:32.7486502' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2278, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:02:32.7596213' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2279, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:03:00.6536629' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2280, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:03:05.1941860' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2281, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:03:22.2185320' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2282, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:06.2947519' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2283, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:06.4936125' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2284, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:11.2528772' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2285, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:08:16.4429070' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2286, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:08:27.2513256' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2287, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:42.7138280' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2288, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:42.9150590' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2289, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:08:52.2739450' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2290, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:08:52.2905276' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2291, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:06.7399802' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2292, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:06.8905583' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2293, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:10.2883170' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2294, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:09:10.3058522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2295, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:12.8061671' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2296, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:12.8197017' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2297, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:12.8424102' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2298, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:16.9842802' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2299, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:09:17.0038715' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2300, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:09:19.4246493' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2301, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:19.4705208' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2302, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:19.5208174' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2303, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:23.7530825' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2304, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T11:09:23.7716551' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2305, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":7}', CAST(N'2024-07-07T11:09:26.0751942' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2306, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:26.1126639' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2307, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:26.1442056' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2308, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:31.2220135' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2309, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:31.3222763' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2310, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:09:34.7176076' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2311, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:46.0242684' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2312, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:46.0359732' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2313, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:09:49.8670765' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2314, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:54.9229979' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2315, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:54.9343711' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2316, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:55.1072115' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2317, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:55.1166203' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2318, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:55.3232508' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2319, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:55.3328105' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2320, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:09:56.2834496' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2321, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:09:56.4355344' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2322, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":7}', CAST(N'2024-07-07T11:09:56.7707162' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2323, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:09:56.7803338' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2324, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:57.5388354' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2325, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:57.9151878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2326, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.0590945' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2327, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.1789459' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2328, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.3315431' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2329, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.4672869' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2330, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.6300985' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2331, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":7}', CAST(N'2024-07-07T11:09:58.7707194' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2332, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:10:29.8804861' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2333, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:10:30.1181230' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2334, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:10:33.8328073' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2335, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:10:33.8478788' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2336, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:01.6899595' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2337, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:01.8388677' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2338, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:05.5311522' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2339, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:11:05.5429690' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2340, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:11:08.5462364' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2341, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:08.5678363' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2342, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:08.5891433' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2343, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:13.3427783' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2344, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:11:13.3537793' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2345, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:11:15.5391466' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2346, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:15.5504334' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2347, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:15.5795978' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2348, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:20.0297909' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2349, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:20.1142583' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2350, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:11:22.9340737' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2351, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:30.5658612' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2352, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:30.5910601' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2353, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:31.3041395' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2354, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:11:31.3226725' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2355, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:07.0428172' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2356, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:07.1898954' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2357, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:13.7729998' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2358, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T11:13:13.7876924' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2359, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:13:15.8854879' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2360, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:15.9055113' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2361, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:15.9254732' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2362, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:19.3968051' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2363, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:13:23.3501750' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2364, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:23.3705853' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2365, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:24.3876129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2366, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:25.5805902' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2367, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:26.4601839' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2368, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:26.6358561' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2369, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:26.7718486' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2370, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:26.9230513' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2371, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:27.0672965' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2372, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:27.4691319' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2373, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:27.6042041' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2374, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:27.7475665' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2375, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:31.9078498' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2376, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:32.6726898' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2377, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:32.8116454' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2378, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:32.9557095' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2379, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.1188162' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2380, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.2524807' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2381, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.4116561' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2382, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.5635751' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2383, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.7228972' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2384, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:33.8754740' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2385, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:34.7927224' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2386, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:34.9325776' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2387, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:35.2278459' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2388, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:35.3637537' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2389, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:35.6688483' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2390, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:13:35.8273631' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2391, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:36.9067775' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2392, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.0502780' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2393, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.1942615' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2394, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.3389785' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2395, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.4905761' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2396, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.6344441' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2397, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.7940480' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2398, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:37.9383957' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2399, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:13:38.0930165' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2400, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:14:02.8212921' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2401, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:20.3316350' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2402, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.1239871' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2403, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.2667607' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2404, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.4341413' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2405, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.5582844' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2406, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.7067419' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2407, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:21.8752387' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2408, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:22.0116148' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2409, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:22.1556649' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2410, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:22.3059831' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2411, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:14:39.9589535' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2412, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:27.5569202' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2413, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:27.7065372' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2414, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:35.2348995' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2415, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:39.9753044' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2416, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:40.6464798' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2417, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:40.8832776' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2418, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.0352884' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2419, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.1954869' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2420, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.3673287' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2421, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.5391200' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2422, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.7161085' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2423, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:41.8998213' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2424, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:47.8996033' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2425, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:50.4836256' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2426, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:50.6673604' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2427, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.0374078' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2428, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.2119687' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2429, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.3796503' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2430, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.5573333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2431, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.7247123' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2432, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:51.9096478' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2433, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.1097195' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2434, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.2957856' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2435, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.4614427' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2436, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.6136579' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2437, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.7649523' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2438, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:52.9492552' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2439, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.1148188' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2440, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.2852717' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2441, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.4379995' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2442, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.6045777' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2443, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.7469184' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2444, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:53.9013278' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2445, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:54.0684880' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2446, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:54.2291232' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2447, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:54.3970417' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2448, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:54.5655649' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2449, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:54.7005362' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2450, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:55.0161259' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2451, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:55.1295425' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2452, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:15:55.2142878' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2453, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:16:36.5384658' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2454, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:16:36.6926609' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2455, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:16:42.2939738' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2456, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:16:57.5765988' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2457, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:16:57.7078129' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2458, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:07.0658954' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2459, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:07.3029410' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2460, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:07.5055107' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2461, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:07.6904907' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2462, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:07.8226166' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2463, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:08.4375227' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2464, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:08.5367610' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2465, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:08.6367599' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2466, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:09.6754313' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2467, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:18.2917787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2468, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:46.6167256' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2469, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:46.7746047' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2470, N'Pera123', N'Saerch tracks', N'{"Title":"s","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:50.8349340' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2471, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:51.8354460' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2472, N'Pera123', N'Saerch tracks', N'{"Title":"e","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:53.2418348' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2473, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:54.4728188' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2474, N'Pera123', N'Saerch tracks', N'{"Title":"so","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:57.0831324' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2475, N'Pera123', N'Saerch tracks', N'{"Title":"song","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:57.4129606' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2476, N'Pera123', N'Saerch tracks', N'{"Title":"son","ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:58.5822640' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2477, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:17:58.8815561' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2478, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:05.1027257' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2479, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:08.6461710' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2480, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:08.7950009' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2481, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:08.9671592' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2482, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.1074191' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2483, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.2665471' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2484, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.4348265' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2485, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.6025701' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2486, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.7469303' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2487, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:09.8912977' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2488, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:10.0344155' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2489, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:10.2029792' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2490, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:10.3149831' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2491, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:10.4915938' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2492, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:10.6910455' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2493, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:43.4795329' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2494, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:43.6320896' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2495, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:51.8767094' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2496, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:18:56.2808579' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2497, N'Pera123', N'Create playlist command', N'{"Name":"pera","AccessLevel":0}', CAST(N'2024-07-07T11:19:01.7426984' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2498, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:01.7738352' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2499, N'Pera123', N'Create playlist command', N'{"Name":"pera","AccessLevel":0}', CAST(N'2024-07-07T11:19:04.8682056' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2500, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:07.0838028' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2501, N'Pera123', N'Create playlist command', N'{"Name":"pera","AccessLevel":0}', CAST(N'2024-07-07T11:19:08.8752261' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2502, N'Pera123', N'Create playlist command', N'{"Name":"pera","AccessLevel":0}', CAST(N'2024-07-07T11:19:08.9855289' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2503, N'Pera123', N'Create playlist command', N'{"Name":"pera","AccessLevel":0}', CAST(N'2024-07-07T11:19:09.4099942' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2504, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:38.5967097' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2505, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:38.7510823' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2506, N'Pera123', N'Create playlist command', N'{"Name":"Per","AccessLevel":0}', CAST(N'2024-07-07T11:19:47.7756957' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2507, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:47.7909615' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2508, N'Pera123', N'Create playlist command', N'{"Name":"Pere","AccessLevel":0}', CAST(N'2024-07-07T11:19:51.6352055' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2509, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:51.6466047' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2510, N'Pera123', N'Delete playlist', N'9', CAST(N'2024-07-07T11:19:53.9735266' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2511, N'Pera123', N'Delete playlist', N'10', CAST(N'2024-07-07T11:19:54.6022244' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2512, N'Pera123', N'Delete playlist', N'11', CAST(N'2024-07-07T11:19:56.7218421' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2513, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:57.4675180' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2514, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:58.0989589' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2515, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:58.5387616' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2516, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:58.9070726' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2517, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:59.2124729' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2518, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:59.4342521' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2519, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:59.5862492' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2520, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:59.7471659' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2521, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:19:59.8828748' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2522, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:00.0120849' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2523, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:00.1384911' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2524, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:04.0889863' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2525, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:20:04.0983787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2526, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:20:06.2997091' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2527, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:06.3269251' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2528, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:06.3453775' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2529, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:10.9819813' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2530, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:20:10.9909237' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2531, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:20:14.1810145' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2532, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:14.2066304' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2533, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:14.2221616' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2534, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:18.0761659' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2535, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:22.0442729' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2536, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:20:25.4228010' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2537, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:26.4749499' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2538, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:26.4946830' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2539, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.1485153' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2540, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.1578110' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2541, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.3154347' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2542, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.3259251' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2543, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.4671172' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2544, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.4770208' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2545, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.6033013' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2546, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.6138254' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2547, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.7459698' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2548, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.7564088' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2549, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:27.9940154' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2550, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:28.0039483' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2551, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:20:30.3946569' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2552, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:20:30.5218874' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2553, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:20:30.6604467' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2554, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.2833319' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2555, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.4339030' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2556, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.5946027' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2557, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.7223837' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2558, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.8586766' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2559, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:31.9859600' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2560, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:20:32.1473163' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2561, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:11.0554377' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2562, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:11.2063261' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2563, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:20.6451188' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2564, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:24:20.6578637' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2565, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:24:22.5087164' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2566, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:22.5287816' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2567, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:22.5478742' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2568, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:26.8230679' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2569, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T11:24:26.8354720' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2570, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:24:28.6662787' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2571, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:28.6769700' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2572, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:28.7170973' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2573, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:24:36.2432413' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2574, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:25:19.0074733' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2575, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:25:22.7809290' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2576, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:25:50.8779855' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2577, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:25:51.0619301' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2578, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:25:57.5636978' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2579, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:26:03.9504725' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2580, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:27:41.5684333' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2581, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:27:41.7245259' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2582, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:06.6392212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2583, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:06.8211032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2584, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:11.9219814' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2585, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:15.6614656' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2586, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:20.8856405' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2587, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:28:20.8958849' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2588, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:28:23.2995768' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2589, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:23.3219250' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2590, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:23.3429201' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2591, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:26.9957368' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2592, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:28:27.0060171' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2593, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:28:31.4741402' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2594, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:31.4860014' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2595, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:31.5025716' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2596, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:35.9973012' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2597, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T11:28:36.0069314' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2598, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:28:38.3536804' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2599, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:38.3846715' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2600, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:38.4030974' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2601, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:44.2089390' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2602, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:45.7326368' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2603, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:54.4909426' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2604, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:28:59.2330507' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2605, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:29:14.0265707' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2606, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:19.4252855' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2607, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:19.5758150' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2608, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:23.5026318' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2609, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:30:23.5134487' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2610, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:25.2842947' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2611, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:25.3058740' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2612, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:30.6830392' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2613, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:30:31.3886005' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2614, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:10.6401541' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2615, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:10.7733144' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2616, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:16.1549242' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2617, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:16.6441263' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2618, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:22.1220565' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2619, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:30.1844621' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2620, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:30.2132541' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2621, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.2844779' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2622, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.2942667' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2623, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.3054877' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2624, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.8607419' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2625, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.8689881' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2626, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:32.8778748' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2627, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:40.6858380' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2628, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:40.6961643' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2629, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:40.7067559' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2630, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:31:41.8796932' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2631, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:41.9035416' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2632, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:51.9151614' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2633, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:51.9257708' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2634, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:51.9475777' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2635, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:53.3860307' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2636, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:53.3960020' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2637, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:31:53.4164072' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2638, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:25.7201326' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2639, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:26.0545429' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2640, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:32.5928481' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2641, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:32.7462849' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2642, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:37.5553390' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2643, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:32:37.8285809' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2644, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:06.9006332' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2645, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:07.0540151' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2646, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:19.1179612' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2647, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:19.3453627' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2648, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:23.4880158' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2649, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:34:27.0524101' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2650, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:27.0743415' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2651, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:34:28.3745845' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2652, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:29.6041468' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2653, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:41.2556808' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2654, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:41.4106371' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2655, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:48.0589965' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2656, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:34:48.0706152' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2657, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:34:51.1235717' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2658, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:51.1493426' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2659, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:51.1696582' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2660, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:55.3650043' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2661, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:34:55.3778772' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2662, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:34:58.1548124' AS DateTime2))
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2663, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:58.1661165' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2664, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:34:58.1832724' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2665, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:02.4509786' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2666, N'Pera123', N'Get track playlists', N'15', CAST(N'2024-07-07T11:35:02.4735032' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2667, N'Pera123', N'Add track to playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:35:04.4605587' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2668, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:04.4717141' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2669, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:04.5002980' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2670, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:09.2601817' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2671, N'Pera123', N'Get track playlists', N'14', CAST(N'2024-07-07T11:35:09.2694810' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2672, N'Pera123', N'Add track to playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:35:11.5305823' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2673, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:11.5959825' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2674, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:11.6137666' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2675, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:17.5556541' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2676, N'Pera123', N'Get track playlists', N'12', CAST(N'2024-07-07T11:35:17.5641689' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2677, N'Pera123', N'Add track to playlist', N'{"Tracks":[12],"PlaylistId":8}', CAST(N'2024-07-07T11:35:19.8091262' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2678, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:19.8221582' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2679, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:19.8373455' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2680, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:26.2282283' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2681, N'Pera123', N'Get track playlists', N'9', CAST(N'2024-07-07T11:35:26.2378836' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2682, N'Pera123', N'Add track to playlist', N'{"Tracks":[9],"PlaylistId":7}', CAST(N'2024-07-07T11:35:29.0737588' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2683, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:29.1490190' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2684, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:29.1665381' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2685, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[9,15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:33.2243230' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2686, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[12,14,15,16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:33.3186175' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2687, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:35:35.4838805' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2688, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[12,14,15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:35.4979468' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2689, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":8}', CAST(N'2024-07-07T11:35:37.2736178' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2690, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[12,14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:37.2833833' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2691, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[14],"PlaylistId":8}', CAST(N'2024-07-07T11:35:37.9367656' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2692, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[12]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:37.9456773' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2693, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[12],"PlaylistId":8}', CAST(N'2024-07-07T11:35:39.1133029' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2694, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[15],"PlaylistId":7}', CAST(N'2024-07-07T11:35:39.9628561' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2695, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[9]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:39.9858608' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2696, N'Pera123', N'Remove tracks from playlist', N'{"Tracks":[9],"PlaylistId":7}', CAST(N'2024-07-07T11:35:40.4916508' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2697, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:41.4044277' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2698, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:35:41.8177359' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2699, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:26.7645301' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2700, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:27.4627451' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2701, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:31.1421573' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2702, N'Pera123', N'Get track playlists', N'16', CAST(N'2024-07-07T11:36:31.1622413' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2703, N'Pera123', N'Add track to playlist', N'{"Tracks":[16],"PlaylistId":8}', CAST(N'2024-07-07T11:36:34.2318645' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2704, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:34.3256529' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2705, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:34.3552155' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2706, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:38.2605405' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2707, N'Pera123', N'Delete playlist', N'7', CAST(N'2024-07-07T11:36:41.8534877' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2708, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:43.2525544' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2709, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:43.2669868' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2710, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:47.9362366' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2711, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:47.9963494' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2712, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:36:51.5644484' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2713, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:37:13.1289416' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2714, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:37:13.1645727' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2715, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:37:16.8338628' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2716, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:40:32.4359948' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2717, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:40:32.5946285' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2718, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:41:56.9407212' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2719, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:41:57.0137761' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2720, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:00.5635266' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2721, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:00.6706962' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2722, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:17.0377172' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2723, N'Pera123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:17.0844003' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2724, N'Pera123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[16]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:21.4398969' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2725, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":null,"Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:29.5253396' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2726, N'admin123', N'Get user playlists', N'{"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:29.5886641' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2727, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[14]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:32.2111035' AS DateTime2))
INSERT [dbo].[UseCaseLogs] ([Id], [Username], [UseCaseName], [UseCaseData], [AttemptedAt]) VALUES (2728, N'admin123', N'Saerch tracks', N'{"Title":null,"ReleaseDate":null,"Album":null,"Artist":null,"Genre":null,"Genres":null,"Ids":"[15]","Sorts":[],"Page":1,"PerPage":10}', CAST(N'2024-07-07T11:42:32.3160168' AS DateTime2))
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [DateOfBirth], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (1, N'admin123', N'admin@gmail.com', N'$2a$10$zMjOYlfi/UbmsY74asNoZez2HcMsb2nkVpCVNv1j3OEX04Zhc/L8O', CAST(N'2019-05-05' AS Date), 2, 0, CAST(N'2024-06-25T11:57:53.5871491' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [DateOfBirth], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (2, N'user123', N'user@gmail.com', N'$2a$10$IQ56L64z8s9ci3CPaAxPyuL73aMlDVCbNRVl7psYQeK7Eb/CxaSOu', CAST(N'2002-10-10' AS Date), 1, 0, CAST(N'2024-06-25T14:49:26.6904490' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [DateOfBirth], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (4, N'Pera123', N'test123@gmail.com', N'$2a$10$HI0XZdVy2w.19VQmZ0T8XO3A2HoyPNShTc5zoQF14ARPWrCB6olD2', CAST(N'2002-10-10' AS Date), 1, 0, CAST(N'2024-07-07T10:15:57.9973371' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [DateOfBirth], [CountryId], [Gender], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive]) VALUES (5, N'Pera1235', N'test1235@gmail.com', N'$2a$10$jsX.Gmgl1y/11irk2.6/..v3hzDK9ZyAIPzeUNHKWIicMqJyKJowO', CAST(N'2002-10-10' AS Date), 2, 1, CAST(N'2024-07-07T10:19:29.8738855' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 28)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 29)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 30)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 31)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 32)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 33)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 34)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 37)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 38)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 39)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 40)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 41)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 42)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 33)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 34)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 40)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 41)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 42)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 33)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 34)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 40)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 41)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 42)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 25)
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 33)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 34)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 36)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 40)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 41)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 42)
GO
/****** Object:  Index [IX_Albums_ArtistId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Albums_ArtistId] ON [dbo].[Albums]
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Albums_Name]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Albums_Name] ON [dbo].[Albums]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArtistGenre_GenreId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_ArtistGenre_GenreId] ON [dbo].[ArtistGenre]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Artists_CountryId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Artists_CountryId] ON [dbo].[Artists]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Artists_FirstName_LastName_CountryId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Artists_FirstName_LastName_CountryId] ON [dbo].[Artists]
(
	[FirstName] ASC,
	[LastName] ASC,
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Artists_Name]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Artists_Name] ON [dbo].[Artists]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArtistTrack_TrackId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_ArtistTrack_TrackId] ON [dbo].[ArtistTrack]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentId] ON [dbo].[Comments]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_TrackId_UserId_CreatedAt]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Comments_TrackId_UserId_CreatedAt] ON [dbo].[Comments]
(
	[TrackId] ASC,
	[UserId] ASC,
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Countries_Name]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Countries_Name] ON [dbo].[Countries]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ErrorLogs_ActorUsername]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_ErrorLogs_ActorUsername] ON [dbo].[ErrorLogs]
(
	[ActorUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ErrorLogs_ErrorId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_ErrorLogs_ErrorId] ON [dbo].[ErrorLogs]
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_Name]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Genres_Name] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GenreTrack_TrackId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_GenreTrack_TrackId] ON [dbo].[GenreTrack]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvalidTokens_TokenId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_InvalidTokens_TokenId] ON [dbo].[InvalidTokens]
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvalidTokens_UserId_AddedAt]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_InvalidTokens_UserId_AddedAt] ON [dbo].[InvalidTokens]
(
	[UserId] ASC,
	[AddedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Playlists_Name]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Playlists_Name] ON [dbo].[Playlists]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Playlists_UserId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Playlists_UserId] ON [dbo].[Playlists]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlaylistTrack_TrackId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_PlaylistTrack_TrackId] ON [dbo].[PlaylistTrack]
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tracks_AlbumId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Tracks_AlbumId] ON [dbo].[Tracks]
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tracks_Title_ReleaseDate_AlbumId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Tracks_Title_ReleaseDate_AlbumId] ON [dbo].[Tracks]
(
	[Title] ASC,
	[ReleaseDate] ASC,
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UseCaseLogs_AttemptedAt]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_AttemptedAt] ON [dbo].[UseCaseLogs]
(
	[AttemptedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UseCaseLogs_UseCaseName]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_UseCaseName] ON [dbo].[UseCaseLogs]
(
	[UseCaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UseCaseLogs_Username]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_Username] ON [dbo].[UseCaseLogs]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_CountryId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_Users_CountryId] ON [dbo].[Users]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 07/07/2024 1:55:08 pm ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Albums] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Albums] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Artists] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Artists] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Genres] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Genres] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[InvalidTokens] ADD  DEFAULT (getdate()) FOR [AddedAt]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[UseCaseLogs] ADD  DEFAULT (getdate()) FOR [AttemptedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_Artists_ArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([Id])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_Artists_ArtistId]
GO
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD  CONSTRAINT [FK_ArtistGenre_Artists_ArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistGenre] CHECK CONSTRAINT [FK_ArtistGenre_Artists_ArtistId]
GO
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD  CONSTRAINT [FK_ArtistGenre_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistGenre] CHECK CONSTRAINT [FK_ArtistGenre_Genres_GenreId]
GO
ALTER TABLE [dbo].[Artists]  WITH CHECK ADD  CONSTRAINT [FK_Artists_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Artists] CHECK CONSTRAINT [FK_Artists_Countries_CountryId]
GO
ALTER TABLE [dbo].[ArtistTrack]  WITH CHECK ADD  CONSTRAINT [FK_ArtistTrack_Artists_ArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistTrack] CHECK CONSTRAINT [FK_ArtistTrack_Artists_ArtistId]
GO
ALTER TABLE [dbo].[ArtistTrack]  WITH CHECK ADD  CONSTRAINT [FK_ArtistTrack_Tracks_TrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistTrack] CHECK CONSTRAINT [FK_ArtistTrack_Tracks_TrackId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Tracks_TrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Tracks_TrackId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[GenreTrack]  WITH CHECK ADD  CONSTRAINT [FK_GenreTrack_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreTrack] CHECK CONSTRAINT [FK_GenreTrack_Genres_GenreId]
GO
ALTER TABLE [dbo].[GenreTrack]  WITH CHECK ADD  CONSTRAINT [FK_GenreTrack_Tracks_TrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreTrack] CHECK CONSTRAINT [FK_GenreTrack_Tracks_TrackId]
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK_Playlists_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playlists] CHECK CONSTRAINT [FK_Playlists_Users_UserId]
GO
ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistTrack_Playlists_PlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlists] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistTrack] CHECK CONSTRAINT [FK_PlaylistTrack_Playlists_PlaylistId]
GO
ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistTrack_Tracks_TrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistTrack] CHECK CONSTRAINT [FK_PlaylistTrack_Tracks_TrackId]
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_Albums_AlbumId] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([Id])
GO
ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [FK_Tracks_Albums_AlbumId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Countries_CountryId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [TuneTrax] SET  READ_WRITE 
GO
