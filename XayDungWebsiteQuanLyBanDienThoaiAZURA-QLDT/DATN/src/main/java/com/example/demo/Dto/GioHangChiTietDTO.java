package com.example.demo.Dto;

import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GioHang;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GioHangChiTietDTO {
    private Long magiohangchitiet;
    private Integer soLuong;
    private Integer trangThai;
    private GioHang gioHang;
    private ChiTietSanPham chiTietSanPham;
    private BigDecimal giaSauKhiGiam;

    public GioHangChiTietDTO(Long magiohangchitiet, Integer soLuong, Integer trangThai, GioHang gioHang, ChiTietSanPham chiTietSanPham) {
        this.magiohangchitiet = magiohangchitiet;
        this.soLuong = soLuong;
        this.trangThai = trangThai;
        this.gioHang = gioHang;
        this.chiTietSanPham = chiTietSanPham;
    }
}
