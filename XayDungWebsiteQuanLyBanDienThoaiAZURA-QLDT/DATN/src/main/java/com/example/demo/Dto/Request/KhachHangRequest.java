package com.example.demo.Dto.Request;

import com.example.demo.Entity.Voucher;
import lombok.Data;

import java.util.Date;

@Data
public class KhachHangRequest {

    private Long maKhachHang;

    private String tenKhachHang;

    private String email;

    private String matKhau;

    private  String sdt;

    private String diaChi;

    private  Boolean gioiTinh;

    private Integer trangThai;

    private Voucher voucher;


    private Date ngaySinh;

    private  String cccd;
}
