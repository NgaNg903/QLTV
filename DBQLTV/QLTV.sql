--1/Tạo Database quản lý thư viện
create database QLTV
go
use QLTV
go
--2/Tạo các bảng và khoá chính
--Tạo bảng người dùng 
create table NguoiDung 
(
	MaND nchar(10) primary key,
	HoTenND nvarchar(50),
	NgaySinh date,
	GioiTinh nvarchar(3),
	DiaChi nvarchar(100),
	SDT char(10)
)

--Tạo bảng đơn mượn
create table DonMuon
(
	MaDon nchar(10) primary key,
	MaND nchar(10) not null,
	MaSach nchar(10) not null,
	NgayMuon date,
	NgayTra date
)

--Tạo bảng tác giả
create table TacGia
(
	MaTG nchar(10) primary key,
	TenTG nvarchar(50)
)

--Tạo bảng nhà xuất bản 
create table NhaXuatBan
(
	MaNXB nchar(10) primary key,
	TenNXB nvarchar(50),
	DiaChi nvarchar(100),
	SDT char(10)
)

--Tạo bảng thể loại 
create table TheLoai
(
	MaTL nchar(10) primary key,
	TenTL nvarchar(50)
)

--Tạo bảng ngôn ngữ 
create table NgonNgu
(
	MaNN nchar(10) primary key,
	NgonNgu nvarchar(50)
)

--Tạo bảng sách
create table Sach
(
	MaSach nchar(10) primary key,
	MaTG nchar(10),
	MaNN nchar(10),
	MaTL nchar(10),
	MaNXB nchar(10),
	TenSach nvarchar(100),
	SoTrang int,
	NgayXuatBan date,
	NgayNhap date,
	SoLuong int,
	TrangThai nvarchar(15)
)

--3/Tạo khoá ngoại 
--Tạo khoá ngoại ở bảng Đơn mượn
alter table [dbo].[DonMuon] add foreign key (MaSach) references Sach(MaSach)
alter table [dbo].[DonMuon] add foreign key (MaND) references NguoiDung(MaND)
--Tạo khoá ngoại ở bảng sách 
alter table [dbo].[Sach] add foreign key (MaTG) references TacGia(MaTG)
alter table [dbo].[Sach] add foreign key (MaTL) references TheLoai(MaTL)
alter table [dbo].[Sach] add foreign key (MaNN) references NgonNgu(MaNN)
alter table [dbo].[Sach] add foreign key (MaNXB) references NhaXuatBan(MaNXB)

--4/Nhập dữ liệu
--Nhập data cho bảng thể loại 
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL01',N'Sách thiếu nhi')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL02',N'Sách tâm lý tình cảm')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL03',N'Sách tôn giáo')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL04',N'Sấch văn hoá xã hội')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL05',N'Sách lịch sử')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL06',N'Sách văn học viễn tưởng')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL07',N'Sách tiểu sử, tự truyện')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL08',N'Sách kinh dị')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL09',N'Sách dạy nấu ăn')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL10',N'Sách khoa học viễn tuỏng')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL11',N'Sách truyền cảm hứng')
insert into [dbo].[TheLoai] (MaTL,TenTL) values ('TL12',N'Sách giáo dục')
--Nhập data bảng nhà xuất bản
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB01',N'Nhà xuất bản Kim Đồng',N'Hai Bà Trưng, Hà Nội','039434781')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB02',N'Nhà xuất bản Trẻ',N'Hồ Chí Minh','')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB03',N'Nhà xuất bản Phụ nữ Việt Nam',N'Hai Bà Trưng, Hà Nội','032151586')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB04',N'Nhà xuất bản Nhã Nam',N'Cầu Giấy, Hà Nội','0903244248')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB05',N'Nhà xuất bản Lao Động',N'Hoàn Kiếm, Hà Nội','')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB06',N'Nhà xuất bản Dân Trí',N'Đống Đa,Hà Nội','066810754')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB07',N'Nhà xuất bản Dân Trí',N'Đống Đa, Hà Nội','066810754')
insert into [dbo].[NhaXuatBan] (MaNXB,TenNXB,DiaChi,SDT) 
values ('NXB08',N'Nhà xuất bản Giáo Dục',N'Hoàn Kiếm, Hà Nội','038220801')

--Nhập data bảng ngôn ngữ 
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN01', N'Tiếng Việt')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN02', N'Tiếng Anh')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN03', N'Tiếng Trung Quốc')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN04', N'Tiếng Hàn Quốc')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN05', N'Tiếng Nhật Bản')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN06', N'Tiếng Pháp')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN07', N'Tiếng Ý')
insert into [dbo].[NgonNgu] (MaNN,NgonNgu) values ('NN08', N'Tiếng Đức')

