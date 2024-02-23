package com.example.demo.Config;

import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.GiamGiaCTSPRepository;
import com.example.demo.Repository.GioHangChiTietRepository;
import com.example.demo.Repository.GioHangRepository;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.GioHangChiTietService;
import com.example.demo.Service.GioHangService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mssql.googlecode.cityhash.CityHash;
import org.apache.poi.hpsf.Decimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.NumberFormatter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private GioHangChiTietService gioHangChiTietService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @GetMapping("/cart/{maKhachHang}")
    public String showCart(Model model, @PathVariable(name = "maKhachHang") Long maKhachHang
    ) {
        KhachHang khachHangs = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHangs);
        GioHang g = gioHangService.getByKhachHang(khachHangs);
//        List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepository.getByGioHang_KhachHang(khachHangs);
//        model.addAttribute("cart", gioHangChiTiets);
        Double tongTien = 0.0;
        Double tongTienSauGiam = 0.0;
        List<GioHangChiTietDTO> gioHangChiTietDTOs = gioHangChiTietRepository.getGHCTByMaKH(khachHangs.getMaKhachHang());
        for (GioHangChiTietDTO gioHangChiTietDTO : gioHangChiTietDTOs) {
            tongTien += (Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(gioHangChiTietDTO.getChiTietSanPham().getMaChiTietSanPham());
            if (giamGiaChiTietSanPham != null) {
                gioHangChiTietDTO.setGiaSauKhiGiam(giamGiaChiTietSanPham.getGiaSauKhiGiam());
                tongTienSauGiam += (Double.parseDouble(String.valueOf(giamGiaChiTietSanPham.getGiaSauKhiGiam())) * gioHangChiTietDTO.getSoLuong());
            } else {
                gioHangChiTietDTO.setGiaSauKhiGiam(gioHangChiTietDTO.getChiTietSanPham().getGiaBan());
                tongTienSauGiam += (Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            }
        }
        DecimalFormat formatter = new DecimalFormat("#0.0");
        model.addAttribute("cart", gioHangChiTietDTOs);
        model.addAttribute("tongTien", formatter.format(tongTien));
        model.addAttribute("tongTienGiam", formatter.format(tongTien - tongTienSauGiam));
        model.addAttribute("tongTienSG", formatter.format(tongTienSauGiam));

        return "/cart";
    }

    @GetMapping("/cart/{maKhachHang}/add-san-pham/{maChiTietSanPham}")
    public ResponseEntity<String> addToCart(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham,
            Model model,
            HttpServletRequest request) {
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
            gioHangChiTiet.setSoLuong(1);
            //test
//            gioHangChiTiet.setGiaBan(ctsp.getGiaBan());k
            gioHangChiTiet.setTrangThai(1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        }
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
        for (GioHangChiTiet ghct : listGHCT) {
            listTN.add(ghct.getChiTietSanPham());
            DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
        }

//        GioHangChiTiet gioHangChiTiet1 = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gioHangRepository.getByKhachHang(khachHangService.getByMa(maKhachHang)));
//        if (gioHangChiTiet1 != null){
//            model.addAttribute("soLuongTrongGioHang", gioHangChiTiet1.getSoLuong());
//        }else{
//            model.addAttribute("soLuongTrongGioHang", 0);
//        }

        model.addAttribute("sp", listTN);
        model.addAttribute("DSSP", DSSP);
        gioHangChiTietService.addGHCT(gioHangChiTiet);
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }

    @PostMapping("/cart/{maKhachHang}/add-san-pham2/{maChiTietSanPham}")
    public ResponseEntity<String> addToCart2(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham,
            Model model,
            HttpServletRequest request) {
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
            gioHangChiTiet.setSoLuong(1);
            //nghịch tý
            String gia = request.getParameter("gia");
//            gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(gia)));
            //
            gioHangChiTiet.setTrangThai(1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        }
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
        for (GioHangChiTiet ghct : listGHCT) {
            listTN.add(ghct.getChiTietSanPham());
            DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
        }
        model.addAttribute("sp", listTN);
        model.addAttribute("DSSP", DSSP);
        gioHangChiTietService.addGHCT(gioHangChiTiet);
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }

    @PostMapping("/cart/{maKhachHang}/add-san-pham1/{tenSanPham}")
    public ResponseEntity<String> addToCart1(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "tenSanPham") String tenSanPham,
            Model model, HttpServletRequest request) {
        String tenDungLuong = request.getParameter("tenDungLuong");
        String tenMauSac = request.getParameter("tenMauSac");
        System.out.println(tenSanPham);
        System.out.println(tenDungLuong);
        System.out.println(tenMauSac);
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamRepository.getCTSPByMauSacAndDungLuongAndTen(tenSanPham, tenDungLuong, tenMauSac);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
//                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaSauGiam"))));
            gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong1")));
            gioHangChiTiet.setTrangThai(1);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong1")));
        }
                    List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
            for (GioHangChiTiet ghct : listGHCT) {
                listTN.add(ghct.getChiTietSanPham());
                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
            }
            model.addAttribute("sp", listTN);
            model.addAttribute("DSSP", DSSP);
            gioHangChiTietService.addGHCT(gioHangChiTiet);
        //add spp co ma giam gia
