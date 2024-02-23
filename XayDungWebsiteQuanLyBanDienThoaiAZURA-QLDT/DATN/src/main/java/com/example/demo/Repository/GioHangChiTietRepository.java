package com.example.demo.Repository;

import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.GioHangChiTiet;
import com.example.demo.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, Long> {
    List<GioHangChiTiet> getByGioHang_KhachHang(KhachHang khachHang);
    GioHangChiTiet getByChiTietSanPhamAndGioHang(ChiTietSanPham c, GioHang g);
    List<GioHangChiTiet> getByGioHang(GioHang gh);

    @Query("SELECT new com.example.demo.Dto.GioHangChiTietDTO(ghct.magiohangchitiet, ghct.soLuong, ghct.trangThai, " +
            "gh, ghct.chiTietSanPham) FROM GioHangChiTiet ghct JOIN GioHang gh ON ghct.gioHang.maGioHang = gh.maGioHang " +
            "WHERE gh.khachHang.maKhachHang = :maKhachHang")
    List<GioHangChiTietDTO> getGHCTByMaKH(@Param("maKhachHang") Long maKhachHang);

    @Query("SELECT new com.example.demo.Dto.GioHangChiTietDTO(ghct.magiohangchitiet, ghct.soLuong, ghct.trangThai, " +
            "gh, ghct.chiTietSanPham) FROM GioHangChiTiet ghct JOIN GioHang gh ON ghct.gioHang.maGioHang = gh.maGioHang " +
            "WHERE gh.maGioHang = :maGH")
    List<GioHangChiTietDTO> getGHCTByMaGH(@Param("maGH") Long maGH);
}
