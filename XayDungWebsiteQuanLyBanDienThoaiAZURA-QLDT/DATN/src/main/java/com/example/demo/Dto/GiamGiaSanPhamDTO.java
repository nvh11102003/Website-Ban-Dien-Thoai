package com.example.demo.Dto;

import jakarta.persistence.Column;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiamGiaSanPhamDTO {
    private Long maGiamGia;
    private String tenGiamGia;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private Integer phanTramSale;
    private Integer trangThai;
    private Integer statusV;

    public GiamGiaSanPhamDTO(Long maGiamGia, String tenGiamGia, Date ngayBatDau, Date ngayKetThuc, Integer phanTramSale, Integer trangThai) {
        this.maGiamGia = maGiamGia;
        this.tenGiamGia = tenGiamGia;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.phanTramSale = phanTramSale;
        this.trangThai = trangThai;
    }

    public void convertStatus(){
        Date dateNow = new Date();
        if (this.ngayKetThuc.before(dateNow) || this.trangThai == 0){
            this.statusV = 0;
        }else{
            this.statusV = 1;
        }
    }
}