--Nhập data bảng tác giả 
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG01',N'Burnett')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG02',N'Stephen Hawking')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG03',N'Hiltrud Baier')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG04',N'Paulo Coelho')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG05',N'Oyoto Yomogi')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG06',N'Trương Du Ca')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG07',N'Higashino Keiko')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG08',N'Nghiêm Đình Vỹ')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG09',N'Nguyễn Nhật Ánh')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG10',N'Lili holland')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG11',N'Laura Wall')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG12',N'Tiên Vũ')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG13',N'Trần Bạch Đằng')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG14',N'Triệu Quốc Mạnh')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG15',N'Toan Ánh')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG16',N'Nguyễn Duy Cần')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG17',N'Lê Đỗ Quỳnh Hương')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG18',N'Lê Thị Thuý Sen')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG19',N'Tô Hoài')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG20',N'Nguyễn Túc')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG21',N'Trân Huyền Trần')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG22',N'John Balchin')
insert into [dbo].[TacGia] (MaTG,TenTG) values ('TG23',N'Nguyễn Như Quỳnh')

--Nhập data bảng sách
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS01','TG01','NN01','TL02','NXB04',N'Công chúa nhỏ',272,'2023-05-27',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS02','TG02','NN01','TL10','NXB04',N'Mở khoá vũ trụ',444,'2023-02-11',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS03','TG02','NN01','TL10','NXB04',N'George và vụ nổ BigBang',312,'2018-03-12',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS04','TG03','NN01','TL01','NXB04',N'Wombi thăm xứ tuyết',104,'2023-02-10',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS05','TG04','NN01','TL06','NXB04',N'Nhà giả kim',228,'2020-08-15',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS06','TG04','NN01','TL06','NXB04',N'Điệp viên',178,'2018-09-02',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS07','TG04','NN01','TL06','NXB04',N'Ngoại tình',331,'2020-07-09',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS08','TG05','NN01','TL02','NXB04',N'Bởi vì tôi sẽ gọi tên em',235,'2024',0,N'Sắp nhập')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS09','TG05','NN01','TL02','NXB04',N'Nhắn gửi tất cả các em , những người tôi đã yêu',236,'2020-10-21',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS10','TG06','NN01','TL08','NXB04',N'Ảo thanh chết chóc',392,'2021-01-02',2,N'Hết hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS11','TG07','NN01','TL08','NXB04',N'Cánh cổng sát nhân',526,'2022-03-10',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS12','TG07','NN01','TL06','NXB04',N'Phía sau nghi can X',396,'2024',0,N'Sắp nhập')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS13','TG07','NN01','TL06','NXB04',N'Sự cứu rỗi của thánh nữ',381,'2019-08-19',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS14','TG08','NN01','TL05','NXB08',N'Lịch sử thế giới cổ đại',346,'2020-06-22',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS15','TG09','NN01','TL06','NXB02',N'Mùa hè không tên',292,'2023-07-25',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS16','TG09','NN01','TL06','NXB02',N'Crying in trees',352,'2023-05-20',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS17','TG09','NN01','TL06','NXB02',N'Tôi thấy hoa vàng trên cỏ xanh',378,'2023-02-10',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS18','TG09','NN01','TL06','NXB02',N'Cho tôi một vé đi tuổi thơ',208,'2023-05-01',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS19','TG09','NN02','TL06','NXB02',N'Tôi thấy hoa vàng trên cỏ xanh',292,'2023-07-25',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS20','TG09','NN01','TL06','NXB02',N'Có hai con mèo ngồi bên cửa sổ',218,'2022-02-10',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS21','TG09','NN01','TL06','NXB02',N'Sương khói quê nhà',214,'2023-04-30',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS22','TG10','NN01','TL01','NXB02',N'50 từ về động vật',32,'2024',0,N'Sắp nhập')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS23','TG11','NN01','TL01','NXB02',N'Tình cờ gặp ngỗng',48,'2023-03-22',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS24','TG11','NN01','TL01','NXB02',N'Ngỗng và kế hoạch nhỏ',48,'2023-04-22',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS25','TG12','NN01','TL01','NXB02',N'Chiếc răng mất tích',32,'2023-03-21',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS26','TG13','NN01','TL05','NXB02',N'Nước Âu Lạc',100,'2023-01-12',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS27','TG14','NN01','TL05','NXB02',N'Hồi ức Sài Gòn thời chiến tranh',200,'2023-01-17',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS28','TG15','NN01','TL04','NXB02',N'Nếp cũ -Cầm-Kỳ-Thi-Hoạ',446,'2023-05-19',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS29','TG16','NN01','TL04','NXB02',N'Chu dịch huyền giải',244,'2021-04-18',2,N'Hết hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS30','TG16','NN01','TL03','NXB02',N'Phật học tinh hoa',252,'2022-12-18',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS31','TG17','NN01','TL11','NXB02',N'Thay lời muốn nói-Thanh xuân tôi',338,'2019-04-28',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS32','TG18','NN01','TL11','NXB01',N'Khéo khôn với tiền-tránh những ưu phiền',284,'2023-04-10',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS33','TG19','NN01','TL01','NXB01',N'Dế mèn phiêu lưu ký',192,'2022-11-28',6,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS34','TG19','NN01','TL07','NXB01',N'Chuyện cũ Hà Nội',302,'2021-10-15',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS35','TG19','NN01','TL07','NXB01',N'Tô Hoài tự truyện',492,'2022-08-09',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS36','TG20','NN01','TL04','NXB05',N'Những ánh sao khuê',292,'2023-01-11',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS37','TG21','NN01','TL11','NXB05',N'Đi làm từ A-Z',254,'2022-10-08',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS38','TG22','NN01','TL05','NXB06',N'100 nhà khoa học vĩ đại thay đổi thế giới',284,'2024',0,N'Sắp nhập')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS39','TG23','NN01','TL09','NXB06',N'50 kiểu bữa sáng ngon',154,'2023-02-14',3,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS40','TG23','NN01','TL09','NXB06',N'Làm một bữa ăn đầy đủ dinh dưỡng',364,'2022-05-16',5,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS41','TG19','NN02','TL01','NXB01',N'Dế mèn phiêu lưu ký',180,'2022-11-28',4,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS42','TG19','NN03','TL01','NXB01',N'Dế mèn phiêu lưu ký',204,'2022-11-28',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS43','TG19','NN04','TL01','NXB01',N'Dế mèn phiêu lưu ký',198,'2022-11-28',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS44','TG19','NN07','TL01','NXB01',N'Dế mèn phiêu lưu ký',190,'2022-11-28',1,N'Hết hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS45','TG14','NN06','TL05','NXB02',N'Hồi ức Sài Gòn thời chiến tranh',198,'2023-01-17',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS46','TG14','NN08','TL05','NXB02',N'Hồi ức Sài Gòn thời chiến tranh',210,'2023-01-17',2,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS47','TG09','NN05','TL06','NXB02',N'Tôi thấy hoa vàng trên cỏ xanh',290,'2023-07-25',1,N'Còn hàng')
insert into [dbo].[Sach] (MaSach,MaTG,MaNN,MaTL,MaNXB,TenSach,SoTrang,NgayXuatBan,SoLuong,TrangThai)
values ('MS48','TG09','NN03','TL06','NXB02',N'Tôi thấy hoa vàng trên cỏ xanh',293,'2023-07-25',1,N'Còn hàng')


