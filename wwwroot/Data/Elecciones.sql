USE [master]
GO
/****** Object:  Database [Elecciones2023]    Script Date: 13/7/2023 15:36:29 ******/
CREATE DATABASE [Elecciones2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elecciones2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elecciones2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Elecciones2023] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elecciones2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elecciones2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elecciones2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elecciones2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elecciones2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elecciones2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elecciones2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elecciones2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Elecciones2023] SET  MULTI_USER 
GO
ALTER DATABASE [Elecciones2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elecciones2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elecciones2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elecciones2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elecciones2023] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Elecciones2023', N'ON'
GO
ALTER DATABASE [Elecciones2023] SET QUERY_STORE = OFF
GO
USE [Elecciones2023]
GO
/****** Object:  User [alumno]    Script Date: 13/7/2023 15:36:29 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 13/7/2023 15:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[Id_Candidato] [int] IDENTITY(1,1) NOT NULL,
	[FK_Partido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidato] PRIMARY KEY CLUSTERED 
(
	[Id_Candidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 13/7/2023 15:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[Id_Partido] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Logo] [varchar](50) NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[CantidadDiputados] [int] NOT NULL,
	[CantidadSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[Id_Partido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidato] ON 

INSERT [dbo].[Candidato] ([Id_Candidato], [FK_Partido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (2, 2, N'Scioli', N'Daniel', CAST(N'1957-01-13' AS Date), N'DanielScioli.jpg', N'Gobernador')
INSERT [dbo].[Candidato] ([Id_Candidato], [FK_Partido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (3, 3, N'Milei', N'Javier', CAST(N'1970-10-22' AS Date), N'Milei.png', N'Presidente')
INSERT [dbo].[Candidato] ([Id_Candidato], [FK_Partido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (4, 1, N'Larreta', N'Horacio ', CAST(N'1965-10-29' AS Date), N'larreta.jpg', N'Gobernador')
INSERT [dbo].[Candidato] ([Id_Candidato], [FK_Partido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (5, 2, N'Massa', N'Sergio', CAST(N'1972-04-28' AS Date), N'Massa.jpg', N'Ministro De Economia')
INSERT [dbo].[Candidato] ([Id_Candidato], [FK_Partido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (6, 3, N'Espert', N'Jose', CAST(N'1961-11-21' AS Date), N'Espert.png', N'Diputado')
SET IDENTITY_INSERT [dbo].[Candidato] OFF
GO
SET IDENTITY_INSERT [dbo].[Partido] ON 

INSERT [dbo].[Partido] ([Id_Partido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (1, N'Juntos Por El Cambio', N'JuntosPorElCambio.png', N'https://jxc.com.ar/', CAST(N'2019-06-12' AS Date), 20, 31)
INSERT [dbo].[Partido] ([Id_Partido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (2, N'FrenteDeTodos', N'Todos.png', N'https://www.frentedetodos.org/', CAST(N'2019-06-12' AS Date), 19, 30)
INSERT [dbo].[Partido] ([Id_Partido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (3, N'La Libertad Avanza', N'LaLibertadAvanza.png', N'https://lalibertadavanza.com.ar/', CAST(N'2021-07-14' AS Date), 17, 40)
SET IDENTITY_INSERT [dbo].[Partido] OFF
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Partido] FOREIGN KEY([FK_Partido])
REFERENCES [dbo].[Partido] ([Id_Partido])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Partido]
GO
USE [master]
GO
ALTER DATABASE [Elecciones2023] SET  READ_WRITE 
GO
