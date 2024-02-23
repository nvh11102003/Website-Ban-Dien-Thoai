package com.example.demo.Dto.Response;

import com.example.demo.Dto.ListDungLuongOfSanPhamDTO;
import com.example.demo.Dto.ListMauSacOfSanPhamDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailSanPhamResponse {
    private Long maChiTietSanPham;
    private Long maSanPham;
    private String tenSanPham;
    private String hinhAnh;
    private Integer tinhTrang;
    private String tenNSX;
    private String tenChip;
    private Integer dungLuongPin;
    private String manHinh;
    private String sim;
    private String moTa;
    private BigDecimal giaBan;
    private String camerasau;
    private String cameratruoc;
    private String heDieuHanh;
    private Integer ram;
    private Integer soLuongBan;
    private Integer soLuongNhap;
    private List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS;
    private List<ListDungLuongOfSanPhamDTO> listDungLuongOfSanPhamDTOS;

    public DetailSanPhamResponse(Long maChiTietSanPham,Long maSanPham, String tenSanPham, String hinhAnh, Integer tinhTrang, String tenNSX, String tenChip, Integer dungLuongPin, String manHinh, String sim, String moTa, String camerasau, String cameratruoc, String heDieuHanh, Integer ram) {
        this.maChiTietSanPham = maChiTietSanPham;
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnh = hinhAnh;
        this.tinhTrang = tinhTrang;
        this.tenNSX = tenNSX;
        this.tenChip = tenChip;
        this.dungLuongPin = dungLuongPin;
        this.manHinh = manHinh;
        this.sim = sim;
        this.moTa = moTa;
        this.camerasau = camerasau;
        this.cameratruoc = cameratruoc;
        this.heDieuHanh = heDieuHanh;
        this.ram = ram;
    }
    public DetailSanPhamResponse(Long maSanPham, String tenSanPham, String hinhAnh, Integer tinhTrang, String tenNSX, String tenChip, Integer dungLuongPin, String manHinh, String sim, String moTa, String camerasau, String cameratruoc, String heDieuHanh, Integer ram,Integer soLuongBan,Integer soLuongNhap) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnh = hinhAnh;
        this.tinhTrang = tinhTrang;
        this.tenNSX = tenNSX;
        this.tenChip = tenChip;
        this.dungLuongPin = dungLuongPin;
        this.manHinh = manHinh;
        this.sim = sim;
        this.moTa = moTa;
        this.camerasau = camerasau;
        this.cameratruoc = cameratruoc;
        this.heDieuHanh = heDieuHanh;
        this.ram = ram;
        this.soLuongBan = soLuongBan;
        this.soLuongNhap = soLuongNhap;
    }

}
