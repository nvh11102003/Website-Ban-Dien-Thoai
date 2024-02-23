package com.example.demo.Dto.Response;

import com.example.demo.Utils.DateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonResponse {
    private Long maHoaDon;
    private String tenKhachHang;
    private String nguoiNhan;
    private String tinh;
    private String huyen;
    private String xa;
    private String diaChi;
    private BigDecimal tongTien;
    private String tenNhanVien;
    private Integer trangThai;
    private Date ngayThanhToan;
    private Integer loaiThanhToan;
    private String ghiChu;
    private String loaiThanhToanString;
    private String ngayThanhToanString;
    private String tongTienString;
    private String trangThaiString;
    private Long maVoucher;
    private String tenVoucher;
    private Integer phanTramGiam;


    public HoaDonResponse(Long maHoaDon, String tenKhachHang,String nguoiNhan, String tinh, String huyen, String xa, String diaChi, BigDecimal tongTien, String tenNhanVien, Integer trangThai, Date ngayThanhToan, Integer loaiThanhToan, String ghiChu) {
        this.maHoaDon = maHoaDon;
        this.tenKhachHang = tenKhachHang;
        this.nguoiNhan = nguoiNhan;
        this.tinh = tinh;
        this.huyen = huyen;
        this.xa = xa;
        this.diaChi = diaChi;
        this.tongTien = tongTien;
        this.tenNhanVien = tenNhanVien;
        this.trangThai = trangThai;
        this.ngayThanhToan = ngayThanhToan;
        this.loaiThanhToan = loaiThanhToan;
        this.ghiChu = ghiChu;
    }

    public void convertTongTien(){
        if(this.ghiChu == null){
            this.ghiChu = "";
        }
        if(this.tongTien != null){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.tongTienString = currencyFormat.format(this.tongTien);
        }
        this.ngayThanhToanString = DateUtils.date2String(this.ngayThanhToan, "dd/MM/yyyy");
        if(this.trangThai == 1){
            this.trangThaiString = "Đang giao hàng";
        }else if(this.trangThai == 0){
            this.trangThaiString = "Chờ xác nhận";
        }else if(this.trangThai == 2){
            this.trangThaiString = "Giao hàng thành công";
        }else if(this.trangThai == 3){
            this.trangThaiString = "Hủy";
        }else if(this.trangThai == 4){
            this.trangThaiString = "Quầy";
        }else if(this.trangThai == 5){
            this.trangThaiString = "Giao hàng thất bại";
        }
        if(this.loaiThanhToan == 1){
            this.loaiThanhToanString = "Đã thanh toán";
        }else if(this.loaiThanhToan == 0) {
            this.loaiThanhToanString = "Thanh toán khi nhận hàng";
        }else if(this.loaiThanhToan == 2) {
            this.loaiThanhToanString = "Thanh toán tại quầy";
        }else if(this.loaiThanhToan == 3) {
            this.loaiThanhToanString = "Thanh toán tại quầy";
        }
    }


    public HoaDonResponse(Long maHoaDon, String tenKhachHang,String nguoiNhan, String tinh, String huyen, String xa, String diaChi, BigDecimal tongTien, String tenNhanVien, Integer trangThai, Date ngayThanhToan, Integer loaiThanhToan, String ghiChu, Long maVoucher) {
        this.maHoaDon = maHoaDon;
        this.tenKhachHang = tenKhachHang;
        this.nguoiNhan = nguoiNhan;
        this.tinh = tinh;
        this.huyen = huyen;
        this.xa = xa;
        this.diaChi = diaChi;
        this.tongTien = tongTien;
        this.tenNhanVien = tenNhanVien;
        this.trangThai = trangThai;
        this.ngayThanhToan = ngayThanhToan;
        this.loaiThanhToan = loaiThanhToan;
        this.ghiChu = ghiChu;
        this.maVoucher = maVoucher;
    }
}
