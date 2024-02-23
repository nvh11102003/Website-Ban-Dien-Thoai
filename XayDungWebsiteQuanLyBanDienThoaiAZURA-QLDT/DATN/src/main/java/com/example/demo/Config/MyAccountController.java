package com.example.demo.Config;


import com.example.demo.Dto.HoaDonModel;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Repository.vi.GiaoDichViRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class MyAccountController {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private KhachHangService userService;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private DanhGiaRepository danhGiaRepository;

    @Autowired
    private ViShopRepository viShopRepository;

    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private GiaoDichViRepository giaoDichViRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;


    @GetMapping("/MyAccount/{maKhachHang}")
    public String hienthiHoaDon(@PathVariable("maKhachHang") Long maKhachHang, HttpSession session, Model model) {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);
        model.addAttribute("viShop", viShopRepository.getByKhachHang(kh));
        model.addAttribute("gdVi", giaoDichViRepository.getByViShopAndTrangThai(viShopRepository.getByKhachHang(kh), 1));
        Date ngaySinh = kh.getNgaySinh();
        model.addAttribute("ngaySinh", ngaySinh);
        //
        Map<Long, Integer> DSSP = new HashMap<>();
        List<SanPham> listTN = new ArrayList<>();

        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);
        List<HoaDon> list = hoaDonRepository.findByKhachHangAndTrangThai(maKhachHang, 0);
        List<HoaDon> list1 = hoaDonRepository.findByKhachHangAndTrangThai(maKhachHang, 1);
        List<HoaDon> list2 = hoaDonRepository.findByKhachHangAndTrangThai(maKhachHang, 2);
        List<HoaDon> list3 = hoaDonRepository.findByKhachHangAndTrangThai(maKhachHang, 3);
        model.addAttribute("list", list);
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        model.addAttribute("list3", list3);
        for (HoaDon hd1 : listHD) {
            List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd1);
            for (HoaDonChiTiet hdct : listHDCT) {
                listTN.add(hdct.getChiTietSanPham().getSanPham());
                DSSP.put(hdct.getChiTietSanPham().getMaChiTietSanPham(), hdct.getSoLuongMua());
            }

            HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDonDanhGia");

            if (hoaDon != null) {
                List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietService.getByHoaDon(hoaDon);
                model.addAttribute("hoaDon", hoaDon);
                model.addAttribute("listHoaDonChiTiets", listHoaDonChiTiets);
                model.addAttribute("noneOrBlock", "block");
            }
            session.removeAttribute("hoaDonDanhGia");

            model.addAttribute("listHD", listHD);
            model.addAttribute("listHDCT", listHDCT);
            model.addAttribute("hoaDon", listTN);
            model.addAttribute("DSSP", DSSP);

        }

        String addThanhCong = (String) session.getAttribute("napThanhCong");
        String addThatBai = (String) session.getAttribute("napThatBai");

        if (addThanhCong != null) {
            model.addAttribute("themThanhCong", "2");
        }
        if (addThatBai != null) {
            model.addAttribute("themThatBai", "2");
        }

        session.removeAttribute("napThanhCong");
        session.removeAttribute("napThatBai");

        return "/my-account";
    }

    @GetMapping("/update1/{maKhachHang}/{maHoaDon}")
    public String update(@PathVariable(name = "maKhachHang") Long maKhachHang,
                         HttpServletRequest request, Model model, @PathVariable("maHoaDon") Long maHoaDon,
                         @RequestParam(value = "note", required = false) String ghiChu) {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        HoaDon hoaDon = hoaDonRepository.findById(maHoaDon).orElse(null);
        if (hoaDon != null) {
            hoaDon.setTrangThai(3);
            hoaDon.setGhiChu(ghiChu);
            hoaDonRepository.save(hoaDon);
            if (hoaDon.getLoaiThanhToan() == 1 || hoaDon.getLoaiThanhToan() == 4){
                ViShop viShop = viShopRepository.getByKhachHang(khachHangService.getByMa(maKhachHang));
                viShop.setTongTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(viShop.getTongTien())) + Double.parseDouble(String.valueOf(hoaDon.getTongTien()))));
                viShopRepository.save(viShop);

                GiaoDichVi giaoDichVi = new GiaoDichVi();
                giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
                giaoDichVi.setDonGia(hoaDon.getTongTien());
                giaoDichVi.setViShop(viShop);
                giaoDichVi.setNhanVien(nhanVienService.getByMa(1L));
                giaoDichVi.setHinhThuc(1);
                giaoDichVi.setTrangThai(1);
                giaoDichViRepository.save(giaoDichVi);
            }
        }
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);

        for (GioHangChiTiet ghct : listGHCT) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(ghct.getChiTietSanPham());
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setGiaTien(gioHangService.tongTien(gh));
            hoaDonChiTiet.setSoLuongMua(ghct.getSoLuong());
            hoaDonChiTiet.setTrangThai(0);

            hoaDonChiTietRepository.save(hoaDonChiTiet);

        }

        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hoaDon);
        // Cập nhật số lượng sản phẩm về ban đầu

        for (HoaDonChiTiet hdct : listHDCT) {
            ChiTietSanPham ctsp = hdct.getChiTietSanPham();
            if (ctsp != null) {

                ctsp.setSoLuongBan(ctsp.getSoLuongBan() - hdct.getSoLuongMua());
                //Hàm đổi trạng thái
                if (ctsp.getSoLuongBan() < ctsp.getSoLuongNhap()) {
                    ctsp.setTrangThai(1);
                    ctsp.getSanPham().setTrangThai(1);
                }
                chiTietSanPhamRepository.save(ctsp);


            }
            listSP.add(hdct.getChiTietSanPham().getSanPham());
            DSSP.put(hdct.getChiTietSanPham().getSanPham().getTenSanPham(), hdct.getSoLuongMua());
        }

        for (GioHangChiTiet ghct : listGHCT) {
            gioHangChiTietRepository.delete(ghct);
        }
        model.addAttribute("hd", hoaDon);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/MyAccount/{maKhachHang}";
    }

    @GetMapping("/update2/{maKhachHang}/{maHoaDon}")
    public String update1(@PathVariable(name = "maKhachHang") Long maKhachHang,
                          HttpServletRequest request, Model model, @PathVariable("maHoaDon") Long maHoaDon) {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        HoaDon hoaDon = hoaDonRepository.findById(maHoaDon).orElse(null);
        if (hoaDon != null) {
            hoaDon.setTrangThai(2);
            hoaDonRepository.save(hoaDon);
        }
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);

        for (GioHangChiTiet ghct : listGHCT) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(ghct.getChiTietSanPham());
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setGiaTien(gioHangService.tongTien(gh));
            hoaDonChiTiet.setSoLuongMua(ghct.getSoLuong());
            hoaDonChiTiet.setTrangThai(0);

            hoaDonChiTietRepository.save(hoaDonChiTiet);

        }

        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hoaDon);
        // Cập nhật số lượng sản phẩm về ban đầu

        for (HoaDonChiTiet hdct : listHDCT) {
            ChiTietSanPham ctsp = hdct.getChiTietSanPham();
            if (ctsp != null) {

                ctsp.setSoLuongBan(ctsp.getSoLuongBan() - hdct.getSoLuongMua());
                //Hàm đổi trạng thái
                if (ctsp.getSoLuongBan() < ctsp.getSoLuongNhap()) {
                    ctsp.setTrangThai(1);
                    ctsp.getSanPham().setTrangThai(1);
                }
                chiTietSanPhamRepository.save(ctsp);


            }
            listSP.add(hdct.getChiTietSanPham().getSanPham());
            DSSP.put(hdct.getChiTietSanPham().getSanPham().getTenSanPham(), hdct.getSoLuongMua());
        }

        for (GioHangChiTiet ghct : listGHCT) {
            gioHangChiTietRepository.delete(ghct);
        }
        model.addAttribute("hd", hoaDon);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/MyAccount/{maKhachHang}";
    }

    @PostMapping("/update1/{maKhachHang}")
    public String update(Model model, @PathVariable(name = "maKhachHang") Long maKhachHang, HttpServletRequest request) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);

        String ten = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String cccd = request.getParameter("cccd");
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        String ns = request.getParameter("ngaySinh");
//        LocalDate parsedDate = LocalDate.parse(ns, dtf);
//        java.sql.Date sqlDate = java.sql.Date.valueOf(parsedDate);


