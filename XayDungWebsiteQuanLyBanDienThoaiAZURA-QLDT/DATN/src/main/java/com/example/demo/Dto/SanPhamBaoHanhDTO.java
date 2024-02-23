package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Data
@NoArgsConstructor
public class SanPhamBaoHanhDTO {
    private String tenSanPham;
    private Long maSanPham;
    private String mauSac;
    private String dungLuong;
    private String imei;
    private Date ngayMua;
    private Date ngayHetHanBaoHanh;
    private Integer trangThai;
    private String khachHang;
    private String ngayMuaString;
    private String ngayHetHanBaoHanhString;

    public SanPhamBaoHanhDTO(String tenSanPham, Long maSanPham, String mauSac, String dungLuong, String imei, Date ngayMua,
                             String khachHang) {
        this.tenSanPham = tenSanPham;
        this.maSanPham = maSanPham;
        this.mauSac = mauSac;
        this.dungLuong = dungLuong;
        this.imei = imei;
        this.ngayMua = ngayMua;
        this.khachHang = khachHang;
    }
    public void convert(){
        if(this.ngayMua!= null){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(this.ngayMua);
            calendar.add(Calendar.MONTH, 6);
            this.ngayHetHanBaoHanh = calendar.getTime();

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            this.ngayHetHanBaoHanhString = sdf.format(this.ngayHetHanBaoHanh);
            this.ngayMuaString = sdf.format(this.ngayMua);

            if(this.ngayHetHanBaoHanh.after(new Date())){
                this.trangThai = 1;
            }else{
                this.trangThai = 0;
            }
        }
    }
}
