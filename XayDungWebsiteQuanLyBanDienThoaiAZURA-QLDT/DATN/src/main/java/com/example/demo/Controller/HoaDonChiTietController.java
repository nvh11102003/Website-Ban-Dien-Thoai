package com.example.demo.Controller;

import com.example.demo.Dto.Request.HoaDonChiTietRequest;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.DanhGia;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.DanhGiaRepository;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.HoaDonChiTietService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/hoa-don-chi-tiet")
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietService service;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private DanhGiaRepository danhGiaRepository;

    @GetMapping("/hien-thi")
    public ResponseEntity<?> hienThi() {
        return service.getAll();
    }

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody HoaDonChiTietRequest hoaDonChiTietRequest) {
        return service.add(hoaDonChiTietRequest);
    }


    @PostMapping("/user/danh_gia")
    public String addDanhGia(HttpServletRequest request) {

        String maKhachHang = request.getParameter("maKhachHang");
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String binhLuan = request.getParameter("danhGia");

        ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham));
        KhachHang khachHang = khachHangService.getByMa(Long.parseLong(maKhachHang));

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();

        DanhGia danhGia = new DanhGia();
        danhGia.setKhachHang(khachHang);
        danhGia.setChiTietSanPham(chiTietSanPham);
        danhGia.setDanhGia(binhLuan);
        try {
            danhGia.setNgayDanhGia(new SimpleDateFormat("yyyy-MM-dd").parse(datenow));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        danhGiaRepository.save(danhGia);

        return "redirect:/hoadon/" + maKhachHang;
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody HoaDonChiTietRequest hoaDonChiTietRequest) {
        return service.update(hoaDonChiTietRequest);
    }

}
