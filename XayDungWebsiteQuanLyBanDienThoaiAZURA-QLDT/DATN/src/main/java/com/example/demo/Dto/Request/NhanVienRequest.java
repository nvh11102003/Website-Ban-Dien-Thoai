package com.example.demo.Dto.Request;

import lombok.Data;

import java.util.Date;

@Data
public class NhanVienRequest {
    private Long maNhanVien;
    private String ho;
    private String tenDem;
    private String ten;
    private String email;
    private String matKhau;
    private String sdt;
    private String diaChi;
    private String cccd;
    private String ngaySinh;
    private Integer trangThai;
    private Long maGiaoCa;
    private Long maChucVu;
}
