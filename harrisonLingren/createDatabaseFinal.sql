USE [master]
GO
/****** Object:  Database [harrisonLingren]    Script Date: 11/30/2015 9:46:24 AM ******/
CREATE DATABASE [harrisonLingren]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'harrisonLingren', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\harrisonLingren.mdf' , SIZE = 59392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'harrisonLingren_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\harrisonLingren_log.ldf' , SIZE = 69760KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [harrisonLingren] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [harrisonLingren].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [harrisonLingren] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [harrisonLingren] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [harrisonLingren] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [harrisonLingren] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [harrisonLingren] SET ARITHABORT OFF 
GO
ALTER DATABASE [harrisonLingren] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [harrisonLingren] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [harrisonLingren] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [harrisonLingren] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [harrisonLingren] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [harrisonLingren] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [harrisonLingren] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [harrisonLingren] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [harrisonLingren] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [harrisonLingren] SET  DISABLE_BROKER 
GO
ALTER DATABASE [harrisonLingren] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [harrisonLingren] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [harrisonLingren] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [harrisonLingren] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [harrisonLingren] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [harrisonLingren] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [harrisonLingren] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [harrisonLingren] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [harrisonLingren] SET  MULTI_USER 
GO
ALTER DATABASE [harrisonLingren] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [harrisonLingren] SET DB_CHAINING OFF 
GO
ALTER DATABASE [harrisonLingren] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [harrisonLingren] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [harrisonLingren] SET DELAYED_DURABILITY = DISABLED 
GO
USE [harrisonLingren]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Airports](
	[Airport_id] [varchar](50) NOT NULL,
	[City_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED 
(
	[Airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[City_name] [varchar](50) NOT NULL,
	[City_market_id] [varchar](50) NOT NULL,
	[State_abr] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[City_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dates]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates](
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day_of_month] [int] NOT NULL,
	[Day_of_week] [int] NOT NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[Month] ASC,
	[Day_of_month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Flight_info]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flight_info](
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day_of_month] [int] NOT NULL,
	[Unique_carrier] [varchar](50) NOT NULL,
	[Fl_num] [varchar](50) NOT NULL,
	[Origin_airport_id] [varchar](50) NOT NULL,
	[Tail_num] [varchar](50) NOT NULL,
	[Dep_delay_new] [varchar](50) NOT NULL,
	[Arr_delay_new] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Flight_info] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[Month] ASC,
	[Day_of_month] ASC,
	[Unique_carrier] ASC,
	[Fl_num] ASC,
	[Origin_airport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[import]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[import](
	[YEAR] [int] NULL,
	[QUARTER] [int] NULL,
	[MONTH] [int] NULL,
	[DAY_OF_WEEK] [int] NULL,
	[DAY_OF_MONTH] [int] NULL,
	[UNIQUE_CARRIER] [varchar](50) NULL,
	[TAIL_NUM] [varchar](50) NULL,
	[FL_NUM] [varchar](50) NULL,
	[ORIGIN_AIRPORT_ID] [varchar](50) NULL,
	[ORIGIN_AIRPORT_SEQ_ID] [varchar](50) NULL,
	[ORIGIN_CITY_MARKET_ID] [varchar](50) NULL,
	[ORIGIN_CITY_NAME] [varchar](50) NULL,
	[ORIGIN_STATE_ABR] [varchar](50) NULL,
	[DEST_AIRPORT_ID] [varchar](50) NULL,
	[DEST_AIRPORT_SEQ_ID] [varchar](50) NULL,
	[DEST_CITY_MARKET_ID] [varchar](50) NULL,
	[DEST_CITY_NAME] [varchar](50) NULL,
	[DEST_STATE_ABR] [varchar](50) NULL,
	[DEP_DELAY_NEW] [varchar](50) NULL,
	[ARR_DELAY_NEW] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quarters]    Script Date: 11/30/2015 9:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quarters](
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
 CONSTRAINT [PK_Quarters] PRIMARY KEY CLUSTERED 
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Airports]  WITH CHECK ADD  CONSTRAINT [FK_Airports_Cities] FOREIGN KEY([City_name])
REFERENCES [dbo].[Cities] ([City_name])
GO
ALTER TABLE [dbo].[Airports] CHECK CONSTRAINT [FK_Airports_Cities]
GO
ALTER TABLE [dbo].[Dates]  WITH CHECK ADD  CONSTRAINT [FK_Dates_Quarters] FOREIGN KEY([Month])
REFERENCES [dbo].[Quarters] ([Month])
GO
ALTER TABLE [dbo].[Dates] CHECK CONSTRAINT [FK_Dates_Quarters]
GO
ALTER TABLE [dbo].[Flight_info]  WITH CHECK ADD  CONSTRAINT [FK_Flight_info_Airports] FOREIGN KEY([Origin_airport_id])
REFERENCES [dbo].[Airports] ([Airport_id])
GO
ALTER TABLE [dbo].[Flight_info] CHECK CONSTRAINT [FK_Flight_info_Airports]
GO
ALTER TABLE [dbo].[Flight_info]  WITH CHECK ADD  CONSTRAINT [FK_Flight_info_Dates] FOREIGN KEY([Year], [Month], [Day_of_month])
REFERENCES [dbo].[Dates] ([Year], [Month], [Day_of_month])
GO
ALTER TABLE [dbo].[Flight_info] CHECK CONSTRAINT [FK_Flight_info_Dates]
GO
USE [master]
GO
ALTER DATABASE [harrisonLingren] SET  READ_WRITE 
GO
