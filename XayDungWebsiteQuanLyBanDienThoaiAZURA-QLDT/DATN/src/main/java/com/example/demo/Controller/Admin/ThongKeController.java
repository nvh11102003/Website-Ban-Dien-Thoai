package com.example.demo.Controller.Admin;

import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Response.ThongKeDoanhThuResponse;
import com.example.demo.Service.HoaDonService;
import com.example.demo.Service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/admin/thong-ke")
public class ThongKeController {

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/so-luong-san-pham")
    public List<Integer> SLSP(@RequestParam("maSP") Long maSp, @RequestParam("ngayBatDau") String ngayBatDau,
                              @RequestParam("ngayKetThuc") String ngayKetThuc){
        List<Integer> list = new ArrayList<>();
        Integer slb = sanPhamService.tongSoLuongBanTheoSanPham(maSp, ngayBatDau, ngayKetThuc);
        Integer sln = sanPhamService.tongSoLuongNhapTheoSanPham(maSp);
        list.add(slb);
        list.add(sln);
        return list;
    }

    @GetMapping("/tong-so-luong-san-pham")
    public List<Integer> tongSLSP(@RequestParam("ngayBatDau") String ngayBatDau,
                              @RequestParam("ngayKetThuc") String ngayKetThuc){
        List<Integer> list = new ArrayList<>();
        Integer slb = sanPhamService.tongSoLuongBanTheoSanPham(null, ngayBatDau, ngayKetThuc);
        Integer sln = sanPhamService.tongSoLuongNhapTheoSanPham(null);
        list.add(slb);
        list.add(sln);
        return list;
    }

    @GetMapping("/doanh-thu-theo-ngay")
    public ThongKeDoanhThuResponse DTTN(@RequestParam("ngayBatDau") String ngayBatDau,
                              @RequestParam("ngayKetThuc") String ngayKetThuc){
        ThongKeDoanhThuResponse thongKeDoanhThuResponse = new ThongKeDoanhThuResponse();
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonService.danhSachHoaDonHoanThanhTheoNgay(ngayBatDau, ngayKetThuc);
        String tongDoanhThu = hoaDonService.tongTienDanhSachHoaDonHoanThanhTheoNgay(ngayBatDau,ngayKetThuc);
        thongKeDoanhThuResponse.setHoaDonChiTietDTOS(hoaDonChiTietDTOS);
        thongKeDoanhThuResponse.setTongDoanhThu(tongDoanhThu);
        return thongKeDoanhThuResponse;
    }
}
