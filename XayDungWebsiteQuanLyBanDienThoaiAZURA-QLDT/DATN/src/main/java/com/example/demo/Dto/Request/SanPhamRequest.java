package com.example.demo.Dto.Request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamRequest {

    private Long maSanPham;

    private String tenSanPham;

    private String heDieuHanh;

    private Integer ram;

    private String manHinh;

    private String cameraTruoc;

    private String cameraSau;

    private String sim;

    private Integer dungLuongPin;

    private Integer trangThai;
}
