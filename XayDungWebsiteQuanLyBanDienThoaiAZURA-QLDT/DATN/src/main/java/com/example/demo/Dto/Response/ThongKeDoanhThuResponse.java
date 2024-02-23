package com.example.demo.Dto.Response;

import com.example.demo.Dto.HoaDonChiTietDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ThongKeDoanhThuResponse {
    private List<HoaDonChiTietDTO> hoaDonChiTietDTOS;
    private String tongDoanhThu;
}
