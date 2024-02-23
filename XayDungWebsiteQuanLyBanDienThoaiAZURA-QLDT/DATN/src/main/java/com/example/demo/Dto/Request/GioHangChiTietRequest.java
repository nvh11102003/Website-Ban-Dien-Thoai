package com.example.demo.Dto.Request;

import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GioHang;
import lombok.Data;

@Data
public class GioHangChiTietRequest {

    private Long magiohangchitiet;

    private Integer soLuong;

    private String moTa;

    private GioHang gioHang;

    private Long maGioHang;

    private ChiTietSanPham chiTietSanPham;

    private Long maChiTietSanPham;

    private Integer trangThai;
}