--select * from [dbo].[Sach]
--select * from [dbo].[Sach]
--where [TrangThai] = N'Hết hàng'
--select * from [dbo].[Sach]
--where [TenSach] like 'Ch%'
--select [MaSach],[TenSach],[SoTrang],[NgonNgu]
--from [dbo].[Sach] s inner join [NgonNgu] nn on s.MaNN =nn.MaNN
--where s.SoTrang<200
alter table [dbo].[Sach] drop column [NgayNhap]

--Nhập data bảng người dùng
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND01',N'Nguyễn Kiều Chi','2000-09-21',N'Nữ',N'Cầu Giấy ,Hà Nội','0351896412')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND02',N'Hà Kiều Anh','2001-03-29',N'Nữ',N'Mỹ Đình, Hà Nội','0351123412')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND03',N'Mai Thanh Lâm','1999-12-03',N'Nam',N'Ba Đình, Hà Nội','0351890185')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND04',N'Hà Thu Phương','2004-09-03',N'Nữ',N'Thanh Xuân, Hà Nội','0328463782')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND05',N'Hà Cảnh Cầm','2002-05-21',N'Nam',N'Hà Nam','0378541259')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND06',N'Nguyễn Thanh Lâm','2001-06-11',N'Nam',N'Phú Thọ','0351895782')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND07',N'Nguyễn Thị Tuyết Nga','2002-07-09',N'Nữ',N'Vĩnh Phúc','0351854312')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND08',N'Đặng Tuyết Chinh','1998-02-20',N'Nữ',N'Vĩnh Phúc','0326846412')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND09',N'Trần Hà Anh','2003-11-11',N'Nam',N'Thái Nguyên','0352179654')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND10',N'Trần Đăng Thi','2002-08-20',N'Nam',N'Phú Thọ','0912548621')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND11',N'Đặng Tiến Thành','1999-09-03',N'Nam',N'Thái Nguyên','0351892781')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND12',N'Đặng Tiến Thành','2000-11-03',N'Nam',N'Phú Thọ','0351892781')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND13',N'Phùng Văn Quang','1998-08-13',N'Nam',N'Nam Định','0313462781')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND14',N'Đàm Kim Ngọc','2001-12-23',N'Nữ',N'Hải Phòng','0328146245')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND15',N'Bùi Hà My','1997-10-09',N'Nữ',N'Hải Phòng','0954128761')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND16',N'Nguyễn Việt Anh','2004-02-01',N'Nam',N'Hải Phòng','0945292781')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND17',N'Bùi Thảo Vân','2000-01-24',N'Nữ',N'Nam Định','0912762789')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND18',N'Lê Phúc Cường','2005-12-31',N'Nam',N'Thanh Hoá','0934562789')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND19',N'Lê Việt Thanh','2003-11-11',N'Nam',N'Thanh Hoá','0900364829')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND20',N'Võ Hoài Thương','1999-05-15',N'Nữ',N'Hải Dương','0924692781')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND21',N'Nguyễn Ngọc Anh','2003-07-08',N'Nữ',N'Hải Dương','0932642006')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND22',N'Nguyễn Ngọc Anh','1997-12-08',N'Nam',N'Lạng Sơn','0975631222')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND23',N'Lý Hồng Sơn','2005-09-30',N'Nam',N'Hoà Bình','0362469209')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND24',N'Lý Hữu Phước','2004-11-23',N'Nam',N'Hải Phòng','0939312487')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND25',N'Trần Thị Hồng Ánh','2002-02-13',N'Nữ',N'Thanh Oai, Hà Nội','0989593246')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND26',N'Nguyễn Công Lập','1997-01-03',N'Nam',N'Thanh Xuân, Hà Nội','0301646284')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND27',N'Nguyễn Quỳnh Nga','2000-06-01',N'Nữ',N'Hà Đông, Hà Nội','0965214844')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND28',N'Lý Thuỳ Linh','2001-10-20',N'Nữ',N'Hà Đông, Hà Nội','0986421567')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND29',N'Nguyễn Việt Nam','2005-07-10',N'Nam',N'Mỹ Đình, Hà Nội','0310894426')
insert into [dbo].[NguoiDung] (MaND,HoTenND,NgaySinh,GioiTinh,DiaChi,SDT)
values ('ND30',N'Nguyễn Hải Long','1995-12-05',N'Nam',N'Hoàng Mai, Hà Nội','0312468549')

