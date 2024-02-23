package com.example.demo.Repository.vi;

import com.example.demo.Entity.KhachHang;
import com.example.demo.Entity.ViShop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ViShopRepository extends JpaRepository<ViShop, Long> {
    ViShop getByKhachHang(KhachHang k);

    ViShop getByKhachHang_MaKhachHang(Long maKhachHang);
}
