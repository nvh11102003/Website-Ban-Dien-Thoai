package com.example.demo.Repository;

import com.example.demo.Dto.*;
import com.example.demo.Dto.Response.DetailSanPhamResponse;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.GioHangChiTiet;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, Long> {

    @Query("SELECT new com.example.demo.Dto.ChiTietSanPhamDTO(sp.maSanPham,ctsp.maChiTietSanPham, sp.tenSanPham,dl.tenDungLuong, ctsp.giaBan, " +
            "ctsp.hinhAnhURL, ctsp.soLuongNhap, ctsp.soLuongBan, ctsp.trangThai, ms.tenMauSac, nsx.tenNSX, c.tenChip, " +
            "sp.dungLuongPin, sp.manhinh, ctsp.giaNhap) " +
            "FROM ChiTietSanPham ctsp " +
            "join SanPham sp on ctsp.sanPham.maSanPham = sp.maSanPham " +
            "join DungLuong dl on ctsp.dungLuong.maDungLuong = dl.maDungLuong " +
            "join MauSac ms on ms.maMauSac = ctsp.mauSac.maMauSac " +
            "join Chip c on c.maChip = ctsp.chip.maChip " +
            "join NSX nsx on nsx.maNSX = ctsp.nsx.maNSX " +
            "WHERE ctsp.trangThai = 1 AND sp.trangThai = 1" +
            "AND (:tenSanPham IS NULL OR ctsp.sanPham.tenSanPham LIKE %:tenSanPham% ) " +
            "AND (:maSanPham IS NULL OR ctsp.sanPham.maSanPham = :maSanPham ) " +
            "AND (:tinhTrang IS NULL OR ctsp.trangThai =:tinhTrang) " +
            "AND (:mauSac IS NULL OR ctsp.mauSac.maMauSac =:mauSac) " +
            "AND (:dungLuong IS NULL OR ctsp.dungLuong.maDungLuong =:dungLuong) " +
            "AND (:nhaSanXuat IS NULL OR ctsp.nsx.maNSX =:nhaSanXuat)  " +
            "ORDER BY ctsp.lastUpdate DESC")
    List<ChiTietSanPhamDTO> searchChiTietSanPham(@Param("tenSanPham") String tenSanPham,
                                                 @Param("maSanPham") Long maSanPham,
                                                 @Param("tinhTrang") Integer tinhTrang,
                                                 @Param("mauSac") Long mauSac,
                                                 @Param("dungLuong") Long dungLuong,
                                                 @Param("nhaSanXuat") Long nhaSanXuat);

    @Query("SELECT new com.example.demo.Dto.ChiTietSanPhamDTO(sp.maSanPham,ctsp.maChiTietSanPham, sp.tenSanPham,dl.tenDungLuong, ctsp.giaBan," +
            " ctsp.hinhAnhURL, ctsp.soLuongNhap, ctsp.soLuongBan, ctsp.trangThai, ms.tenMauSac, nsx.tenNSX, c.tenChip, " +
            "sp.dungLuongPin, sp.manhinh, ctsp.giaNhap) " +
            "FROM ChiTietSanPham ctsp " +
            "join SanPham sp on ctsp.sanPham.maSanPham = sp.maSanPham " +
            "join DungLuong dl on ctsp.dungLuong.maDungLuong = dl.maDungLuong " +
            "join MauSac ms on ms.maMauSac = ctsp.mauSac.maMauSac " +
            "join Chip c on c.maChip = ctsp.chip.maChip " +
            "join NSX nsx on nsx.maNSX = ctsp.nsx.maNSX " +
            "ORDER BY ctsp.lastUpdate DESC")
    List<ChiTietSanPhamDTO> viewAllCTSP();

    @Query("SELECT new com.example.demo.Dto.ChiTietSanPhamDTO(sp.maSanPham,sp.tenSanPham) " +
            "FROM ChiTietSanPham ctsp " +
            "join SanPham sp on ctsp.sanPham.maSanPham = sp.maSanPham " +
            "GROUP BY sp.maSanPham,sp.tenSanPham ")
    List<ChiTietSanPhamDTO> viewAllCTSPGanGG();

    //    @Query("SELECT ctsp.sanPham.maSanPham AS maSanPham,SP.tenSanPham AS tenSanPham,ctsp.hinhAnhURL AS hinhAnhURL,ctsp.giaBan AS giaBan" +
//            "                                 FROM ChiTietSanPham ctsp JOIN SanPham SP ON SP.maSanPham = ctsp.sanPham.maSanPham  AND ctsp.sanPham.maSanPham NOT IN (" +
//            "                                         SELECT g.maSanPham FROM GiamGiaChiTietSanPham g WHERE g.trangThai = 1)" +
//            "                                WHERE ctsp.trangThai = 1 ")

    @Query("SELECT new com.example.demo.Dto.ChiTietSanPhamDTO(sp.tenSanPham,Max(c.giaBan) ,Max(c.hinhAnhURL) , MAX(c.dungLuong.tenDungLuong), MAX(c.mauSac.tenMauSac))\n" +
            "FROM ChiTietSanPham c\n" +
            "JOIN SanPham sp ON c.sanPham.maSanPham = sp.maSanPham\n" +
            "WHERE c.trangThai = 1 AND c.maChiTietSanPham NOT IN (SELECT gg.chiTietSanPham.maChiTietSanPham FROM GiamGiaChiTietSanPham gg WHERE gg.trangThai = 1)\n" +
            "GROUP BY sp.tenSanPham ")
    List<ChiTietSanPhamDTO> findAllNotGiamGiaTrangChu();

    List<ChiTietSanPham> findAllByTrangThai(Integer n);

    @Query("SELECT c FROM ChiTietSanPham c WHERE c.sanPham.tenSanPham LIKE %:tenSanPham% AND c.sanPham.trangThai=1")
    List<ChiTietSanPham> findByTenSanPhamContaining(@Param("tenSanPham") String tenSanPham);

    @Query("SELECT c FROM ChiTietSanPham c WHERE c.sanPham.maSanPham = :maSanPham")
    ChiTietSanPham getChiTietSanPhamCheckSoLuong(@Param("maSanPham") Long maSanPham);


    // Lấy danh sách sản phẩm dựa trên trạng thái và phân trang
    List<ChiTietSanPham> findByTrangThai(int trangThai, Pageable pageable);

    // Lấy danh sách sản phẩm dựa trên loại và trạng thái và phân trang
    List<ChiTietSanPham> findByNsxMaNSXAndTrangThai(Long maNSX, int trangThai, Pageable pageable);

    // Đếm số lượng sản phẩm dựa trên trạng thái
    int countByTrangThai(int trangThai);

    // Đếm số lượng sản phẩm dựa trên loại và trạng thái
    int countByNsxMaNSXAndTrangThai(Long maNSX, int trangThai);

    @Query("SELECT c FROM ChiTietSanPham c " +
            "where c.trangThai = 1 and c.maChiTietSanPham not in (SELECT gg.chiTietSanPham.maChiTietSanPham FROM GiamGiaChiTietSanPham gg where gg.trangThai = 1 )")
    List<ChiTietSanPham> findAllNotGiamGia();

    //    @Query("SELECT new com.example.demo.Dto.SanPhamGiamGiaDTO(sp.maSanPham,ctsp.maChiTietSanPham, sp.tenSanPham,dl.tenDungLuong, ctsp.giaBan, " +
//            "ctsp.hinhAnhURL, ctsp.soLuongNhap, ctsp.soLuongBan, ctsp.trangThai, ms.tenMauSac, nsx.tenNSX, c.tenChip, " +
//            "sp.dungLuongPin, sp.manhinh, gg.giaSauKhiGiam, gsp.phanTramSale, ctsp.moTa) from ChiTietSanPham ctsp " +
//            "join SanPham sp on ctsp.sanPham.maSanPham = sp.maSanPham " +
//            "join DungLuong dl on ctsp.dungLuong.maDungLuong = dl.maDungLuong " +
//            "join MauSac ms on ms.maMauSac = ctsp.mauSac.maMauSac " +
//            "join Chip c on c.maChip = ctsp.chip.maChip " +
//            "join NSX nsx on nsx.maNSX = ctsp.nsx.maNSX " +
//            "join GiamGiaChiTietSanPham gg on ctsp.maChiTietSanPham = gg.chiTietSanPham.maChiTietSanPham " +
//            "join GiamGiaSanPham gsp on gsp.maGiamGia = gg.giamGiaSanPham.maGiamGia " +
//            "where gg.trangThai = 1 and gsp.trangThai = 1 " +
//            "and ctsp.trangThai = 1 and gsp.ngayBatDau <= current_date and gsp.ngayKetThuc >= current_date ")
    @Query("SELECT new com.example.demo.Dto.SanPhamHTDTO(P.sanPham.maSanPham " +
            "     , S.tenSanPham     " +
            "     , P.hinhAnhURL     " +
            "     , P.giaBan         " +
            "     , g.giaSauKhiGiam , P.dungLuong.tenDungLuong ) " +
            "FROM GiamGiaChiTietSanPham g " +
            "         JOIn ChiTietSanPham P on g.chiTietSanPham.maChiTietSanPham = P.maChiTietSanPham " +
            "         JOIN SanPham S on P.sanPham.maSanPham = S.maSanPham " +
            "WHERE P.trangThai = 1 and  g.trangThai= 1" +
            " GROUP BY P.sanPham.maSanPham,S.tenSanPham,P.hinhAnhURL,P.giaBan ,g.giaSauKhiGiam,P.dungLuong.tenDungLuong")
    List<SanPhamHTDTO> findAllSanPhamGiamGia();

    @Query("SELECT new com.example.demo.Dto.SanPhamGiamGiaDTO(sp.maSanPham,ctsp.maChiTietSanPham, sp.tenSanPham,dl.tenDungLuong, ctsp.giaBan, " +
            "ctsp.hinhAnhURL, ctsp.soLuongNhap, ctsp.soLuongBan, ctsp.trangThai, ms.tenMauSac, nsx.tenNSX, c.tenChip, " +
            "sp.dungLuongPin, sp.manhinh, gg.giaSauKhiGiam, gsp.phanTramSale, ctsp.moTa) from ChiTietSanPham ctsp " +
            "join SanPham sp on ctsp.sanPham.maSanPham = sp.maSanPham " +
            "join DungLuong dl on ctsp.dungLuong.maDungLuong = dl.maDungLuong " +
            "join MauSac ms on ms.maMauSac = ctsp.mauSac.maMauSac " +
            "join Chip c on c.maChip = ctsp.chip.maChip " +
            "join NSX nsx on nsx.maNSX = ctsp.nsx.maNSX " +
            "join GiamGiaChiTietSanPham gg on ctsp.maChiTietSanPham = gg.chiTietSanPham.maChiTietSanPham " +
            "join GiamGiaSanPham gsp on gsp.maGiamGia = gg.giamGiaSanPham.maGiamGia " +
            "where gg.trangThai = 1 and gsp.trangThai = 1 " +
            "and ctsp.trangThai = 1 " +
            "and ctsp.maChiTietSanPham = :maChiTietSanPham")
    SanPhamGiamGiaDTO detailSanPhamGiamGia(Long maChiTietSanPham);

    @Query("SELECT count(ctsp) from ChiTietSanPham ctsp " +
            "join GiamGiaChiTietSanPham gg on ctsp.maChiTietSanPham = gg.chiTietSanPham.maChiTietSanPham " +
            "join GiamGiaSanPham gsp on gsp.maGiamGia = gg.giamGiaSanPham.maGiamGia " +
            "where gg.trangThai = 1 and gsp.trangThai = 1 " +
            "and ctsp.trangThai = 1 " +
            "and ctsp.maChiTietSanPham = :maChiTietSanPham")
    Integer countSPGG(Long maChiTietSanPham);

    @Query("SELECT new com.example.demo.Dto.Response.DetailSanPhamResponse(sp.maSanPham, sp.tenSanPham, MAX(ctsp.hinhAnhURL), " +
            "MAX(sp.trangThai), MAX(nsx.tenNSX), MAX(c.tenChip), MAX(sp.dungLuongPin), MAX(sp.manhinh), MAX(sp.sim)," +
            "MAX(ctsp.moTa), MAX(sp.camerasau), MAX(sp.cameratruoc), MAX(sp.heDieuHanh), MAX(sp.ram), " +
            "MAX(ctsp.soLuongBan), MAX(ctsp.soLuongNhap)) " +
            "FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "JOIN NSX nsx ON ctsp.nsx.maNSX = nsx.maNSX " +
            "JOIN Chip c ON c.maChip = ctsp.chip.maChip " +
            "WHERE sp.tenSanPham = :tenSanPham " +
            "GROUP BY sp.maSanPham, sp.tenSanPham")
    DetailSanPhamResponse detailSanPham(@Param("tenSanPham") String tenSanPham);


    @Query("SELECT new com.example.demo.Dto.ListMauSacOfSanPhamDTO(sp.tenSanPham, sp.maSanPham, ctsp.mauSac.maMauSac, " +
            "ctsp.dungLuong.maDungLuong, ms.tenMauSac, ctsp.hinhAnhURL) " +
            "FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "JOIN MauSac ms ON ms.maMauSac = ctsp.mauSac.maMauSac " +
            "WHERE sp.tenSanPham = :tenSanPham " +
            "AND (:maDungLuong IS NULL OR ctsp.dungLuong.maDungLuong = :maDungLuong) " +
            "GROUP BY sp.tenSanPham, sp.maSanPham, ctsp.mauSac.maMauSac, ms.tenMauSac, ctsp.hinhAnhURL, ctsp.dungLuong.maDungLuong ")
    List<ListMauSacOfSanPhamDTO> getListMauSacOfSanPham(@Param("tenSanPham") String tenSanPham,
                                                        @Param("maDungLuong") Long maDungLuong);

    @Query("SELECT new com.example.demo.Dto.ListDungLuongOfSanPhamDTO(sp.tenSanPham, sp.maSanPham, dl.maDungLuong, dl.tenDungLuong, ctsp.giaBan) " +
            "FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "JOIN DungLuong dl ON dl.maDungLuong = ctsp.dungLuong.maDungLuong " +
            "WHERE sp.tenSanPham = :tenSanPham " +
            "GROUP BY sp.tenSanPham, sp.maSanPham, dl.maDungLuong, dl.tenDungLuong, ctsp.giaBan ")
    List<ListDungLuongOfSanPhamDTO> getListDungLuongOfSanPham(@Param("tenSanPham") String tenSanPham);

    @Query("SELECT ctsp " +
            " FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "JOIN NSX nsx ON ctsp.nsx.maNSX = nsx.maNSX " +
            "JOIN Chip c ON c.maChip = ctsp.chip.maChip " +
            "WHERE ctsp.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND ctsp.mauSac.tenMauSac = :tenMauSac " +
            "AND ctsp.sanPham.tenSanPham = :tenSanPham ")
    ChiTietSanPham getCTSPByMauSacAndDungLuongAndTen(@Param("tenSanPham") String tenSanPham,
                                                     @Param("tenDungLuong") String tenDungLuong,
                                                     @Param("tenMauSac") String tenMauSac);

    @Query("SELECT ctsp FROM ChiTietSanPham ctsp " +
            "WHERE ctsp.sanPham.tenSanPham = :tenSanPham ")
    ChiTietSanPham findByTen(@Param("tenSanPham") String tenSanPham);

    @Query("SELECT new com.example.demo.Dto.ListDungLuongOfSanPhamDTO(ctsp.giaBan, gg.giaSauKhiGiam)  " +
            "FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "JOIN GiamGiaChiTietSanPham gg ON gg.chiTietSanPham.maChiTietSanPham = ctsp.maChiTietSanPham " +
            "JOIN DungLuong dl ON dl.maDungLuong = ctsp.dungLuong.maDungLuong " +
            "WHERE sp.tenSanPham = :tenSanPham AND dl.maDungLuong = :maDungLuong AND gg.trangThai = 1 " +
            "GROUP BY ctsp.giaBan, gg.giaSauKhiGiam ")
    ListDungLuongOfSanPhamDTO getGiaBanOfSP(@Param("tenSanPham") String tenSanPham,
                                            @Param("maDungLuong") Long maDungLuong);


    List<ChiTietSanPham> findByTrangThai(int trangThai);

    List<ChiTietSanPham> findByGiaBanBetweenAndTrangThai(BigDecimal giaMin, BigDecimal giaMax, int trangTha);


    List<ChiTietSanPham> findByGiaBanBetweenAndNsxMaNSXAndTrangThai(BigDecimal giaMin, BigDecimal giaMax, Long maNsx, int trangThai);


    @Query("SELECT ctsp " +
            "FROM ChiTietSanPham ctsp JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "WHERE (:maDungLuong IS NULL OR ctsp.dungLuong.maDungLuong = :maDungLuong) " +
            "AND (:maMauSac IS NULL OR ctsp.mauSac.maMauSac = :maMauSac) " +
            "AND (:maSanPham IS NULL OR ctsp.sanPham.maSanPham = :maSanPham) ")
    List<ChiTietSanPham> getCTSPByMaMauSacAndDungLuongAndTen(@Param("maSanPham") Long maSanPham,
                                                             @Param("maDungLuong") Long maDungLuong,
                                                             @Param("maMauSac") Long maMauSac);

    @Query("SELECT c.soLuongNhap FROM ChiTietSanPham c " +
            "WHERE c.sanPham.tenSanPham = :tenSanPham " +
            "AND c.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND c.mauSac.tenMauSac = :tenMauSac")
    Integer countSoLuongNhapByTenSanPhamAndDungLuongAndMauSac(
            @Param("tenSanPham") String tenSanPham,
            @Param("tenDungLuong") String tenDungLuong,
            @Param("tenMauSac") String tenMauSac
    );

    @Query("SELECT c.soLuongBan FROM ChiTietSanPham c " +
            "WHERE c.sanPham.tenSanPham = :tenSanPham " +
            "AND c.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND c.mauSac.tenMauSac = :tenMauSac")
    Integer countSoLuongBanByTenSanPhamAndDungLuongAndMauSac(
            @Param("tenSanPham") String tenSanPham,
            @Param("tenDungLuong") String tenDungLuong,
            @Param("tenMauSac") String tenMauSac
    );

    List<ChiTietSanPham> findBySanPhamMaSanPham(Long maSanPham);

    @Query("SELECT c.soLuongNhap FROM ChiTietSanPham c " +
            "WHERE c.sanPham.tenSanPham = :tenSanPham " +
            "AND c.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND c.mauSac.tenMauSac = :tenMauSac")
    Integer findSoLuongNhapBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
            @Param("tenSanPham") String tenSanPham,
            @Param("tenDungLuong") String tenDungLuong,
            @Param("tenMauSac") String tenMauSac
    );

    @Query("SELECT c.hinhAnhURL FROM ChiTietSanPham c " +
            "WHERE c.sanPham.tenSanPham = :tenSanPham " +
            "AND c.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND c.mauSac.tenMauSac = :tenMauSac")
    String findHinhAnhURLBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
            @Param("tenSanPham") String tenSanPham,
            @Param("tenDungLuong") String tenDungLuong,
            @Param("tenMauSac") String tenMauSac
    );

    @Query("SELECT c.soLuongBan FROM ChiTietSanPham c " +
            "WHERE c.sanPham.tenSanPham = :tenSanPham " +
            "AND c.dungLuong.tenDungLuong = :tenDungLuong " +
            "AND c.mauSac.tenMauSac = :tenMauSac")
    Integer findSoLuongBanBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
            @Param("tenSanPham") String tenSanPham,
            @Param("tenDungLuong") String tenDungLuong,
            @Param("tenMauSac") String tenMauSac
    );

    @Query("SELECT count(ctsp) FROM ChiTietSanPham ctsp WHERE ctsp.trangThai = 0")
    Integer countSanPhamHetHang();

    @Query("SELECT new com.example.demo.Dto.ChiTietSanPhamDTO(ctsp.sanPham.maSanPham, ctsp.maChiTietSanPham, ctsp.sanPham.tenSanPham, " +
            "ctsp.giaBan, ctsp.giaNhap, ctsp.hinhAnh.hinhAnhURL, ctsp.soLuongNhap, ctsp.soLuongBan, ctsp.trangThai, ctsp.dungLuong.tenDungLuong, " +
            "ctsp.mauSac.tenMauSac) " +
            "FROM  ChiTietSanPham ctsp WHERE ctsp.trangThai = 0")
    List<ChiTietSanPhamDTO> getDanhSachSanPhamHetHang();

}
