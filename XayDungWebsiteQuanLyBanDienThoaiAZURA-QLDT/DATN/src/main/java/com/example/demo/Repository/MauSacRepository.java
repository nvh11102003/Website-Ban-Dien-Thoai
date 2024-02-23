package com.example.demo.Repository;

import com.example.demo.Entity.Chip;
import com.example.demo.Entity.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac,Long> {

    Page<MauSac> findAllByTrangThai(Integer trangThai, Pageable pageable);
    List<MauSac> findAllByTrangThai(Integer trangThai);
    List<MauSac> findAllByOrderByTrangThaiDesc();

    MauSac findByMaMauSac(Long m);

    @Query("SELECT ms FROM MauSac ms WHERE ms.trangThai = 0 AND ms.tenMauSac = :tenMauSac")
    MauSac findAllInactiveByTen(@Param("tenMauSac") String tenMauSac);

    @Query("SELECT ms FROM MauSac ms WHERE ms.trangThai = 1 AND ms.tenMauSac = :tenMauSac")
    MauSac findAllActiveByTen(@Param("tenMauSac") String tenMauSac);

}
