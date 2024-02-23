package com.example.demo.Dto.Request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class HoaDonChiTietRequest {

    private Long maHoaDonChiTiet;

    private Integer soLuongMua;

    private BigDecimal giaTien;

    private Integer trangThai;

}
