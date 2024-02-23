package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class SanPhamHTDTO {
    private Long maChiTietSanPham;
    private String tenSanPham;
    private String hinhAnhURL;
    private BigDecimal giaBan;
    private BigDecimal giaSauKhiGiam;
    private Integer checkSPGG;
    private String dungLuong;

    public SanPhamHTDTO(Long maChiTietSanPham, String tenSanPham, String hinhAnhURL, BigDecimal giaBan,BigDecimal giaSauKhiGiam, String dungLuong) {
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnhURL = hinhAnhURL;
        this.giaBan = giaBan;
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.dungLuong = dungLuong;
    }

    public void CheckGGSP(){
        if(this.giaSauKhiGiam == null){
            this.checkSPGG = 1;
        }else {
            this.checkSPGG=0;
        }
    }

}

