package com.example.demo.Dto.Request;

import lombok.Data;

import java.util.Date;

@Data
public class SanPhamBaoHanhRequest {
    private String tenSanPhamSearch;

    private String imei;

    private String ngayBatDau;

    private String ngayKetThuc;
}
