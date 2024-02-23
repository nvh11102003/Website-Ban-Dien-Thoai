package com.example.demo.Repository;

import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface VoucherRepository  extends JpaRepository<Voucher, Long> {

    @Query("SELECT v FROM Voucher v WHERE v.trangthai = 1 AND v.soLuongToiThieu <= :soLuongMuaTT AND " +
            "v.donGiaToiThieu <= :donGiaMuaTT and v.ngayKetThuc >= :ngayHienTai  and v.ngayBatDau <= :ngayHienTai " +
            "ORDER BY v.lastUpdate DESC")
    List<Voucher> fillListVoucher(@Param("soLuongMuaTT") Integer soLuongMuaTT,
                                  @Param("donGiaMuaTT") BigDecimal donGiaMuaTT,
                                  @Param("ngayHienTai") Date ngayHienTai);

    List<Voucher> findVoucherByOrderByLastUpdateDesc();

    @Query("SELECT v FROM Voucher v WHERE v.ngayKetThuc <= :dateNow")
    List<Voucher> getListGGHDInactive(@Param("dateNow") Date dateNow);

}
