
CREATE
DATABASE DATN
GO
USE DATN
GO

CREATE TABLE MauSac
(
    MaMauSac  bigint identity NOT NULL PRIMARY KEY,
    TenMauSac nvarchar(50) NULL,
    TrangThai int NULL
)
CREATE TABLE HinhAnh
(
    MaHinhAnh  bigint identity NOT NULL PRIMARY KEY,
    TenHinhAnh nvarchar(50) NULL,
    HinhAnhUrl nvarchar( Max) NULL,
    TrangThai  int NULL
)
CREATE TABLE SanPham
(
    MaSanPham    bigint identity NOT NULL PRIMARY KEY,
    TenSanPham   nvarchar(50) NULL,
    HeDieuHanh   nvarchar(50) NULL,
    Ram          int null,
    ManHinh      nvarchar(50) null,
    CameraTruoc       nvarchar (50) null,
    CameraSau       nvarchar (50) null,
    Sim nvarchar (50) null,
    DungLuongPin int null,
    TrangThai    int NULL
)
CREATE TABLE DungLuong
(
    MaDungLuong     bigint identity NOT NULL PRIMARY KEY,
    TenDungLuong    nvarchar(50) NULL,
    TrangThai int NULL
)
CREATE TABLE Chip
(
    MaChip     bigint identity NOT NULL PRIMARY KEY,
    TenChip    nvarchar(50) NULL,
    TrangThai int NULL
)
CREATE TABLE NSX
(
    MaNSX     bigint identity NOT NULL PRIMARY KEY,
    TenNSX    nvarchar(50) NULL,
    TrangThai int NULL
)

CREATE TABLE ChucVu
(
    MaChucVu  bigint identity NOT NULL PRIMARY KEY,
    TenChucVu nvarchar(50) NULL,
    TrangThai int NULL
)

CREATE TABLE GiamGiaSanPham
(
    MaGiamGia       bigint identity NOT NULL PRIMARY KEY,
    TenGiamGia VARCHAR(50),
    PhanTramSale int NULL,
    NgayKetThuc    date NULL,
    NgayBatDau     date NULL,
    TrangThai    int NULL
)

CREATE TABLE ChiTietSanPham
(
    MaChiTietSanPham bigint identity NOT NULL PRIMARY KEY,
    SoLuongBan       int NULL,
    SoLuongNhap      int NULL,
    NgayNhap         date Null,
    GiaBan           decimal(20, 1) Null,
    GiaNhap          decimal(20, 1) Null,
    Mota             nvarchar( Max) null,
    DanhMuc          nvarchar(50) null,
    HinhAnhUrl		nvarchar(max) null,
    TrangThai        int Null,
    MaMauSac         Bigint FOREIGN KEY REFERENCES MauSac(MaMauSac),
    MaSanPham        Bigint FOREIGN KEY REFERENCES SanPham(MaSanPham),
    MaHinhAnh        Bigint FOREIGN KEY REFERENCES HinhAnh(MaHinhAnh),
    MaNSX            Bigint FOREIGN KEY REFERENCES NSX(MaNSX),
    MaDungLuong      Bigint FOREIGN KEY REFERENCES DungLuong(MaDungLuong),
    MaChip           Bigint FOREIGN KEY REFERENCES Chip(MaChip)
)

CREATE TABLE GiamGiaChiTietSanPham
(
    MaGiamGiaChiTiet       bigint identity NOT NULL PRIMARY KEY,
    GiaSauKhiGiam           decimal(20, 1) Null,
    MaGiamGia         Bigint FOREIGN KEY REFERENCES GiamGiaSanPham(MaGiamGia),
    MaChiTietSanPham         Bigint FOREIGN KEY REFERENCES ChiTietSanPham(MaChiTietSanPham),
    TrangThai    int NULL
)

CREATE TABLE NhanVien
(
    MaNhanVien bigint identity NOT NULL PRIMARY KEY,
    Ten        nvarchar(50) NULL,
    MatKhau    nvarchar(50) NULL,
    NgaySinh DATE NULL,
    CCCD NVARCHAR(20) NULL,
    Email      nvarchar(50) NULL,
    GioiTinh   bit null,
    Sdt        nvarchar(50) NULL,
    DiaChi     nvarchar(50) NULL,
    MaChucVu   Bigint FOREIGN KEY REFERENCES ChucVu(MaChucVu),
    TrangThai  int NULL
)

CREATE TABLE Voucher
(
    MaVoucher       bigint identity NOT NULL PRIMARY KEY,
    TenVoucher   nvarchar(100),
    PhanTramSale int NULL,
    NgayKetThuc    date NULL,
    NgayBatDau     date NULL,
    TrangThai    int NULL
)

CREATE TABLE KhachHang
(
    MaKhachHang bigint identity NOT NULL PRIMARY KEY,
    Ten         nvarchar(50) NULL,
    MatKhau     nvarchar(50) NULL,
    Email       nvarchar(50) NULL,
    GioiTinh    bit null,
    NgaySinh DATE NULL,
    CCCD NVARCHAR(20) NULL,
    Sdt         nvarchar(50) NULL,
    DiaChi      nvarchar(50) NULL,
    MaVoucher      Bigint FOREIGN KEY REFERENCES Voucher(MaVoucher),
    TrangThai   int NULL
)
CREATE TABLE GioHang
(
    MaGioHang   bigint identity NOT NULL PRIMARY KEY,
    MoTa        nvarchar( Max) NULL,
    TrangThai   int NULL,
    MaKhachHang Bigint FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
)
CREATE TABLE GioHangChiTiet
(
    MaGioHangChiTiet bigint identity NOT NULL PRIMARY KEY,
    SoLuong          int null,
    TrangThai        int NULL,
    MaGioHang        Bigint FOREIGN KEY REFERENCES GioHang(MaGioHang),
    MaChiTietSanPham Bigint FOREIGN KEY REFERENCES ChiTietSanPham(MaChiTietSanPham),
)
CREATE TABLE HoaDon
(
    MaHoaDon    bigint identity NOT NULL PRIMARY KEY,
    NgayTao     date Null,
    DiaChi      nvarchar( Max) NULL,
    NgayThanhToan DATE null,
    LoaiThanhToan INT null,
    TongTien    money null,
    NguoiNhan	nvarchar(Max) Null,
    SdtNguoiNhan nvarchar(20) Null,
    TrangThai   int NULL,
    MaNhanVien  Bigint FOREIGN KEY REFERENCES NhanVien(MaNhanVien),
    MaKhachHang Bigint FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
    GhiChu    NVARCHAR(500) Null,
    Tinh         NVARCHAR(200) Null,
    Huyen         NVARCHAR(200) Null,
    Xa         NVARCHAR(200) Null,

)


CREATE TABLE VoucherChiTiet
(
    MaVoucherChiTiet       bigint identity NOT NULL PRIMARY KEY,
    GiaSauKhiGiam           decimal(20, 1) Null,
    MaVoucher   Bigint FOREIGN KEY REFERENCES Voucher(MaVoucher),
    MaHoaDon   Bigint FOREIGN KEY REFERENCES HoaDon(MaHoaDon),
    TrangThai    int NULL
)
CREATE TABLE HoaDonChiTiet
(
    MaHoaDonChiTiet  bigint identity NOT NULL PRIMARY KEY,
    SoLuongMua       int Null,
    GiaTien          money null,
    TrangThai        int NULL,
    MaHoaDon         Bigint FOREIGN KEY REFERENCES HoaDon(MaHoaDon),
    MaChiTietSanPham Bigint FOREIGN KEY REFERENCES ChiTietSanPham(MaChiTietSanPham),
)
CREATE TABLE DanhGia
(
    MaDanhGia        bigint identity NOT NULL PRIMARY KEY,
    DanhGia          nvarchar( Max) null,
    TrangThai        int NULL,
    MaChiTietSanPham Bigint FOREIGN KEY REFERENCES ChiTietSanPham(MaChiTietSanPham),
    MaKhachHang      Bigint FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
)
CREATE TABLE ViShop
(
    MaViShop        bigint identity NOT NULL PRIMARY KEY,
    TongTien          decimal(20, 1) Null,
    TrangThai        int NULL,
    MaKhachHang      Bigint FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
)
CREATE TABLE GiaoDichVi
(
    MaGiaoDichVi        bigint identity NOT NULL PRIMARY KEY,
    DonGia          decimal(20, 1) Null,
    TrangThai        int NULL,
    NgayGiaoDich	datetime null,
    HinhThuc		int null,
    MaViShop Bigint FOREIGN KEY REFERENCES ViShop(MaViShop),
    MaNhanVien      Bigint FOREIGN KEY REFERENCES NhanVien(MaNhanVien),
)

    INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Iphone13-ProMax', N'https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/8/2/2233100382823499770232452909484620675775421n-16279190166491377262354.png', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Iphone13-Pro', N'https://imaxmobile.vn/media/data/Iphone-13-Pro-mau-vang-1.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Iphone13', N'https://hsstoreimages.blob.core.windows.net/hsstorecontainer/0050316_apple-iphone-13-pro-max-256gb-5g-sierra-blue.jpeg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Iphone13-Mini', N'https://static.doji.co/product/medias/smartphones/apple/iphone-13-mini/back_front-pink.png', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Iphone15', N'https://kenh14cdn.com/203336854389633024/2022/7/8/photo2022-07-08-094020-16572501956891984954946.jpeg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Samsung Galaxy S21 Ultra', N'https://www.cnet.com/a/img/Y9gCqD2rTasHIdtBUfQ7GGJFwJk=/1092x0/2021/07/02/f3605d5b-0093-423b-b1d8-06dbe2e2331d/thumbnail-1.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Samsung Galaxy S21+', N'https://media.takealot.com/covers_images/8258081527124faaa12134188f173da9/s-zoom.file', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Samsung Galaxy S21', N'https://www.ourshopee.com/ourshopee-img/ourshopee_product_images/295458473web-03.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Samsung Galaxy Note 20 Ultra', N'https://dalabu.ru/assets/images/obzory/galaxy-note-20-ultr.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Samsung Galaxy Note 20', N'https://www.didongmy.com/vnt_upload/product/01_2021/thumbs/(600x600)_600_600_note_20_mau_dong_ban_my.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Oppo Find X3 Pro', N'https://shining.my/image/shining/image/cache/data/all_product_images/product-2866/TLLt57oX1617691668-420x420.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Oppo Reno6 Pro+', N'https://tse1.mm.bing.net/th?id=OIP.zWyvK_pYhZx8iPPji9UHhAHaHa&pid=Api&P=0&h=220', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Oppo A74', N'https://fora.kz/images/content/products/622402/oppo-a74-cph2219-midnight-blue-6gb128gb_609cfeb761372.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Oppo-F19-Pro', N'https://philnews.ph/wp-content/uploads/2021/03/Oppo-F19-Pro-5G-1.jpg', 1);
