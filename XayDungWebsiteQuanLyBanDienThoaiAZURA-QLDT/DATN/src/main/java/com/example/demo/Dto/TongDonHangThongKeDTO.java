package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TongDonHangThongKeDTO {
    private String tenKhachHang;
    private List<String> danhSachSanPham;
    private Integer soLuongMua;
    private BigDecimal tongTien;
}
