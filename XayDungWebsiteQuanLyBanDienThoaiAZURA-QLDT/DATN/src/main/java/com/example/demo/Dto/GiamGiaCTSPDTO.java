package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiamGiaCTSPDTO {
    private Long maGiamGiaChiTiet;
    private Long maGiamGia;
    private Long maChiTietSanPham;
    private Integer trangThai;
    private String tenGiamGia;
    private String tenSanPham;
    private Integer phanTramGiam;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private BigDecimal giaBanDau;
    private BigDecimal giaSauKhiGiam;
    private String moTa;
    private String tenMauSac;
    private String tenDungLuong;
    private Long maSanPham;

    private String giaBanDauString;
    private String giaSauKhiGiamString;

    public GiamGiaCTSPDTO(Long maGiamGiaChiTiet, Long maGiamGia, Long maChiTietSanPham, Integer trangThai,
                          String tenGiamGia,String tenSanPham,Integer phanTramGiam, Date ngayBatDau, Date ngayKetThuc,
                          BigDecimal giaBanDau, BigDecimal giaSauKhiGiam, String moTa, String tenMauSac, String tenDungLuong) {
        this.maGiamGiaChiTiet = maGiamGiaChiTiet;
        this.maGiamGia = maGiamGia;
        this.maChiTietSanPham = maChiTietSanPham;
        this.trangThai = trangThai;
        this.tenGiamGia = tenGiamGia;
        this.tenSanPham = tenSanPham;
        this.phanTramGiam = phanTramGiam;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.giaBanDau = giaBanDau;
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.moTa = moTa;
        this.tenMauSac = tenMauSac;
        this.tenDungLuong = tenDungLuong;
    }

    public GiamGiaCTSPDTO(Long maGiamGiaChiTiet, Long maGiamGia, Long maChiTietSanPham, Integer trangThai, String tenGiamGia, Integer phanTramGiam, Date ngayBatDau, Date ngayKetThuc, BigDecimal giaBanDau, BigDecimal giaSauKhiGiam, String moTa, String tenMauSac) {
        this.maGiamGiaChiTiet = maGiamGiaChiTiet;
        this.maGiamGia = maGiamGia;
        this.maChiTietSanPham = maChiTietSanPham;
        this.trangThai = trangThai;
        this.tenGiamGia = tenGiamGia;
        this.phanTramGiam = phanTramGiam;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.giaBanDau = giaBanDau;
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.moTa = moTa;
        this.tenMauSac = tenMauSac;
    }

    public void convert(){
        if(this.giaBanDau != null ){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaBanDauString = currencyFormat.format(this.giaBanDau);
        }

        if(this.giaSauKhiGiam != null ){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaSauKhiGiamString = currencyFormat.format(this.giaSauKhiGiam);
        }
    }
}
