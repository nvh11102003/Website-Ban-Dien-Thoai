package com.example.demo.Repository.GiamGia;

import com.example.demo.Dto.VoucherDTO;
import com.example.demo.Entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GiamGiaHoaDonRepository extends JpaRepository<Voucher, Long> {

    @Query("SELECT new com.example.demo.Dto.VoucherDTO(v.maVoucher, v.ten, v.phanTramVoucher, v.ngayBatDau, v.ngayKetThuc, " +
            "v.trangthai, v.soLuongToiThieu, v.donGiaToiThieu) FROM Voucher v ")
    List<VoucherDTO> viewAll();
}