INSERT INTO DATN.dbo.HinhAnh (TenHinhAnh, HinhAnhUrl, TrangThai) VALUES (N'Oppo-A54', N'https://www.thaqfny.com/wp-content/uploads/2021/06/Oppo-A54.jpg', 1);
INSERT INTO NSX(TenNSX,TrangThai) VALUES ('APPLE',1),
                                         ('SAMSUNG',1),
                                         ('OPPO',1),
                                         ('XIAOMI',1),
                                         ('VIVO',1),
                                         ('Realme',1)
    INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Natural Titanium', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Green Titan', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Blue', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Pink', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Green', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Black', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Yellow', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Purple', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'light blue', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'White', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai ) VALUES (N'Grey', 1);
INSERT INTO DATN.dbo.MauSac (TenMauSac, TrangThai) VALUES (N'Sky', 1);

INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'A13 Bionic', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'A14 Bionic', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'A15 Bionic', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'A16 Bionic', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'A17 Pro', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Qualcomm Snapdragon', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'MediaTek Dimensity', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Samsung Exynos', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Chip MediaTek Helio G88', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Snapdragon 680', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'MediaTek Helio G95', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Snapdragon 732G', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N'Snapdragon 695 5G', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N' MariSilicon X Imaging NPU', 1);
INSERT INTO DATN.dbo.Chip (TenChip, TrangThai) VALUES (N' Unisoc Tiger T612', 1);
INSERT INTO DungLuong(TenDungLuong,TrangThai)VALUES
('128GB',1),
('256GB',1),
('512GB',1),
('1TB',1),
('64GB',1)

    INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'IPhone 13 Pro Max', N'IOS', 6, N'Super Retina XDR OLED, 6.7 inches', N'12 MP', N'12 MP + 12 MP + 12 MP', N'Nano-SIM', 4352, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'IPhone 13 Pro', N'IOS', 6, N'Super Retina XDR OLED, 6.1 inches', N'12 MP', N'12 MP + 12 MP + 12 MP', N'Nano-SIM', 3095, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'IPhone 13', N'IOS', 4, N'Super Retina XDR OLED, 6.1 inches', N'12 MP', N'12 MP + 12 MP + 12 MP', N'Nano-SIM', 3095, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'IPhone 13 mini', N'IOS', 4, N'Super Retina XDR OLED, 5.4 inches', N'12 MP', N'12 MP + 12 MP + 12 MP', N'Nano-SIM', 2406, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'iPhone 15', N'IOS', 8, N'Super Retina XDR OLED, 6.7 inches', N'12 MP', N'12 MP + 12 MP + 12 MP', N'Nano-SIM', 4500, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy S21 Ultra', N'Android', 12, N'Dynamic AMOLED 2X, 6.8 inches', N'40 MP', N'108 MP + 12 MP + 10 MP + 10 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy S21+', N'Android', 8, N'Dynamic AMOLED 2X, 6.7 inches', N'10 MP', N'12 MP + 12 MP + 64 MP', N'Nano-SIM', 4800, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy S21', N'Android', 8, N'Dynamic AMOLED 2X, 6.2 inches', N'10 MP', N'12 MP + 12 MP + 64 MP', N'Nano-SIM', 4000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy Note 20 Ultra', N'Android', 12, N'Dynamic AMOLED 2X, 6.9 inches', N'10 MP', N'108 MP + 12 MP + 12 MP', N'Nano-SIM', 4500, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy Note 20', N'Android', 8, N'Super AMOLED Plus, 6.7 inches', N'10 MP', N'12 MP + 64 MP + 12 MP', N'Nano-SIM', 4300, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo Find X3 Pro', N'Android', 12, N'AMOLED, 6.7 inches', N'32 MP', N'50 MP + 50 MP + 13 MP + 3 MP', N'Nano-SIM', 4500, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo Reno6 Pro+', N'Android', 8, N'AMOLED, 6.55 inches', N'32 MP', N'50 MP + 16 MP + 13 MP + 2 MP', N'Nano-SIM', 4500, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo A74', N'Android', 6, N'AMOLED, 6.43 inches', N'16 MP', N'48 MP + 2 MP + 2 MP + 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo F19 Pro+', N'Android', 8, N'Super AMOLED, 6.43 inches', N'16 MP', N'48 MP + 8 MP + 2 MP + 2 MP', N'Nano-SIM', 4310, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo A54', N'Android', 4, N'IPS LCD, 6.51 inches', N'16 MP', N'13 MP + 2 MP + 2 MP + 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi Redmi 10', N'Android', 8, N'6.5 inch', N' 8 MP', N'Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi Redmi Note 11', N'Android', 8, N'6.43 inch', N'13 MP', N'Chính 50 MP & Phụ 8 MP, 2 MP, 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi Redmi Note 10S', N'Android', 8, N'6.5 inch', N'16 MP', N'Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi Redmi Note 10 Pro', N'Android', 8, N'6.5 inch', N'16 MP', N'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP', N'Nano-SIM', 5020, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi Redmi Note 11 Pro 5G', N'Android', 8, N'6.67 inch', N'16 MP', N'Chính 108 MP & Phụ 8 MP, 2 MP.', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi 11 Lite 5G NE', N'Android', 8, N'6.55 inch', N'20 MP', N'Chính 64 MP & Phụ 8 MP, 5 MP', N'Nano-SIM', 4250, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi 11T', N'Android', 8, N'6.67 inch', N'16 MP', N'Chính 108 MP & Phụ 8 MP, 5 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi 11T Pro 5G', N'Android', 8, N'6.67 inch', N'16 MP', N'Chính 108 MP & Phụ 8 MP, 5 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi 12', N'Android', 8, N'6.28 inch', N'32 MP', N'Chính 50 MP & Phụ 13 MP, 5 MP', N'Nano-SIM', 4500, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Xiaomi 12 Pro', N'Android', 12, N'6.73 inch', N'32 MP', N' 3 camera 50 MP', N'Nano-SIM', 4600, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Oppo Find X5 Pro', N'Android', 12, N'6.70 inch', N'32MP', N'50MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy S22 5G', N'Android', 8, N'Dynamic AMOLED 2X6.1 Full HD+', N'10 MP', N'Chính 50 MP & Phụ 12 MP, 10 MP', N'Nano-SIM', 3700, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy Z Flip3', N'Android', 8, N'Dynamic AMOLED 2XChính 6.7 & Phụ 1.9 Full HD+', N'10 MP', N'2 camera 12 MP', N'Nano-SIM', 3300, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy S22 Ultra', N'Android', 8, N'6.8 inch.', N'40 MP', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP.', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy Z Fold3', N'Android', 12, N'Chính 7.6 inch & Phụ 6.2 inch.', N'10 MP & 4 MP.', N'3 camera 12 MP.', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'iPhone 14 Pro Max', N'IOS', 6, N'OLED', N'12 MP.', N'Chính 48 MP & Phụ 12 MP, 12 MP.', N'1 Nano SIM & 1 eSIMHỗ trợ 5G', 4323, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'iPhone 12', N'IOS', 4, N'màn hình OLED, 6.1 inch', N'12 MP', N'2 camera 12 MP.', N'Nano-SIM', 2815, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'iPhone 14', N'IOS', 6, N'OLED 6.1 Super Retina XDR', N'12 MP', N'2 camera 12 MP', N'1 Nano SIM & 1 eSIMHỗ trợ 5G', 3279, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'iPhone 15 Plus', N'IOS', 6, N'OLED,6.7 Super Retina XDR', N'12 MP', N'Chính 48 MP & Phụ 12 MP', N'1 Nano SIM & 1 eSIMHỗ trợ 5G', 4383, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Vivo Y22s', N'Android', 8, N'IPS LCD', N'8 MP', N'Chính 50 MP & phụ 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'vivo V29e 5G', N'Android', 12, N'AMOLED6.67 Full HD+', N'50 MP', N'Chính 64 MP & Phụ 8 MP', N'Nano-SIM', 4800, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'vivo V27e', N'Android', 8, N'AMOLED6.62 Full HD+', N'32 MP', N'Chính 64 MP & Phụ 2 MP, 2 MP', N'Nano-SIM', 4600, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'vivo Y35', N'Android', 8, N'IPS LCD6.58 Full HD+', N'16 MP', N'Chính 50 MP & Phụ 2 MP, 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'vivo Y02T', N'Android', 4, N'IPS LCD6.51 HD+', N'5 MP', N'8 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme C53', N'Android', 6, N' IPS LCD6.74 HD+', N'8 MP', N'Chính 50 MP & Phụ 0.08 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme 11 Pro+', N'Android', 12, N'AMOLED6.7 Full HD+', N'32 MP', N'Chính 200 MP & Phụ 8 MP, 2 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme C30s', N'Android', 3, N'IPS LCD6.5 HD+', N'5 MP', N'8 MP', N'Nano-SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme 10 ', N'Android', 8, N'Super AMOLED6.4"Full HD+', N'16 MP', N'Chính 50 MP & Phụ 2 MP', N'2 Nano SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme 11 Pro 5G ', N'Android ', 8, N'AMOLED6.7"Full HD+', N'16 MP', N'Chính 100 MP & Phụ 2 MP', N'2 Nano SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Realme C67', N'Android ', 8, N'Full HD+ (1080 x 2400 Pixels)', N'8 MP', N'Chính 108 MP & Phụ 2 MP', N'2 Nano SIM', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'OPPO A17K', N'Android ', 3, N'IPS LCD6.56"HD+', N'5 MP', N'8MP', N'2 Nano SIM, Hỗ trợ 4G', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'OPPO A78', N'Android ', 8, N'AMOLED6.43"Full HD+', N'8 MP', N'Chính 50 MP & Phụ 2 MP', N'2 Nano SIM, Hỗ trợ 4G', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'OPPO A58', N'Android ', 8, N'LTPS LCD6.72"Full HD+', N'8 MP', N'Chính 50 MP & Phụ 2 MP', N'2 Nano SIM, Hỗ trợ 4G', 5000, 1);
