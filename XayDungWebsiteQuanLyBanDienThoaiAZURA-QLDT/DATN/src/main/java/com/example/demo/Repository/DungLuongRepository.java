package com.example.demo.Repository;

import com.example.demo.Dto.DungLuongDTO;
import com.example.demo.Dto.ListDungLuongOfSanPhamDTO;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Entity.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DungLuongRepository extends JpaRepository<DungLuong, Long> {

    Page<DungLuong> findAllByTrangThai(Integer trangThai, Pageable pageable);

    @Query("SELECT dl FROM DungLuong dl WHERE dl.trangThai = 1")
    List<DungLuong> findAllActive();

    @Query("select new com.example.demo.Dto.DungLuongDTO(dl.maDungLuong, dl.tenDungLuong, dl.trangThai)" +
            "from DungLuong dl where dl.trangThai = 1 and dl.tenDungLuong = :tenDungLuong")
    List<DungLuongDTO> searchDungLuong(@Param("tenDungLuong") String tenDungLuong);

    @Query("select new com.example.demo.Dto.DungLuongDTO(dl.maDungLuong, dl.tenDungLuong, dl.trangThai)" +
            "from DungLuong dl")
    List<DungLuongDTO> viewAllDl();

    @Query("select new com.example.demo.Dto.ListDungLuongOfSanPhamDTO(dl.maDungLuong, dl.tenDungLuong, ct.giaBan)" +
            "from DungLuong dl JOIN ChiTietSanPham ct ON ct.dungLuong.maDungLuong = dl.maDungLuong " +
            "WHERE dl.tenDungLuong = :tenDungLuong AND ct.sanPham.tenSanPham = :tenSanPham")
    List<ListDungLuongOfSanPhamDTO> findByTenSanPhamAndTenDL(@Param("tenSanPham") String tenSanPham,
                                                       @Param("tenDungLuong") String tenDungLuong);

    @Query("select dl from DungLuong dl JOIN ChiTietSanPham ctsp ON ctsp.dungLuong.maDungLuong = dl.maDungLuong " +
            "WHERE ctsp.sanPham.maSanPham = :maSP")
    List<DungLuong> fillListDungLuongBySp(@Param("maSP") Long maSP);

    @Query("SELECT dl FROM DungLuong dl WHERE dl.trangThai = 0 AND dl.tenDungLuong = :tenDungLuong")
    DungLuong findAllInactiveByTen(@Param("tenDungLuong") String tenDungLuong);

    @Query("SELECT dl FROM DungLuong dl WHERE dl.trangThai = 1 AND dl.tenDungLuong = :tenDungLuong")
    DungLuong findAllActiveByTen(@Param("tenDungLuong") String tenDungLuong);
}
