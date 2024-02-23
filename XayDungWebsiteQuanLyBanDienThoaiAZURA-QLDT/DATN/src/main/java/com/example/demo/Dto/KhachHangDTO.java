package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KhachHangDTO {
    private Long maKhachHang;
    private String tenKhachHang;
    private Boolean gioiTinh;
    private String CCCD;
    private Date ngaySinh;
    private String diaChi;
    private String sdt;
    private String email;
    private String gioiTinhString;
    private Integer tuoi;

    public KhachHangDTO(Long maKhachHang, String tenKhachHang, Boolean gioiTinh, String CCCD, Date ngaySinh, String diaChi, String sdt, String email) {
        this.maKhachHang = maKhachHang;
        this.tenKhachHang = tenKhachHang;
        this.gioiTinh = gioiTinh;
        this.CCCD = CCCD;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
    }

    public void convertString(){
        if(this.gioiTinh!=null){
            if(this.gioiTinh.equals(true)){
                this.gioiTinhString = "Nam";
            }else {
                this.gioiTinhString = "Nữ";
            }
        }
    }
}
