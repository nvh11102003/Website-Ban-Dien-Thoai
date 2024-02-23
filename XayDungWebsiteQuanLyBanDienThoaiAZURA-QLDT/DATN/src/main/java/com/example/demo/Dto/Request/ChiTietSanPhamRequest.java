package com.example.demo.Dto.Request;

import com.example.demo.Entity.*;
import jakarta.persistence.Column;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ChiTietSanPhamRequest {

    private Long maChiTietSanPham;

    private Long maSanPham;

    private Long maChip;

    private Long maDungLuong;

    private BigDecimal giaBan;

    private BigDecimal giaNhap;

    private Long maHinhAnh;

    private Long maMauSac;

    private String moTa;

    private Date ngayNhap;

    private Long maNSX;

    private SanPham sanPham;

    private Integer soLuongBan;

    private Integer soLuongNhap;

    private Integer trangThai;

    private String tenSanPham;

    private String tenDungLuong;

    private String heDieuHanh;

    private Integer ram;

    private String manHinh;

    private Integer dungLuongPin;

    private String hinhAnhURL;

    private String cameratruoc;

    private String camerasau;

    private String sim;

}
