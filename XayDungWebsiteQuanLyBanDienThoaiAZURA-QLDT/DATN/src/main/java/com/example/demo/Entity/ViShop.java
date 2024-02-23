package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "vishop")
public class ViShop {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mavishop")
    private Long maViShop;

    @Column(name = "tongtien")
    private BigDecimal tongTien;

    @ManyToOne
    @JoinColumn(name = "makhachhang")
    private KhachHang khachHang;

    @Column(name = "trangthai")
    private int trangThai;
}
