package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamGiamGiaDTO {
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
    private BigDecimal giaSauKhiGiam;
    private Integer phanTramGiamGia;
    private String moTa;

    public SanPhamGiamGiaDTO(Long maSanPham, Long maChiTietSanPham, String tenSanPham, String dungLuong, BigDecimal giaBan, String hinhAnh, Integer soLuongNhap, Integer soLuongBan, Integer tinhTrang, String mauSac, String tenNSX, String tenChip, Integer dungLuongPin,
                             String manHinh, BigDecimal giaSauKhiGiam, Integer phanTramGiamGia,String moTa) {
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
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.phanTramGiamGia = phanTramGiamGia;
        this.moTa = moTa;
    }
}