INSERT INTO DATN.dbo.SanPham (TenSanPham, HeDieuHanh, Ram, ManHinh, CameraTruoc, CameraSau, Sim, DungLuongPin, TrangThai) VALUES (N'Samsung Galaxy A04s', N'Android ', 4, N'IPS LCD6.5"HD+', N'5 MP', N'Chính 50 MP & Phụ 2 MP', N'2 Nano SIM, Hỗ trợ 4G', 5000, 1);

INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2023-11-27', 21000000.0, 18500000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 1', N'2023-11-27_ip13 tím.webp', 1, 8, 1, 1, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 15, N'2023-11-27', 20000000.0, 17600000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 2', N'2023-11-27_Iphone-13-Pro-mau-vang-1.jpg', 1, 7, 2, 2, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 12, N'2023-11-27', 19500000.0, 16000000.0, N'Apple iPhone 13  2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 3', N'2023-11-27_ip13 pro blue.jpeg', 1, 3, 3, 3, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (25, 30, N'2024-01-11', 19000000.0, 14000000.0, N'Apple iPhone 13 MiNi 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 4', N'2023-11-27_13 mini hồng.png', 1, 4, 4, 4, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 25, N'2023-11-27', 24000000.0, 20000000.0, N'iPhone 15 được cho là sẽ được trang bị những tính năng và cải tiến đáng chú ý. Và trong đó, chip 5G mới, camera chính được nâng cấp lên 48MP, cổng USB-C, cảm biến camera mới từ Sony và nhiều tính năng khác sẽ là điểm nhấn của sản phẩm này', N'Danh mục 5', N'2023-11-27_15 blue.webp', 1, 3, 5, 5, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 20, N'2024-01-12', 13000000.0, 10000000.0, N'Galaxy S21 Ultra cũ là một trong những mẫu điện thoại cao cấp của Samsung với màn hình Dynamic AMOLED 2X 6.8 inch, camera sau 108MP, pin 5000mAh và sạc nhanh 25W. Điện thoại này được trang bị chip Exynos 2100 hoặc Snapdragon 888, tùy thuộc vào thị trường và phiên bản.', N'Danh mục 6', N'2023-11-27_Samsung Galaxy S21 Ultra blue.webp', 1, 3, 6, 6, 2, 1, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (14, 15, N'2024-01-12', 11000000.0, 8000000.0, N'Đắm chìm trong vẻ đẹp tuyệt tác đến từ Samsung Galaxy S21+ 5G 256 GB, làm chủ cuộc chơi với hiệu năng hàng đầu, cụm camera chuyên nghiệp cùng tốc độ 5G bức phá mọi giới hạn, mẫu điện thoại cho bạn thỏa sức khám phá cuộc sống, thể hiện cá tính theo cách riêng của mình.', N'Danh mục 7', N'2023-11-27_Samsung Galaxy S21+ hồng.jpg', 1, 4, 7, 7, 2, 2, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 12, N'2023-11-27', 20000000.0, 14000000.0, N'Điện thoại Galaxy S21 5G nằm trong series S21 đến từ Samsung nổi bật với thiết kế tràn viền, cụm camera ấn tượng cho đến hiệu năng mạnh mẽ hàng đầu.', N'Danh mục 8', N'2023-11-27_Samsung Galaxy S21 đen.webp', 1, 6, 8, 8, 2, 3, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (19, 30, N'2023-11-27', 18000000.0, 14000000.0, N'Đặc điểm nổi bật Màn hình kích thước 6.9" cùng công nghệ hiển thị hiện đại Bộ nhớ trong 256GB cho khả năng lưu trữ dữ liệu tối ưu Chơi game, xem phim "tẹt ga" với màn hình cảm ứng siêu nhạy Khả năng quay những thước phim chất lượng 8K hoàn hảo Bộ 3 camera có độ phân giải cao bắt trọn mọi khoảnh khắc', N'Danh mục 9', N'2023-11-27_Samsung Galaxy Note 20 Ultra Tím.jpg', 1, 8, 9, 9, 2, 4, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 25, N'2023-11-27', 12000000.0, 10000000.0, N'Tháng 8/2020, smartphone Galaxy Note 20 chính thức được lên kệ, với thiết kế camera trước nốt ruồi quen thuộc, cụm camera hình chữ nhật mới lạ cùng với vi xử lý Exynos 990 cao cấp của chính điện thoại Samsung chắc hẳn sẽ mang lại một trải nghiệm thú vị cùng hiệu năng mạnh mẽ.', N'Danh mục 10', N'2023-11-27_Samsung Galaxy Note 20 Vàng.jpg', 1, 7, 10, 10, 2, 2, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (15, 20, N'2023-11-27', 15000000.0, 10000000.0, N'Sẵn sàng cùng bạn hướng tới tương lai với OPPO Find X3 Pro 5G, chiếc điện thoại sở hữu camera màu sắc trung thực, màn hình 120Hz siêu mượt, 1 tỷ màu sống động và hiệu năng đột phá với sức mạnh của con chip Qualcomm Snapdragon 888 hỗ trợ 5G.', N'Danh mục 11', N'2023-11-27_Oppo Find X3 Pro đen.jpg', 1, 6, 11, 11, 3, 1, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 15, N'2023-12-13', 11000000.0, 7000000.0, N'Được thiết kế cho trải nghiệm quay video chân dung AI chuyên nghiệp, Reno6 Pro hỗ trợ hàng loạt tính năng hàng đầu trong ngành, nổi bật nhất là Video chân dung Bokeh Flare mới, mang lại hiệu ứng xoá phông bokeh điện ảnh cho các thước hình chân dung, và Hiệu ứng video AI nâng cấp, cho chất lượng video tối ưu nhất trong mọi điều kiện ghi hình. Reno6 Pro được trang bị các công nghệ phần cứng tiên tiến, bao gồm cảm biến IMX766 do OPPO và Sony đồng phát triển, chip xử lý Qualcomm® Snapdragon™ 870 5G, kỹ thuật thiết kế OPPO Reno Glow cải tiến và giao diện truyền cảm hứng của ColorOS 11.3, mang đến cho người dùng một chiếc smartphone đón đầu xu hướng với những trải nghiệm trọn vẹn nhất.', N'Danh mục 12', N'2023-11-27_Oppo Reno6 Pro+ blue.jpg', 1, 3, 12, 12, 3, 2, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (7, 12, N'2023-11-27', 20000000.0, 15000000.0, N'Điện Thoại OPPO A74 8GB/128GB Xanh Chính Hãng, Giá Tốt | Nguyễn Kim Xem 9 hình Đặc điểm nổi bật Màn hình AMOLED 6.43'''' FHD+ hiển thị hình ảnh sắc nét, màu sắc chân thực Bộ xử lý Qualcomm Snapdragon 662, tối đa 2.0GHz xử lý tác vụ nhanh chóng Dung lượng pin 5000mAh, hỗ trợ sạc nhanh 33W, thoải mái sử dụng cả ngày', N'Danh mục 13', N'2023-11-27_Oppo A74 blue.jpg', 1, 3, 13, 13, 3, 3, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (16, 30, N'2023-11-27', 18000000.0, 12000000.0, N'OPPO F19 Pro+ xuất hiện với phiên bản màu Space Silver và có số model CPH2213, RAM 8 GB, bộ nhớ trong 128 GB. Máy nặng 173 gram, sở hữu màn hình 6.43 inch, với lỗ khoét ở góc trên cùng bên trái chứa camera selfie độ phân giải 16 MP. Hộp của máy đi kèm các phụ kiện: Bộ sạc, tai nghe, cáp USB-C và que chọc SIM.', N'', N'2023-11-27_Oppo F19 Pro+ hồng.jpg', 1, 4, 14, null, 3, 2, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (16, 25, N'2023-11-27', 12000000.0, 9000000.0, N'OPPO A54 (CPH2239) Pin 5000mAh, sạc siêu nhanh 18W 128GB ROM, bộ xử lý 8 nhân Màn hình 6.51'''' (16,55cm) chấm O, bảo vệ mắt Thiết kế cong tràn 3D, mở khóa bằng vân tay Camera selfie 16MP, làm đẹp Al Bảo vệ toàn diện, chống nước chuẩn IPX4', N'', N'2023-11-27_Oppo-A54 blue.jpg', 1, 3, 15, null, 3, 1, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (1, 20, N'2023-12-12', 4700000.0, 3900000.0, N'Xiaomi Redmi 10 (6GB/128GB) có thiết kế sang trọng, thời thượng với màn hình tràn viền, kiểu dáng mỏng nhẹ, mặt lưng được làm nhám mờ hạn chế bám dấu vân tay.
Máy được trang bị chip xử lý Helio G88 với hiệu năng mạnh mẽ chuyên dành cho các máy tầm trung giá rẻ. Bên cạnh đó, máy có RAM 8 GB cùng bộ nhớ 128 GB giúp đáp ứng tốt nhu cầu sử dụng cơ bản. Với mức giá tầm 5 triệu, máy được đánh giá có khả năng chụp hình ổn.', null, N'2023-12-12_XiaomiRedmi10xanh duong.jpg', 1, 9, 16, null, 4, 1, 9);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-12', 2300000.0, 2000000.0, N'Xiaomi Redmi Note 11 được trang bị hoàn thiện từ nhựa nguyên khối, các góc cạnh viền được bo đều đặn, thiết kế thời thượng, màn hình tràn viền cùng kiểu dáng mỏng nhẹ, sang trọng. Máy có RAM 4 GB và bộ nhớ 64 GB đáp ứng tốt nhu cầu sử dụng cơ bản một cách nhanh gọn.
Về khả năng chụp ảnh, máy được trang bị bộ cảm biến với những tính năng nhận diện hình ảnh và làm đẹp tương tự như Xiaomi Redmi 10 (6GB/128GB). Tuy vậy máy vừa được ra mắt trong năm 2022, do đó nếu bạn ưa thích điện thoại đời mới thì đây là lựa chọn phù hợp cho bạn.', null, N'2023-12-12_Xiaomi Redmi Note 11 black.jpeg', 1, 6, 17, null, 4, 1, 10);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 30, N'2023-12-12', 5000000.0, 4000000.0, N'Xiaomi Redmi Note 10S được thiết kế với mặt lưng bằng nhựa với khung viền kim loại chắc chắn, sang đẹp, các góc cạnh bo viền mềm mại tạo cảm giác cầm nắm chắc tay, tổng thể thiết kế sang chảnh không thua kém những phiên bản smartphone đắt tiền.
Máy cho phép truy cập màn hình nhanh cùng khả năng bảo mật tốt nhờ hỗ trợ mở khóa khuôn mặt và cảm biến vân tay cạnh viền, bảo vệ tốt thông tin cá nhân trên thiết bị di động của bạn. Khả năng chụp ảnh của máy được đánh giá khá tốt, nhận diện hình tương đối nhanh.', null, N'2023-12-12_xiaomi-redmi-note-10s-xanh.jpg', 1, 3, 18, null, 4, 1, 11);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (7, 25, N'2023-12-12', 6000000.0, 5000000.0, N'Xiaomi Redmi Note 10 Pro có thiết kế nguyên khối mang lại cảm giác rất đầm tay và chắc chắn, bên cạnh việc trang bị mặt kính ở hai cả hai mặt, tăng khả năng chống chịu va đập và các trầy xước không mong muốn. Máy có RAM 8 GB và bộ nhớ trong 128 GB giúp đáp ứng tốt nhu cầu sử dụng cho công việc.
Máy được trang bị cụm camera sau siêu khủng với độ phân giải camera chính lên đến 108 MP, camera góc rộng 8 MP, camera macro 5 MP và camera đo độ sâu 2 MP. Camera trước có độ phân giải 16 MP hỗ trợ các tính năng làm đẹp tự động. Nhìn chung, đây là sản phẩm tầm trung nên mua với hiệu năng ổn, camera chất lượng cùng thiết kế máy hiện đại.', null, N'2023-12-12_xiaomi-redmi-note-10-pro-thumb-xam.jpg', 1, 11, 19, null, 4, 1, 12);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (11, 20, N'2023-12-12', 4300000.0, 3900000.0, N'Xiaomi Redmi Note 11 Pro 5G hội tụ đủ những yếu tố ấn tượng nhất của một chiếc smartphone tầm trung: Camera 108 MP số 1 phân khúc, màn hình hiển thị sắc nét, pin 5000 mAh, sạc nhanh 67 W, cùng con chip xử lý vô cùng mạnh mẽ. Máy có thiết kế thời thượng, hiện đại với phần viền phẳng, bo góc mềm mại.
Xiaomi Redmi Note 11 Pro 5G chỉ được trang bị 3 camera sau gồm camera chính 108 MP, camera góc siêu rộng 8 MP và một camera macro 2 MP, không có camera xóa phông như thế hệ tiền nhiệm. Tuy vậy, chất lượng bộ cảm biến được đánh giá có sự nâng cấp đôi chút góp phần làm đẹp hơn cho bức ảnh được chụp.', null, N'2023-12-12_xiaomi-redmi-note-11-pro-5g-xam.jpg', 1, 6, 20, null, 4, 1, 13);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 21, N'2023-12-12', 8400000.0, 7500000.0, N'Xiaomi 11 Lite 5G NE được chế tác nguyên khối, sở hữu một thân hình siêu mỏng nhẹ chỉ có trọng lượng 158 g và mỏng 6.8 mm, tạo cảm giác cầm nắm thoải mái, để vào túi quần hay túi áo cũng không quá nặng nề. Thiết kế bề ngoài chính là ưu điểm cuốn hút nhất của sản phẩm.
Về hiệu năng camera, máy được trang bị cụm 3 camera sau bao gồm camera chính 64 MP, camera góc siêu rộng độ phân giải 8 MP và camera telemacro 5 MP. Máy có camera trước 20 MP tích hợp nhiều tính năng làm đẹp nâng cao. Về khả năng quay video, máy hỗ trợ xuất video chất lượng cao.', null, N'2023-12-12_xiaomi-11-lite-5g-ne-pink.jpg', 1, 4, 21, null, 4, 1, 13);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 15, N'2023-12-12', 8900000.0, 8000000.0, N'Xiaomi 11T được trang bị cụm 3 camera sau gồm camera chính độ phân giải 108 MP, camera góc rộng 8 MP và camera telemacro 5 MP cùng hệ thống phần cứng tối tân được trang bị bên trong cực kỳ ấn tượng. Máy có khả năng thu phóng cực tốt cho bạn chụp được rõ từng chi tiết dù đối tượng ở khá xa.
Máy sở hữu camera trước 16 MP tích hợp đầy đủ các tính năng giúp những tấm ảnh của bạn luôn tươi tắn mà không cần chỉnh sửa quá nhiều. Máy có khung kim loại và mặt lưng kính, không chỉ đẹp mà còn bền. Trọng lượng máy 203 g và mỏng 8.8 mm cho cảm giác cầm chắc tay, không quá nặng.', null, N'2023-12-12_Xiaomi-11T-White.jpg', 1, 10, 22, null, 4, 1, 13);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 22, N'2023-12-12', 9100000.0, 8000000.0, N'Xiaomi 11T Pro 5G nhìn chung có bộ cảm biến hình ảnh cũng như chất lượng camera tương tự như Xiaomi 11T vừa được giới thiệu tại phần trên. Sự khác biệt của 2 sản phẩm chủ yếu đến từ chip xử lý và công nghệ sạc pin.
Xiaomi 11T Pro 5G có cấu hình phần cứng mạnh hơn đôi chút cùng tốc độ sạc pin nhanh hơn. Nếu bạn có nhu cầu sử dụng đa nhiệm thường xuyên thì đây là sản phẩm phù hợp với bạn.', null, N'2023-12-12_xiaomi-11t-pro-5g-đen.jpeg', 1, 11, 23, null, 4, 2, 12);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-12', 13000000.0, 9800000.0, N'Xiaomi 12 có thiết kế thời thượng, đẳng cấp, cạnh viền được bo cong mềm mại và không thấy xuất hiện chi tiết thừa, Bộ khung kim loại cứng cáp cùng mặt lưng kính cao cấp được hoàn thiện nhám mang lại khả năng hạn chế bám dấu vân tay, cũng như cho ra cảm giác cầm nắm rất thoải mái.
Máy được trang bị cụm 3 camera gồm camera chính 50 MP, camera góc siêu rộng 13 MP và camera macro 5 MP cho ra các bức hình có độ chi tiết cao, màu sắc được tái hiện chân thực, ảnh sau khi zoom vẫn mang một chất lượng khá ổn. Camera trước 32 MP góp phần mang lại những khung hình ấn tượng, sắc nét, làm đẹp tự động.', null, N'2023-12-12_Xiaomi-12-xam.jpg', 1, 6, 24, null, 4, 2, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 20, N'2023-12-12', 15000000.0, 12000000.0, N'Điện thoại Xiaomi 12 Pro có kiểu dáng bề ngoài tương tự như Xiaomi 12. Điểm đặc biệt chính là máy được trang bị 3 camera ở phần mặt lưng có cùng độ phân giải lên đến 50 MP để cho ra các bức ảnh có độ sắc nét cực cao, cùng nhiều tính năng hiện đại giúp bạn có được những tấm hình đầy nghệ thuật.
Máy có cấu hình phần cứng được đánh giá rất cao, hỗ trợ đa nhiệm mượt mà, tốc độ xử lý nhanh chóng, hiệu năng vận hành mạnh mẽ. Đây là một sản phẩm điện thoại cao cấp nên mua với các bạn ưa thích trải nghiệm những công nghệ mới trên điện thoại.', null, N'2023-12-12_Xiaomi-12-Pro-tim.jpg', 1, 8, 25, null, 4, 2, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-13', 20000000.0, 17000000.0, N'Điện thoại OPPO Find X5 Pro kế thừa ngôn ngữ thiết kế từ đời tiền nhiệm X3 Pro, đồng thời cũng có những nét riêng nổi bật. Chiếc máy có vẻ ngoài sang trọng, hiện đại và hoàn thiện mặt lưng thanh lịch tăng thêm nét cuốn hút. Thiết kế mỏng gọn kết hợp với tính chống bụi / nước IP68 giúp OPPO Find X5 Pro trở thành chiếc smartphone tuyệt vời của năm.', null, N'2023-12-13_Oppo-Find-X5-Pro-trắng.jpg', 1, 10, 26, null, 3, 2, 14);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-17', 29000000.0, 26000000.0, N'Samsung Galaxy S22 5G 256GB được trang bị bộ vi xử lý Snapdragon 8 Gen 1 đi cùng là RAM 8 GB giúp mang lại cho thiết bị một hiệu năng đầy mạnh mẽ. Máy dễ dàng đáp ứng các tác vụ hằng ngày như lướt web, đọc báo, thậm chí là các tựa game có đồ họa cao một cách mượt mà.
Máy sử dụng hệ điều hành Android 12 với một giao diện thân diện dễ dùng, hỗ trợ kết nối 5G cho tốc độ truy cập mạng vô cùng nhanh chóng. Máy có màn hình rộng 6.1 inch, độ phân giải Full HD+ cho bạn trải nghiệm xem nhìn vô cùng đã mắt.', null, N'2023-12-17_samsung-galaxy-s22-vang.jpg', 1, 6, 27, null, 2, 2, 13);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (1, 60, N'2023-12-17', 27000000.0, 24000000.0, N'Samsung Galaxy Z Flip3 5G 256GB sử dụng bộ vi xử lý Snapdragon 888 cùng RAM 8 GB mang lại khả năng xử lý mượt mà, nhanh chóng hầu hết các tác vụ thông dụng, khả năng đa nhiệm ổn. Máy được trang bị công nghệ 5G giúp mang lại trải nghiệm kết nối cực nhanh.
Máy có thiết kế màn hình có thể gập lại khá độc đáo, thân máy siêu mỏng với 6.9 mm, nhẹ 183 g tạo nên một kiểu dáng vô cùng gọn nhẹ. Màn hình máy có độ phân giải Full HD+ cho màu sắc hiển thị rực rỡ giúp mọi chi tiết được tái hiện một cách chân thực.', null, N'2023-12-17_samsung-galaxy-z-flip-3-tím.jpg', 1, 8, 28, null, 2, 2, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 70, N'2023-12-17', 28000000.0, 16990000.0, N'Samsung Galaxy S22 Ultra 5G 128GB có thiết kế vuông vức, cảm giác cầm nắm đầm tay, phần mặt lưng được làm nhám nên hạn chế tốt việc bám dấu vân tay. Máy sử dụng chip xử lý Snapdragon 8 Gen 1 vô cùng mạnh mẽ, hiệu năng xử lý nhanh chóng. Máy được tích hợp bút S Pen.
Máy sử dụng màn hình kích thước 6.8 inch, độ phân giải 2K+, mang lại khả năng hiển thị màu sắc ấn tượng, hình ảnh rõ nét, sống động. Máy được trang bị viên pin dung lượng 5000 mAh, hỗ trợ sạc nhanh công xuất 45 W cho thời gian sạc ngắn hơn.', null, N'2023-12-17_Galaxy-S22-Ultra-tím.jpg', 1, 8, 29, null, 2, 1, 6);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 70, N'2023-12-17', 32000000.0, 27000000.0, N'Samsung Galaxy Z Fold3 5G 256GB sở hữu thiết kế màn hình gập vô cùng độc đáo. Sản phẩm được xem như là sự kết hợp giữa điện thoại (khi gập) và tablet (khi mở). Máy sử dụng chip Snapdragon 888, hỗ trợ kết nối 5G nhanh chóng. Máy cũng hỗ trợ bút S Pen.
Máy được trang bị RAM 12 GB mang lại khả năng xử lý đa nhiệm nhanh chóng, hiệu quả. Sản phẩm có dung lượng pin 4400 mAh vừa đủ để bạn có thể sử dụng trong khoảng một ngày với các tác vụ làm việc giải trí thông thường.', null, N'2023-12-17_samsung-galaxy-z-fold-3-trắng.jpg', 1, 10, 30, null, 2, 2, 13);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (1, 60, N'2023-12-17', 29000000.0, 26000000.0, N'iPhone 14 Pro Max sở hữu cụm cam chất lượng. Camera sau 48MP bắt trọn mọi khung hình cho hình ảnh sắc nét. Về phần chụp ảnh thì sản phẩm lần này sẽ được trang bị 3 camera sau với camera chính có độ phân giải 48 MP giúp bạn bắt trọn mọi khung hình được sắc nét, bên cạnh sẽ là camera góc siêu rộng 12 MP và cảm biến cuối cùng có độ phân giải 12 MP. Đi kèm với đó sẽ là cảm biến quad-pixel cao cấp giúp nâng độ phân giải trên từng bức hình bạn chụp.', null, N'2023-12-17_iphone-14-pro-max-tim.jpg', 1, 8, 31, null, 1, 2, 4);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (30, 45, N'2023-12-17', 14000000.0, 12700000.0, N'Điện thoại iPhone 12 64GB là sản phẩm đánh dấu hệ thống 5G lần đầu tiên được Apple trang bị trên những chiếc iPhone, cho tốc độ truyền tải dữ liệu nhanh hơn, ổn định hơn bao giờ hết.
Máy được trang bị màn hình Super Retina XDR OLED tràn viền với kích thước 6.1 inch, được bảo vệ bởi kính cường lực Ceramic Shield cứng cáp, độ bền cao.
iPhone 12 được trang bị hệ thống camera kép phía sau, gồm camera góc rộng và camera siêu rộng có cùng độ phân giải là 12 MP, camera selfie cũng 12 MP kết hợp nhiều chế độ chụp đỉnh cao.
Ngoài ra, máy còn gây ấn tượng với chỉ số chống nước chuẩn IP68 cùng với công nghệ sạc pin nhanh 20W và sạc không dây, mang đến sự tiện dụng tối ưu cho người dùng.', null, N'2023-12-17_iphone-12-tim.jpg', 1, 8, 32, null, 1, 5, 2);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 50, N'2023-12-17', 20000000.0, 16000000.0, N'iPhone 14 128GB được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.', null, N'2023-12-17_iPhone-14-thumb-tim.webp', 1, 8, 33, null, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 60, N'2023-12-17', 25990000.0, 22990000.0, N'Chính thức được giới thiệu trong sự kiện ra mắt sản phẩm mới của Apple tại California ngày 12/9, phiên bản iPhone 15 Plus trong series lần này mang đến những trải nghiệm cao cấp vô cùng xứng đáng cho người dùng, điển hình là màn hình Dynamic Island thay thế hoàn toàn cho thiết kế tai thỏ. Không những thế, iPhone 15 Plus còn có nhiều thay đổi được đánh giá là thực dụng hơn và đáng mua hơn nhiều như sạc dễ dàng hơn với cổng USB-C phổ thông, trang bị camera Tele, camera 48MP với độ phân giải siêu cao bên cạnh thiết kế bằng kính pha màu trendy,... tất cả “kiến tạo” nên một chiếc iPhone 15 Plus - một lựa chọn khôn ngoan.', null, N'2023-12-17_iphone-15-plus-128gb-xanh dương nhạt.webp', 1, 12, 34, null, 1, 1, 4);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 50, N'2023-12-18', 5990000.0, 3000000.0, N'Điện thoại Vivo Y22s có thiết kế vuông vức, thời thượng với xu hướng màu sắc mới lạ. Cụm camera nổi bật trên mặt lưng với hai ống kính có độ phân giải lớn cho ra chất lượng ảnh chụp chuyên nghiệp, sắc nét.
Màn hình hiển thị lớn cho không gian thao tác và làm việc thoải mái. Hiệu năng mạnh mẽ, ổn định nhờ con chip Snapdragon 680, phục vụ tốt các tác vụ thường ngày. Viên pin dung lượng 5000 mAh cho thời gian sử dụng lâu dài mà không lo bị gián đoạn.', null, N'2023-12-18_vivo-y22s-vang.jpg', 1, 7, 35, null, 5, 1, 10);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 9990000.0, 7000000.0, N'vivo V29e 5G là một phiên bản điện thoại di động đáng chú ý trong phân khúc tầm trung, đặc biệt với sự kết hợp tinh tế giữa thiết kế và hiệu suất. Điều làm nổi bật chiếc điện thoại này chính là camera chất lượng, thiết kế sang trọng và viên pin lớn kèm sạc nhanh. ', null, N'2023-12-18_vivo-v29e-black.jpg', 1, 6, 36, null, 5, 2, 10);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 9000000.0, 6000000.0, N'vivo V27e một trong những chiếc điện thoại tầm trung nổi bật của vivo trong năm 2023. Với thiết kế độc đáo và khả năng chụp ảnh - quay phim ấn tượng, vì thế máy đã mang lại cho vivo nhiều niềm tự hào khi ra mắt tại thị trường Việt Nam, hứa hẹn mang đến trải nghiệm tuyệt vời đến với người dùng.', null, N'2023-12-18_vivo-v27e-tim.jpg', 1, 8, 37, null, 5, 2, 11);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 6990000.0, 3000000.0, N'vivo Y35 là một chiếc điện thoại tầm trung đáng chú ý được ra mắt vào tháng 10/2022, máy nổi bật nhờ sở hữu thiết kế đẹp, khả năng sạc nhanh cùng cấu hình ổn trong phân khúc, ngoài ra camera với độ phân giải lên đến 50 MP cũng là điểm cộng dành cho chiếc máy này.', null, N'2023-12-18_vivo-y35-vàng.jpg', 1, 7, 38, null, 5, 1, 10);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-18', 2990000.0, 1000000.0, N'Điện thoại vivo Y02T là một trong những sản phẩm mới của vivo, hãng smartphone nổi tiếng của Trung Quốc. Tuy thuộc phân khúc giá rẻ, nhưng vẫn có những tính năng nổi bật như pin lớn 5000 mAh, màn hình IPS LCD 6.51 inch, bộ xử lý Helio P35 và bộ nhớ lưu trữ 64 GB.', null, N'2023-12-18_vivo-y02t-xanh-tim.jpg', 1, 8, 39, null, 5, 5, 11);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 4300000.0, 2700000.0, N'realme C53 - chiếc điện thoại giá rẻ với thiết kế đẹp, màn hình lớn và camera sắc nét, thực sự là một lựa chọn hợp lý dành cho người dùng khi đang băn khoăn tìm mua một thiết bị trong phân khúc giá rẻ.', null, N'2023-12-18_realme-c53-gold.jpg', 1, 7, 40, null, 6, 1, 15);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 14990000.0, 11000000.0, N'realme 11 Pro+ 5G mẫu điện thoại kinh doanh chính hãng tại thị trường Việt Nam vào tháng 07/2023, máy được cộng đồng người yêu công nghệ quan tâm nhiều nhờ sở hữu cấu hình mạnh mẽ, thiết kế đẹp và còn trang bị hệ thống ống kính xịn với độ phân giải cao nhất lên đến 200 MP.', null, N'2023-12-18_realme-11-pro-plus-trắng.jpeg', 1, 10, 41, null, 6, 3, 7);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 40, N'2023-12-18', 2700000.0, 1200000.0, N'Điện thoại realme C30s (3GB/64GB) thuộc phân khúc giá rẻ nhưng vẫn đáp ứng tốt các tác vụ thường ngày một cách trơn tru, mượt mà. Bên cạnh đó, dung lượng pin 5000 mAh vô cùng trâu cho bạn thỏa sức sử dụng cả một ngày dài đầy năng động.', null, N'2023-12-18_realme-c30s-3gb-64gb-blue.jpg', 1, 9, 42, null, 6, 5, 15);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 60, N'2023-12-18', 6500000.0, 3700000.0, N'realme 10 có thể xem là một trong những mẫu smartphone đáng mong đợi nhất trong dịp đầu năm 2023 với nhiều điểm nổi bật, một số điểm đáng chú ý có thể kể đến như: Tấm nền Super AMOLED, camera siêu độ phân giải 50 MP đi kèm con chip Helio G99 mạnh mẽ.', null, N'2023-12-18_realme-10-trang.webp', 1, 10, 43, null, 6, 2, 11);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 40, N'2023-12-18', 11490000.0, 10000000.0, N'realme là một thương hiệu điện thoại thông minh đến từ Trung Quốc, được biết đến với những sản phẩm có thiết kế đẹp, cấu hình mạnh và giá cả hợp lý. Trong đó, có thể kể đến phiên bản realme 11 Pro 5G với một vẻ ngoài đẹp mắt, chất lượng ảnh chụp sắc nét cũng như một hiệu năng đầy mạnh mẽ.
Vẻ ngoài cao cấp, sang trọng', null, N'2023-12-18_realme-11-pro-5g-green.webp', 1, 5, 44, null, 6, 2, 7);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (3, 20, N'2023-12-18', 7590000.0, 6500000.0, N'Đúng như đã hẹn, realme C67 5G ra mắt chính thức tại thị trường Ấn Độ vào ngày 14/12. Chiếc smartphone giá rẻ mới của realme sở hữu ngoại hình trẻ trung với phong cách thiết kế vuông vức phần khung viền cùng mặt lưng bóng bẩy. Sản phẩm có 2 tùy chọn màu sắc là Sunny Oasis (xanh lá) và Dark Purple (tím than). Điều đặc biệt là realme C67 5G sở hữu khả năng kháng nước IP54.', null, N'2023-12-18_realmec67.jpg', 1, 6, 45, null, 6, 1, 7);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (0, 30, N'2023-12-18', 3500000.0, 1800000.0, N'OPPO A17K là mẫu điện thoại giá rẻ đáng chú ý được ra mắt vào tháng 10/2022, máy nổi bật với viên pin 5000 mAh, thiết kế đẹp cùng màn hình lớn giúp nâng cao trải nghiệm hình ảnh khi xem phim, chơi game giải trí.
Diện mạo vuông vắn cùng màu sắc hiện đại
OPPO A17K mang một thiết kế thanh lịch khi được tạo hình theo kiểu vuông vức với mặt lưng và bộ khung làm phẳng. Điện thoại có độ dày khoảng 8.3 mm nên khi nhìn tổng thể nó tạo cho mình cảm giác thanh thoát, gọn gàng hơn.', null, N'2023-12-18_oppo-a17k-vang.webp', 1, 7, 46, null, 3, 5, 7);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 40, N'2023-12-18', 6990000.0, 4000000.0, N'OPPO A78 một sản phẩm được nhà OPPO cho ra mắt với thiết kế trẻ trung, thiết bị này được đánh giá có hiệu năng ổn định, màn hình sắc nét và viên pin có dung lượng lớn, phù hợp cho người dùng sử dụng lâu dài.', null, N'2023-12-18_oppo-a78-den-.webp', 1, 6, 47, null, 3, 2, 10);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 40, N'2023-12-18', 5990000.0, 2500000.0, N'Thị trường điện thoại di động ngày nay, OPPO A58 8GB là một trong những sản phẩm nổi bật với thiết kế vuông vức và hiện đại. Được thiết kế với mục tiêu tối ưu hóa trải nghiệm người dùng, chiếc điện thoại này mang đến một loạt tính năng ấn tượng trong một thiết kế thon gọn và nhẹ nhàng.', null, N'2023-12-18_oppo-a58-4g-xanh.webp', 1, 9, 48, null, 3, 1, 9);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 50, N'2023-12-18', 3990000.0, 1500000.0, N'Samsung Galaxy A04s là mẫu điện thoại giá rẻ đáng chú ý được Samsung ra mắt vào tháng 09/2022, máy nổi bật với các thông số như màn hình tần số quét 90 Hz, camera 50 MP cùng hiệu năng ổn định với chip Exynos 850.
', null, N'2023-12-18_samsung-galaxy-a04s-den.webp', 1, 6, 49, null, 2, 5, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-11', 22000000.0, 18500000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 1', N'2024-01-11_Apple-iPhone-13-Pro-Max-Black.jpg', 1, 6, 1, 1, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-11', 23000000.0, 18500000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 1', N'2024-01-11_iphone-13-pro-max-mau-trang.jpg', 1, 10, 1, 1, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 20, N'2024-01-11', 21000000.0, 18500000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 1', N'2024-01-11_13prm_blue.jpg', 1, 3, 1, 1, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-11', 24000000.0, 18500000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 1', N'2024-01-11_13prm_hồng.jpg', 1, 4, 1, 1, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (10, 20, N'2024-01-11', 20000000.0, 17600000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 2', N'2024-01-11_13pr_green.jpeg', 1, 5, 2, 2, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 20, N'2023-11-27', 19000000.0, 17600000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 2', N'2023-11-27_Iphone-13-Pro-mau-vang-1.jpg', 1, 7, 2, 2, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (10, 20, N'2024-01-11', 19000000.0, 17600000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 2', N'2024-01-11_13pr_whlite.webp', 1, 10, 2, 2, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 20, N'2024-01-11', 22000000.0, 17600000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 2', N'2024-01-11_13pr_black.jpg', 1, 6, 2, 2, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (16, 20, N'2024-01-11', 18500000.0, 16000000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 3', N'2023-11-27_ip13 pro blue.jpeg', 1, 3, 3, 3, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 20, N'2024-01-12', 19000000.0, 16000000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 3', N'2024-01-11_13_hồng.webp', 1, 4, 3, 3, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 20, N'2024-01-12', 19000000.0, 16000000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 3', N'2024-01-11_13_green.webp', 1, 5, 3, 3, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (10, 20, N'2024-01-11', 20000000.0, 16000000.0, N'Apple iPhone 13 Pro Max 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 3', N'2024-01-11_13_black.webp', 1, 6, 3, 3, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (16, 20, N'2024-01-11', 15000000.0, 14000000.0, N'Apple iPhone 13 MiNi 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 4', N'2023-11-27_13 mini hồng.png', 1, 4, 4, 4, 1, 1, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 20, N'2024-01-11', 19000000.0, 14000000.0, N'Apple iPhone 13 MiNi 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 4', N'2024-01-11_13mn_blue.jpg', 1, 3, 4, 4, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (10, 20, N'2024-01-11', 16000000.0, 14000000.0, N'Apple iPhone 13 MiNi 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 4', N'2023-11-27_13 mini hồng.png', 1, 4, 4, 4, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (8, 20, N'2024-01-11', 16000000.0, 14000000.0, N'Apple iPhone 13 MiNi 2021 vẫn có một cụm camera mới với kích thước lớn hơn, tích hợp một loạt những nâng cấp nhằm cho ra những bức ảnh, video tốt hơn. Màn hình Pro Motion 120Hz cũng là điểm nhấn mới của iPhone dòng Pro năm nay bên cạnh thời lượng pin được kéo dài đáng kể.

', N'Danh mục 4', N'2024-01-11_13mn_green.jpg', 1, 5, 4, 4, 1, 2, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 20, N'2024-01-11', 26000000.0, 20000000.0, N'iPhone 15 được cho là sẽ được trang bị những tính năng và cải tiến đáng chú ý. Và trong đó, chip 5G mới, camera chính được nâng cấp lên 48MP, cổng USB-C, cảm biến camera mới từ Sony và nhiều tính năng khác sẽ là điểm nhấn của sản phẩm này', N'Danh mục 5', N'2023-11-27_15 blue.webp', 1, 3, 5, 5, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (10, 20, N'2024-01-11', 24000000.0, 20000000.0, N'iPhone 15 được cho là sẽ được trang bị những tính năng và cải tiến đáng chú ý. Và trong đó, chip 5G mới, camera chính được nâng cấp lên 48MP, cổng USB-C, cảm biến camera mới từ Sony và nhiều tính năng khác sẽ là điểm nhấn của sản phẩm này', N'Danh mục 5', N'2024-01-11_15_black.webp', 1, 6, 5, 5, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (12, 20, N'2024-01-11', 24000000.0, 20000000.0, N'iPhone 15 được cho là sẽ được trang bị những tính năng và cải tiến đáng chú ý. Và trong đó, chip 5G mới, camera chính được nâng cấp lên 48MP, cổng USB-C, cảm biến camera mới từ Sony và nhiều tính năng khác sẽ là điểm nhấn của sản phẩm này', N'Danh mục 5', N'2024-01-11_15_vàng.webp', 1, 7, 5, 5, 1, 3, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (13, 20, N'2024-01-11', 26000000.0, 20000000.0, N'iPhone 15 được cho là sẽ được trang bị những tính năng và cải tiến đáng chú ý. Và trong đó, chip 5G mới, camera chính được nâng cấp lên 48MP, cổng USB-C, cảm biến camera mới từ Sony và nhiều tính năng khác sẽ là điểm nhấn của sản phẩm này', N'Danh mục 5', N'2024-01-11_15_hồng.webp', 1, 4, 5, 5, 1, 4, 3);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-12', 13000000.0, 10000000.0, N'Galaxy S21 Ultra cũ là một trong những mẫu điện thoại cao cấp của Samsung với màn hình Dynamic AMOLED 2X 6.8 inch, camera sau 108MP, pin 5000mAh và sạc nhanh 25W. Điện thoại này được trang bị chip Exynos 2100 hoặc Snapdragon 888, tùy thuộc vào thị trường và phiên bản.', N'Danh mục 6', N'2024-01-12_ss_s21_hồng.jpg', 1, 4, 6, 6, 2, 1, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (9, 20, N'2024-01-12', 14000000.0, 10000000.0, N'Galaxy S21 Ultra cũ là một trong những mẫu điện thoại cao cấp của Samsung với màn hình Dynamic AMOLED 2X 6.8 inch, camera sau 108MP, pin 5000mAh và sạc nhanh 25W. Điện thoại này được trang bị chip Exynos 2100 hoặc Snapdragon 888, tùy thuộc vào thị trường và phiên bản.', N'Danh mục 6', N'2023-11-27_Samsung Galaxy S21 Ultra blue.webp', 1, 3, 6, 6, 2, 2, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-12', 15000000.0, 10000000.0, N'Galaxy S21 Ultra cũ là một trong những mẫu điện thoại cao cấp của Samsung với màn hình Dynamic AMOLED 2X 6.8 inch, camera sau 108MP, pin 5000mAh và sạc nhanh 25W. Điện thoại này được trang bị chip Exynos 2100 hoặc Snapdragon 888, tùy thuộc vào thị trường và phiên bản.', N'Danh mục 6', N'2024-01-12_2023-12-17_Galaxy-S22-Ultra-tím.jpg', 1, 4, 6, 6, 2, 3, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (5, 20, N'2024-01-12', 15000000.0, 10000000.0, N'Galaxy S21 Ultra cũ là một trong những mẫu điện thoại cao cấp của Samsung với màn hình Dynamic AMOLED 2X 6.8 inch, camera sau 108MP, pin 5000mAh và sạc nhanh 25W. Điện thoại này được trang bị chip Exynos 2100 hoặc Snapdragon 888, tùy thuộc vào thị trường và phiên bản.', N'Danh mục 6', N'2024-01-12_ss_s21_green.jpg', 1, 5, 6, 6, 2, 3, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (13, 20, N'2024-01-12', 10000000.0, 8000000.0, N'Đắm chìm trong vẻ đẹp tuyệt tác đến từ Samsung Galaxy S21+ 5G 256 GB, làm chủ cuộc chơi với hiệu năng hàng đầu, cụm camera chuyên nghiệp cùng tốc độ 5G bức phá mọi giới hạn, mẫu điện thoại cho bạn thỏa sức khám phá cuộc sống, thể hiện cá tính theo cách riêng của mình.', N'Danh mục 7', N'2024-01-12_ss_s21_Blue.jpg', 1, 3, 7, 7, 2, 2, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (13, 20, N'2024-01-12', 11000000.0, 8000000.0, N'Đắm chìm trong vẻ đẹp tuyệt tác đến từ Samsung Galaxy S21+ 5G 256 GB, làm chủ cuộc chơi với hiệu năng hàng đầu, cụm camera chuyên nghiệp cùng tốc độ 5G bức phá mọi giới hạn, mẫu điện thoại cho bạn thỏa sức khám phá cuộc sống, thể hiện cá tính theo cách riêng của mình.', N'Danh mục 7', N'2024-01-12_s21+_black.jpg', 1, 6, 7, 7, 2, 2, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (13, 20, N'2023-11-27', 10000000.0, 8000000.0, N'Đắm chìm trong vẻ đẹp tuyệt tác đến từ Samsung Galaxy S21+ 5G 256 GB, làm chủ cuộc chơi với hiệu năng hàng đầu, cụm camera chuyên nghiệp cùng tốc độ 5G bức phá mọi giới hạn, mẫu điện thoại cho bạn thỏa sức khám phá cuộc sống, thể hiện cá tính theo cách riêng của mình.', N'Danh mục 7', N'2023-11-27_Samsung Galaxy S21+ hồng.jpg', 1, 4, 7, 7, 2, 1, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 20, N'2024-01-12', 20000000.0, 14000000.0, N'Điện thoại Galaxy S21 5G nằm trong series S21 đến từ Samsung nổi bật với thiết kế tràn viền, cụm camera ấn tượng cho đến hiệu năng mạnh mẽ hàng đầu.', N'Danh mục 8', N'2024-01-12_s21_vang.jpg', 1, 7, 8, 8, 2, 3, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 20, N'2024-01-12', 20000000.0, 14000000.0, N'Điện thoại Galaxy S21 5G nằm trong series S21 đến từ Samsung nổi bật với thiết kế tràn viền, cụm camera ấn tượng cho đến hiệu năng mạnh mẽ hàng đầu.', N'Danh mục 8', N'2024-01-12_s21_tím.webp', 1, 8, 8, 8, 2, 3, 8);
INSERT INTO DATN.dbo.ChiTietSanPham (SoLuongBan, SoLuongNhap, NgayNhap, GiaBan, GiaNhap, Mota, DanhMuc, HinhAnhUrl, TrangThai, MaMauSac, MaSanPham, MaHinhAnh, MaNSX, MaDungLuong, MaChip) VALUES (6, 20, N'2024-01-12', 18000000.0, 14000000.0, N'Điện thoại Galaxy S21 5G nằm trong series S21 đến từ Samsung nổi bật với thiết kế tràn viền, cụm camera ấn tượng cho đến hiệu năng mạnh mẽ hàng đầu.', N'Danh mục 8', N'2023-11-27_Samsung Galaxy S21 đen.webp', 1, 6, 8, 8, 2, 2, 8);


INSERT INTO ChucVu(TenChucVu,TrangThai)VALUES
(N'Nhân Viên',1),
('Admin',1)

    INSERT INTO NhanVien(Ten,MatKhau,CCCD,NgaySinh,Email,GioiTinh,Sdt,DiaChi,MaChucVu,TrangThai)VALUES
    ( N'Nguyễn Văn A', '123456','026203002086','1999-11-18', 'nguyenvana@gmail.com', 1, '0123456789', N'Hà Nội', 2,  1),
    ( N'Lê Thị B', '123456','026203002086','2000-11-18', 'lethib@gmail.com', 0, '0987654321', N'Hà Nội', 1,  1),
    ( N'Trần Thu C', '123456','026203002083','1997-11-18', 'tranthuc@gmail.com', 0, '0123456789', N'Hà Nội', 1,  0);
-- INSERT INTO KhachHang(Ten,MatKhau,Email,GioiTinh,NgaySinh,CCCD,Sdt,DiaChi,MaVoucher,TrangThai)VALUES
-- ( N'Nguyễn Văn An', '123456', 'nguyenvanan@gmail.com', 1,'2002-11-18','026203002086', '0123456789', N'Hà Nội', NULL, 1),
-- ( N'Lê Thị Bình', '123456', 'lethibinh@gmail.com', 0,'2001-11-18','026203002086', '0987654321', N'Hà Nội' , NULL, 1),
-- ( N'Trần Thu Chinh', '123456', 'tranthuchinh@gmail.com', 0,'2000-11-18','026203002086', '0123456789', N'Hà Nội' , NULL, 0),
-- ( N'Phạm Thị Dung', '123456', 'phamthidung@gmail.com', 1,'1990-11-18','026203002086', '0987654321', N'Hà Nội' , NULL, 1),
-- ( N'Hoàng Văn Tú', '123456', 'hoangvantu@gmail.com', 1,'2000-11-18','026203002086', '0123456789', N'Hà Nội' , NULL, 1)
--
--     INSERT INTO DATN.dbo.HoaDon (NgayTao, DiaChi, NgayThanhToan, LoaiThanhToan, TongTien, NguoiNhan, SdtNguoiNhan, TrangThai, MaNhanVien, MaKhachHang, GhiChu, Tinh, Huyen, Xa) VALUES (N'2023-10-26', N'Nhà 1', N'2023-10-26', 1, 30000000.0000, N'Son1', N'0374236659', 1, 1, 1, null, N'Bắc Ninh', N'Huyện Gia Bình', N'Xã Đại Lai');
-- INSERT INTO DATN.dbo.HoaDon (NgayTao, DiaChi, NgayThanhToan, LoaiThanhToan, TongTien, NguoiNhan, SdtNguoiNhan, TrangThai, MaNhanVien, MaKhachHang, GhiChu, Tinh, Huyen, Xa) VALUES (N'2023-10-27', N'Nhà 2', N'2023-10-27', 1, 30000000.0000, N'Son2', N'0374236759', 1, 2, 2, null, N'Bắc Ninh', N'Huyện Gia Bình', N'Xã Đại Lai');
-- INSERT INTO DATN.dbo.HoaDon (NgayTao, DiaChi, NgayThanhToan, LoaiThanhToan, TongTien, NguoiNhan, SdtNguoiNhan, TrangThai, MaNhanVien, MaKhachHang, GhiChu, Tinh, Huyen, Xa) VALUES (N'2023-10-28', N'Nhà 3', N'2023-10-28', 1, 20000000.0000, N'Son3', N'0374238759', 1, 2, 3, null, N'Bắc Ninh', N'Huyện Gia Bình', N'Xã Đại Lai');
-- INSERT INTO DATN.dbo.HoaDon (NgayTao, DiaChi, NgayThanhToan, LoaiThanhToan, TongTien, NguoiNhan, SdtNguoiNhan, TrangThai, MaNhanVien, MaKhachHang, GhiChu, Tinh, Huyen, Xa) VALUES (N'2023-10-29', N'Nhà 4', N'2023-10-29', 1, 72000000.0000, N'Son4', N'0374236459', 1, 2, 4, null, N'Bắc Ninh', N'Huyện Gia Bình', N'Xã Đại Lai');
-- INSERT INTO DATN.dbo.HoaDon (NgayTao, DiaChi, NgayThanhToan, LoaiThanhToan, TongTien, NguoiNhan, SdtNguoiNhan, TrangThai, MaNhanVien, MaKhachHang, GhiChu, Tinh, Huyen, Xa) VALUES (N'2023-10-30', N'Nhà 5', N'2023-10-30', 1, 24000000.0000, N'Son5', N'0374236759', 2, 3, 5, null, N'Bắc Ninh', N'Huyện Gia Bình', N'Xã Đại Lai');
-- INSERT INTO DATN.dbo.HoaDonChiTiet (SoLuongMua, GiaTien, TrangThai, MaHoaDon, MaChiTietSanPham) VALUES (2, 15000000.0000, 1, 1, 1);
-- INSERT INTO DATN.dbo.HoaDonChiTiet (SoLuongMua, GiaTien, TrangThai, MaHoaDon, MaChiTietSanPham) VALUES (3, 10000000.0000, 1, 2, 2);
-- INSERT INTO DATN.dbo.HoaDonChiTiet (SoLuongMua, GiaTien, TrangThai, MaHoaDon, MaChiTietSanPham) VALUES (1, 20000000.0000, 1, 3, 3);
-- INSERT INTO DATN.dbo.HoaDonChiTiet (SoLuongMua, GiaTien, TrangThai, MaHoaDon, MaChiTietSanPham) VALUES (4, 18000000.0000, 1, 4, 4);
-- INSERT INTO DATN.dbo.HoaDonChiTiet (SoLuongMua, GiaTien, TrangThai, MaHoaDon, MaChiTietSanPham) VALUES (2, 12000000.0000, 1, 5, 5);
-- INSERT INTO GioHang(MoTa,TrangThai,MaKhachHang)VALUES
-- (N'Mô tả 1', 1, 1),
-- (N'Mô tả 2', 1, 2),
-- (N'Mô tả 3', 1, 3),
-- (N'Mô tả 4', 1, 4),
-- (N'Mô tả 5', 1, 5)
--     INSERT INTO GioHangChiTiet(SoLuong,TrangThai,MaGioHang,MaChiTietSanPham)VALUES
--     (2, 1, 1, 1),
--     (3, 1, 2, 2),
--     (1, 1, 3, 3),
--     (4, 1, 4, 4),
--     (2, 1, 5, 5)

alter table DanhGia ADD NgayDanhGia Date

ALTER TABLE GiamGiaChiTietSanPham
    Add MoTa NVARCHAR(200);

ALTER TABLE Voucher
    Add SoLuongToiThieu Int;
ALTER TABLE GiaoDichVi
    Add Ma nvarchar(max);
ALTER TABLE Voucher
    Add DonGiaToiThieu decimal(20, 1) Null;
GO
ALTER TABLE NhanVien
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE KhachHang
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE SanPham
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE HoaDon
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE HoaDonChiTiet
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE ChiTietSanPham
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE GiamGiaSanPham
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE GiamGiaChiTietSanPham
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE Voucher
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE Chip
    ADD CreatedDate DATE,LastUpdate DATE;

ALTER TABLE DungLuong
    ADD CreatedDate DATE,LastUpdate DATE;

ALTER TABLE NSX
    ADD CreatedDate DATE,LastUpdate DATE;

ALTER TABLE MauSac
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE ChucVu
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE VoucherChiTiet
    ADD CreatedDate DATE,LastUpdate DATE;
ALTER TABLE HoaDonChiTiet
    ADD Imei NVARCHAR(50);
ALTER TABLE DanhGia
    ADD MaSanPham Bigint FOREIGN KEY REFERENCES SanPham(MaSanPham)


ALTER TABLE GiamGiaChiTietSanPham
    ADD MaSanPham Bigint

ALTER TABLE HoaDon
    ADD MaVoucher Bigint