package com.example.demo.Entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity(name = "voucherchitiet")
@Getter
@Setter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class VoucherChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mavoucherchitiet")
    private Long maVoucherChiTiet;

    @Column(name = "giasaukhigiam")
    private BigDecimal giaSauKhiGiam;

    @ManyToOne
    @JoinColumn(name = "mavoucher")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Voucher voucher;

    @ManyToOne
    @JoinColumn(name = "mahoadon")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private HoaDon hoaDon;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;
}
