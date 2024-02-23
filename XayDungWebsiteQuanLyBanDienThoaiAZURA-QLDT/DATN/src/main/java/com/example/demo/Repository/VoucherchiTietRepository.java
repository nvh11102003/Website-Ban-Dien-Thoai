package com.example.demo.Repository;


import com.example.demo.Entity.VoucherChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VoucherchiTietRepository extends JpaRepository<VoucherChiTiet, Long> {

}
