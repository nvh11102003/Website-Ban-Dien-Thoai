package com.example.demo.Dto.Request;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class VoucherRequest {

    private Long maVoucher;

    private Integer phamTramVoucher;

    private Date ngayBatDau;

    private Date ngayKetThuc;

    private Integer trangThai;

    private Integer soLuongMuaTT;

    private BigDecimal donGiaMuaTT;

}
