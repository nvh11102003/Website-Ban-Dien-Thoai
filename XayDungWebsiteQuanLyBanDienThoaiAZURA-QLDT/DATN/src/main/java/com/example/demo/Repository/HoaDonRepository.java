package com.example.demo.Repository;

import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Response.HoaDonResponse;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Long> {

    @Query("SELECT new com.example.demo.Dto.Response.HoaDonResponse(hd.maHoaDon, kh.ten,hd.nguoiNhan,hd.tinh,hd.huyen,hd.xa, hd.diaChi, " +
            "hd.tongTien, nv.ten, hd.trangThai, hd.ngayThanhToan, hd.loaiThanhToan, hd.ghiChu, hd.maVoucher) FROM HoaDon hd " +
            "JOIN KhachHang kh ON kh.maKhachHang = hd.khachHang.maKhachHang " +
            "JOIN NhanVien  nv ON nv.maNhanVien = hd.nhanVien.maNhanVien " +
            "WHERE (:trangThai IS NULL OR hd.trangThai = :trangThai) " +
            "AND (:ngayBatDau IS NULL OR hd.ngayThanhToan >= :ngayBatDau) " +
            "AND (:ngayKetThuc IS NULL OR hd.ngayThanhToan <= :ngayKetThuc) " +
            "AND (:khachHang IS NULL OR kh.ten LIKE CONCAT( '%', :khachHang, '%')) " +
            "AND (:nguoiNhan IS NULL OR hd.nguoiNhan LIKE CONCAT( '%', :nguoiNhan, '%')) " +
            "ORDER BY hd.lastUpdate DESC ")
    List<HoaDonResponse> searchHoaDon(@Param("trangThai") Integer trangThai,
                                      @Param("ngayBatDau") Date ngayBatDau,
                                      @Param("ngayKetThuc") Date ngayKetThuc,
                                      @Param("khachHang") String khachHang,
                                      @Param("nguoiNhan") String nguoiNhan);

    @Query("SELECT new com.example.demo.Dto.Response.HoaDonResponse(hd.maHoaDon, kh.ten,hd.nguoiNhan,hd.tinh,hd.huyen,hd.xa, hd.diaChi, " +
            "hd.tongTien, nv.ten, hd.trangThai, hd.ngayThanhToan, hd.loaiThanhToan, hd.ghiChu)  FROM HoaDon hd " +
            "JOIN KhachHang kh ON kh.maKhachHang = hd.khachHang.maKhachHang " +
            "JOIN NhanVien  nv ON nv.maNhanVien = hd.nhanVien.maNhanVien " +
            "ORDER BY hd.lastUpdate DESC")
    List<HoaDonResponse> viewALl();

    List<HoaDon> findAllBykhachHang(KhachHang khachHang);

    HoaDon getBykhachHang(KhachHang khachHang);

    List<HoaDon> getByKhachHangAndTrangThai(KhachHang khachHang, Integer trangThai);

    HoaDon getHoaDonByKhachHangAndTrangThai(KhachHang khachHang, Integer trangThai);

    @Query("SELECT new com.example.demo.Dto.HoaDonChiTietDTO(hd.maHoaDon, kh.maKhachHang, " +
            "kh.ten, hd.nguoiNhan, hd.diaChi, hd.trangThai, hd.tongTien, hd.loaiThanhToan) " +
            "FROM HoaDon hd " +
            "JOIN KhachHang kh ON kh.maKhachHang = hd.khachHang.maKhachHang " +
            "WHERE hd.maHoaDon = :maHoaDon")
    HoaDonChiTietDTO getDetailHD(@Param("maHoaDon") Long maHoaDon);

    @Query("select hd from HoaDon hd where hd.khachHang.maKhachHang = ?1 and hd.trangThai = ?2")
    List<HoaDon> findByKhachHangAndTrangThai(Long maKhachHang, int trangThai);

    @Query("SELECT count(hd) FROM HoaDon hd ")
    Integer tongDonHang();

    @Query("SELECT count(hd) FROM HoaDon hd WHERE hd.trangThai = 3")
    Integer tongDonHangHuy();

    @Query("SELECT SUM(hd.tongTien) FROM HoaDon hd WHERE hd.trangThai IN (2,4) ")
    BigDecimal tongDoangThu();

    @Query("SELECT new com.example.demo.Dto.HoaDonChiTietDTO(hd.maHoaDon, kh.maKhachHang, " +
            "kh.ten, hd.nguoiNhan, hd.diaChi, hd.trangThai, hd.tongTien, hd.loaiThanhToan, hd.ngayThanhToan) " +
            "FROM HoaDon hd " +
            "JOIN KhachHang kh ON kh.maKhachHang = hd.khachHang.maKhachHang " +
            "WHERE hd.trangThai IN (2,4)")
    List<HoaDonChiTietDTO> danhSachDOnHangThanhCong();

    @Query("SELECT new com.example.demo.Dto.HoaDonChiTietDTO(hd.maHoaDon, kh.maKhachHang, " +
            "kh.ten, hd.nguoiNhan, hd.diaChi, hd.trangThai, hd.tongTien, hd.loaiThanhToan, hd.ngayThanhToan) " +
            "FROM HoaDon hd " +
            "JOIN KhachHang kh ON kh.maKhachHang = hd.khachHang.maKhachHang " +
            "WHERE hd.trangThai IN(2,4) " +
            "AND (:ngayBatDau IS NULL OR hd.ngayThanhToan >= :ngayBatDau) " +
            "AND (:ngayKetThuc IS NULL OR hd.ngayThanhToan <= :ngayKetThuc) ")
    List<HoaDonChiTietDTO> danhSachDOnHangThanhCongTheoNgay(@Param("ngayBatDau") Date ngayBatDau,
                                                            @Param("ngayKetThuc") Date ngayKetThuc);

    @Query("SELECT hd FROM HoaDon hd WHERE hd.trangThai = 1")
    List<HoaDon> findAllHoaDonTTGiaoHang();
}
