package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListMauSacOfSanPhamDTO {
    private String tenSP;
    private Long maSP;
    private Long maMauSac;
    private Long maDungLuong;
    private String tenMauSac;
    private String hinhAnhURL;

}
