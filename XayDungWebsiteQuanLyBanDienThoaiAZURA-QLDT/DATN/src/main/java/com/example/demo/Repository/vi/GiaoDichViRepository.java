package com.example.demo.Repository.vi;

import com.example.demo.Entity.GiaoDichVi;
import com.example.demo.Entity.ViShop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GiaoDichViRepository extends JpaRepository<GiaoDichVi, Long> {
    List<GiaoDichVi> getByViShopAndTrangThai(ViShop v, Integer tt);

    GiaoDichVi getByMa(String m);

}
