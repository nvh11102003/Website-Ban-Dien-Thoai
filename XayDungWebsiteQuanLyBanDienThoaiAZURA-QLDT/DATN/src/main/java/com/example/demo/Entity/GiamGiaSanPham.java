package com.example.demo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "giamgiasanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GiamGiaSanPham implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "magiamgia")
    private Long maGiamGia;

    @Column(name = "tengiamgia")
    private String tenGiamGia;

    @Column(name = "ngaybatdau")
    @Temporal(TemporalType.DATE)
    private Date ngayBatDau;

    @Column(name = "ngayketthuc")
    @Temporal(TemporalType.DATE)
    private Date ngayKetThuc;

    @Column(name = "phantramsale")
    private Integer phanTramSale;

    @Column(name = "trangthai")
    private Integer trangThai;

    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "lastupdate")
    private Date lastUpdate;

    @Transient
    private String tenGiamGiaView;

    public void convert(){
        if(this.getNgayKetThuc().before(new Date())){
            this.tenGiamGiaView = this.tenGiamGia + (" (Hết hạn)");
        }else {
            this.tenGiamGiaView = this.tenGiamGia + (" (Hoạt động)");
        }

        if(this.trangThai == 0){
            this.tenGiamGiaView = this.tenGiamGia + (" (Hết hạn)");
        }else {
            this.tenGiamGiaView = this.tenGiamGia + (" (Hoạt động)");
        }
    }

}
