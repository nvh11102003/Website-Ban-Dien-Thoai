package com.example.demo.Dto.Request;

import com.example.demo.Dto.DanhSachSanPhamHoaDonDTO;
import lombok.Data;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Data
public class HoaDonRequest {

    private Long maHoaDon;

    private Date ngayTao;

    private String diaChi;

    private BigDecimal tongTien;

    private Integer trangThai;

    private String ngayBatDau;

    private String ngayKetThuc;

    private String ngayThanhToan;

    private String khachHang;

    private String nguoiNhan;

    private String ghiChu;

    private Integer loaiThanhToan;

    private List<DanhSachSanPhamHoaDonDTO> danhSachSanPhamHoaDonDTOS;

    private Long maVoucher;

}
