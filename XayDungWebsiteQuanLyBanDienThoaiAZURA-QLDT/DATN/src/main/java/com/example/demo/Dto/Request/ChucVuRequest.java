package com.example.demo.Dto.Request;

import jakarta.persistence.Column;
import lombok.Data;

@Data
public class ChucVuRequest {
    private Long maChucVu;

    private String tenChucVu;

    private Integer trangThai;

}
