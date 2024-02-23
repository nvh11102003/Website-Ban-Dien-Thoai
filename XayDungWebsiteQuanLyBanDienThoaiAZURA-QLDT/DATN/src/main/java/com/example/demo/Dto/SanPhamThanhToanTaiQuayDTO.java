package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamThanhToanTaiQuayDTO {
    private Long maChiTietSanPham;
    private Integer soLuongMua;
    private BigDecimal giaTien;
    private String imei;
}
