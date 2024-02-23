package com.example.demo.Repository;

import com.example.demo.Dto.KhachHangDTO;
import com.example.demo.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Long> {
    KhachHang getByEmailAndMatKhau(String email, String matKhau);

    KhachHang findByEmailAndMatKhauIsNotNull(String mail);


    @Query("SELECT new com.example.demo.Dto.KhachHangDTO(kh.maKhachHang, kh.ten, kh.gioiTinh, " +
            "kh.cccd, kh.ngaySinh, kh.diaChi, kh.sdt, kh.email) FROM KhachHang kh " +
            "WHERE (:diaChi IS NULL OR UPPER(kh.diaChi) LIKE CONCAT('%', UPPER(:diaChi), '%')) " +
            "AND (:tenKhachHang IS NULL OR UPPER(kh.ten) LIKE CONCAT('%', UPPER(:tenKhachHang), '%')) ")
    List<KhachHangDTO> searchKhachHang(@Param("diaChi") String diaChi,
                                       @Param("tenKhachHang") String tenKhachHang);

    @Query("SELECT CASE WHEN COUNT(kh) > 0 THEN true ELSE false END FROM KhachHang kh WHERE kh.email = :email and kh.matKhau is not NULL ")
    boolean existsByEmail(String email);


}
