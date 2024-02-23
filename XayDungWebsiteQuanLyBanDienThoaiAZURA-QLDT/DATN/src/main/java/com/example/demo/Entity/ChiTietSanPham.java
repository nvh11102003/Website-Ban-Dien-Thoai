package com.example.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
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
@Table(name = "chitietsanpham")
public class ChiTietSanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "machitietsanpham")
    private Long maChiTietSanPham;

    @Column(name = "soluongnhap")
    private Integer soLuongNhap;

    @Column(name = "soluongban")
    private Integer soLuongBan;

    @Column(name = "ngaynhap")
    private Date ngayNhap;

    @Column(name = "giaban")
    private BigDecimal giaBan;

    @Column(name = "gianhap")
    private BigDecimal giaNhap;

    @Column(name = "mota")
    private String moTa;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "hinhanhurl")
    private String hinhAnhURL;

    @ManyToOne
    @JoinColumn(name = "mamausac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "masanpham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "mahinhanh")
    private HinhAnh hinhAnh;

    @ManyToOne
    @JoinColumn(name = "mansx")
    private NSX nsx;

    @ManyToOne
    @JoinColumn(name = "madungluong")
    private DungLuong dungLuong;

    @ManyToOne
    @JoinColumn(name = "machip")
    private Chip chip;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;

    public ChiTietSanPham(BigDecimal giaBan, SanPham sanPham, HinhAnh hinhAnh) {
        this.giaBan = giaBan;
        this.sanPham = sanPham;
        this.hinhAnh = hinhAnh;
    }

    public ChiTietSanPham(Long maChiTietSanPham, BigDecimal giaBan, String hinhAnhURL) {
        this.maChiTietSanPham = maChiTietSanPham;
        this.giaBan = giaBan;
        this.hinhAnhURL = hinhAnhURL;
    }
}
