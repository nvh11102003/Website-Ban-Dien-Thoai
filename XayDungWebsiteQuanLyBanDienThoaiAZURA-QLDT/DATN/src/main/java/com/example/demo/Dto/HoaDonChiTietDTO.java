package com.example.demo.Dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Data
@NoArgsConstructor
public class HoaDonChiTietDTO {
    private Long maHoaDon;
    private Long maKhachHang;
    private String tenKhachHang;
    private String nguoiNhan;
    private String diaChi;
    private Integer trangThai;
    private List<DanhSachSanPhamHoaDonDTO> danhSachSanPhamHoaDonDTOS;
    private BigDecimal tongTien;
    private Integer loaiThanhToan;
    private Date ngayThanhToan;

    private String tongTienString;
    private String trangThaiString;
    private List<String> danhSachSanPham;
    private Integer soLuongMua;

    public HoaDonChiTietDTO(Long maHoaDon, Long maKhachHang, String tenKhachHang, String nguoiNhan, String diaChi, Integer trangThai, BigDecimal tongTien, Integer loaiThanhToan) {
        this.maHoaDon = maHoaDon;
        this.maKhachHang = maKhachHang;
        this.tenKhachHang = tenKhachHang;
        this.nguoiNhan = nguoiNhan;
        this.diaChi = diaChi;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
        this.loaiThanhToan = loaiThanhToan;
    }

    public HoaDonChiTietDTO(Long maHoaDon, Long maKhachHang, String tenKhachHang, String nguoiNhan, String diaChi, Integer trangThai, BigDecimal tongTien, Integer loaiThanhToan, Date ngayThanhToan) {
        this.maHoaDon = maHoaDon;
        this.maKhachHang = maKhachHang;
        this.tenKhachHang = tenKhachHang;
        this.nguoiNhan = nguoiNhan;
        this.diaChi = diaChi;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
        this.loaiThanhToan = loaiThanhToan;
        this.ngayThanhToan = ngayThanhToan;
    }

    public void convertDataToString(){
        if(this.tongTien != null ){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.tongTienString = currencyFormat.format(this.tongTien);
        }

        if(this.trangThai == 1){
            this.trangThaiString = "Đã thanh toán";
        }
        this.trangThaiString = "Chưa thanh toán";

    }

}
