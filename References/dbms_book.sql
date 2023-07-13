USE master
GO

DROP DATABASE DBMS_BOOK
GO

CREATE DATABASE DBMS_BOOK
GO

USE DBMS_BOOK
GO

CREATE TABLE khoa (
    makhoa	    NVARCHAR(5)	NOT NULL CONSTRAINT pk_khoa PRIMARY KEY,
    tenkhoa	    NVARCHAR(50)	NOT NULL ,
    dienthoai	NVARCHAR(15)	NULL
)


CREATE TABLE lop (
    malop	    NVARCHAR(10)	NOT NULL CONSTRAINT pk_lop	PRIMARY KEY,
    tenlop	    NVARCHAR(30)	NULL ,
    khoa	    SMALLINT	    NULL ,
    hedaotao	NVARCHAR(25)	NULL , 
    namnhaphoc	INT	NULL ,
    siso	    SMALLINT    	NULL ,
    makhoa  	NVARCHAR(5)	NULL
)


CREATE TABLE sinhvien (
    masv	  NVARCHAR(10)	NOT NULL CONSTRAINT pk_sinhvien PRIMARY KEY,
    hodem     NVARCHAR(25),
    ten       NVARCHAR(10)	NOT NULL,
    ngaysinh  DATE	NOT NULL,
    gioitinh  BIT	NULL,
    noisinh	  NVARCHAR(100)	NULL,
    malop     NVARCHAR(10)  NULL
)   


CREATE TABLE monhoc(
    mamonhoc    NVARCHAR(10) NOT NULL CONSTRAINT pk_monhoc PRIMARY KEY, 
    tenmonhoc	NVARCHAR(50) NOT NULL,
    sodvht	    SMALLINT	 NOT NULL
)

CREATE TABLE diemthi (
    mamonhoc	NVARCHAR(10)	NOT NULL , 
    masv	    NVARCHAR(10)	NOT NULL , 
    diemlan1	NUMERIC(5, 2)	NULL , 
    diemlan2	NUMERIC(5, 2)	NULL,
    CONSTRAINT pk_diemthi PRIMARY KEY(mamonhoc,masv)
)
GO


ALTER TABLE	lop 
ADD
    CONSTRAINT fk_lop_khoa FOREIGN KEY(makhoa) REFERENCES khoa(makhoa) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE sinhvien 
ADD
    CONSTRAINT fk_sinhvien_lop FOREIGN KEY (malop)
    REFERENCES lop(malop) 
    ON DELETE CASCADE
    ON UPDATE CASCADE


ALTER TABLE diemthi 
ADD
    CONSTRAINT fk_diemthi_monhoc FOREIGN KEY (mamonhoc) REFERENCES monhoc(mamonhoc) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT fk_diemthi_sinhvien FOREIGN KEY (masv) REFERENCES sinhvien(masv) 
    ON DELETE CASCADE
    ON UPDATE CASCADE


ALTER TABLE monhoc 
ADD
    CONSTRAINT chk_monhoc_sodht CHECK(sodvht>0 and sodvht<=5)

ALTER TABLE diemthi 
ADD
    CONSTRAINT chk_diemthi_diemlan1 CHECK (diemlan1>=0 and diemlan1<=10), 
    CONSTRAINT chk_diemthi_diemlan2 CHECK (diemlan2>=0 and diemlan2<=10)

GO


INSERT INTO khoa 
VALUES
('DHT01',N'Khoa Toán cơ - Tin học','0961762912'),
('DHT02',N'Khoa Công nghệ thông tin','0961764551'),
('DHT03',N'Khoa Vật lý','0961760989'),
('DHT04',N'Khoa Hóa học','0961766650'),
('DHT05',N'Khoa Ngoại ngữ','0961715627'),
('DHT06',N'Khoa Sinh học','0961719905'),
('DHT07',N'Khoa Kinh tế','0961754399'),
('DHT08',N'Khoa Luật','0961711554')



