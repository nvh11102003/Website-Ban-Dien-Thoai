package com.example.demo.Repository;

import com.example.demo.Dto.ChipDTO;
import com.example.demo.Dto.DungLuongDTO;
import com.example.demo.Entity.Chip;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Entity.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChipRepository extends JpaRepository<Chip, Long> {

    Page<Chip> findAllByTrangThai(Integer trangThai, Pageable pageable);

    @Query("select new com.example.demo.Dto.ChipDTO(c.maChip, c.tenChip, c.trangThai)" +
            "from Chip c where c.trangThai = 1 and c.tenChip = :tenChip")
    List<ChipDTO> searchChip(@Param("tenChip") String tenChip);

    @Query("select new com.example.demo.Dto.ChipDTO(c.maChip, c.tenChip, c.trangThai)" +
            "from Chip c")
    List<ChipDTO> viewAllC();

    @Query("SELECT chip FROM Chip chip WHERE chip.trangThai = 0 AND chip.tenChip = :tenChip")
    Chip findAllInactiveByTen(@Param("tenChip") String tenChip);

    @Query("SELECT chip FROM Chip chip WHERE chip.trangThai = 1 AND chip.tenChip = :tenChip")
    Chip findAllActiveByTen(@Param("tenChip") String tenChip);

}
