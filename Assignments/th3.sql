CREATE DATABASE QLTV
USE QLTV;

CREATE TABLE NhaXuatBan (
	MaNXB char(4) NOT NULL PRIMARY KEY,
	TenNXB nvarchar(30) NOT NULL,
);

CREATE TABLE BanDoc (
	MaThe char(6) NOT NULL PRIMARY KEY,
	TenBanDoc nvarchar(30) NOT NULL,
	DiaChi nvarchar(30),
	SoDT char(10)
);
CREATE TABLE TheLoai (
	MaTL char(2) NOT NULL PRIMARY KEY,
	TenTL nvarchar(20) NOT NULL,
);
CREATE TABLE Sach (
	MaSach char(6) NOT NULL PRIMARY KEY,
	TuaDe nvarchar(30) NOT NULL,
	MaNXB char(4) REFERENCES NhaXuatBan(MaNXB),
	TacGia	nvarchar(30),
	SoLuong int,
	NgayNhap Date,
	MaTL char(2) REFERENCES TheLoai(MaTL)
);

CREATE TABLE MuonSach (
	MaThe char(6) REFERENCES BanDoc(Mathe),
	MaSach char(6) REFERENCES Sach(MaSach),
	NgayMuon Date,
	NgayTra Date,
    PRIMARY KEY(MaThe,MaSach)
)

GO

INSERT INTO NhaXuatBan VALUES 
('N001', N'Giáo dục'),
('N002', N'Khoa học kỹ thuật'),
('N003', N'Thống kê'),
('N004', N'Thanh niên');
GO

INSERT INTO BanDoc VALUES 
('050001',N'Trần Thị Xuân',N'17 Pauster' , '0392736451'),
('050002',N'Lê Hoài Nam',N'145 Nguyễn Thị Minh Khai' , '0382767201'),
('060001',N'Trần Xuân Hùng',N'20 Trần Phú' , '0392560097'),
('060002',N'Nguyễn Minh Hưng',N'102 Nguyễn Trãi' , '0896885422');
GO

INSERT INTO TheLoai VALUES 
('TH', N'Tin học'),
('HH', N'Hóa học'),
('KT', N'Kinh tế'),
('TN', N'Toán học')
GO

SET DATEFORMAT dmy
INSERT INTO Sach VALUES 
('TH0001',N'Nhập môn cơ sở dữ liệu','N003',N'Đinh Bá Tiến',6,'08/09/2022','TH'),
('TH0002',N'Giáo trình SQL Server','N001',N'Lê Quang Minh',3,'22/11/2021','TH'),
('TH0003',N'Chuyên đề Oracle','N002',N'Phan Thanh Tâm',5,'14/03/2023','TH'),
('TH0004',N'Kỹ thuật lập trình C/C++','N001',N'Đặng Bình Phương',4,'11/06/2022','TH'),
('TH0005',N'Giáo trình Khai phá dữ liệu','N003',N'Trần Hoài Ân',2,'01/12/2021','TH'),
('TH0006',N'Nhập môn phân tích dữ liệu','N003',N'Bùi Thị Ngọc Ngân',4,'23/07/2022','TH'),
('TH0007',N'Lập trình Python và ứng dụng','N001',N'Lê Đại Minh',1,'12/11/2022','TH'),
('TH0008',N'Trực quan hóa dữ liệu','N003',N'Lê Quang Đại',4,'29/11/2022','TH'),
('TH0009',N'Giáo trình Access 2022','N004',N'Thiện Tâm',3,'11/01/2023','TH'),
('TH0010',N'Kỹ thuật thiết kế hệ thống','N002',N'Phạm Minh Chính',2,'16/02/2023','TH')
GO


INSERT INTO MuonSach VALUES 
('050001','TH0006','12/11/2022','01/02/2023'),
('050001','TH0007','12/11/2022',NULL),
('050002','TH0001','22/03/2023','10/05/2023'),
('050002','TH0004','22/03/2023',NULL),
('050002','TH0005','09/04/2023','15/06/2023'),
('050002','TH0008','19/01/2023',NULL),
('060002','TH0003','17/08/2022','01/04/2023'),
('060002','TH0009','22/09/2022',NULL),
('060002','TH0001','29/11/2022',NULL)
GO