//        if (kiemTraEmailTonTai(email)) {
//            model.addAttribute("error", "Email đã tồn tại");
//            return "dangky";
//        }
        khachHang.setTen(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(matKhau);
        khachHang.setCccd(cccd);
//        khachHang.setNgaySinh(sqlDate);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
        khachHang.setTrangThai(1);
        khachHangRepository.save(khachHang);
        model.addAttribute("kh", khachHang);
        return "redirect:/MyAccount/{maKhachHang}";
    }

    //danh gia views
    @GetMapping("/danh_gia_view/*")
    public String danhGiaView(HttpServletRequest request, HttpSession session) {

        String url = request.getRequestURI();
        String[] parts = url.split("/danh_gia_view/");
        String id = parts[1];

        HoaDon hoaDon = hoaDonService.getByMa(Long.parseLong(id));
        session.setAttribute("hoaDonDanhGia", hoaDon);

        return "redirect:/MyAccount/" + hoaDon.getKhachHang().getMaKhachHang();
    }

    @PostMapping("/danh_gia")
    public String addDanhGia(HttpServletRequest request){

        String idKh = request.getParameter("maKhachHang");
        String tenSanPham = request.getParameter("san-pham");
        String binhLuan = request.getParameter("binhLuan");


        KhachHang khachHang = khachHangService.getByMa(Long.parseLong(idKh));

        DanhGia danhGia = new DanhGia();
        danhGia.setKhachHang(khachHang);
//        danhGia.setChiTietSanPham(chiTietSanPham);
        danhGia.setSanPham(sanPhamRepository.findByTenSanPham(tenSanPham));
        danhGia.setDanhGia(binhLuan);
        ZoneOffset zoneOffset = ZoneOffset.of("+07:00");
        danhGia.setNgayDanhGia(new Date(LocalDateTime.now().toInstant(zoneOffset).toEpochMilli()));
        danhGia.setTrangThai(1);

        danhGiaRepository.save(danhGia);

        return "redirect:/MyAccount/"+ idKh;
    }

}