--select * from [dbo].[NguoiDung]

--Nhập data bảng Đơn mượn
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD01','ND02','MS20','2023-05-23','2023-05-30')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD02','ND11','MS20','2023-06-11','2023-06-18')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD03','ND30','MS01','2023-04-10','2023-04-17')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD04','ND28','MS14','2023-06-04','2023-06-11')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD05','ND12','MS10','2023-07-20','2023-07-27')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD06','ND12','MS21','2023-07-20','2023-07-27')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD07','ND12','MS18','2023-07-20','2023-07-27')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD08','ND05','MS19','2023-05-13','2023-05-20')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD09','ND09','MS19','2023-06-21','2023-06-28')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD10','ND07','MS03','2023-06-21','2023-06-28')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD11','ND11','MS35','2023-05-23','2023-05-30')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD12','ND18','MS22','2023-07-16','2023-07-23')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD13','ND27','MS40','2023-06-01','2023-06-08')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD14','ND02','MS10','2023-04-23','2023-04-30')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD15','ND09','MS38','2023-07-03','2023-07-10')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD16','ND27','MS30','2023-04-23','2023-04-30')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD17','ND26','MS34','2023-05-18','2023-05-25')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD18','ND17','MS34','2023-06-17','2023-06-24')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD19','ND30','MS41','2023-04-20','2023-04-27')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD20','ND29','MS39','2023-06-19','2023-06-26')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD21','ND22','MS44','2023-05-17','2023-05-24')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD22','ND07','MS05','2023-05-04','2023-05-11')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD23','ND10','MS20','2023-06-23','2023-06-30')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD24','ND12','MS11','2023-07-13','2023-07-20')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD25','ND24','MS26','2023-05-18','2023-05-25')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD26','ND15','MS36','2023-05-10','2023-05-17')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD27','ND10','MS10','2023-06-09','2023-06-16')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD28','ND14','MS06','2023-05-01','2023-05-08')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD29','ND26','MS18','2023-06-02','2023-06-09')
insert into [dbo].[DonMuon] (MaDon,MaND,MaSach,NgayMuon,NgayTra)
values ('MD30','ND04','MS37','2023-07-05','2023-07-13')

--select * from [dbo].[DonMuon]