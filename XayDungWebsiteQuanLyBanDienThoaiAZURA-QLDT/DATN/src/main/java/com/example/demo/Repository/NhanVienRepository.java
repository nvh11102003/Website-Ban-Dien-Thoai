package com.example.demo.Repository;

import com.example.demo.Dto.NhanVienDTO;
import com.example.demo.Entity.ChucVu;
import com.example.demo.Entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Long> {

    List<NhanVien> findByTrangThai(Integer trangThai);

    @Query("SELECT new com.example.demo.Dto.NhanVienDTO(nv.maNhanVien, nv.ten, " +
            "nv.email, nv.diaChi, nv.sdt, cv.tenChucVu, nv.trangThai, nv.cccd, nv.ngaySinh) FROM NhanVien nv " +
            "JOIN ChucVu cv ON cv.maChucVu = nv.chucVu.maChucVu ")
    List<NhanVienDTO> getListNhanVien();

    NhanVien getByEmailAndMatKhau(String email, String pass);

    ChucVu findByTen(String tenChucVu);

    @Query("SELECT count(nv) FROM NhanVien nv WHERE nv.trangThai = 1")
    Integer tongNhanVienDangHoatDong();

    List<NhanVien> findAllByOrderByTrangThaiDesc();
}