INSERT INTO lop
VALUES
('TC1501',N'Toán cơ K15',15,N'Chính quy',2021,6,'DHT01'),
('VL1501',N'Vật lý K15',15,N'Chính quy',2021,5,'DHT03'),
('HH1501',N'Hóa học K15',15,N'Chính quy',2021,5,'DHT04'),
('HTTT1601',N'Hệ thống thông tin K16',16,N'Chính quy',2022,6,'DHT02'),
('KTPM1601',N'Kỹ thuật phần mềm K16',16,N'Chính quy',2022,8,'DHT02'),
('TC1601',N'Toán cơ K16',16,N'Chính quy',2022,6,'DHT01'),
('NN1601',N'Nhật bản học K16',16,N'Chính quy',2022,6,'DHT05'),
('NN1702',N'Hàn Quốc học K17',17,N'Chính quy',2023,8,'DHT05')



SET DATEFORMAT dmy
INSERT INTO sinhvien
VALUES
('22150001',N'Nguyễn Tự',N'Ánh','29/12/2002',0,N'HCM','TC1501'),
('22150002',N'Lưu Quang',N'Bảo','15/08/2002',1,N'Đồng Tháp','TC1501'),
('22150003',N'Lê Văn',N'Quyền','18/10/2001',1,N'Vĩnh Long','TC1501'),
('22150004',N'Vương Trung',N'Quân','12/11/2002',1,N'HCM','TC1501'),
('22150005',N'Lê Thị Ngọc',N'Trinh','18/10/2002',0,N'Long An','TC1501'),
('22150006',N'Nguyễn Thị Thúy',N'Kiều','29/06/2002',0,N'Nam Định','TC1501'),
('22151001',N'Nguyễn Nhật',N'An','19/07/2002',0,N'Tây Ninh','VL1501'),
('22151002',N'Phạm Thế',N'Bảo','09/12/2002',1,N'HCM','VL1501'),
('22151003',N'Trương Ngọc',N'Hào','11/12/2001',1,N'Tiền Gianh','VL1501'),
('22151004',N'Phạm Nhật',N'Quang','18/09/2002',1,N'HCM','VL1501'),
('22151005',N'Nguyễn Văn',N'Sang','22/06/2002',1,N'Vĩnh Long','VL1501'),
('22152001',N'Trần Văn',N'Bình','29/12/2002',1,N'HCM','HH1501'),
('22152002',N'Lưu Quang',N'Huy','12/11/2002',1,N'Đồng Tháp','HH1501'),
('22152003',N'Trịnh Văn',N'Minh','16/12/2002',1,N'Nam Định','HH1501'),
('22152004',N'Lê Văn',N'Quyến','29/09/2002',1,N'HCM','HH1501'),
('22152005',N'Nguyễn Văn',N'Tân','08/06/2002',0,N'Long An','HH1501'),
('22160001',N'Ngô Thị Nhật',N'Anh','27/11/2002',0,N'HCM','HTTT1601'),
('22160002',N'Nguyễn Thị Ngọc',N'Anh','18/03/2001',0,N'Long An','HTTT1601'),
('22160003',N'Nguyễn Tuấn',N'Anh','20/10/2002',1,N'HCM','HTTT1601'),
('22160004',N'Bùi Thị Ngọc',N'Hân','02/06/2002',0,N'Đồng Tháp','HTTT1601'),
('22160005',N'Trần Minh',N'Quân','16/07/2002',1,N'Tiền Giang','HTTT1601'),
('22160006',N'Hứa Hữu',N'Cường','14/01/2002',1,N'HCM','HTTT1601'),
('22161001',N'Nguyễn Thanh',N'Bình','11/10/2002',1,N'HCM','KTPM1601'),
('22161002',N'Lê Chí',N'Cường','06/05/2002',1,N'HCM','KTPM1601'),
('22161003',N'Ngô Minh',N'Đạt','18/09/2002',1,N'Long An','KTPM1601'),
('22161004',N'Bùi Quang',N'Minh','02/12/2001',1,N'HCM','KTPM1601'),
('22161005',N'Nguyễn Văn',N'Ninh','21/02/2002',1,N'Cần Thơ','KTPM1601'),
('22161006',N'Trịnh Ngọc',N'Trâm','07/04/2002',0,N'Long An','KTPM1601'),
('22161007',N'Nguyễn Thị Ngọc',N'Trinh','16/09/2002',0,N'Tiền Giang','KTPM1601'),
('22161008',N'Nguyễn Thị Ái',N'Vy','10/06/2001',0,N'Tây Ninh','KTPM1601'),
('22162001',N'Lê Thành',N'Đạt','11/02/2002',1,N'Long An','TC1601'),
('22162002',N'Nguyễn Minh',N'Hoàng','05/12/2002',1,N'An Giang','TC1601'),
('22162003',N'Đỗ Thị',N'Hậu','11/02/2002',0,N'Kiên Giang','TC1601'),
('22162004',N'Vương Minh',N'Hiếu','16/08/2002',1,N'HCM','TC1601'),
('22162005',N'Nguyễn Thị Kiều',N'My','15/09/2002',0,N'Tây Ninh','TC1601'),
('22162006',N'Đoàn Văn',N'Hải','21/03/2002',1,N'HCM','TC1601'),

