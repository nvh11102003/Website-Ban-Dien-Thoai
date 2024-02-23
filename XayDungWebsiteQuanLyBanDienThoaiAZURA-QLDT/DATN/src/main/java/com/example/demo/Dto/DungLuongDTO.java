package com.example.demo.Dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
public class DungLuongDTO {
    private Long maDungLuong;
    private String tenDungLuong;
    private Integer trangThai;

    public DungLuongDTO(Long maDungLuong, String tenDungLuong, Integer trangThai) {
        this.maDungLuong = maDungLuong;
        this.tenDungLuong = tenDungLuong;
        this.trangThai = trangThai;
    }
}
