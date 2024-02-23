package com.example.demo.Repository;

import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.DanhGia;
import com.example.demo.Entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DanhGiaRepository extends JpaRepository<DanhGia, Long> {
    List<DanhGia> findAllByChiTietSanPham(ChiTietSanPham c);

    List<DanhGia> findAllBySanPham(SanPham sanPham);
}
