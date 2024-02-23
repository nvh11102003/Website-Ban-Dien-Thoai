package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamTHongKeDTO {
    private Long soLuongMua;
    private Long maSanPham;
    private String tenSanPham;
    private BigDecimal giaBan;
    private String giaBanString;

    public SanPhamTHongKeDTO(Long soLuongMua, Long maSanPham, String tenSanPham, BigDecimal giaBan) {
        this.soLuongMua = soLuongMua;
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
    }

    public void convert(){
        if(this.giaBan != null){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaBanString = currencyFormat.format(this.giaBan);
        }
    }
}
