package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor

public class ChipDTO {
    private Long maChip;
    private String tenChip;
    private Integer trangThai;

    public ChipDTO(Long maChip, String tenChip, Integer trangThai) {
        this.maChip = maChip;
        this.tenChip = tenChip;
        this.trangThai = trangThai;
    }
}
