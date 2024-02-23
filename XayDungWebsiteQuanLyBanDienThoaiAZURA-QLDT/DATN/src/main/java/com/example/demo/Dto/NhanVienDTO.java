package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NhanVienDTO {
    private Long maNhanVien;
    private String hoVaTen;
    private String email;
    private String diaChi;
    private String soDienThoai;
    private String chucVu;
    private Integer trangThai;
    private String cccd;
    private Date ngaySinh;
    private String trangThaiString;

    public NhanVienDTO(Long maNhanVien, String hoVaTen, String email, String diaChi, String soDienThoai, String chucVu,
                       Integer trangThai, String cccd, Date ngaySinh) {
        this.maNhanVien = maNhanVien;
        this.hoVaTen = hoVaTen;
        this.email = email;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
        this.chucVu = chucVu;
        this.trangThai = trangThai;
        this.cccd = cccd;
        this.ngaySinh = ngaySinh;
    }

    public void convertTrangThaiToString(){
        if(this.trangThai == 1){
            this.trangThaiString = "Đang làm việc";
        }else{
            this.trangThaiString = "Nghỉ việc";
        }
    }
}
