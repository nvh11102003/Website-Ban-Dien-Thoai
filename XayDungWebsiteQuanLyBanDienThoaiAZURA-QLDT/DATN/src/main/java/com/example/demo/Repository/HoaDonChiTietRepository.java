package com.example.demo.Repository;

import com.example.demo.Dto.DanhSachSanPhamHoaDonDTO;
import com.example.demo.Dto.SanPhamBaoHanhDTO;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Long> {
    List<HoaDonChiTiet> getAllByHoaDon(HoaDon hd);

    @Query("SELECT new com.example.demo.Dto.DanhSachSanPhamHoaDonDTO(hdct.maHoaDonChiTiet,sp.tenSanPham, hdct.soLuongMua, " +
            "hdct.giaTien, hdct.imei, ctsp.mauSac.tenMauSac, ctsp.dungLuong.tenDungLuong) FROM HoaDonChiTiet hdct " +
            "JOIN ChiTietSanPham ctsp ON ctsp.maChiTietSanPham = hdct.chiTietSanPham.maChiTietSanPham " +
            "JOIN SanPham sp ON sp.maSanPham = ctsp.sanPham.maSanPham " +
            "WHERE hdct.hoaDon.maHoaDon = :maHoaDon")
    List<DanhSachSanPhamHoaDonDTO> getDsSPOFHoaDon(@Param("maHoaDon") Long maHoaDon);


    @Query("SELECT hdct FROM HoaDonChiTiet hdct JOIN HoaDon hd ON hdct.hoaDon.maHoaDon = hd.maHoaDon " +
            "WHERE hdct.imei = :imei " +
            "AND hd.trangThai IN (1, 2, 4)")
    HoaDonChiTiet checkImei(@Param("imei") String imei);

    @Query("SELECT new com.example.demo.Dto.SanPhamBaoHanhDTO(SP.tenSanPham, CTSP.sanPham.maSanPham,CTSP.mauSac.tenMauSac, " +
            "CTSP.dungLuong.tenDungLuong,hdct.imei, HD.ngayThanhToan, HD.khachHang.ten) FROM HoaDonChiTiet hdct " +
            "JOIN HoaDon HD on hdct.hoaDon.maHoaDon = HD.maHoaDon " +
            "JOIN ChiTietSanPham CTSP on CTSP.maChiTietSanPham = hdct.chiTietSanPham.maChiTietSanPham " +
            "JOIN SanPham SP on CTSP.sanPham.maSanPham = SP.maSanPham " +
            "WHERE HD.trangThai IN (2, 4) " +
            "AND (:imei IS NULL OR hdct.imei = :imei) " +
            "AND (:tenSanPhamSearch IS NULL OR SP.tenSanPham LIKE %:tenSanPhamSearch% ) " +
            "AND (:ngayBatDau IS NULL OR HD.ngayThanhToan >= :ngayBatDau) " +
            "AND (:ngayKetThuc IS NULL OR HD.ngayThanhToan <= :ngayKetThuc) ")
    List<SanPhamBaoHanhDTO> searchSanPhamBaoHanh(@Param("tenSanPhamSearch") String tenSanPhamSearch,
                                                 @Param("imei") String imei,
                                                 @Param("ngayBatDau") Date ngayBatDau,
                                                 @Param("ngayKetThuc") Date ngayKetThuc);
}
