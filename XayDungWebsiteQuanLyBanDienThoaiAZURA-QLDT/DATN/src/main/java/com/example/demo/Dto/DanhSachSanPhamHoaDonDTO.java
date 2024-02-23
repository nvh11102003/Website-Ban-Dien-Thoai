package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DanhSachSanPhamHoaDonDTO {
    private Long maHDCT;
    private String tenSanpham;
    private Integer soLuong;
    private BigDecimal giaTien;
    private String imei;
    private String tenMauSac;
    private String tenDungLuong;
    private String giaTienString;

    public DanhSachSanPhamHoaDonDTO(Long maHDCT, String tenSanpham, Integer soLuong, BigDecimal giaTien, String imei,
                                    String tenMauSac, String tenDungLuong) {
        this.maHDCT = maHDCT;
        this.tenSanpham = tenSanpham;
        this.soLuong = soLuong;
        this.giaTien = giaTien;
        this.imei = imei;
        this.tenMauSac = tenMauSac;
        this.tenDungLuong = tenDungLuong;
    }

    public void convertGiaTien(){
        if(this.giaTien != null ){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaTienString = currencyFormat.format(this.giaTien);
        }
        if(this.imei == null){
            this.imei = "";
        }
    }

}
