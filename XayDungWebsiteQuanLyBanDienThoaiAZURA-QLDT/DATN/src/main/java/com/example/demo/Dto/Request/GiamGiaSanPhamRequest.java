package com.example.demo.Dto.Request;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class GiamGiaSanPhamRequest {
    Long maGiamGia;
    String tenGiamGia;

    String ngayBatDau;

    String ngayKetThuc;

    Integer phamTramSale;

    Integer trangThai;
}
