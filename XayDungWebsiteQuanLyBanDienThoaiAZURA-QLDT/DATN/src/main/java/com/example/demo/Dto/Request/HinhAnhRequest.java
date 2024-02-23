package com.example.demo.Dto.Request;

import lombok.Data;

@Data
public class HinhAnhRequest {

    private Long maHinhAnh;

    private String tenHinhAnh;

    private String hinhAnhURL;

    private Integer trangThai;
}
