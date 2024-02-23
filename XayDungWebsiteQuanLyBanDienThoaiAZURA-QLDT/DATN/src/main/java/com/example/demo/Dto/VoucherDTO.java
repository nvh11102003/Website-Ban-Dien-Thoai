package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoucherDTO {
    private Long maVoucher;
    private String ten;
    private Integer phanTramVoucher;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private Integer trangthai;
    private Integer soLuongToiThieu;
    private BigDecimal donGiaToiThieu;
    private Integer statusV;

    public VoucherDTO(Long maVoucher, String ten, Integer phanTramVoucher, Date ngayBatDau, Date ngayKetThuc, Integer trangthai, Integer soLuongToiThieu, BigDecimal donGiaToiThieu) {
        this.maVoucher = maVoucher;
        this.ten = ten;
        this.phanTramVoucher = phanTramVoucher;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.trangthai = trangthai;
        this.soLuongToiThieu = soLuongToiThieu;
        this.donGiaToiThieu = donGiaToiThieu;
    }

    public void convertStatus(){
        Date dateNow = new Date();
        if (this.ngayKetThuc.before(dateNow) || this.trangthai == 0){
            this.statusV = 0;
        }else{
            this.statusV = 1;
        }
    }
}
