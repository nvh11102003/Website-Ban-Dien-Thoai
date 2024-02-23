package com.example.demo.Controller;


import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Service.*;
import com.example.demo.Service.VNPChuaDN.VnpayServiceChuaDN;
import com.example.demo.Service.VNPChuaDN.VnpayServiceDN;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.DocumentException;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class VnpayController {
    @Autowired
    private VnpayService vnPayService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private VnpayServiceChuaDN vnpayServiceChuaDN;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    @Autowired
    private VnpayServiceDN vnpayServiceDN;

    @GetMapping("index")
    public String home() {
        return "index";
    }

    @PostMapping("/submitOrder")
    public String submidOrderKhiDangNhap(@CookieValue("makhachhang") Long maKhachHang, @RequestParam("tongTien") String orderTotal,
                                         @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response
            , HttpServletRequest request) throws UnsupportedEncodingException {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);

        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        GioHang gh = gioHangService.getByKhachHang(kh);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);


        String[] soLuongArray = request.getParameterValues("soLuong");

        // Chuyển mảng số lượng thành một danh sách List<Integer>
        List<Integer> listSoLuong = new ArrayList<>();
        if (soLuongArray != null) {
            for (String soLuong : soLuongArray) {
                // Kiểm tra và chuyển đổi số lượng từ chuỗi sang số nguyên
                try {
                    int soLuongInt = Integer.parseInt(soLuong);
                    listSoLuong.add(soLuongInt);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi
                    e.printStackTrace();
                }
            }
        }

        // Chuyển danh sách số lượng thành chuỗi JSON
        ObjectMapper mapper = new ObjectMapper();
        String danhSachSoLuongJson = "";
        try {
            danhSachSoLuongJson = mapper.writeValueAsString(listSoLuong);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
// Encode chuỗi JSON
        String encodedDanhSachSoLuongJson = URLEncoder.encode(danhSachSoLuongJson, "UTF-8");

// Tạo cookie với giá trị đã được encode
        Cookie soLuongCookie = new Cookie("listSoLuong", encodedDanhSachSoLuongJson);
        soLuongCookie.setMaxAge(3600);

// Thêm cookie vào response
        response.addCookie(soLuongCookie);

        String[] sanPhamArray = request.getParameterValues("maChiTietSanPhamss");

        // Chuyển mảng số lượng thành một danh sách List<Integer>
        List<Integer> listMaChiTietSanPham = new ArrayList<>();
        if (sanPhamArray != null) {
            for (String maChiTietSanPham : sanPhamArray) {
                // Kiểm tra và chuyển đổi số lượng từ chuỗi sang số nguyên
                try {
                    int maCTSP = Integer.parseInt(maChiTietSanPham);
                    listMaChiTietSanPham.add(maCTSP);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi
                    e.printStackTrace();
                }
            }
        }

        // Chuyển danh sách số lượng thành chuỗi JSON
        ObjectMapper mapper1 = new ObjectMapper();
        String danhSachMaChiTietSanPhamJson = "";
        try {
            danhSachMaChiTietSanPhamJson = mapper.writeValueAsString(listMaChiTietSanPham);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
// Encode chuỗi JSON
        String encodedDanhSachMaChiTietSanPhamJson = URLEncoder.encode(danhSachMaChiTietSanPhamJson, "UTF-8");

// Tạo cookie với giá trị đã được encode
        Cookie maChiTietSanPhamCookie = new Cookie("listMaChiTietSanPham", encodedDanhSachMaChiTietSanPhamJson);
        maChiTietSanPhamCookie.setMaxAge(3600);

// Thêm cookie vào response
        response.addCookie(maChiTietSanPhamCookie);

//        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String maVoucher = request.getParameter("maVoucher3");

        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");
        String giaTriCookieMaVoucher = URLEncoder.encode(maVoucher, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");


//        //cookie

        String giaTienSauGiamFormatted = orderTotal.replaceAll("[^\\d]", "");
        Cookie cookie3 = new Cookie("tongTien", giaTienSauGiamFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);

        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);

        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);
        Cookie cookie12 = new Cookie("maVoucher", giaTriCookieMaVoucher);

        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);

        cookie8.setMaxAge(3600);

        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);
        cookie12.setMaxAge(3600);


        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie8);

        response.addCookie(cookie10);
        response.addCookie(cookie11);
        response.addCookie(cookie12);


        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnPayService.createOrder(BigDecimal.valueOf(Double.parseDouble(giaTienSauGiamFormatted)), orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }


    //thanh toán ngay
    @PostMapping("/submitOrder1")
    public String submidOrderChuaDangNhap(@RequestParam("tongTien") String orderTotal,
                                          @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response,
                                          HttpServletRequest request) throws DocumentException, MessagingException, IOException {
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaTienSauGiam = request.getParameter("giaTienSauGiam1");
        String giaTienSauGiamFormatted = giaTienSauGiam.replaceAll("[^\\d]", "");
        String orderTotalFormatted = orderTotal.replaceAll("[^\\d]", "");
        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");
        String giaTriCookieEmail = URLEncoder.encode(email, "UTF-8");


        //cookie
        Cookie cookie1 = new Cookie("giaSauGiam", giaTienSauGiamFormatted);
        Cookie cookie2 = new Cookie("soLuong", request.getParameter("soLuong"));
        Cookie cookie3 = new Cookie("tongTien", orderTotalFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);
        Cookie cookie7 = new Cookie("maChiTietSanPham", maChiTietSanPham);
        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);
        Cookie cookie9 = new Cookie("email", giaTriCookieEmail);
        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);


        cookie1.setMaxAge(3600);
        cookie2.setMaxAge(3600);
        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);
        cookie7.setMaxAge(3600);
        cookie8.setMaxAge(3600);
        cookie9.setMaxAge(3600);
        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);

        response.addCookie(cookie1);
        response.addCookie(cookie2);
        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie7);
        response.addCookie(cookie8);
        response.addCookie(cookie9);
        response.addCookie(cookie10);
        response.addCookie(cookie11);

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnpayServiceChuaDN.createOrder(BigDecimal.valueOf(Double.parseDouble(orderTotalFormatted)), orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    @GetMapping("/vnpay-payment1")
    public String ThanhToanKhiChuaDangNhap(
            @CookieValue(name = "giaSauGiam") String giaTienSauGiam1,
            @CookieValue(name = "maChiTietSanPham") Long maChiTietSanPham,
            @CookieValue(name = "tongTien") BigDecimal orderTotal,
            @CookieValue(name = "soLuong") Integer soLuong,
            @CookieValue(name = "tinh") String tinh,
            @CookieValue(name = "huyen") String huyen, @CookieValue(name = "xa") String xa
            , @CookieValue(name = "nguoiNhan") String nguoiNhan,
            @CookieValue(name = "email") String email,
            @CookieValue(name = "sdt") String sdt, @CookieValue(name = "diaChi") String diaChi

            , HttpServletRequest request, HttpServletResponse response, Model model) throws DocumentException, MessagingException, IOException {

        int paymentStatus = vnpayServiceChuaDN.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        if (paymentStatus == 1) {
// Lấy các giá trị từ cookie và giải mã
            String giaTriDaGiaiMaTinh = "", giaTriDaGiaiMaHuyen = "", giaTriDaGiaiMaXa = "", giaTriDaGiaiMaNguoiNhan = "", giaTriDaGiaiMaDiaChi = "", giaTriDaGiaiMaEmail = "";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    switch (cookie.getName()) {
                        case "tinh":
                            giaTriDaGiaiMaTinh = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "huyen":
                            giaTriDaGiaiMaHuyen = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "xa":
                            giaTriDaGiaiMaXa = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "nguoiNhan":
                            giaTriDaGiaiMaNguoiNhan = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "diaChi":
                            giaTriDaGiaiMaDiaChi = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "email":
                            giaTriDaGiaiMaEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;

                    }
                }
            }

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();

            // Sử dụng thông tin từ cookie để tạo KhachHang
            KhachHang k = KhachHang.builder()
                    .ten(giaTriDaGiaiMaNguoiNhan)
                    .email(giaTriDaGiaiMaEmail)
                    .sdt(sdt)
                    .diaChi(giaTriDaGiaiMaDiaChi)
                    .build();
            khachHangRepository.save(k);


            HoaDon hd = HoaDon.builder()
                    .nguoiNhan(k.getTen())
                    .khachHang(k)
                    .diaChi(k.getDiaChi())
                    .sdt(k.getSdt())
                    .trangThai(0)
                    .nhanVien(nhanVienMD)
                    .ngayTao(Date.valueOf(datenow))
                    .ngayThanhToan(Date.valueOf(datenow))
                    .tongTien(orderTotal)
                    .loaiThanhToan(1)
                    .tinh(giaTriDaGiaiMaTinh)
                    .huyen(giaTriDaGiaiMaHuyen)
                    .xa(giaTriDaGiaiMaXa)
                    .build();
            hoaDonRepository.save(hd);

            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(maChiTietSanPham);

            for (int i = 0; i < soLuong; i++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setHoaDon(hd);
                hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(giaTienSauGiam1)));
                hoaDonChiTiet.setSoLuongMua(1);
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTiet.setCreatedDate(new java.util.Date());
                hoaDonChiTiet.setLastUpdate(new java.util.Date());
                hoaDonChiTietRepository.save(hoaDonChiTiet);

                chiTietSanPham.setSoLuongBan(chiTietSanPham.getSoLuongBan() + hoaDonChiTiet.getSoLuongMua());
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            if (chiTietSanPham.getSoLuongNhap() <= chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(0);
//                SanPham sp = sanPhamRepository.findById(chiTietSanPham.getSanPham().getMaSanPham()).orElse(null);
//                sp.setTrangThai(0);
//                sanPhamRepository.save(sp);
                chiTietSanPhamRepository.save(chiTietSanPham);
            }


            hoaDonService.sendEmailWithAttachment(k.getEmail());

            Cookie cookie = new Cookie("makhachhang", null);
            cookie.setMaxAge(0);
            response.addCookie(cookie);

            Cookie cookie12 = new Cookie("maHoaDon", null);
            cookie12.setMaxAge(0);
            response.addCookie(cookie12);

            Cookie cookie1 = new Cookie("giaSauGiam", null);
            Cookie cookie2 = new Cookie("soLuong", null);
            Cookie cookie3 = new Cookie("tongTien", null);
            Cookie cookie4 = new Cookie("tinh", null);
            Cookie cookie5 = new Cookie("huyen", null);
            Cookie cookie6 = new Cookie("xa", null);
            Cookie cookie7 = new Cookie("maChiTietSanPham", null);
            Cookie cookie8 = new Cookie("nguoiNhan", null);
            Cookie cookie9 = new Cookie("email", null);
            Cookie cookie10 = new Cookie("sdt", null);
            Cookie cookie11 = new Cookie("diaChi", null);


            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            cookie4.setMaxAge(0);
            cookie5.setMaxAge(0);
            cookie6.setMaxAge(0);
            cookie7.setMaxAge(0);
            cookie8.setMaxAge(0);
            cookie9.setMaxAge(0);
            cookie10.setMaxAge(0);
            cookie11.setMaxAge(0);

            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            response.addCookie(cookie4);
            response.addCookie(cookie5);
            response.addCookie(cookie6);
            response.addCookie(cookie7);
            response.addCookie(cookie8);
            response.addCookie(cookie9);
            response.addCookie(cookie10);
            response.addCookie(cookie11);

            return "/VNP/odersuc";
        } else {
            return "/VNP/orderfail";
        }

    }


    @GetMapping("/vnpay-payment")
    public String ThanhToanKhiDangNhap(@CookieValue(name = "makhachhang") Long makhachhang,
                                       @CookieValue(name = "tongTien") BigDecimal orderTotal,
                                       @CookieValue(name = "tinh") String tinh,
                                       @CookieValue(name = "huyen") String huyen, @CookieValue(name = "xa") String xa,
                                       @CookieValue(name = "nguoiNhan") String nguoiNhan,
                                       @CookieValue(name = "sdt") String sdt,
                                       @CookieValue(name = "diaChi") String diaChi,
                                       HttpServletRequest request, HttpServletResponse response, Model model) throws DocumentException, MessagingException, IOException {

        int paymentStatus = vnPayService.orderReturn(request);

        model.addAttribute("makhachhang", makhachhang);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);


        if (paymentStatus == 1) {
            Cookie[] cookies = request.getCookies();
            String danhSachSoLuongJsonEncoded = " ";
            String chiTietSanPhamJsonEncoded = " ";


            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("listSoLuong")) {
                        danhSachSoLuongJsonEncoded = cookie.getValue();
                    } else if (cookie.getName().equals("listMaChiTietSanPham")) {
                        chiTietSanPhamJsonEncoded = cookie.getValue();
                    }
                }
            }

