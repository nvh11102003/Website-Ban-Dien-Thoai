package com.example.demo.Repository;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.SanPhamTHongKeDTO;
import com.example.demo.Entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham,Long> {

    SanPham findByTenSanPham(String tenSanPham);

    @Query("SELECT count(sp) FROM SanPham sp ")
    Integer countSanPhamDangCo();



    @Query("SELECT new com.example.demo.Dto.SanPhamTHongKeDTO(SUM(hdct.soLuongMua), sp.maSanPham, sp.tenSanPham, ctsp.giaBan) FROM SanPham sp JOIN ChiTietSanPham ctsp ON sp.maSanPham = ctsp.sanPham.maSanPham " +
            "JOIN HoaDonChiTiet hdct ON ctsp.maChiTietSanPham = hdct.chiTietSanPham.maChiTietSanPham JOIN HoaDon HD on hdct.hoaDon.maHoaDon = HD.maHoaDon WHERE HD.trangThai IN (2,4) " +
            "GROUP BY sp.tenSanPham, sp.maSanPham, ctsp.giaBan " +
            "ORDER BY SUM(hdct.soLuongMua) DESC ")
    List<SanPhamTHongKeDTO> top10SanPhamBanChayNhat();



    @Query("SELECT SUM(hdct.soLuongMua) FROM ChiTietSanPham ctsp " +
            "JOIN HoaDonChiTiet hdct ON hdct.chiTietSanPham.maChiTietSanPham = ctsp.maChiTietSanPham " +
            "JOIN HoaDon hd ON hd.maHoaDon = hdct.hoaDon.maHoaDon " +
            "WHERE (:maSP IS NULL OR ctsp.sanPham.maSanPham = :maSP) " +
            "AND (:ngayBatDau IS NULL OR hd.ngayThanhToan >= :ngayBatDau) " +
            "AND (:ngayKetThuc IS NULL OR hd.ngayThanhToan <= :ngayKetThuc) " +
            "AND hd.trangThai IN (2, 4)")
    Integer tongSoLuongBan(@Param("maSP") Long maSP,
                           @Param("ngayBatDau") Date ngayBatDau,
                           @Param("ngayKetThuc") Date ngayKetThuc);

    @Query("SELECT SUM(ctsp.soLuongNhap) FROM SanPham sp JOIN ChiTietSanPham ctsp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "WHERE sp.trangThai = 1 AND (:maSP IS NULL OR sp.maSanPham = :maSP)")
    Integer tongSoLuongNhap(@Param("maSP") Long maSP);

    @Query("SELECT sp FROM SanPham sp WHERE sp.trangThai = 1")
    List<SanPham> danhSachSPConHang();

    @Query("SELECT sp FROM SanPham sp JOIN ChiTietSanPham ctsp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "WHERE (:tenSanPham IS NULL OR sp.tenSanPham = :tenSanPham) " +
            "AND (:maMauSac IS NULL OR ctsp.mauSac.maMauSac = :maMauSac )  " +
            "AND (:maDungLuong IS NULL OR ctsp.dungLuong.maDungLuong = :maDungLuong) " +
            "AND (:maSP IS NULL OR sp.maSanPham = :maSP) " +
            "AND sp.trangThai = 1")
    SanPham sanPhamCheckTT(@Param("tenSanPham") String tenSanPham,
                           @Param("maDungLuong") Long maDungLuong,
                           @Param("maMauSac") Long maMauSac,
                           @Param("maSP") Long maSP);

}

