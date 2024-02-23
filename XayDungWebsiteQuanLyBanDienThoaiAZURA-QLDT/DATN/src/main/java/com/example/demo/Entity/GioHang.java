package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "giohang")
public class GioHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "magiohang")
    private Long maGioHang;

    @Column(name = "mota")
    private String moTa;

    @ManyToOne
    @JoinColumn(name = "makhachhang")
    private KhachHang khachHang;

    @Column(name = "trangthai")
    private Integer trangThai;

    @OneToMany(mappedBy ="gioHang")
    private List<GioHangChiTiet> gioHangChiTietList;

}