// Giải mã danh sách số lượng
            List<Integer> listSoLuong = new ArrayList<>();
            if (danhSachSoLuongJsonEncoded != null) {
                try {
                    String danhSachSoLuongJson = URLDecoder.decode(danhSachSoLuongJsonEncoded, "UTF-8");
                    ObjectMapper mapper = new ObjectMapper();
                    listSoLuong = mapper.readValue(danhSachSoLuongJson, new TypeReference<List<Integer>>() {
                    });
                    System.out.println(listSoLuong);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

// Giải mã danh sách chi tiết sản phẩm
            List<Integer> chiTietSanPhamList = new ArrayList<>();
            if (chiTietSanPhamJsonEncoded != null) {
                try {
                    String chiTietSanPhamJson = URLDecoder.decode(chiTietSanPhamJsonEncoded, "UTF-8");
                    ObjectMapper mapper = new ObjectMapper();
                    chiTietSanPhamList = mapper.readValue(chiTietSanPhamJson, new TypeReference<List<Integer>>() {
                    });
                    System.out.println(chiTietSanPhamList);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            String giaTriDaGiaiMaTinh = "", giaTriDaGiaiMaHuyen = "", giaTriDaGiaiMaXa = "", giaTriDaGiaiMaNguoiNhan = "", giaTriDaGiaiMaDiaChi = "", giaTriDaGiaiMaEmail = "", giaTriDaGiaiMaMaVoucher = "";

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    switch (cookie.getName()) {
                        case "tinh":
                            giaTriDaGiaiMaTinh = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "huyen":
                            giaTriDaGiaiMaHuyen = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "xa":
                            giaTriDaGiaiMaXa = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "nguoiNhan":
                            giaTriDaGiaiMaNguoiNhan = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "diaChi":
                            giaTriDaGiaiMaDiaChi = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "maVoucher":
                            giaTriDaGiaiMaMaVoucher = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;

                    }
                }
            }
            KhachHang kh = khachHangService.getByMa(makhachhang);
            List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(makhachhang));
            model.addAttribute("hd", hd);
            model.addAttribute("kh", kh);

            Map<String, Integer> DSSP = new HashMap<>();
            List<SanPham> listSP = new ArrayList<>();

            GioHang gh = gioHangService.getByKhachHang(kh);
            List<HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);
            List<GioHangChiTietDTO> listGHCT = gioHangChiTietRepository.getGHCTByMaGH(gh.getMaGioHang());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();
            Long maVoucherLong = null;
            if(giaTriDaGiaiMaMaVoucher != ""){
                maVoucherLong = Long.parseLong(giaTriDaGiaiMaMaVoucher);
            }
            HoaDon hd1 = HoaDon.builder().
                    nguoiNhan(giaTriDaGiaiMaNguoiNhan).
                    khachHang(khachHangService.getByMa(makhachhang)).
                    diaChi(giaTriDaGiaiMaDiaChi).
                    ngayTao(java.sql.Date.valueOf(datenow)).
                    nhanVien(nhanVienRepository.getReferenceById(1L)).
                    tongTien(orderTotal).
                    trangThai(0).
                    loaiThanhToan(1).
                    ngayThanhToan(java.sql.Date.valueOf(datenow)).
                    sdt(sdt).
                    tinh(giaTriDaGiaiMaTinh).huyen(giaTriDaGiaiMaHuyen).xa(giaTriDaGiaiMaXa).
                    maVoucher(maVoucherLong).
                    build();
            hoaDonRepository.save(hd1);

            for (int i = 0; i < listGHCT.size(); i++) {
                for (int j = 0; j < listGHCT.get(i).getSoLuong(); j++) {
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                    hoaDonChiTiet.setHoaDon(hd1);
                    hoaDonChiTiet.setChiTietSanPham(listGHCT.get(i).getChiTietSanPham());
                    GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(listGHCT.get(i).getChiTietSanPham().getMaChiTietSanPham());
                    if (giamGiaChiTietSanPham != null) {
                        hoaDonChiTiet.setGiaTien(giamGiaChiTietSanPham.getGiaSauKhiGiam());
                    } else {
                        hoaDonChiTiet.setGiaTien(listGHCT.get(i).getChiTietSanPham().getGiaBan());
                    }
                    hoaDonChiTiet.setSoLuongMua(1);
                    hoaDonChiTiet.setTrangThai(1);
                    hoaDonChiTietRepository.save(hoaDonChiTiet);
                }
                ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(listGHCT.get(i).getChiTietSanPham().getMaChiTietSanPham());
                if (chiTietSanPham.getSoLuongBan() >= chiTietSanPham.getSoLuongNhap()) {
                    chiTietSanPham.setTrangThai(0);
//                    chiTietSanPham.getSanPham().setTrangThai(0);
                }
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            model.addAttribute("hd", hd);
            model.addAttribute("listHD", listHD);
            model.addAttribute("sanPham", listSP);
            model.addAttribute("DSSP", DSSP);


            hoaDonService.sendEmailWithAttachment(hd1.getKhachHang().getEmail());
            for (GioHangChiTietDTO ghct : listGHCT) {
                GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(ghct.getMagiohangchitiet()).orElse(null);
                gioHangChiTietRepository.delete(gioHangChiTiet);
            }

            Cookie cookie3 = new Cookie("tongTien", null);
            Cookie cookie12 = new Cookie("listSoLuong", null);
            Cookie cookie13 = new Cookie("listMaChiTietSanPham", null);
            Cookie cookie4 = new Cookie("tinh", null);
            Cookie cookie5 = new Cookie("huyen", null);
            Cookie cookie6 = new Cookie("xa", null);

            Cookie cookie8 = new Cookie("nguoiNhan", null);

            Cookie cookie10 = new Cookie("sdt", null);
            Cookie cookie11 = new Cookie("diaChi", null);

            cookie3.setMaxAge(0);
            cookie4.setMaxAge(0);
            cookie5.setMaxAge(0);
            cookie6.setMaxAge(0);

            cookie8.setMaxAge(0);

            cookie10.setMaxAge(0);
            cookie11.setMaxAge(0);
            cookie12.setMaxAge(0);
            cookie13.setMaxAge(0);


            response.addCookie(cookie3);
            response.addCookie(cookie4);
            response.addCookie(cookie5);
            response.addCookie(cookie6);
            response.addCookie(cookie8);

            response.addCookie(cookie10);
            response.addCookie(cookie11);
            response.addCookie(cookie12);
            response.addCookie(cookie13);

            return "/VNP/ordersuccess";
        } else {
            return "/VNP/orderfaildn";
        }
    }

    //thanh toán ngay
    @PostMapping("/submitOrder2")
    public String submidOrderMuaNgayKhiDN(@RequestParam("tongTien") String orderTotal,
                                          @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response,
                                          HttpServletRequest request) throws DocumentException, MessagingException, IOException {
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String maVoucher = request.getParameter("maVoucher3");

        String giaTienSauGiam = request.getParameter("giaSauGiam");
        String giaTienSauGiamFormatted = giaTienSauGiam.replaceAll("[^\\d]", "");
        String orderTotalFormatted = orderTotal.replaceAll("[^\\d]", "");
        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");
        String giaTriCookieMaVoucher = URLEncoder.encode(maVoucher, "UTF-8");


        //cookie
        Cookie cookie1 = new Cookie("giaSauGiam", giaTienSauGiamFormatted);
        Cookie cookie2 = new Cookie("soLuong", request.getParameter("soLuong"));
        Cookie cookie3 = new Cookie("tongTien", orderTotalFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);
        Cookie cookie7 = new Cookie("maChiTietSanPham", maChiTietSanPham);
        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);
        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);
        Cookie cookie12 = new Cookie("maVoucher", giaTriCookieMaVoucher);


        cookie1.setMaxAge(3600);
        cookie2.setMaxAge(3600);
        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);
        cookie7.setMaxAge(3600);
        cookie8.setMaxAge(3600);
        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);
        cookie12.setMaxAge(3600);

        response.addCookie(cookie1);
        response.addCookie(cookie2);
        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie7);
        response.addCookie(cookie8);
        response.addCookie(cookie10);
        response.addCookie(cookie11);
        response.addCookie(cookie12);

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnpayServiceDN.createOrder(BigDecimal.valueOf(Double.parseDouble(orderTotalFormatted)), orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    @GetMapping("/vnpay-payment2")
    public String ThanhToanMuaNgayKhiDangNhap(
            @CookieValue(name = "giaSauGiam") BigDecimal giaTienSauGiam1,
            @CookieValue(name = "makhachhang") Long maKhachHang,
            @CookieValue(name = "maChiTietSanPham") Long maChiTietSanPham,
            @CookieValue(name = "tongTien") BigDecimal orderTotal,
            @CookieValue(name = "soLuong") Integer soLuong,
            @CookieValue(name = "tinh") String tinh,
            @CookieValue(name = "huyen") String huyen, @CookieValue(name = "xa") String xa
            , @CookieValue(name = "nguoiNhan") String nguoiNhan,
            @CookieValue(name = "sdt") String sdt, @CookieValue(name = "diaChi") String diaChi

            , HttpServletRequest request, HttpServletResponse response, Model model) throws DocumentException, MessagingException, IOException {

        int paymentStatus = vnpayServiceChuaDN.orderReturn(request);
        model.addAttribute("makhachhang", maKhachHang);
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        if (paymentStatus == 1) {
// Lấy các giá trị từ cookie và giải mã
            String giaTriDaGiaiMaTinh = "", giaTriDaGiaiMaHuyen = "", giaTriDaGiaiMaXa = "", giaTriDaGiaiMaNguoiNhan = "", giaTriDaGiaiMaDiaChi = "", giaTriDaGiaiMaEmail = "",giaTriDaGiaiMaMaVoucher = "";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    switch (cookie.getName()) {
                        case "tinh":
                            giaTriDaGiaiMaTinh = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "huyen":
                            giaTriDaGiaiMaHuyen = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "xa":
                            giaTriDaGiaiMaXa = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "nguoiNhan":
                            giaTriDaGiaiMaNguoiNhan = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "diaChi":
                            giaTriDaGiaiMaDiaChi = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "maVoucher":
                            giaTriDaGiaiMaMaVoucher = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;

                    }
                }
            }

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();
            Long maVoucherLong = null;
            if(giaTriDaGiaiMaMaVoucher != ""){
                maVoucherLong = Long.parseLong(giaTriDaGiaiMaMaVoucher);
            }
            HoaDon hd1 = HoaDon.builder()
                    .nguoiNhan(giaTriDaGiaiMaNguoiNhan)
                    .khachHang(kh)
                    .diaChi(giaTriDaGiaiMaDiaChi)
                    .sdt(kh.getSdt())
                    .trangThai(0)
                    .nhanVien(nhanVienMD)
                    .ngayTao(Date.valueOf(datenow))
                    .ngayThanhToan(Date.valueOf(datenow))
                    .tongTien(orderTotal)
                    .loaiThanhToan(1)
                    .tinh(giaTriDaGiaiMaTinh)
                    .huyen(giaTriDaGiaiMaHuyen)
                    .xa(giaTriDaGiaiMaXa)
                    .maVoucher(maVoucherLong)
                    .build();
            hoaDonRepository.save(hd1);

            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(maChiTietSanPham);
            for (int i = 0; i < soLuong; i++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setHoaDon(hd1);
                hoaDonChiTiet.setGiaTien(giaTienSauGiam1);
                hoaDonChiTiet.setSoLuongMua(1);
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTiet.setCreatedDate(new java.util.Date());
                hoaDonChiTiet.setLastUpdate(new java.util.Date());
                hoaDonChiTietRepository.save(hoaDonChiTiet);

                chiTietSanPham.setSoLuongBan(chiTietSanPham.getSoLuongBan() + hoaDonChiTiet.getSoLuongMua());
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            if (chiTietSanPham.getSoLuongNhap() <= chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(0);
//                SanPham sp = sanPhamRepository.findById(chiTietSanPham.getSanPham().getMaSanPham()).orElse(null);
//                sp.setTrangThai(0);
//                sanPhamRepository.save(sp);
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            hoaDonService.sendEmailWithAttachment(kh.getEmail());

            Cookie cookie1 = new Cookie("giaSauGiam", null);
            Cookie cookie2 = new Cookie("soLuong", null);
            Cookie cookie3 = new Cookie("tongTien", null);
            Cookie cookie4 = new Cookie("tinh", null);
            Cookie cookie5 = new Cookie("huyen", null);
            Cookie cookie6 = new Cookie("xa", null);
            Cookie cookie7 = new Cookie("maChiTietSanPham", null);
            Cookie cookie8 = new Cookie("nguoiNhan", null);
            Cookie cookie10 = new Cookie("sdt", null);
            Cookie cookie11 = new Cookie("diaChi", null);
            Cookie cookie12 = new Cookie("maVoucher", null);


            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            cookie4.setMaxAge(0);
            cookie5.setMaxAge(0);
            cookie6.setMaxAge(0);
            cookie7.setMaxAge(0);
            cookie8.setMaxAge(0);
            cookie10.setMaxAge(0);
            cookie11.setMaxAge(0);
            cookie12.setMaxAge(0);

            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            response.addCookie(cookie4);
            response.addCookie(cookie5);
            response.addCookie(cookie6);
            response.addCookie(cookie7);
            response.addCookie(cookie8);
            response.addCookie(cookie10);
            response.addCookie(cookie11);
            response.addCookie(cookie12);

            return "/VNP/ordersuccess";
        } else {
            return "/VNP/orderfaildn";
        }

    }
}
