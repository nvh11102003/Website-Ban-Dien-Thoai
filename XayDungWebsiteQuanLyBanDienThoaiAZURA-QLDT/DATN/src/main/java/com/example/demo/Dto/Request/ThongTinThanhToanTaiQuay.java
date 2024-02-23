package com.example.demo.Dto.Request;

import com.example.demo.Dto.SanPhamThanhToanTaiQuayDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ThongTinThanhToanTaiQuay {
    private String tenKhachHang;
    private String sdt;
    private String diaChi;
    private BigDecimal tongTien;
    private Integer loaiThanhToan;
    private Integer giaTien;
    private String ghiChu;
    private List<SanPhamThanhToanTaiQuayDTO> sanPhamThanhToanTaiQuayDTOS;
    private Long maNhanVien;
    private Long maVoucher;
}
