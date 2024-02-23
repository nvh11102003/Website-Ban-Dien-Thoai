package com.example.demo.Repository;

import com.example.demo.Entity.Chip;
import com.example.demo.Entity.MauSac;
import com.example.demo.Entity.NSX;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NSXRepository extends JpaRepository<NSX, Long> {
    Page<NSX> findAllByTrangThai(Integer trangThai, Pageable pageable);
    List<NSX> findAllByOrderByLastUpdateDesc();

    @Query("SELECT nsx FROM NSX nsx WHERE nsx.trangThai = 0 AND nsx.tenNSX = :tenNSX")
    NSX findAllInactiveByTen(@Param("tenNSX") String tenNSX);

    @Query("SELECT nsx FROM NSX nsx WHERE nsx.trangThai = 1 AND nsx.tenNSX = :tenNSX")
    NSX findAllActiveByTen(@Param("tenNSX") String tenNSX);

}
