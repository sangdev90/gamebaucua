USE [master]
GO
/****** Object:  Database [QLTaiKhoan]    Script Date: 10/12/2017 21:03:15 ******/
CREATE DATABASE [QLTaiKhoan] ON  PRIMARY 
( NAME = N'QLTaiKhoan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLTaiKhoan.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTaiKhoan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLTaiKhoan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTaiKhoan] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTaiKhoan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTaiKhoan] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLTaiKhoan] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLTaiKhoan] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLTaiKhoan] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLTaiKhoan] SET ARITHABORT OFF
GO
ALTER DATABASE [QLTaiKhoan] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QLTaiKhoan] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLTaiKhoan] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLTaiKhoan] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLTaiKhoan] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLTaiKhoan] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLTaiKhoan] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLTaiKhoan] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLTaiKhoan] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLTaiKhoan] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLTaiKhoan] SET  DISABLE_BROKER
GO
ALTER DATABASE [QLTaiKhoan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLTaiKhoan] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLTaiKhoan] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLTaiKhoan] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLTaiKhoan] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLTaiKhoan] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLTaiKhoan] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLTaiKhoan] SET  READ_WRITE
GO
ALTER DATABASE [QLTaiKhoan] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLTaiKhoan] SET  MULTI_USER
GO
ALTER DATABASE [QLTaiKhoan] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLTaiKhoan] SET DB_CHAINING OFF
GO
USE [QLTaiKhoan]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/12/2017 21:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](max) NOT NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[Diem] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GioiTinh], [DiaChi], [SoDienThoai], [Diem]) VALUES (N'Admin', N'Admin', NULL, NULL, NULL, N'0')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GioiTinh], [DiaChi], [SoDienThoai], [Diem]) VALUES (N'us1', N'us1', N'Nam', N'', N'', N'0')
/****** Object:  StoredProcedure [dbo].[XemDiem]    Script Date: 10/12/2017 21:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XemDiem]
(
	@TenTaiKhoan nvarchar(50)
)
AS
BEGIN
	SELECT TK.Diem
	FROM QLTaiKhoan.dbo.TaiKhoan TK
	WHERE TK.TenDangNhap = @TenTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 10/12/2017 21:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DangNhap]
(
	@TenDangNhap nvarchar(50),
	@MatKhau nvarchar(MAX)
)
AS
BEGIN
	SELECT *
	FROM QLTaiKhoan.dbo.TaiKhoan TK
	WHERE TK.TenDangNhap = @TenDangNhap AND
			TK.MatKhau = @MatKhau
END
GO
/****** Object:  StoredProcedure [dbo].[DangKy]    Script Date: 10/12/2017 21:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DangKy]
(
	@TenDangNhap nvarchar(50),
	@MatKhau nvarchar(MAX),
	@GioiTinh nvarchar(5),
	@DiaChi nvarchar(MAX),
	@SoDienThoai nvarchar(11),
	@Diem nvarchar(MAX) = N'0'
)
AS
BEGIN
	INSERT INTO [QLTaiKhoan].[dbo].[TaiKhoan]
           ([TenDangNhap]
           ,[MatKhau]
           ,[GioiTinh]
           ,[DiaChi]
           ,[SoDienThoai]
           ,[Diem])
     VALUES
           (@TenDangNhap
           ,@MatKhau
           ,@GioiTinh
           ,@DiaChi
           ,@SoDienThoai
           ,@Diem)
END
GO
