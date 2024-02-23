package com.example.demo.Dto.Request;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class GiamGiaHoaDonRequest {
    Long maGiamGia;
    String tenGiamGia;
    String ngayBatDau;
    String ngayKetThuc;
    Integer phamTramSale;
    Integer trangThai;
    Integer soLuongMuaTT;
    BigDecimal donGiaMuaTT;
}