//        String check = request.getParameter("check");
//        if (Integer.parseInt(check) == 1) {
//            model.addAttribute("sl", request.getParameter("soLuong2"));
//            model.addAttribute("phanTramGiamGia", request.getParameter("phanTramGiamGia"));
//            model.addAttribute("gia", request.getParameter("giaSauGiam"));
//
////            Cookie gia = new Cookie("gia", request.getParameter("giaSauGiam"));
////            gia.setMaxAge(3600);
////            response.addCookie(gia);
//
//            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
//            if (gioHangChiTiet == null) {
//                gioHangChiTiet = new GioHangChiTiet();
//                gioHangChiTiet.setChiTietSanPham(ctsp);
//                gioHangChiTiet.setGioHang(g);
////                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaSauGiam"))));
//                gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong2")));
//                gioHangChiTiet.setTrangThai(1);
//            } else {
//                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong2")));
//            }
//            List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
//            for (GioHangChiTiet ghct : listGHCT) {
//                listTN.add(ghct.getChiTietSanPham());
//                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
//            }
//            model.addAttribute("sp", listTN);
//            model.addAttribute("DSSP", DSSP);
//            gioHangChiTietService.addGHCT(gioHangChiTiet);
//        } else {
//            model.addAttribute("gia", request.getParameter("giaBan"));
//            model.addAttribute("sl", request.getParameter("soLuong1"));
//            model.addAttribute("phanTramGiamGia", 0);
//
//            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
//            if (gioHangChiTiet == null) {
//                gioHangChiTiet = new GioHangChiTiet();
//                gioHangChiTiet.setChiTietSanPham(ctsp);
//                gioHangChiTiet.setGioHang(g);
////                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaBan"))));
//                gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong1")));
//                gioHangChiTiet.setTrangThai(1);
//            } else {
//                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong1")));
//            }
//            List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
//            for (GioHangChiTiet ghct : listGHCT) {
//                listTN.add(ghct.getChiTietSanPham());
//                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
//            }
//            model.addAttribute("sp", listTN);
//            model.addAttribute("DSSP", DSSP);
//            gioHangChiTietService.addGHCT(gioHangChiTiet);
//        }
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }


    @GetMapping("/cart/{maKhachHang}/giamSoLuong/{maChiTietSanPham}")
    public String giamSoLuong(@PathVariable(name = "maKhachHang") Long maKhachHang,
                              @PathVariable("maChiTietSanPham") Long maChiTietSanPham
            , Model model) {
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gh);
        ghct.setSoLuong(ghct.getSoLuong() - 1);
        chiTietSanPhamRepository.save(ctsp);
        if (ghct.getSoLuong() == 0) {
            gioHangChiTietRepository.delete(ghct);
            return "redirect:/cart/{maKhachHang}";
        }
        ghct = gioHangChiTietRepository.save(ghct);
        return "redirect:/cart/{maKhachHang}";
    }


    @GetMapping("/cart/{maKhachHang}/tangSoLuong/{maChiTietSanPham}")
    public String tangSoLuong(@PathVariable(name = "maKhachHang") Long maKhachHang, @PathVariable("maChiTietSanPham") Long maChiTietSanPham
            , Model model) {
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gh);
        ghct.setSoLuong(ghct.getSoLuong() + 1);
        chiTietSanPhamRepository.save(ctsp);
        gioHangChiTietRepository.save(ghct);

        return "redirect:/cart/{maKhachHang}";
    }

    @GetMapping("/cart/{maKhachHang}/xoaSanPham/{maChiTietSanPham}")
    public String xoaTaiNghe(@PathVariable(name = "maKhachHang") Long maKhachHang, @PathVariable("maChiTietSanPham") Long maChiTietSanPham
            , Model model) {
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gh);
        ctsp.setSoLuongBan(ctsp.getSoLuongBan());
        chiTietSanPhamRepository.save(ctsp);
        gioHangChiTietRepository.delete(ghct);
        return "redirect:/cart/{maKhachHang}";
    }

    @GetMapping("/out")
    public String out() {
        return "checkout";
    }

}

