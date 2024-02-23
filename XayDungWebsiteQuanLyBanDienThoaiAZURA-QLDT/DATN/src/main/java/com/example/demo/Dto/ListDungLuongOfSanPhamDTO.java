package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class ListDungLuongOfSanPhamDTO {
    private String tenSP;
    private Long maSP;
    private Long maDungLuong;
    private String tenDungLuong;
    private BigDecimal giaBan;
    private BigDecimal giaBanSauKhiGG;

    public ListDungLuongOfSanPhamDTO(String tenSP, Long maSP, Long maDungLuong, String tenDungLuong, BigDecimal giaBan) {
        this.tenSP = tenSP;
        this.maSP = maSP;
        this.maDungLuong = maDungLuong;
        this.tenDungLuong = tenDungLuong;
        this.giaBan = giaBan;
    }

    public ListDungLuongOfSanPhamDTO(BigDecimal giaBan, BigDecimal giaBanSauKhiGG) {
        this.giaBan = giaBan;
        this.giaBanSauKhiGG = giaBanSauKhiGG;
    }

    public ListDungLuongOfSanPhamDTO(Long maDungLuong, String tenDungLuong, BigDecimal giaBan) {
        this.maDungLuong = maDungLuong;
        this.tenDungLuong = tenDungLuong;
        this.giaBan = giaBan;
    }

    public ListDungLuongOfSanPhamDTO(Long maDungLuong, String tenDungLuong, BigDecimal giaBan, BigDecimal giaBanSauKhiGG) {
        this.maDungLuong = maDungLuong;
        this.tenDungLuong = tenDungLuong;
        this.giaBan = giaBan;
        this.giaBanSauKhiGG = giaBanSauKhiGG;
    }
}
