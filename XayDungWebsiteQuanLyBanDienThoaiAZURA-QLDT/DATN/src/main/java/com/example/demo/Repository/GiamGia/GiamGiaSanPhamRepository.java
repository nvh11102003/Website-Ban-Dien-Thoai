package com.example.demo.Repository.GiamGia;

import com.example.demo.Dto.GiamGiaSanPhamDTO;
import com.example.demo.Entity.GiamGiaSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface GiamGiaSanPhamRepository extends JpaRepository<GiamGiaSanPham, Long> {

    @Query("SELECT new com.example.demo.Dto.GiamGiaSanPhamDTO(gg.maGiamGia, gg.tenGiamGia, gg.ngayBatDau, " +
            "gg.ngayKetThuc, gg.phanTramSale, gg.trangThai) FROM GiamGiaSanPham gg ")
    List<GiamGiaSanPhamDTO> viewALl();

    @Query("SELECT gg FROM GiamGiaSanPham gg WHERE gg.ngayKetThuc >= :ngayHienTai")
    List<GiamGiaSanPham> findALlActive(@Param("ngayHienTai") Date ngayHienTai);

    @Query("SELECT gg FROM GiamGiaSanPham gg ")
    List<GiamGiaSanPham> findALlActiveAndNotActive();

    @Query("SELECT gg FROM GiamGiaSanPham gg WHERE gg.ngayKetThuc <= :ngayHienTai")
    List<GiamGiaSanPham> findALlInactive(@Param("ngayHienTai") Date ngayHienTai);
}
