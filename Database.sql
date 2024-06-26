USE [master]
GO
/****** Object:  Database [HeThongQuanLyHocTap]    Script Date: 5/17/2024 4:27:57 PM ******/
CREATE DATABASE [HeThongQuanLyHocTap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HeThongQuanLyHocTap', FILENAME = N'D:\SQL Server\MSSQL15.SERVEREBAN\MSSQL\DATA\HeThongQuanLyHocTap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HeThongQuanLyHocTap_log', FILENAME = N'D:\SQL Server\MSSQL15.SERVEREBAN\MSSQL\DATA\HeThongQuanLyHocTap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HeThongQuanLyHocTap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ARITHABORT OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET RECOVERY FULL 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET  MULTI_USER 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HeThongQuanLyHocTap', N'ON'
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET QUERY_STORE = OFF
GO
USE [HeThongQuanLyHocTap]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/17/2024 4:27:58 PM ******/
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
/****** Object:  Table [dbo].[BaiTap]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiTap](
	[idBaiTap] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiBaiTap] [int] NOT NULL,
	[idKhoaHoc] [int] NOT NULL,
	[tenBaiTap] [nvarchar](255) NOT NULL,
	[thoiGian] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[idCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[noiDung] [nvarchar](max) NOT NULL,
	[idMonHoc] [int] NOT NULL,
	[idLoaiCauHoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CotDiem]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CotDiem](
	[idCotDiem] [int] IDENTITY(1,1) NOT NULL,
	[tenCotDiem] [nvarchar](255) NOT NULL,
	[Diem] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCotDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DapAn]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DapAn](
	[idDapAn] [int] IDENTITY(1,1) NOT NULL,
	[noiDung] [nvarchar](max) NOT NULL,
	[ketQua] [bit] NOT NULL,
	[idCauHoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDapAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[idHocKy] [int] IDENTITY(1,1) NOT NULL,
	[namHocKy] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[idKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[idMonHoc] [int] NOT NULL,
	[idGiangVien] [int] NOT NULL,
	[idHocKy] [int] NOT NULL,
	[tenKhoaHoc] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListTracNghiem]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTracNghiem](
	[idTracNghiem] [int] IDENTITY(1,1) NOT NULL,
	[idBaiTap] [int] NOT NULL,
	[idCauHoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTracNghiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiBaiTap]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBaiTap](
	[idLoaiBaiTap] [int] IDENTITY(1,1) NOT NULL,
	[tenBaiTap] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoaiBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCauHoi]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCauHoi](
	[idLoaiCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[tenLoaiCauHoi] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoaiCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[idMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[tenMonHoc] [nvarchar](255) NOT NULL,
	[soTinChi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienKhoaHoc]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienKhoaHoc](
	[idSVKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[idSinhVien] [int] NOT NULL,
	[idKhoaHoc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSVKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienLamBai]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienLamBai](
	[idBaiLam] [int] IDENTITY(1,1) NOT NULL,
	[idSinhVien] [int] NOT NULL,
	[idBaiTap] [int] NOT NULL,
	[idCotDiem] [int] NOT NULL,
	[noiDungBaiLam] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBaiLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOu]    Script Date: 5/17/2024 4:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOu](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[firstName] [varchar](100) NOT NULL,
	[lastName] [varchar](100) NOT NULL,
	[avatar] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[role] [varchar](50) NOT NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiTap] ON 

INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (11, 1, 2, N'bai tapj', 10)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (15, 2, 2, N'bai test', 10)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (16, 1, 1, N'Giữa kỳ', 10)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (18, 2, 1, N'Cuối kỳ', 10)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (20, 2, 2, N'zdszdvsdvz', 1)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (23, 1, 4, N'Cuối kỳ', 1)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (24, 2, 4, N'Bài tập chương I', 1)
INSERT [dbo].[BaiTap] ([idBaiTap], [idLoaiBaiTap], [idKhoaHoc], [tenBaiTap], [thoiGian]) VALUES (25, 2, 4, N'bài chương 2', 1)
SET IDENTITY_INSERT [dbo].[BaiTap] OFF
GO
SET IDENTITY_INSERT [dbo].[CauHoi] ON 

INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (2, N'1 + 1 ', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (3, N'em yeu anh khoong', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (4, N'choi game khong ', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (5, N'hehehe', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (6, N'string', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (7, N'hahahaha', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (8, N'hihihi', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (9, N'mimimi', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (10, N'Đâu là thủ đô của Việt Nam?', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (11, N'mo hai ba', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (12, N'hôm nay thứ mấy', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (13, N'string', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (14, N'Đâu là thủ đô của Pháp?', 1, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (15, N'sdfsdfsdf', 2, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (16, N'sdfsdfsdf', 2, 2)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (17, N'đi choi', 2, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (18, N'Cảm nhận về Đại học mở', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (19, N'trường đại học mở có bao nhiêu cơ sở?', 1, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (20, N'gdfgdfgdfb', 2, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (21, N'what is my name', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (22, N'làm sao để biết cài win', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (23, N'hoho', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (24, N'ASP.NET là gì?', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (25, N'Web Forms không hỗ trợ lập trình hướng đối tượng  ', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (26, N'ASP.NET Web API là gì?', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (27, N'Các phương thức HTTP phổ biến trong Web API là gì?', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (28, N'Điểm nổi bật của ASP.NET Core so với các phiên bản trước là gì?', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (29, N'Viêt lệnh truy vấn SQL để lấy dữ liệu sinh viên?', 3, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (30, N'ehfhalfhaldsf', 3, 1)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (31, N'học 123', 3, 3)
INSERT [dbo].[CauHoi] ([idCauHoi], [noiDung], [idMonHoc], [idLoaiCauHoi]) VALUES (32, N'học 123', 3, 3)
SET IDENTITY_INSERT [dbo].[CauHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[CotDiem] ON 

INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (1, N'Bài tập về nhà', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (2, N'bai test', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (3, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (4, N'Ten Cot', 1)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (5, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (6, N'Ten Cot', 5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (7, N'Ten Cot', 5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (8, N'Ten Cot', 5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (9, N'Ten Cot', 5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (10, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (11, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (12, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (13, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (14, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (15, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (16, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (17, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (18, N'Ten Cot', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (19, N'Ten Cot', 10)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (20, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (21, N'Ten Cot', 5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (22, N'Ten Cot', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (23, N'Thực hành trên phòng máy', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (24, N'Giữa kỳ', 2.5)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (25, N'Bài tập tự luận', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (26, N'Bài tập tự luận', 9)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (27, N'Cuối kỳ', 10)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (28, N'2234234234', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (29, N'bai tapj', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (30, N'2234234234', 10)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (31, N'Cuối kỳ', 9)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (32, N'Giữa kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (33, N'bai tapj', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (34, N'bai test', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (35, N'Bài test', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (36, N'Giữa kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (37, N'Giữa kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (38, N'Cuối kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (39, N'2234234234', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (40, N'Cuối kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (41, N'Cuối kỳ', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (42, N'Bài tập chương I', 0)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (43, N'Cuối kỳ', 6)
INSERT [dbo].[CotDiem] ([idCotDiem], [tenCotDiem], [Diem]) VALUES (44, N'Bài tập chương I', 9)
SET IDENTITY_INSERT [dbo].[CotDiem] OFF
GO
SET IDENTITY_INSERT [dbo].[DapAn] ON 

INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (1, N'32', 0, 2)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (2, N'2', 1, 2)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (3, N'4', 0, 2)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (4, N'85', 0, 2)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (5, N'Không', 1, 3)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (6, N'Có ', 0, 3)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (7, N'Hỏi làm gì ', 0, 3)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (8, N'nghỉ choi', 0, 3)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (9, N'có nhé vô', 1, 4)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (10, N'Bận học rồi', 0, 4)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (11, N'Buồn ngủ quá', 0, 4)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (12, N'điện thoại hết pin', 0, 4)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (13, N'hihi', 1, 5)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (14, N'hoho', 0, 5)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (15, N'huhu', 0, 5)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (16, N'haha', 0, 5)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (17, N'Hà Nội', 1, 10)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (18, N'Hồ Chí Minh', 0, 10)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (19, N'Đà Nẵng', 0, 10)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (20, N'Huế', 0, 10)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (21, N'string', 1, 13)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (22, N'Paris', 1, 14)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (23, N'London', 0, 14)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (24, N'Berlin', 0, 14)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (25, N'Rome', 0, 14)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (26, N'', 0, 15)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (27, N'', 0, 15)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (28, N'sdfsd', 0, 16)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (29, N'sdfsdf', 0, 16)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (30, N'do er', 0, 17)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (31, N'di chill', 0, 17)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (32, N'', 0, 18)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (33, N'', 0, 18)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (34, N'không biết', 0, 21)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (35, N'làm gì', 0, 21)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (36, N'thôi chịu', 0, 21)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (37, N'mệt nhă', 0, 21)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (38, N'mang ra tiệm', 0, 22)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (39, N'tự cài theo pháp sư ấn độ', 0, 22)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (40, N'tự làm theo trực giác', 0, 22)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (41, N'chưa làm được', 0, 22)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (42, N'hihi', 0, 23)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (43, N'hưhư', 0, 23)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (44, N'haha', 0, 23)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (45, N'hehe', 0, 23)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (46, N'Một hệ điều hành', 0, 24)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (47, N'Một ngôn ngữ lập trình', 0, 24)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (48, N'Một ngôn ngữ lập trình', 1, 24)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (49, N'Một trình duyệt web', 0, 24)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (50, N'MVC không hỗ trợ đa nền tảng', 0, 25)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (51, N'Web Forms không hỗ trợ sự kiện  ', 0, 25)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (52, N'MVC sử dụng mô hình Model-View-Controller  ', 1, 25)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (53, N'Web Forms không hỗ trợ lập trình hướng đối tượng ', 0, 25)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (54, N'Một ngôn ngữ lập trình mới', 0, 26)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (55, N'Một framework cho phép xây dựng dịch vụ HTTP  ', 1, 26)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (56, N'Một phần mềm chỉnh sửa mã nguồn  ', 0, 26)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (57, N'Một trình duyệt web', 0, 26)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (58, N'POST, RUN, EXIT  ', 0, 27)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (59, N'GET, POST, PUT, DELETE', 1, 27)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (60, N'FETCH, UPDATE, REMOVE  ', 0, 27)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (61, N'INSERT, DELETE, UPDATE  ', 0, 27)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (62, N'Chỉ hỗ trợ trên Windows', 0, 28)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (63, N'Hỗ trợ đa nền tảng    ', 1, 28)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (64, N'Không hỗ trợ dịch vụ web   ', 0, 28)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (65, N'Chỉ hỗ trợ ứng dụng di động  ', 0, 28)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (66, N'Chỉ hỗ trợ trên Windows', 0, 29)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (67, N'Hỗ trợ đa nền tảng    ', 1, 29)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (68, N'Không hỗ trợ dịch vụ web   ', 0, 29)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (69, N'Chỉ hỗ trợ ứng dụng di động  ', 0, 29)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (70, N'bac', 1, 31)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (71, N'jyd', 0, 31)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (72, N'jdud', 0, 31)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (73, N'bac', 0, 32)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (74, N'jyd', 0, 32)
INSERT [dbo].[DapAn] ([idDapAn], [noiDung], [ketQua], [idCauHoi]) VALUES (75, N'jdud', 1, 32)
SET IDENTITY_INSERT [dbo].[DapAn] OFF
GO
SET IDENTITY_INSERT [dbo].[HocKy] ON 

INSERT [dbo].[HocKy] ([idHocKy], [namHocKy]) VALUES (1, N'Học Kỳ I 2024')
INSERT [dbo].[HocKy] ([idHocKy], [namHocKy]) VALUES (2, N'Học kỳ II 2024')
INSERT [dbo].[HocKy] ([idHocKy], [namHocKy]) VALUES (3, N'Học kỳ III 2024')
SET IDENTITY_INSERT [dbo].[HocKy] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([idKhoaHoc], [idMonHoc], [idGiangVien], [idHocKy], [tenKhoaHoc]) VALUES (1, 1, 3, 3, N'Tập lập trình')
INSERT [dbo].[KhoaHoc] ([idKhoaHoc], [idMonHoc], [idGiangVien], [idHocKy], [tenKhoaHoc]) VALUES (2, 2, 3, 3, N'Lập trình Java')
INSERT [dbo].[KhoaHoc] ([idKhoaHoc], [idMonHoc], [idGiangVien], [idHocKy], [tenKhoaHoc]) VALUES (3, 1, 3, 2, N'Thể dục bơi lội')
INSERT [dbo].[KhoaHoc] ([idKhoaHoc], [idMonHoc], [idGiangVien], [idHocKy], [tenKhoaHoc]) VALUES (4, 3, 13, 3, N'Lập trình cơ sở dữ liệu')
INSERT [dbo].[KhoaHoc] ([idKhoaHoc], [idMonHoc], [idGiangVien], [idHocKy], [tenKhoaHoc]) VALUES (6, 5, 13, 3, N'Tiếng anh giao tiếp')
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[ListTracNghiem] ON 

INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (28, 11, 16)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (29, 11, 17)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (35, 15, 15)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (36, 16, 14)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (37, 16, 13)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (38, 16, 12)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (39, 16, 10)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (41, 18, 18)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (42, 18, 19)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (44, 20, 15)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (45, 20, 20)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (52, 23, 28)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (53, 23, 27)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (54, 23, 26)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (55, 23, 25)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (56, 23, 24)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (57, 24, 29)
INSERT [dbo].[ListTracNghiem] ([idTracNghiem], [idBaiTap], [idCauHoi]) VALUES (58, 25, 30)
SET IDENTITY_INSERT [dbo].[ListTracNghiem] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiBaiTap] ON 

INSERT [dbo].[LoaiBaiTap] ([idLoaiBaiTap], [tenBaiTap]) VALUES (1, N'Trắc nghiệm')
INSERT [dbo].[LoaiBaiTap] ([idLoaiBaiTap], [tenBaiTap]) VALUES (2, N'Tự luận')
SET IDENTITY_INSERT [dbo].[LoaiBaiTap] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiCauHoi] ON 

INSERT [dbo].[LoaiCauHoi] ([idLoaiCauHoi], [tenLoaiCauHoi]) VALUES (1, N'Tự luận')
INSERT [dbo].[LoaiCauHoi] ([idLoaiCauHoi], [tenLoaiCauHoi]) VALUES (2, N'Trắc nghiệm nhiều đáp án')
INSERT [dbo].[LoaiCauHoi] ([idLoaiCauHoi], [tenLoaiCauHoi]) VALUES (3, N'Trắc nghiệm 4 đáp án')
SET IDENTITY_INSERT [dbo].[LoaiCauHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTinChi]) VALUES (1, N'Phân tích hệ thống ', 3)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTinChi]) VALUES (2, N'Lập trình hệ thống web', 4)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTinChi]) VALUES (3, N'Kiểm thử phần mềm', 4)
INSERT [dbo].[MonHoc] ([idMonHoc], [tenMonHoc], [soTinChi]) VALUES (5, N'Tiếng anh nâng cao', 4)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienKhoaHoc] ON 

INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (1, 2, 1)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (13, 2, 2)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (16, 8, 1)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (17, 8, 2)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (18, 8, 3)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (19, 6, 1)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (20, 6, 2)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (21, 6, 3)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (22, 2, 3)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (23, 2, 4)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (24, 12, 1)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (25, 12, 2)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (26, 12, 3)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (27, 12, 4)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (28, 11, 6)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (29, 11, 4)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (31, 14, 6)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (32, 14, 4)
INSERT [dbo].[SinhVienKhoaHoc] ([idSVKhoaHoc], [idSinhVien], [idKhoaHoc]) VALUES (34, 11, 2)
SET IDENTITY_INSERT [dbo].[SinhVienKhoaHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienLamBai] ON 

INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (2, 2, 15, 2, N'<p>hdlákjdfhlkádhflkjádhlfkándf ádf ádg sdhgfadf sdf gádfg ág</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (24, 2, 16, 24, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (27, 2, 18, 27, N'<p>Xuất sắc</p><p>5 cơ sở</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (29, 2, 11, 29, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (31, 6, 18, 31, N'<p>123123</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (32, 6, 16, 32, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (33, 6, 11, 33, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (34, 6, 15, 34, N'<p>12wềhrgh</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (36, 12, 16, 36, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (37, 12, 16, 37, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (38, 12, 18, 38, N'<p>SDsdfsdf</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (40, 14, 23, 40, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (41, 14, 23, 41, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (42, 14, 24, 42, N'<p>adc</p>')
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (43, 11, 23, 43, NULL)
INSERT [dbo].[SinhVienLamBai] ([idBaiLam], [idSinhVien], [idBaiTap], [idCotDiem], [noiDungBaiLam]) VALUES (44, 11, 24, 44, N'<p>học 234 </p>')
SET IDENTITY_INSERT [dbo].[SinhVienLamBai] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOu] ON 

INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (1, N'admin', N'admin', N'admin', N'admin', NULL, NULL, N'Admin', NULL)
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (2, N'eban123', N'123', N'Jhon', N'Eban', N'https://i.pinimg.com/736x/7a/66/05/7a660504cc2c04009c2114148bcdc113.jpg', N'eban@gmail.com', N'Student', N'Buôn Mê Thu?t')
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (3, N'hon', N'123', N'hon', N'nie', NULL, N'hon@gmail.com', N'Teacher', N'BTM')
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (6, N'TAcoder', N'123', N'Nguy?n', N'Th? Anh', N'https://i.pinimg.com/736x/94/14/a1/9414a102e5918bfa16635f617106d74b.jpg', N'TheAnh@123', N'Student', N'Bình th?nh')
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (8, N'mau', N'123', N'Nguyen', N'Mau', NULL, N'mau@123', N'Student', N'Miên Tây')
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (9, N'Anh123', N'123', N'Duc', N'Anh', NULL, N'ducanh@gmail.com', N'Student', NULL)
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (10, N'string', N'string', N'string', N'string', NULL, N'string', N'Student', NULL)
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (11, N'mau123', N'123', N'nguyen', N'mau', N'https://i.pinimg.com/564x/bd/1c/c7/bd1cc751865c67de695216da045579d5.jpg', N'mau123@gmail.com', N'Student', NULL)
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (12, N'Huong123', N'1234567890', N'Ph?m', N'Huong', N'https://i.pinimg.com/564x/bd/1c/c7/bd1cc751865c67de695216da045579d5.jpg', N'huong123@gmail.com', N'Student', NULL)
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (13, N'Jhon', N'123', N'Jhon', N'Eban', N'https://static.ybox.vn/2022/4/5/1649991145759-%E1%BB%A6Y%20BAN%20NH%C3%82N%20D%C3%82N%20T%E1%BB%88NH%20H%C3%80%20T%C4%A8NH.png', N'jhon123@gmail.com', N'Teacher', N'Nhà bè')
INSERT [dbo].[UserOu] ([idUser], [username], [password], [firstName], [lastName], [avatar], [email], [role], [address]) VALUES (14, N'hehe123', N'hehe', N'keke', N'haha', N'https://i.pinimg.com/564x/bd/1c/c7/bd1cc751865c67de695216da045579d5.jpg', N'sakdál@fmá.fak', N'Student', NULL)
SET IDENTITY_INSERT [dbo].[UserOu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserOu__F3DBC5723D8AF0CA]    Script Date: 5/17/2024 4:27:58 PM ******/
ALTER TABLE [dbo].[UserOu] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MonHoc] ADD  DEFAULT ((0)) FOR [soTinChi]
GO
ALTER TABLE [dbo].[BaiTap]  WITH CHECK ADD FOREIGN KEY([idKhoaHoc])
REFERENCES [dbo].[KhoaHoc] ([idKhoaHoc])
GO
ALTER TABLE [dbo].[BaiTap]  WITH CHECK ADD FOREIGN KEY([idLoaiBaiTap])
REFERENCES [dbo].[LoaiBaiTap] ([idLoaiBaiTap])
GO
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD FOREIGN KEY([idLoaiCauHoi])
REFERENCES [dbo].[LoaiCauHoi] ([idLoaiCauHoi])
GO
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD FOREIGN KEY([idMonHoc])
REFERENCES [dbo].[MonHoc] ([idMonHoc])
GO
ALTER TABLE [dbo].[DapAn]  WITH CHECK ADD FOREIGN KEY([idCauHoi])
REFERENCES [dbo].[CauHoi] ([idCauHoi])
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD FOREIGN KEY([idGiangVien])
REFERENCES [dbo].[UserOu] ([idUser])
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD FOREIGN KEY([idHocKy])
REFERENCES [dbo].[HocKy] ([idHocKy])
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD FOREIGN KEY([idMonHoc])
REFERENCES [dbo].[MonHoc] ([idMonHoc])
GO
ALTER TABLE [dbo].[ListTracNghiem]  WITH CHECK ADD FOREIGN KEY([idBaiTap])
REFERENCES [dbo].[BaiTap] ([idBaiTap])
GO
ALTER TABLE [dbo].[ListTracNghiem]  WITH CHECK ADD FOREIGN KEY([idCauHoi])
REFERENCES [dbo].[CauHoi] ([idCauHoi])
GO
ALTER TABLE [dbo].[SinhVienKhoaHoc]  WITH CHECK ADD FOREIGN KEY([idKhoaHoc])
REFERENCES [dbo].[KhoaHoc] ([idKhoaHoc])
GO
ALTER TABLE [dbo].[SinhVienKhoaHoc]  WITH CHECK ADD FOREIGN KEY([idSinhVien])
REFERENCES [dbo].[UserOu] ([idUser])
GO
ALTER TABLE [dbo].[SinhVienLamBai]  WITH CHECK ADD FOREIGN KEY([idBaiTap])
REFERENCES [dbo].[BaiTap] ([idBaiTap])
GO
ALTER TABLE [dbo].[SinhVienLamBai]  WITH CHECK ADD FOREIGN KEY([idCotDiem])
REFERENCES [dbo].[CotDiem] ([idCotDiem])
GO
ALTER TABLE [dbo].[SinhVienLamBai]  WITH CHECK ADD FOREIGN KEY([idSinhVien])
REFERENCES [dbo].[UserOu] ([idUser])
GO
ALTER TABLE [dbo].[SinhVienLamBai]  WITH CHECK ADD  CONSTRAINT [FK_SinhVienLamBai_idBaiTap] FOREIGN KEY([idBaiTap])
REFERENCES [dbo].[BaiTap] ([idBaiTap])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SinhVienLamBai] CHECK CONSTRAINT [FK_SinhVienLamBai_idBaiTap]
GO
USE [master]
GO
ALTER DATABASE [HeThongQuanLyHocTap] SET  READ_WRITE 
GO
