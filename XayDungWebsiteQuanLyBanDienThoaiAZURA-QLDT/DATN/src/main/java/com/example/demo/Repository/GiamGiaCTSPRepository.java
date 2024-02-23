package com.example.demo.Repository;

import com.example.demo.Dto.GiamGiaCTSPDTO;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface GiamGiaCTSPRepository extends JpaRepository<GiamGiaChiTietSanPham, Long> {

    @Query("SELECT new com.example.demo.Dto.GiamGiaCTSPDTO(ggctsp.maGiamGiaChiTiet, ggsp.maGiamGia," +
            " ctsp.maChiTietSanPham, ggctsp.trangThai, ggsp.tenGiamGia, ctsp.sanPham.tenSanPham, ggsp.phanTramSale, " +
            "ggsp.ngayBatDau, ggsp.ngayKetThuc, ctsp.giaBan, ggctsp.giaSauKhiGiam, ggctsp.moTa, ctsp.mauSac.tenMauSac, ctsp.dungLuong.tenDungLuong) " +
            "FROM GiamGiaChiTietSanPham ggctsp " +
            "JOIN ChiTietSanPham ctsp ON ctsp.maChiTietSanPham = ggctsp.chiTietSanPham.maChiTietSanPham " +
            "JOIN GiamGiaSanPham ggsp ON ggsp.maGiamGia = ggctsp.giamGiaSanPham.maGiamGia " +
            "WHERE (:maSP IS NULL OR ctsp.sanPham.maSanPham = :maSP) " +
            "AND (:maGG IS NULL OR ggsp.maGiamGia = :maGG) " +
            "AND (:maMS IS NULL OR ctsp.mauSac.maMauSac = :maMS) " +
            "AND (:maDL IS NULL OR ctsp.dungLuong.maDungLuong = :maDL) " +
            "ORDER BY ggctsp.lastUpdate DESC")
    List<GiamGiaCTSPDTO> searchGiamGiaCTSP(@Param("maSP") Long maSP,
                                           @Param("maDL") Long maDL,
                                           @Param("maMS") Long maMS,
                                           @Param("maGG") Long maGG);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.chiTietSanPham.maChiTietSanPham = :maCTSP " +
            "AND ggctsp.trangThai = 1")
    GiamGiaChiTietSanPham checkGiamGiaTonTai(@Param("maCTSP") Long maCTSP);

    @Query("SELECT new com.example.demo.Dto.GiamGiaCTSPDTO(ggctsp.maGiamGiaChiTiet, ggsp.maGiamGia," +
            " ggctsp.chiTietSanPham.maChiTietSanPham, ggctsp.trangThai, ggsp.tenGiamGia, ctsp.sanPham.tenSanPham, ggsp.phanTramSale, " +
            "ggsp.ngayBatDau, ggsp.ngayKetThuc, ctsp.giaBan, ggctsp.giaSauKhiGiam, ggctsp.moTa, ctsp.mauSac.tenMauSac, ctsp.dungLuong.tenDungLuong) " +
            "FROM GiamGiaChiTietSanPham ggctsp " +
            "JOIN ChiTietSanPham ctsp ON ctsp.maChiTietSanPham = ggctsp.chiTietSanPham.maChiTietSanPham " +
            "JOIN GiamGiaSanPham ggsp ON ggsp.maGiamGia = ggctsp.giamGiaSanPham.maGiamGia" +
            " where ggctsp.maGiamGiaChiTiet = :maGGCTSP")
    GiamGiaCTSPDTO detailGiamGiaCTSP(@Param("maGGCTSP") Long maCTSP);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.chiTietSanPham.maChiTietSanPham = :maCTSP " +
            "AND ggctsp.trangThai = 1")
    GiamGiaChiTietSanPham fillGGCTSP(@Param("maCTSP") Long maCTSP);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.chiTietSanPham.maChiTietSanPham = :maCTSP " +
            "AND ggctsp.giamGiaSanPham.maGiamGia = :maGG ")
    GiamGiaChiTietSanPham checkGiamGiaAndMaGG(@Param("maCTSP") Long maCTSP,
                                             @Param("maGG") Long maGG);

    List<GiamGiaChiTietSanPham> findAllByTrangThai(Integer t);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.giamGiaSanPham.ngayKetThuc <= :ngayHienTai")
    List<GiamGiaChiTietSanPham> findAllHetHan(@Param("ngayHienTai") Date ngayHienTai);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.maSanPham = :maSP " +
            "AND (:maDL is NULL OR ggctsp.chiTietSanPham.dungLuong.maDungLuong = :maDL)")
    List<GiamGiaChiTietSanPham> getListGGBySPAndDL(@Param("maSP") Long maSP,
                                              @Param("maDL") Long maDL);

    @Query("SELECT ggctsp FROM GiamGiaChiTietSanPham ggctsp WHERE ggctsp.giamGiaSanPham.maGiamGia = :maGGSP ")
    List<GiamGiaChiTietSanPham> getGGCTSPBymaGGSP(@Param("maGGSP") Long maGGSP);

    GiamGiaChiTietSanPham findByChiTietSanPham(ChiTietSanPham ma);


}
