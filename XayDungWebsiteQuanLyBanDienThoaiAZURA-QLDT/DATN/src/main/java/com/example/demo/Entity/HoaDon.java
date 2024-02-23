package com.example.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "hoadon")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mahoadon")
    private Long maHoaDon;

    @Column(name = "ngaytao")
    private Date ngayTao;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "tinh")
    private String tinh;

    @Column(name = "huyen")
    private String huyen;

    @Column(name = "xa")
    private String xa;

    @Column(name = "nguoinhan")
    private String nguoiNhan;

    @Column(name = "sdtnguoinhan")
    private String sdt;

    @Column(name = "tongtien")
    private BigDecimal tongTien;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngaythanhtoan")
    private Date ngayThanhToan;

    @Column(name = "loaithanhtoan")
    private Integer loaiThanhToan;

    @Column(name = "ghichu")
    private String ghiChu;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;

    @ManyToOne
    @JoinColumn(name = "makhachhang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "manhanvien")
    private NhanVien nhanVien;

    @Column(name = "mavoucher")
    private Long maVoucher;
}
