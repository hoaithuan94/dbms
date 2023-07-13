CREATE DATABASE QLSV
GO

USE QLSV;
GO

CREATE TABLE Khoa (
	MaKhoa char(4) NOT NULL PRIMARY KEY,
	TenKhoa nvarchar(30) NOT NULL,
	DiaChi nvarchar(50) NULL,
	DienThoai varchar(10)
)

CREATE TABLE SinhVien (
	MaSV char(8) NOT NULL PRIMARY KEY,
	HoTen nvarchar(30) NOT NULL,
	NgaySinh Date,
	MaKhoa char(4) REFERENCES Khoa (MaKhoa)
)

CREATE TABLE MonHoc (
	MaMon varchar(5) NOT NULL PRIMARY KEY,
	TenMon nvarchar(30) NOT NULL,
	SoTinChi SmallInt,
	TenGV nvarchar(30)
)

CREATE TABLE DangKyHoc (
	MaSV char (8),
	MaMon varchar(5),
	HocKy smallInt
)
GO


INSERT INTO Khoa VALUES 
('TOAN', N'Toán - Tin', N'Nhà C','0375473250'),
('CNTT', N'Công nghệ thông tin', N'Nhà C','0375471002'),
('DIAL',N'Địa lý',N'Nhà A1',NULL),
('HOAH', N'Hóa học',N'Nhà A2',NULL)

INSERT INTO SinhVien VALUES 
('K6100001',N'Phạm Văn Bình', '2003-2-24','TOAN'),
('K6100002',N'Nguyễn Thị Hoài','2002-4-12','CNTT'),
('K6100003',N'Trần Ngọc','2003-4-15','DIAL'),
('K6100004',N'Nguyễn Tấn Dũng','2002-12-23','CNTT'),
('K6100005',N'Trương Tấn Sang','2002-12-4','DIAL'),
('K6100006',N'Nguyễn Sinh Hùng','2002-3-13','HOAH')

INSERT INTO MonHoc VALUES
('GT1',N'Giải tích 1',2,N'Đỗ Đức Thái'),
('DSTT',N'Đại số tuyến tính',3,N'Nguyễn Văn Trào'),
('HH',N'Hình học Afin',2,N'Nguyễn Doãn Tuấn'),
('XSTK',N'Xác suất thống kê',2,N'Đỗ Đức Thái')

INSERT INTO DangKyHoc VALUES
('K6100001','GT1',1),
('K6100001','DSTT',2),
('K6100001','HH',1),
('K6100002','DSTT',1),
('K6100002','XSTK',2),
('K6100002','GT1',1),
('K6100003','HH',1),
('K6100003','GT1',1),
('K6100003','XSTK',2),
('K6100004','XSTK',3),
('K6100004','DSTT',3),
('K6100004','DSTT',1)
GO


