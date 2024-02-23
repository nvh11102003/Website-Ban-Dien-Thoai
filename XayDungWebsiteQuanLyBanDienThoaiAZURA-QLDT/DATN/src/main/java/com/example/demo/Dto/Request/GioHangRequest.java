package com.example.demo.Dto.Request;

import com.example.demo.Entity.KhachHang;
import lombok.Data;

@Data
public class GioHangRequest {

    private Long maGioHang;

    private String moTa;

    private KhachHang khachHang;

    private Long maKhachHang;

    private Integer trangThai;

}
