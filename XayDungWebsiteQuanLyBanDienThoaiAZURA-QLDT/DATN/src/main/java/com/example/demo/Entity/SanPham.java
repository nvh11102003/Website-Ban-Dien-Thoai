package com.example.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "sanpham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "masanpham")
    private Long maSanPham;

    @Column(name = "tensanpham")
    private String tenSanPham;

    @Column(name = "hedieuhanh")
    private String heDieuHanh;

    @Column(name = "ram")
    private Integer ram;

    @Column(name = "manhinh")
    private String manhinh;

    @Column(name = "cameratruoc")
    private String cameratruoc;

    @Column(name = "camerasau")
    private String camerasau;

    @Column(name = "sim")
    private String sim;

    @Column(name = "dungluongpin")
    private Integer dungLuongPin;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;

}
