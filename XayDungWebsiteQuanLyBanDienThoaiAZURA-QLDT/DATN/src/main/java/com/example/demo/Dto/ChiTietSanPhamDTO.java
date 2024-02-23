package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietSanPhamDTO {
    private Long maSanPham;
    private Long maChiTietSanPham;
    private String tenSanPham;
    private String dungLuong;
    private BigDecimal giaBan;
    private BigDecimal giaNhap;
    private String hinhAnh;
    private Integer soLuongNhap;
    private Integer soLuongBan;
    private Integer tinhTrang;
    private String mauSac;
    private String tenNSX;
    private String tenChip;
    private Integer dungLuongPin;
    private String manHinh;
    private String giaBanString;
    private Integer soLuongTon;
    private String hinhAnhURL;
    private Long maDL;
    private Long maMS;
    private String giaNhapString;

    public ChiTietSanPhamDTO(Long maSanPham, Long maChiTietSanPham, String tenSanPham, String dungLuong, BigDecimal giaBan, String hinhAnh, Integer soLuongNhap, Integer soLuongBan, Integer tinhTrang, String mauSac, String tenNSX, String tenChip, Integer dungLuongPin, String manHinh, BigDecimal giaNhap) {
        this.maSanPham = maSanPham;
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.dungLuong = dungLuong;
        this.giaBan = giaBan;
        this.hinhAnh = hinhAnh;
        this.soLuongNhap = soLuongNhap;
        this.soLuongBan = soLuongBan;
        this.tinhTrang = tinhTrang;
        this.mauSac = mauSac;
        this.tenNSX = tenNSX;
        this.tenChip = tenChip;
        this.dungLuongPin = dungLuongPin;
        this.manHinh = manHinh;
        this.giaNhap = giaNhap;
    }

    public ChiTietSanPhamDTO(String tenSanPham, BigDecimal giaBan, String hinhAnhURL, Long maDL, Long maMS) {
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
        this.hinhAnhURL = hinhAnhURL;
        this.maDL = maDL;
        this.maMS = maMS;
    }

    public ChiTietSanPhamDTO(String tenSanPham, BigDecimal giaBan, String hinhAnhURL, String dungLuong, String mauSac) {
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
        this.hinhAnhURL = hinhAnhURL;
        this.dungLuong = dungLuong;
        this.mauSac = mauSac;
    }

    public ChiTietSanPhamDTO(Long maSanPham, Long maChiTietSanPham, String tenSanPham, BigDecimal giaBan, BigDecimal giaNhap, String hinhAnh, Integer soLuongNhap, Integer soLuongBan, Integer tinhTrang) {
        this.maSanPham = maSanPham;
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
        this.hinhAnh = hinhAnh;
        this.soLuongNhap = soLuongNhap;
        this.soLuongBan = soLuongBan;
        this.tinhTrang = tinhTrang;
    }

    public ChiTietSanPhamDTO(Long maSanPham, String tenSanPham) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
    }

    public void convertGiaBan(){
        if(this.giaBan != null){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaBanString = currencyFormat.format(this.giaBan);
        }
        if(this.giaNhap != null){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaNhapString = currencyFormat.format(this.giaNhap);
        }
        if(this.soLuongBan == null){
            this.soLuongTon = this.soLuongNhap;
        }else{
            this.soLuongTon = this.soLuongNhap - this.soLuongBan;
        }
    }

    public ChiTietSanPhamDTO(Long maSanPham, Long maChiTietSanPham, String tenSanPham, BigDecimal giaBan, BigDecimal giaNhap, String hinhAnh, Integer soLuongNhap, Integer soLuongBan, Integer tinhTrang, String dungLuong, String mauSac) {
        this.maSanPham = maSanPham;
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
        this.giaNhap = giaNhap;
        this.hinhAnh = hinhAnh;
        this.soLuongNhap = soLuongNhap;
        this.soLuongBan = soLuongBan;
        this.tinhTrang = tinhTrang;
        this.dungLuong = dungLuong;
        this.mauSac = mauSac;
    }
}
