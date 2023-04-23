USE [master]
GO
/****** Object:  Database [BikeStores]    Script Date: 4/17/2023 11:34:46 PM ******/
CREATE DATABASE [BikeStores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeStores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BikeStores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BikeStores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BikeStores.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BikeStores] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeStores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeStores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeStores] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeStores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeStores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeStores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeStores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeStores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeStores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeStores] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeStores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeStores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeStores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeStores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeStores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeStores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeStores] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BikeStores] SET  MULTI_USER 
GO
ALTER DATABASE [BikeStores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeStores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeStores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeStores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BikeStores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BikeStores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BikeStores] SET QUERY_STORE = OFF
GO
USE [BikeStores]
GO
/****** Object:  Table [dbo].[Cửa hàng]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cửa hàng](
	[Mã cửa hàng] [varchar](10) NOT NULL,
	[Tên cửa hàng] [nvarchar](20) NOT NULL,
	[Số điện thoại] [int] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Đường] [nvarchar](30) NOT NULL,
	[Thành phố] [nvarchar](30) NOT NULL,
	[Tình trạng] [nvarchar](15) NOT NULL,
	[Mã bưu điện] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã cửa hàng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hóa đơn]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hóa đơn](
	[Mã hóa đơn] [varchar](10) NOT NULL,
	[Ngày lập] [date] NULL,
	[Thời gian bảo hành] [nvarchar](30) NOT NULL,
	[Đơn giá] [int] NOT NULL,
	[Số lượng] [int] NOT NULL,
	[Mã Khách hàng] [varchar](10) NOT NULL,
	[Mã cửa hàng] [varchar](10) NOT NULL,
	[Mã nhân viên] [varchar](10) NOT NULL,
	[Mã xe] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã hóa đơn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHÁCH HÀNG]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHÁCH HÀNG](
	[Mã khách hàng] [varchar](10) NOT NULL,
	[Họ khách hàng] [nvarchar](30) NOT NULL,
	[Tên Khách hàng] [nvarchar](10) NOT NULL,
	[Địa chỉ] [nvarchar](50) NOT NULL,
	[Số điện thoại] [int] NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã khách hàng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhà Phân Phối]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhà Phân Phối](
	[Mã Nhà phân phối] [varchar](10) NOT NULL,
	[Tên Nhà Phân Phối] [nvarchar](30) NOT NULL,
	[Địa chỉ] [nvarchar](50) NOT NULL,
	[Số điện thoại] [int] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã Nhà phân phối] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhân Viên Hành Chánh]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhân Viên Hành Chánh](
	[Mã nhân viên] [varchar](10) NOT NULL,
	[Tên nhân viên] [nvarchar](30) NOT NULL,
	[Địa chỉ] [nvarchar](50) NOT NULL,
	[Số điện thoại] [int] NOT NULL,
	[Chức vụ] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[Số năm kinh nghiệm] [int] NOT NULL,
	[Mã cửa hàng] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã nhân viên] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhân Viên Kĩ Thuật]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhân Viên Kĩ Thuật](
	[Mã nhân viên] [varchar](10) NOT NULL,
	[Tên nhân viên] [nvarchar](30) NOT NULL,
	[Số điện thoại] [int] NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[Bậc thợ] [nvarchar](10) NOT NULL,
	[Chức vụ] [nvarchar](20) NOT NULL,
	[Số năm kinh nghiệm] [int] NOT NULL,
	[Địa chỉ] [nvarchar](50) NOT NULL,
	[Mã cửa hàng] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã nhân viên] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phiếu Nhận Xét]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phiếu Nhận Xét](
	[Mã phiếu] [varchar](10) NOT NULL,
	[Lí do bảo hành] [nvarchar](50) NOT NULL,
	[Lỗi thuộc về] [nvarchar](30) NOT NULL,
	[Giá tiền] [int] NOT NULL,
	[Linh kiện] [nvarchar](20) NOT NULL,
	[Mã khách hàng] [varchar](10) NOT NULL,
	[Mã nhân viên] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã phiếu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thông Tin Xe]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thông Tin Xe](
	[Mã loại xe] [varchar](10) NOT NULL,
	[Tên loại xe] [nvarchar](30) NOT NULL,
	[Giá niêm yết] [int] NOT NULL,
	[Giá giảm] [int] NOT NULL,
	[Mô tả xe] [nvarchar](150) NOT NULL,
	[Phiên bản] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã loại xe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XE]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[Mã xe] [varchar](10) NOT NULL,
	[Số máy] [varchar](20) NOT NULL,
	[Số khung] [varchar](20) NOT NULL,
	[Ngày nhập xe] [date] NULL,
	[Mã Nhà phân phối] [varchar](10) NOT NULL,
	[Mã loại xe] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã xe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe Trong Kho]    Script Date: 4/17/2023 11:34:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe Trong Kho](
	[Mã cửa hàng] [varchar](10) NOT NULL,
	[Mã xe] [varchar](10) NOT NULL,
	[Số lượng] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mã cửa hàng] ASC,
	[Mã xe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cửa hàng] ([Mã cửa hàng], [Tên cửa hàng], [Số điện thoại], [Email], [Đường], [Thành phố], [Tình trạng], [Mã bưu điện]) VALUES (N'CH123', N'Tân Hiệp Phát', 2234324, N'hieppha@gmail.com', N'Bùi quang là', N'Ho chi minh', N'mở cửa', 1234)
INSERT [dbo].[Cửa hàng] ([Mã cửa hàng], [Tên cửa hàng], [Số điện thoại], [Email], [Đường], [Thành phố], [Tình trạng], [Mã bưu điện]) VALUES (N'CH125', N'Tân Hiệp Thành', 123232, N'thanh@gmail.com', N'dà lạt', N'Ðà lạt', N'mở cửa', 2234)
INSERT [dbo].[Cửa hàng] ([Mã cửa hàng], [Tên cửa hàng], [Số điện thoại], [Email], [Đường], [Thành phố], [Tình trạng], [Mã bưu điện]) VALUES (N'CH127', N'Tân Hiệp Chánh', 9283442, N'chanh@gmail.com', N'vung tàu', N'Bà rịa', N'nâng cấp', 1222)
GO
INSERT [dbo].[Hóa đơn] ([Mã hóa đơn], [Ngày lập], [Thời gian bảo hành], [Đơn giá], [Số lượng], [Mã Khách hàng], [Mã cửa hàng], [Mã nhân viên], [Mã xe]) VALUES (N'KYM121', NULL, N'3 tháng', 80000, 2, N'N123', N'CH123', N'NV723', N'YMHCM12')
INSERT [dbo].[Hóa đơn] ([Mã hóa đơn], [Ngày lập], [Thời gian bảo hành], [Đơn giá], [Số lượng], [Mã Khách hàng], [Mã cửa hàng], [Mã nhân viên], [Mã xe]) VALUES (N'THD11', NULL, N'12 tháng', 230000, 1, N'N345', N'CH125', N'NV222', N'HD342')
GO
INSERT [dbo].[KHÁCH HÀNG] ([Mã khách hàng], [Họ khách hàng], [Tên Khách hàng], [Địa chỉ], [Số điện thoại], [Email]) VALUES (N'N123', N'Trịnh', N'Minh Kha', N'269/67 Phan Huy Ích', 921599432, N'minhkha20031996@gmail.com')
INSERT [dbo].[KHÁCH HÀNG] ([Mã khách hàng], [Họ khách hàng], [Tên Khách hàng], [Địa chỉ], [Số điện thoại], [Email]) VALUES (N'N234', N'Phạm ', N'Van Thành', N'Ðại Học công nghiệp', 9234134, N'thanh123@gmail.com')
INSERT [dbo].[KHÁCH HÀNG] ([Mã khách hàng], [Họ khách hàng], [Tên Khách hàng], [Địa chỉ], [Số điện thoại], [Email]) VALUES (N'N345', N'Trần ', N'Van Tèo', N'Thành phố Hồ Chí Minh', 92344421, N'teocuto@gmail.com')
GO
INSERT [dbo].[Nhà Phân Phối] ([Mã Nhà phân phối], [Tên Nhà Phân Phối], [Địa chỉ], [Số điện thoại], [Email]) VALUES (N'111', N'Yamaha', N'Hồ chí minh', 99999, N'mahaahaa@gmail.com')
INSERT [dbo].[Nhà Phân Phối] ([Mã Nhà phân phối], [Tên Nhà Phân Phối], [Địa chỉ], [Số điện thoại], [Email]) VALUES (N'222', N'Honda', N'Hồ chí minh', 88888, N'hoooda@gmail.com')
GO
INSERT [dbo].[Nhân Viên Hành Chánh] ([Mã nhân viên], [Tên nhân viên], [Địa chỉ], [Số điện thoại], [Chức vụ], [Email], [Số năm kinh nghiệm], [Mã cửa hàng]) VALUES (N'NV222', N'Trần Van C', N'Hồ Chí Minh', 45554, N'Bán hàng', N'cc@gmail.com', 4, N'CH125')
INSERT [dbo].[Nhân Viên Hành Chánh] ([Mã nhân viên], [Tên nhân viên], [Địa chỉ], [Số điện thoại], [Chức vụ], [Email], [Số năm kinh nghiệm], [Mã cửa hàng]) VALUES (N'NV723', N'Trần Van B', N'Vung tàu', 1122456, N'Bán hàng', N'Bb@gmail.com', 2, N'CH125')
INSERT [dbo].[Nhân Viên Hành Chánh] ([Mã nhân viên], [Tên nhân viên], [Địa chỉ], [Số điện thoại], [Chức vụ], [Email], [Số năm kinh nghiệm], [Mã cửa hàng]) VALUES (N'NV789', N'Trần Van A', N'Hồ chí minh', 221133, N'Kế toán', N'aa@gmail.com', 3, N'CH123')
GO
INSERT [dbo].[Nhân Viên Kĩ Thuật] ([Mã nhân viên], [Tên nhân viên], [Số điện thoại], [Email], [Bậc thợ], [Chức vụ], [Số năm kinh nghiệm], [Địa chỉ], [Mã cửa hàng]) VALUES (N'NV11', N'Lê Quang Vinh', 123111, N'vinhcuto@gmail.com', N'th? ph?', N'nhân viên kiểm xe', 4, N'cầu thị nghè', N'CH123')
INSERT [dbo].[Nhân Viên Kĩ Thuật] ([Mã nhân viên], [Tên nhân viên], [Số điện thoại], [Email], [Bậc thợ], [Chức vụ], [Số năm kinh nghiệm], [Địa chỉ], [Mã cửa hàng]) VALUES (N'NV14', N'Trần Ðức Ðộ', 912344, N'docunho@gmail.com', N'th? chính', N'nhân viên sửa xe', 6, N'chợ bà chiểu', N'CH125')
INSERT [dbo].[Nhân Viên Kĩ Thuật] ([Mã nhân viên], [Tên nhân viên], [Số điện thoại], [Email], [Bậc thợ], [Chức vụ], [Số năm kinh nghiệm], [Địa chỉ], [Mã cửa hàng]) VALUES (N'NV15', N'Lê Tông', 123455, N'tong@gmail.com', N'th? chính', N'nhân viên sửa xe', 3, N'gầm cầu', N'CH123')
GO
INSERT [dbo].[Phiếu Nhận Xét] ([Mã phiếu], [Lí do bảo hành], [Lỗi thuộc về], [Giá tiền], [Linh kiện], [Mã khách hàng], [Mã nhân viên]) VALUES (N'123', N'Hu chân chóng', N'khách hàng', 123000, N'Chân chóng', N'N123', N'NV11')
INSERT [dbo].[Phiếu Nhận Xét] ([Mã phiếu], [Lí do bảo hành], [Lỗi thuộc về], [Giá tiền], [Linh kiện], [Mã khách hàng], [Mã nhân viên]) VALUES (N'129', N'Hu yên xe', N'Xe', 222000, N'yên xe', N'N234', N'NV14')
GO
INSERT [dbo].[Thông Tin Xe] ([Mã loại xe], [Tên loại xe], [Giá niêm yết], [Giá giảm], [Mô tả xe], [Phiên bản]) VALUES (N'HD111', N'Win150', 230000, 20000, N'Xe bô ngon', N'2022')
INSERT [dbo].[Thông Tin Xe] ([Mã loại xe], [Tên loại xe], [Giá niêm yết], [Giá giảm], [Mô tả xe], [Phiên bản]) VALUES (N'YN12', N'Ex150', 400000, 0, N'Xe ngon', N'2023')
GO
INSERT [dbo].[XE] ([Mã xe], [Số máy], [Số khung], [Ngày nhập xe], [Mã Nhà phân phối], [Mã loại xe]) VALUES (N'HD342', N'F12', N'1HD344', NULL, N'222', N'HD111')
INSERT [dbo].[XE] ([Mã xe], [Số máy], [Số khung], [Ngày nhập xe], [Mã Nhà phân phối], [Mã loại xe]) VALUES (N'YMHCM12', N'G123', N'1YM123', NULL, N'111', N'YN12')
GO
INSERT [dbo].[Xe Trong Kho] ([Mã cửa hàng], [Mã xe], [Số lượng]) VALUES (N'CH123', N'YMHCM12', 21)
INSERT [dbo].[Xe Trong Kho] ([Mã cửa hàng], [Mã xe], [Số lượng]) VALUES (N'CH125', N'HD342', 55)
GO
ALTER TABLE [dbo].[Hóa đơn]  WITH CHECK ADD  CONSTRAINT [Có] FOREIGN KEY([Mã xe])
REFERENCES [dbo].[XE] ([Mã xe])
GO
ALTER TABLE [dbo].[Hóa đơn] CHECK CONSTRAINT [Có]
GO
ALTER TABLE [dbo].[Hóa đơn]  WITH CHECK ADD  CONSTRAINT [FKHóa đơn431152] FOREIGN KEY([Mã Khách hàng])
REFERENCES [dbo].[KHÁCH HÀNG] ([Mã khách hàng])
GO
ALTER TABLE [dbo].[Hóa đơn] CHECK CONSTRAINT [FKHóa đơn431152]
GO
ALTER TABLE [dbo].[Hóa đơn]  WITH CHECK ADD  CONSTRAINT [FKHóa đơn440981] FOREIGN KEY([Mã cửa hàng])
REFERENCES [dbo].[Cửa hàng] ([Mã cửa hàng])
GO
ALTER TABLE [dbo].[Hóa đơn] CHECK CONSTRAINT [FKHóa đơn440981]
GO
ALTER TABLE [dbo].[Hóa đơn]  WITH CHECK ADD  CONSTRAINT [FKHóa đơn706841] FOREIGN KEY([Mã nhân viên])
REFERENCES [dbo].[Nhân Viên Hành Chánh] ([Mã nhân viên])
GO
ALTER TABLE [dbo].[Hóa đơn] CHECK CONSTRAINT [FKHóa đơn706841]
GO
ALTER TABLE [dbo].[Nhân Viên Hành Chánh]  WITH CHECK ADD  CONSTRAINT [FKNhân Viên 619153] FOREIGN KEY([Mã cửa hàng])
REFERENCES [dbo].[Cửa hàng] ([Mã cửa hàng])
GO
ALTER TABLE [dbo].[Nhân Viên Hành Chánh] CHECK CONSTRAINT [FKNhân Viên 619153]
GO
ALTER TABLE [dbo].[Nhân Viên Kĩ Thuật]  WITH CHECK ADD  CONSTRAINT [FKNhân Viên 510861] FOREIGN KEY([Mã cửa hàng])
REFERENCES [dbo].[Cửa hàng] ([Mã cửa hàng])
GO
ALTER TABLE [dbo].[Nhân Viên Kĩ Thuật] CHECK CONSTRAINT [FKNhân Viên 510861]
GO
ALTER TABLE [dbo].[Phiếu Nhận Xét]  WITH CHECK ADD  CONSTRAINT [FKPhiếu Nhận15466] FOREIGN KEY([Mã nhân viên])
REFERENCES [dbo].[Nhân Viên Kĩ Thuật] ([Mã nhân viên])
GO
ALTER TABLE [dbo].[Phiếu Nhận Xét] CHECK CONSTRAINT [FKPhiếu Nhận15466]
GO
ALTER TABLE [dbo].[Phiếu Nhận Xét]  WITH CHECK ADD  CONSTRAINT [FKPhiếu Nhận540629] FOREIGN KEY([Mã khách hàng])
REFERENCES [dbo].[KHÁCH HÀNG] ([Mã khách hàng])
GO
ALTER TABLE [dbo].[Phiếu Nhận Xét] CHECK CONSTRAINT [FKPhiếu Nhận540629]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [Phân phối] FOREIGN KEY([Mã Nhà phân phối])
REFERENCES [dbo].[Nhà Phân Phối] ([Mã Nhà phân phối])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [Phân phối]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [Thuộc] FOREIGN KEY([Mã loại xe])
REFERENCES [dbo].[Thông Tin Xe] ([Mã loại xe])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [Thuộc]
GO
ALTER TABLE [dbo].[Xe Trong Kho]  WITH CHECK ADD  CONSTRAINT [FKXe Trong K65137] FOREIGN KEY([Mã xe])
REFERENCES [dbo].[XE] ([Mã xe])
GO
ALTER TABLE [dbo].[Xe Trong Kho] CHECK CONSTRAINT [FKXe Trong K65137]
GO
ALTER TABLE [dbo].[Xe Trong Kho]  WITH CHECK ADD  CONSTRAINT [FKXe Trong K922372] FOREIGN KEY([Mã cửa hàng])
REFERENCES [dbo].[Cửa hàng] ([Mã cửa hàng])
GO
ALTER TABLE [dbo].[Xe Trong Kho] CHECK CONSTRAINT [FKXe Trong K922372]
GO
USE [master]
GO
ALTER DATABASE [BikeStores] SET  READ_WRITE 
GO