('22163001',N'Võ Thị',N'Tuyết','02/08/2002',0,N'HCM','NN1601'),
('22163002',N'Nguyễn Đức',N'Huy','15/02/2002',1,N'Long An','NN1601'),
('22163003',N'Đỗ Văn',N'Khánh','19/11/2001',1,N'Kiên Giang','NN1601'),
('22163004',N'Lê Phương',N'Thảo','11/12/2001',0,N'Đồng Tháp','NN1601'),
('22163005',N'Đoàn Thị Kiều',N'Ngân','21/03/2002',0,N'HCM','NN1601'),
('22163006',N'Bùi Thị Ái',N'Liên','29/12/2002',0,N'Tây Ninh','NN1601'),
('22170001',N'Võ Thị',N'Ánh','11/10/2002',0,N'Cần Thơ','NN1702'),
('22170002',N'Nguyễn Thiên',N'Kim','06/12/2002',0,N'Long An','NN1702'),
('22170003',N'Phan Thị Mỹ',N'Linh','09/06/2002',0,N'Long An','NN1702'),
('22170004',N'Nguyễn Thị Ánh',N'Tuyết','28/12/2001',0,N'Đồng Tháp','NN1702'),
('22170005',N'Đoàn Thị Diễm',N'My','16/10/2002',0,N'HCM','NN1702'),
('22170006',N'Phạm Thị Mai',N'Thanh','12/09/2002',0,N'Nam Định','NN1702'),
('22170007',N'Trần Ngọc',N'Hoàng','28/09/2001',1,N'HCM','NN1702'),
('22170008',N'Lê Thanh',N'Phong','19/12/2002',1,N'Tây Ninh','NN1702')


INSERT INTO Monhoc
VALUES
('HO001',N'Hóa đại cương',3),
('VL001',N'Vật lý đại cương',3),
('TI001',N'Tin học đại cương',3),
('TI002',N'Ngôn ngữ C',5),
('TI003',N'Lý thuyết hệ điều hành',5),
('TI004',N'Cấu trúc dữ liệu và giải thuật',5),
('TI005',N'Cơ sở dữ liệu',5),
('TO001',N'Toán cao cấp',2),
('TO002',N'Giải tích 1',2),
('TA001',N'Tiếng Anh 1',4),
('TA002',N'Tiếng Anh 2',4),
('TA003',N'Tiếng Anh 3',4)
GO

SELECT * FROM lop
SELECT * FROM sinhvien

SELECT hodem,ten
FROM sinhvien JOIN lop on sinhvien.malop=lop.malop WHERE tenlop=N'Toán cơ K15' AND
year(ngaysinh)= ANY(SELECT year(ngaysinh)
FROM sinhvien JOIN lop ON sinhvien.malop=lop.malop 
WHERE lop.tenlop= N'Hóa học K15')


