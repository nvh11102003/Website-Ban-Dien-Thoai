package com.example.demo.Entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "giamgiachitietsanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GiamGiaChiTietSanPham implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "magiamgiachitiet")
    private Long maGiamGiaChiTiet;

    @Column(name = "giasaukhigiam")
    private BigDecimal giaSauKhiGiam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "magiamgia")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private GiamGiaSanPham giamGiaSanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @JoinColumn(name = "machitietsanpham")
    private ChiTietSanPham chiTietSanPham;

    @Column(name = "masanpham")
    private Long maSanPham;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "mota")
    private String moTa;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;
}
