package com.example.demo.Repository;

import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Long> {
    GioHang getByKhachHang(KhachHang khachHang);
}
