package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "giaodichvi")
public class GiaoDichVi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "magiaodichvi")
    private Long maGiaoDichVi;

    @ManyToOne
    @JoinColumn(name = "mavishop")
    private ViShop viShop;

    @ManyToOne
    @JoinColumn(name = "manhanvien")
    private NhanVien nhanVien;

    @Column(name = "dongia")
    BigDecimal donGia;

    @Column(name = "ngaygiaodich")
    LocalDateTime ngayGiaoDich;

    @Column(name = "hinhthuc")
    private int hinhThuc;

    @Column(name = "trangthai")
    private int trangThai;

    @Column(name = "ma")
    private String ma;
}
