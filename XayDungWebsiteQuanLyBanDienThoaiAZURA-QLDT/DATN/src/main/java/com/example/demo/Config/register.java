package com.example.demo.Config;

import com.example.demo.Dto.Request.KhachHangRequest;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Entity.ViShop;
import com.example.demo.Repository.GioHangRepository;
import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.EmailService;
import com.example.demo.Service.GioHangService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//@RestController
@Controller
//@RequestMapping("/dang-ky")
public class register {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private EmailService emailService;


    @Autowired
    private ViShopRepository viShopRepository;

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody
                                          KhachHangRequest khachHangRequest) {
        return khachHangService.them(khachHangRequest);
    }

    @GetMapping("/dang-ky")
    public String dang_ky() {
        return "/dangky";
    }

    @PostMapping("/RegistrationForm")
    public String dangKy(Model model, HttpServletRequest request) {
        String ten = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String cccd = request.getParameter("cccd");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String ns = request.getParameter("ngaySinh");
        LocalDate parsedDate = LocalDate.parse(ns, dtf);
        java.sql.Date sqlDate = java.sql.Date.valueOf(parsedDate);

        KhachHang khachHang = new KhachHang();
        khachHang.setTen(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(matKhau);
        khachHang.setCccd(cccd);
        khachHang.setNgaySinh(sqlDate);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
        khachHang.setTrangThai(1);
        khachHang.setGioiTinh(true);
        khachHangRepository.save(khachHang);

        emailService.sendRegistrationSuccessEmail(email);


        GioHang gioHang = new GioHang();
        gioHang.setKhachHang(KhachHang.builder().maKhachHang(khachHang.getMaKhachHang()).build());
        gioHang.setTrangThai(1);
        gioHangRepository.save(gioHang);

        //  tao vi
        ViShop viShop= new ViShop();
        viShop.setKhachHang(KhachHang.builder().maKhachHang(khachHang.getMaKhachHang()).build());
        viShop.setTongTien(BigDecimal.valueOf(0));
        viShop.setTrangThai(1);
        viShopRepository.save(viShop);
        return "redirect:/loginView";
    }

    @GetMapping("detailKh/{maKhachHang}")
    public String detailKh(Model model, @PathVariable(name = "maKhachHang") Long maKhachHang) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        Date ngaySinh = khachHang.getNgaySinh();
        model.addAttribute("ngaySinh", ngaySinh);
        model.addAttribute("kh", khachHang);
        return "detailKH";
    }

    @PostMapping("/update/{maKhachHang}")
    public String update(Model model, @PathVariable(name = "maKhachHang") Long maKhachHang, HttpServletRequest request) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        String ten = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String cccd = request.getParameter("cccd");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String ns = request.getParameter("ngaySinh");
        LocalDate parsedDate = LocalDate.parse(ns, dtf);
        java.sql.Date sqlDate = java.sql.Date.valueOf(parsedDate);

        khachHang.setTen(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(matKhau);
        khachHang.setCccd(cccd);
        khachHang.setNgaySinh(sqlDate);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
        khachHang.setTrangThai(1);
        khachHangRepository.save(khachHang);
        model.addAttribute("kh", khachHang);
        return "/login";
    }

    @GetMapping("contact")
    public String hienthiContent() {
        return "contact";
    }

    @GetMapping("blog")
    public String hienthiBlog() {
        return "blog";
    }

    @GetMapping("contact1/{maKhachHang}")
    public String hienthiContentDN(Model model,@PathVariable(name = "maKhachHang") Long maKhachHang) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHang);
        return "contactDN";
    }

    @GetMapping("blog1/{maKhachHang}")
    public String hienthiBlogDN(Model model,@PathVariable(name = "maKhachHang") Long maKhachHang) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHang);
        return "blogDN";
    }


    @PostMapping("/check-email")
    public ResponseEntity<Map<String, Boolean>> checkEmail(@RequestBody Map<String, String> payload) {
        String email = payload.get("email");
        boolean exists = khachHangRepository.existsByEmail(email);

        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);

        return ResponseEntity.ok(response);
    }

    @GetMapping("test")
    public String hienthiT() {
        return "VNP/orderfail";
    }
}
