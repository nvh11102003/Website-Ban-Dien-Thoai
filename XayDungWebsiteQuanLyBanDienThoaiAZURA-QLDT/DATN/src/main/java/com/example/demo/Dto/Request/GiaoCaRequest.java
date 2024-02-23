package com.example.demo.Dto.Request;

import jakarta.persistence.Column;
import lombok.Data;

import java.util.Date;
@Data
public class GiaoCaRequest {
    private Long magiaoca;

    private Date thoiGianGiaoCa;

    private Date ngay;

    private Date thoiGian;

    private Integer trangThai;
}
