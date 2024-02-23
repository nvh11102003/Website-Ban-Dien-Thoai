package com.example.demo.Config;

import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Dto.HoaDonModel;
import com.example.demo.Dto.ListDungLuongOfSanPhamDTO;
import com.example.demo.Dto.Request.VoucherRequest;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Repository.vi.GiaoDichViRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.*;
import com.itextpdf.text.*;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.List;

import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

import com.itextpdf.text.pdf.PdfWriter;

@Controller
public class HoaDonController {
    @Autowired
    GioHangService gioHangService;

    @Autowired
    GioHangRepository gioHangRepository;
    //
    @Autowired
    GioHangChiTietService gioHangChiTietService;

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    KhachHangService userService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    SanPhamService sanPhamService;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    NhanVienRepository nhanVienRepository;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private VoucherService voucherService;

    @Autowired
    GiamGiaCTSPRepository giamGiaCTSPRepository;

    @Autowired
    ViShopRepository viShopRepository;

    @Autowired
    GiaoDichViRepository giaoDichViRepository;

    @Autowired
    DungLuongRepository dungLuongRepository;

    @Value("${FONT}")
    private String font;

    @Value("${PDF_DIRECTORY}")
    private String pdfDirectory;

    @Value("${IMG_LOGO_PATH}")
    private String imgLogoPath;

    @GetMapping("/thanhtoan/{maKhachHang}")
    public String hoaDonView(@PathVariable(name = "maKhachHang") Long maKhachHang, Model model) {
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listSanPham = new ArrayList<>();
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
//        HoaDon hoaDon = hoaDonRepository.getBykhachHang(user);

//        model.addAttribute("hds", hoaDon);
        model.addAttribute("viShop", viShopRepository.getByKhachHang(user));

        List<HoaDon> listhd = hoaDonService.getAllBykhachHang(user);
        GioHang g = gioHangService.getByKhachHang(user);

        Integer tongTien = 0;
        Integer tongTienSauGiam = 0;
        List<GioHangChiTietDTO> gioHangChiTietDTOs = gioHangChiTietRepository.getGHCTByMaKH(user.getMaKhachHang());
        for (GioHangChiTietDTO gioHangChiTietDTO : gioHangChiTietDTOs) {
            double giaBanDouble = Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan()));
            int giaBanInt = (int) giaBanDouble;
            tongTien += (giaBanInt * gioHangChiTietDTO.getSoLuong());
//            tongTien += (Integer.parseInt(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(gioHangChiTietDTO.getChiTietSanPham().getMaChiTietSanPham());
            if (giamGiaChiTietSanPham != null) {
                gioHangChiTietDTO.setGiaSauKhiGiam(giamGiaChiTietSanPham.getGiaSauKhiGiam());
                double giaSauKhiGiamDouble = Double.parseDouble(String.valueOf(giamGiaChiTietSanPham.getGiaSauKhiGiam()));
                int giaSauKhiGiamInt = (int) giaSauKhiGiamDouble;
                tongTienSauGiam += (giaSauKhiGiamInt * gioHangChiTietDTO.getSoLuong());

//                tongTienSauGiam += (Integer.parseInt(String.valueOf(giamGiaChiTietSanPham.getGiaSauKhiGiam())) * gioHangChiTietDTO.getSoLuong());
            } else {
                gioHangChiTietDTO.setGiaSauKhiGiam(gioHangChiTietDTO.getChiTietSanPham().getGiaBan());
                double giaBanDouble1 = Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan()));
                int giaBanInt1 = (int) giaBanDouble1;
                tongTienSauGiam += (giaBanInt1 * gioHangChiTietDTO.getSoLuong());

//                tongTienSauGiam += (Integer.parseInt(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            }
        }
        model.addAttribute("cart", gioHangChiTietDTOs);
        Integer soLuongMua = 0;
        for (GioHangChiTietDTO gioHangChiTiet : gioHangChiTietDTOs) {
            soLuongMua += gioHangChiTiet.getSoLuong();
        }

        for (HoaDon hd : listhd) {
            List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd);
            for (HoaDonChiTiet hdct : listHDCT) {
                listSanPham.add(hdct.getChiTietSanPham());
                DSSP.put(hdct.getChiTietSanPham().getMaChiTietSanPham(), hdct.getSoLuongMua());
            }

        }
        DecimalFormat formatter = new DecimalFormat("#0.0");

        VoucherRequest request = new VoucherRequest();
        request.setDonGiaMuaTT(BigDecimal.valueOf(tongTienSauGiam));
        request.setSoLuongMuaTT(soLuongMua);
        List<Voucher> vouchers = voucherService.fillListVoucher(request);
        model.addAttribute("listVoucher", vouchers);
//            model.addAttribute("newHD", hoaDon);
        model.addAttribute("listHD", listhd);
        model.addAttribute("tongTien", formatter.format(tongTien));
        model.addAttribute("tongTienSG", formatter.format(tongTienSauGiam));
        model.addAttribute("hoaDon", listSanPham);
        model.addAttribute("DSSP", DSSP);
        model.addAttribute("viShop", viShopRepository.getByKhachHang(user));
        return "checkout";
    }

    @GetMapping("/thanhToanDn/{maKhachHang}/{tenSanPham}")
    public String hienThi(@PathVariable(name = "maKhachHang") Long maKhachHang,
                          @PathVariable(name = "tenSanPham") String tenSanPham
            , HttpServletRequest request, Model model) {
        String tenDungLuong = request.getParameter("tenDungLuong");
        String tenMauSac = request.getParameter("tenMauSac");
        ChiTietSanPham ctsp = chiTietSanPhamRepository.getCTSPByMauSacAndDungLuongAndTen(tenSanPham, tenDungLuong, tenMauSac);

        KhachHang user = khachHangService.getByMa(maKhachHang);
        System.out.println(ctsp.getSanPham().getTenSanPham());
        String soLuongString = request.getParameter("soLuong1");
        String giaBanString = request.getParameter("giaBan");
        model.addAttribute("sl", soLuongString);

//        model.addAttribute("")
        String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
        String giaBanFormatted = giaBanString.replaceAll("\\.", "").replaceAll("\\d$", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
        int soLuong = Integer.parseInt(soLuongFormatted);
        int giaBan = Integer.parseInt(giaBanFormatted);
        model.addAttribute("giaBan", giaBan);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
        int tongTien = soLuong * giaBan;
        model.addAttribute("tongTien", tongTien);
// Đưa giá trị đã tính toán vào model


        VoucherRequest request1 = new VoucherRequest();
        request1.setDonGiaMuaTT(BigDecimal.valueOf(tongTien));
        request1.setSoLuongMuaTT(soLuong);
        List<Voucher> vouchers = voucherService.fillListVoucher(request1);
        model.addAttribute("listVoucher", vouchers);
        model.addAttribute("kh", user);
        model.addAttribute("viShop", viShopRepository.getByKhachHang(user));
        model.addAttribute("lol", ctsp);
        return "checkoutDn";
    }


    //Khi chưa đăng nhập
    @GetMapping("/thanhToanCDN/{tenSanPham}")
    public String thanhToanNgay(@PathVariable(name = "tenSanPham") String tenSanPham
            , HttpServletRequest request, Model model) {
        String tenDungLuong = request.getParameter("tenDungLuong");
        String tenMauSac = request.getParameter("tenMauSac");
        ChiTietSanPham ctsp = chiTietSanPhamRepository.getCTSPByMauSacAndDungLuongAndTen(tenSanPham, tenDungLuong, tenMauSac);
        System.out.println(ctsp.getSanPham().getTenSanPham());
        System.out.println(tenDungLuong);
        System.out.println(tenSanPham);
        System.out.println(tenMauSac);
        String soLuongString = request.getParameter("soLuong1");
        String giaBanString = request.getParameter("giaBan");
        model.addAttribute("sl", soLuongString);

//        model.addAttribute("")
        String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
        String giaBanFormatted = giaBanString.replaceAll("\\.", "").replaceAll("\\d$", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
        int soLuong = Integer.parseInt(soLuongFormatted);
        int giaBan = Integer.parseInt(giaBanFormatted);
        model.addAttribute("giaBan", giaBan);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
        int tongTien = soLuong * giaBan;
        model.addAttribute("tongTien", tongTien);
// Đưa giá trị đã tính toán vào model


        VoucherRequest request1 = new VoucherRequest();
        request1.setDonGiaMuaTT(BigDecimal.valueOf(tongTien));
        request1.setSoLuongMuaTT(soLuong);
        List<Voucher> vouchers = voucherService.fillListVoucher(request1);
        model.addAttribute("listVoucher", vouchers);
        model.addAttribute("lol", ctsp);
        return "chuaDangNhap/checkoutKhiChuaDangNhap";
    }

    @PostMapping("/thanhtoanDn/{maKhachHang}/{maChiTietSanPham}")
    public String muaNgayDn(@PathVariable(name = "maKhachHang") Long maKhachHang, @PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham, HttpServletRequest request, HttpServletResponse response, Model model) {
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        String check = request.getParameter("check");
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        if (Integer.parseInt(check) == 0) {
            model.addAttribute("gia", request.getParameter("giaBan"));
            model.addAttribute("giaTrcGiam", request.getParameter("giaBan"));
            model.addAttribute("sl", request.getParameter("soLuong1"));
            model.addAttribute("phanTramGiamGia", 0);
//            Integer tongTien = Integer.parseInt(request.getParameter("soLuong1")) * Integer.parseInt(request.getParameter("giaBan"));
//            model.addAttribute("tongTien", tongTien);
//            model.addAttribute("tongTienTrcGiam", tongTien);
            // Lấy giá trị từ request parameter
            String soLuongString = request.getParameter("soLuong1");
            String giaBanString = request.getParameter("giaBan");


// Loại bỏ các ký tự không phải số từ chuỗi giá trị tiền
            String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
            String giaBanFormatted = giaBanString.replaceAll("[^\\d]", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
            int soLuong = Integer.parseInt(soLuongFormatted);
            int giaBan = Integer.parseInt(giaBanFormatted);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
            int tongTien = soLuong * giaBan;

            VoucherRequest request1 = new VoucherRequest();
            request1.setDonGiaMuaTT(BigDecimal.valueOf(tongTien));
            request1.setSoLuongMuaTT(soLuong);
            List<Voucher> vouchers = voucherService.fillListVoucher(request1);
            model.addAttribute("listVoucher", vouchers);

// Đưa giá trị đã tính toán vào model
            model.addAttribute("tongTien", tongTien);
            model.addAttribute("tongTienTrcGiam", tongTien);
        } else {
            model.addAttribute("giaTrcGiam", request.getParameter("giaTrcGiam"));
            model.addAttribute("sl", request.getParameter("soLuong2"));
            model.addAttribute("phanTramGiamGia", request.getParameter("phanTramGiamGia"));
            model.addAttribute("gia", request.getParameter("giaSauGiam"));
//            Double tongTienTrcGiam = Double.parseDouble(request.getParameter("soLuong2")) * Double.parseDouble(request.getParameter("giaTrcGiam"));
//            model.addAttribute("tongTienTrcGiam", String.format("%.2f", tongTienTrcGiam));
            // Lấy giá trị từ request parameter
            String soLuongString = request.getParameter("soLuong2");
            String giaSauGiamString = request.getParameter("giaSauGiam");

// Loại bỏ các ký tự không phải số từ chuỗi giá trị
            String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
            String giaSauGiamFormatted = giaSauGiamString.replaceAll("[^\\d]", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
            int soLuong = Integer.parseInt(soLuongFormatted);
            int giaSauGiam = Integer.parseInt(giaSauGiamFormatted);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
            int tongTien = soLuong * giaSauGiam;
            VoucherRequest request1 = new VoucherRequest();
            request1.setDonGiaMuaTT(BigDecimal.valueOf(tongTien));
            request1.setSoLuongMuaTT(soLuong);
            List<Voucher> vouchers = voucherService.fillListVoucher(request1);
            model.addAttribute("listVoucher", vouchers);

// Đưa giá trị đã tính toán vào model
            model.addAttribute("tongTien", tongTien);
            model.addAttribute("tongTienTrcGiam", tongTien);

        }
        model.addAttribute("lol", ctsp);
        model.addAttribute("viShop", viShopRepository.getByKhachHang(user));
        return "checkoutDn";
    }

    //DN Mua Ngay
    @GetMapping("/addHDDn/{maKhachHang}")
    public String addHDDn(@PathVariable(name = "maKhachHang") Long maKhachHang,
                          HttpServletRequest request, Model model, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTietDTO> listGHCT = gioHangChiTietRepository.getGHCTByMaGH(gh.getMaGioHang());
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String tongTienString = request.getParameter("tongTien1");
        System.out.println(tongTienString);

        String tongTienStringFormatted = tongTienString.replaceAll("[^\\d]", "");
        System.out.println(tongTienStringFormatted);


        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");

        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaSauGiam = request.getParameter("giaSauGiam");

        String giaSauGiamFormatted = giaSauGiam.replaceAll("[^\\d]", "");

        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        System.out.println(maChiTietSanPham);
        String maVoucher = request.getParameter("maVoucher1");
        System.out.println(maVoucher);
        Long maVoucherLong = null;
        if (maVoucher != "") {
            maVoucherLong = Long.parseLong(maVoucher);
        }

        HoaDon hd = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                diaChi(diaChi).
                sdt(sdt).
                trangThai(0).
                khachHang(user).
                nhanVien(nhanVienMD).
                tongTien(BigDecimal.valueOf(Long.parseLong(tongTienStringFormatted))).
                ngayTao(Date.valueOf(datenow)).
                loaiThanhToan(0).
                tinh(tinh).huyen(huyen).xa(xa).
                maVoucher(maVoucherLong).
                build();
        hoaDonRepository.save(hd);


//        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//        hoaDonChiTiet.setHoaDon(hd);
//        hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(Integer.parseInt(giaSauGiamFormatted)))));
//        hoaDonChiTiet.setChiTietSanPham(chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham)));
//        hoaDonChiTiet.setTrangThai(1);
//        hoaDonChiTiet.setSoLuongMua(Integer.valueOf(request.getParameter("soLuong")));
//        hoaDonChiTietRepository.save(hoaDonChiTiet);

        Integer sl = Integer.valueOf(request.getParameter("soLuong"));
        for (int i = 0; i < sl; i++) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham)));
            hoaDonChiTiet.setHoaDon(hd);
            hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(Integer.parseInt(giaSauGiamFormatted)))));
            hoaDonChiTiet.setSoLuongMua(1);
            hoaDonChiTiet.setTrangThai(1);
            hoaDonChiTiet.setCreatedDate(new java.util.Date());
            hoaDonChiTiet.setLastUpdate(new java.util.Date());
            hoaDonChiTietRepository.save(hoaDonChiTiet);
        }

        ChiTietSanPham chi = chiTietSanPhamService.getByMa(Long.valueOf(maChiTietSanPham));
        chi.setSoLuongBan(chi.getSoLuongBan() + sl);
        //Hàm đổi trạng thái
        if (chi.getSoLuongBan() >= chi.getSoLuongNhap()) {
            chi.setTrangThai(0);
//            chi.getSanPham().setTrangThai(0);
        }
        chiTietSanPhamRepository.save(chi);

        hoaDonService.sendEmailWithAttachment(hd.getKhachHang().getEmail());
        for (GioHangChiTietDTO ghct : listGHCT) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(ghct.getMagiohangchitiet()).orElse(null);
            gioHangChiTietRepository.delete(gioHangChiTiet);
        }

        model.addAttribute("hd", hd);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/home_clients/{maKhachHang}";
    }

    @GetMapping("/addHDDnVi/{maKhachHang}")
    public String addHDDnVi(@PathVariable(name = "maKhachHang") Long maKhachHang,
                            HttpServletRequest request, Model model, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTietDTO> listGHCT = gioHangChiTietRepository.getGHCTByMaGH(gh.getMaGioHang());
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String tongTienString = request.getParameter("tongTien1");
        System.out.println(tongTienString);
        String tongTienStringFormatted = tongTienString.replaceAll("[^\\d]", "");
//        Double tongTienDb = Double.parseDouble(tongTienString);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");

        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaSauGiam = request.getParameter("giaSauGiam");

        String giaSauGiamFormatted = giaSauGiam.replaceAll("[^\\d]", "");
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String maVoucher = request.getParameter("maVoucher2");
        Long maVoucherLong = null;
        if (maVoucher != "") {
            maVoucherLong = Long.parseLong(maVoucher);
        }
        HoaDon hd = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                diaChi(diaChi).
                sdt(sdt).
                trangThai(0).
                khachHang(user).
                nhanVien(nhanVienMD).
                tongTien(BigDecimal.valueOf(Long.parseLong(tongTienStringFormatted))).
                ngayTao(Date.valueOf(datenow)).
                loaiThanhToan(4).
                tinh(tinh).huyen(huyen).xa(xa).
                maVoucher(maVoucherLong).
                build();
        hoaDonRepository.save(hd);

        ViShop viShop = viShopRepository.getByKhachHang(user);
        viShop.setTongTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(viShop.getTongTien())) - Double.parseDouble(tongTienStringFormatted)));
        viShopRepository.save(viShop);


        GiaoDichVi giaoDichVi = new GiaoDichVi();
        giaoDichVi.setViShop(viShopRepository.getByKhachHang(khachHangService.getByMa(maKhachHang)));
        giaoDichVi.setDonGia(hd.getTongTien());
        giaoDichVi.setNhanVien(nhanVienRepository.getReferenceById(1L));
        giaoDichVi.setHinhThuc(2);
        giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
        giaoDichVi.setTrangThai(1);
        giaoDichViRepository.save(giaoDichVi);

//        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//        hoaDonChiTiet.setHoaDon(hd);
//        hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(Integer.parseInt(giaSauGiamFormatted)))));
//        hoaDonChiTiet.setChiTietSanPham(chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham)));
//        hoaDonChiTiet.setTrangThai(1);
//        hoaDonChiTiet.setSoLuongMua(Integer.valueOf(request.getParameter("soLuong")));
//        hoaDonChiTietRepository.save(hoaDonChiTiet);
        Integer sl = Integer.valueOf(request.getParameter("soLuong"));
        for (int i = 0; i < sl; i++) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham)));
            hoaDonChiTiet.setHoaDon(hd);
            hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(Integer.parseInt(giaSauGiamFormatted)))));
            hoaDonChiTiet.setSoLuongMua(1);
            hoaDonChiTiet.setTrangThai(1);
            hoaDonChiTiet.setCreatedDate(new java.util.Date());
            hoaDonChiTiet.setLastUpdate(new java.util.Date());
            hoaDonChiTietRepository.save(hoaDonChiTiet);

        }

        ChiTietSanPham chi = chiTietSanPhamService.getByMa(Long.valueOf(maChiTietSanPham));
        chi.setSoLuongBan(chi.getSoLuongBan() + sl);
        //Hàm đổi trạng thái
        if (chi.getSoLuongBan() >= chi.getSoLuongNhap()) {
            chi.setTrangThai(0);
//            chi.getSanPham().setTrangThai(0);
        }
        chiTietSanPhamRepository.save(chi);

        hoaDonService.sendEmailWithAttachment(hd.getKhachHang().getEmail());
        for (GioHangChiTietDTO ghct : listGHCT) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(ghct.getMagiohangchitiet()).orElse(null);
            gioHangChiTietRepository.delete(gioHangChiTiet);
        }

        model.addAttribute("hd", hd);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/home_clients/{maKhachHang}";
    }

    @GetMapping("/addHD/{maKhachHang}")
    public String addHD(@PathVariable(name = "maKhachHang") Long maKhachHang,
                        HttpServletRequest request, Model model, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTietDTO> listGHCT = gioHangChiTietRepository.getGHCTByMaGH(gh.getMaGioHang());
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String tongTienString = request.getParameter("tongTien1");
        System.out.println(tongTienString);
        String tongTienStringFormatted = tongTienString.replaceAll("[^\\d]", "");
        int tt = Integer.parseInt(tongTienStringFormatted);
        System.out.println(tt/10);


        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");

        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaSauGiam = request.getParameter("giaSauGiam");
        String maVoucher = request.getParameter("maVoucher1");
        Long maVoucherLong = null;
        if (maVoucher != "") {
            maVoucherLong = Long.parseLong(maVoucher);
        }
        HoaDon hd = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                diaChi(diaChi).
                sdt(sdt).
                trangThai(0).
                khachHang(user).
                nhanVien(nhanVienMD).
                tongTien(BigDecimal.valueOf(Long.parseLong(String.valueOf(tt/10)))).
                ngayTao(Date.valueOf(datenow)).
                loaiThanhToan(0).
                tinh(tinh).huyen(huyen).xa(xa).
                maVoucher(maVoucherLong).
                build();
        hoaDonRepository.save(hd);


        for (int i = 0; i < listGHCT.size(); i++) {
            for (int j = 0; j < listGHCT.get(i).getSoLuong(); j++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hd);
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
//                chiTietSanPham.getSanPham().setTrangThai(0);
            }
            chiTietSanPhamRepository.save(chiTietSanPham);
        }

        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd);
        for (HoaDonChiTiet hdct : listHDCT) {
            ChiTietSanPham ctsp = hdct.getChiTietSanPham();

            if (ctsp != null) {

                ctsp.setSoLuongBan(ctsp.getSoLuongBan() + hdct.getSoLuongMua());
                ctsp.setMaChiTietSanPham(ctsp.getMaChiTietSanPham());
                //Hàm đổi trạng thái
                if (ctsp.getSoLuongBan() >= ctsp.getSoLuongNhap()) {
                    ctsp.setTrangThai(0);
//                    ctsp.getSanPham().setTrangThai(0);
                    System.out.println(ctsp.getMaChiTietSanPham());
                }
                chiTietSanPhamRepository.save(ctsp);
            }
        }

        hoaDonService.sendEmailWithAttachment(hd.getKhachHang().getEmail());
        for (GioHangChiTietDTO ghct : listGHCT) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(ghct.getMagiohangchitiet()).orElse(null);
            gioHangChiTietRepository.delete(gioHangChiTiet);
        }

        model.addAttribute("hd", hd);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/home_clients/{maKhachHang}";
    }

    @GetMapping("/addHDVi/{maKhachHang}")
    public String addHDVi(@PathVariable(name = "maKhachHang") Long maKhachHang,
                          HttpServletRequest request, Model model, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(user);
        List<GioHangChiTietDTO> listGHCT = gioHangChiTietRepository.getGHCTByMaGH(gh.getMaGioHang());
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
//        BigDecimal tongTien = gioHangService.tongTien(gh);
//        model.addAttribute("tongTien", tongTien);
        String tongTienString = request.getParameter("tongTien1");
//        Double tongTienDb = Double.parseDouble(tongTienString);
        String tongTienStringFormatted = tongTienString.replaceAll("[^\\d]", "");
        int tt = Integer.parseInt(tongTienStringFormatted);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");

        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaSauGiam = request.getParameter("giaSauGiam");
        String maVoucher = request.getParameter("maVoucher2");
        Long maVoucherLong = null;
        if (maVoucher != "") {
            maVoucherLong = Long.parseLong(maVoucher);
        }
        HoaDon hd = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                diaChi(diaChi).
                sdt(sdt).
                trangThai(0).
                khachHang(user).
                nhanVien(nhanVienMD).
                tongTien(BigDecimal.valueOf(Long.parseLong(String.valueOf(tt/10)))).
                ngayTao(Date.valueOf(datenow)).
                loaiThanhToan(4).
                tinh(tinh).huyen(huyen).xa(xa).
                maVoucher(maVoucherLong).
                build();
        hoaDonRepository.save(hd);

        ViShop viShop = viShopRepository.getByKhachHang(user);
        viShop.setTongTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(viShop.getTongTien())) - Double.parseDouble(String.valueOf(tt/10))));
        viShopRepository.save(viShop);


        GiaoDichVi giaoDichVi = new GiaoDichVi();
        giaoDichVi.setViShop(viShopRepository.getByKhachHang(khachHangService.getByMa(maKhachHang)));
        giaoDichVi.setDonGia(hd.getTongTien());
        giaoDichVi.setNhanVien(nhanVienRepository.getReferenceById(1L));
        giaoDichVi.setHinhThuc(2);
        giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
        giaoDichVi.setTrangThai(1);
        giaoDichViRepository.save(giaoDichVi);

//        for (GioHangChiTietDTO ghct : listGHCT) {
//            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//            hoaDonChiTiet.setChiTietSanPham(ghct.getChiTietSanPham());
//            hoaDonChiTiet.setHoaDon(hd);
//            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(ghct.getChiTietSanPham().getMaChiTietSanPham());
//            if (giamGiaChiTietSanPham != null) {
//                ghct.setGiaSauKhiGiam(giamGiaChiTietSanPham.getGiaSauKhiGiam());
//            } else {
//                ghct.setGiaSauKhiGiam(ghct.getChiTietSanPham().getGiaBan());
//            }
//            hoaDonChiTiet.setGiaTien(ghct.getGiaSauKhiGiam());
//            hoaDonChiTiet.setSoLuongMua(ghct.getSoLuong());
//            hoaDonChiTiet.setTrangThai(0);
//
//            hoaDonChiTietRepository.save(hoaDonChiTiet);
//
//        }



        for (int i = 0; i < listGHCT.size(); i++) {
            for (int j = 0; j < listGHCT.get(i).getSoLuong(); j++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hd);
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
//                chiTietSanPham.getSanPham().setTrangThai(0);
            }
            chiTietSanPhamRepository.save(chiTietSanPham);
        }

        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd);
        for (HoaDonChiTiet hdct : listHDCT) {
            ChiTietSanPham ctsp = hdct.getChiTietSanPham();

            if (ctsp != null) {

                ctsp.setSoLuongBan(ctsp.getSoLuongBan() + hdct.getSoLuongMua());
                ctsp.setMaChiTietSanPham(ctsp.getMaChiTietSanPham());
                //Hàm đổi trạng thái
                if (ctsp.getSoLuongBan() >= ctsp.getSoLuongNhap()) {
                    ctsp.setTrangThai(0);
//                    ctsp.getSanPham().setTrangThai(0);
                }

                chiTietSanPhamRepository.save(ctsp);
            }
        }
        hoaDonService.sendEmailWithAttachment(hd.getKhachHang().getEmail());

        for (GioHangChiTietDTO ghct : listGHCT) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(ghct.getMagiohangchitiet()).orElse(null);
            gioHangChiTietRepository.delete(gioHangChiTiet);
        }

        model.addAttribute("hd", hd);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/home_clients/{maKhachHang}";
    }


    @GetMapping("/update/{maKhachHang}/{maHoaDon}")
    public String update(@PathVariable(name = "maKhachHang") Long maKhachHang, HttpServletRequest request, Model model, @PathVariable("maHoaDon") Long maHoaDon) {

        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        HoaDon hoaDon = hoaDonRepository.findById(maHoaDon).orElse(null);
        if (hoaDon != null) {
            hoaDon.setTrangThai(3);
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
//                    ctsp.getSanPham().setTrangThai(1);
                }
                chiTietSanPhamRepository.save(ctsp);
            }
        }


        for (GioHangChiTiet ghct : listGHCT) {
            gioHangChiTietRepository.delete(ghct);
        }
        model.addAttribute("hd", hoaDon);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);

        return "redirect:/hoadon/{maKhachHang}";
    }

    // Phương thức gửi email với tệp PDF đính kèm
    private void sendEmailWithAttachment(String toEmail, String pdfFileName) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            // Đặt thông tin email
            helper.setTo(toEmail);
            helper.setSubject("Thông tin hóa đơn");

            // Tạo nội dung email theo dạng bảng HTML
            String tableContent = "<table>" +
                    "<tr>" +
                    "<th>Column 1</th>" +
                    "<th>Column 2</th>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>Row 1, Cell 1</td>" +
                    "<td>Row 1, Cell 2</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>Row 2, Cell 1</td>" +
                    "<td>Row 2, Cell 2</td>" +
                    "</tr>" +
                    "</table>";

            helper.setText(tableContent, true); // Đặt nội dung email là mã HTML
            helper.setText("Cảm ơn Bạn đã mua hàng của chúng tôi. Đơn hàng của bạn đang chờ xác nhận");

            // Đính kèm tệp PDF vào email
            FileSystemResource file = new FileSystemResource(new File(pdfFileName));
            helper.addAttachment("invoice.pdf", file);

            // Gửi email
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Thêm Hoa Don
    @PostMapping("/update-hoa-don/{maKhachHang}")
    public String updateSimple(HttpServletRequest request,
                               @PathVariable(name = "maKhachHang") Long maKhachHang, Model model,
                               HttpSession session) {

        // Sử dụng giá trị makhachhang
        HoaDon hd1 = new HoaDon();
        String sdt = request.getParameter("sdt");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        KhachHang user = khachHangService.getByMa(maKhachHang);
        hd1.setKhachHang(user);
        hd1.setSdt(sdt);
        hd1.setNguoiNhan(nguoiNhan);
        hd1.setDiaChi(diaChi);
        hd1.setTrangThai(0);

        model.addAttribute("hd", hd1);


        hoaDonRepository.save(hd1);
        return "redirect:/thanhtoan/{maKhachHang}";
    }

    private Long getMaKhachHangFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("makhachhang")) {
                    // Lấy giá trị của cookie
                    String maKhachHangValue = cookie.getValue();

                    // Chuyển đổi giá trị từ chuỗi sang Long (hoặc kiểu dữ liệu phù hợp)
                    return Long.parseLong(maKhachHangValue);
                }
            }
        }
        return null;
    }

    @GetMapping("/update-hoa-don/{maKhachHang}")
    public String updateHoaDonAndDownloadPdf(
            @PathVariable(name = "maKhachHang") Long maKhachHang, Model model,
            @Validated HoaDon hd, @Validated ChiTietSanPham sanPham, BindingResult result,
            HttpServletRequest request, HttpServletResponse response,
            KhachHang khachHang) throws Exception {

        HttpSession session = request.getSession();
        Long cookieMaKhachHang = getMaKhachHangFromCookie(request);

        // Kiểm tra nếu giá trị từ cookie khác null thì sử dụng giá trị đó, ngược lại sử dụng giá trị từ path variable
        maKhachHang = (cookieMaKhachHang != null) ? cookieMaKhachHang : maKhachHang;
        System.out.println("maKhachHang: " + maKhachHang);
        session.setAttribute("makhachhang", maKhachHang);
        model.addAttribute("makhachhang", maKhachHang);
        // Lấy thông tin người dùng và hóa đơn
        KhachHang user = userService.getByMa(maKhachHang);

        //
        List<String> spp = new ArrayList<>();
        BigDecimal tongtien = null;

        // Cập nhật thông tin hóa đơn
        List<HoaDon> listhd = hoaDonRepository.getByKhachHangAndTrangThai(user, 0);
        if (!listhd.isEmpty()) {
            for (HoaDon hd1 : listhd) {
                hd1.setTrangThai(0);
                hoaDonRepository.save(hd1);

                GioHang gh = gioHangService.getByKhachHang(user);
                if (gh != null) {
                    List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);
                    for (GioHangChiTiet ghct : listGHCT) {
                        gioHangChiTietRepository.delete(ghct);
                    }
                }
                List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd1);
                for (HoaDonChiTiet hdct : listHDCT) {
                    ChiTietSanPham ctsp = hdct.getChiTietSanPham();
                    if (ctsp != null) {
                        ctsp.setSoLuongBan(ctsp.getSoLuongBan() - hdct.getSoLuongMua());
                        ctsp.setMaChiTietSanPham(ctsp.getMaChiTietSanPham());
                        ctsp.setGiaBan(ctsp.getGiaBan());
                        ctsp.setHinhAnh(ctsp.getHinhAnh());
                        ctsp.setGiaNhap(ctsp.getGiaNhap());
                        ctsp.setMoTa(ctsp.getMoTa());
                        chiTietSanPhamRepository.save(ctsp);
                    }
                }
                String tensp = null;
                Integer sl = null;
                String test = " ";
                for (HoaDonChiTiet hdct2 : listHDCT) {
                    tensp = hdct2.getChiTietSanPham().getSanPham().getTenSanPham();
                    sl = hdct2.getSoLuongMua();
                    tongtien = hdct2.getGiaTien();
                    String all = tensp + " x " + sl;
                    spp.add(all);
                }
            }
        }
        return "redirect:/home_clients/{maKhachHang}";
    }

    private void sendPdfToMail(HoaDon hd, Long id, KhachHang user, List<String> tenSp, String tongTien, HttpServletResponse response) throws IOException, DocumentException, MessagingException {

        Document document = new Document();
        String pdfFileName = this.pdfDirectory + "HoaDon_" + id + ".pdf";
        PdfWriter writer = PdfWriter.getInstance(document, Files.newOutputStream(Paths.get(pdfFileName), StandardOpenOption.CREATE));

        // Mở tài liệu PDF
        document.open();
        // Đường dẫn tới tệp hình ảnh logo của cửa hàng
        String logoImagePath = this.imgLogoPath;

// Tạo đối tượng Image từ tệp hình ảnh logo
        Image logoImage = Image.getInstance(logoImagePath);
        logoImage.scaleAbsolute(100, 100); // Điều chỉnh kích thước ảnh logo theo ý muốn

        // Đặt vị trí ảnh logo bên trái trên cùng
        float logoX = document.left();
        float logoY = document.top() - 60; // Khoảng cách giữa logo và phần trên

        logoImage.setAbsolutePosition(logoX, logoY);

// Thêm ảnh logo vào tài liệu PDF
        document.add(logoImage);

        // Tạo font chữ cho tiêu đề và nội dung
        BaseFont bf = BaseFont.createFont(this.font, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);


        Font titleFont = new Font(bf, 18, Font.BOLD);
        Font headerFont = new Font(bf, 12, Font.BOLD);
        Font contentFont = new Font(bf, 12);


        // Tạo tiêu đề hóa đơn
        Paragraph title = new Paragraph("HÓA ĐƠN BÁN HÀNG", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20f);
        document.add(title);

        // Tạo thông tin cửa hàng
        Paragraph storeInfo = new Paragraph("CỬA HÀNG AZURA", headerFont);
        storeInfo.setAlignment(Element.ALIGN_LEFT);
        storeInfo.setSpacingAfter(10f);
        document.add(storeInfo);

        Paragraph storeAddress = new Paragraph("Số 14A, Đường Xuân Phương, Quận Nam Từ Liêm, Thành phố Hà Nội", contentFont);
        storeAddress.setAlignment(Element.ALIGN_LEFT);
        storeAddress.setSpacingAfter(20f);
        document.add(storeAddress);

        // Tạo thông tin hóa đơn
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setWidths(new float[]{1.5f, 2.5f});

        // Thêm dòng Mã Hóa đơn
        PdfPCell cell = new PdfPCell(new Phrase("Mã Hóa đơn:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(String.valueOf(hd.getMaHoaDon()), contentFont));

        table.addCell(cell);

        // Thêm dòng Tên khách hàng
        cell = new PdfPCell(new Phrase("Tên khách hàng:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(hd.getNguoiNhan(), contentFont));

        table.addCell(cell);

        // Thêm dòng Địa chỉ
        cell = new PdfPCell(new Phrase("Địa chỉ:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(hd.getDiaChi() + ", " + hd.getXa() + ", " + hd.getHuyen() + ", " + hd.getTinh(), contentFont));

        table.addCell(cell);

        // Thêm dòng Ngày tạo
        cell = new PdfPCell(new Phrase("Ngày tạo:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(String.valueOf(hd.getNgayTao()), contentFont));

        table.addCell(cell);

        // Thêm dòng Số điện thoại
        cell = new PdfPCell(new Phrase("Số điện thoại:", headerFont));

        table.addCell(cell);

        cell = new PdfPCell(new Phrase(hd.getSdt(), contentFont));

        table.addCell(cell);

        // Thêm dòng Sản phẩm
        cell = new PdfPCell(new Phrase("Sản phẩm:", headerFont));
        table.addCell(cell);
        cell = new PdfPCell(new Phrase(String.join(", ", tenSp), contentFont));
        table.addCell(cell);

        // Thêm dòng Tổng tiền
        cell = new PdfPCell(new Phrase("Tổng tiền:", headerFont));
        table.addCell(cell);
        cell = new PdfPCell(new Phrase(tongTien, contentFont));
        table.addCell(cell);

        // Thêm bảng thông tin hóa đơn vào tài liệu PDF
        document.add(table);

        // Đóng tài liệu PDF
        document.close();

        // Gửi email với tệp PDF đính kèm
        sendEmailWithAttachment(user.getEmail(), pdfFileName);
    }


    @GetMapping("/hoadon/{maKhachHang}")
    public String hienthiHoaDon(@PathVariable("maKhachHang") Long maKhachHang, HttpServletRequest request, Model model) {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);


        //
        Map<Long, Integer> DSSP = new HashMap<>();
        List<SanPham> listTN = new ArrayList<>();

        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);
        for (HoaDon hd1 : listHD) {
            //Test
            HoaDonModel hoaDonModel = new HoaDonModel();
            hoaDonModel.setHoaDon(hd1);
            if (hd1.getTrangThai() == 0 || hd1.getTrangThai() == 2) {
                hoaDonModel.setChoXoa(true); // Đánh dấu rằng hóa đơn có thể xóa
            } else {
                hoaDonModel.setChoXoa(false); // Đánh dấu rằng hóa đơn không thể xóa
            }
            List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd1);
            for (HoaDonChiTiet hdct : listHDCT) {
                listTN.add(hdct.getChiTietSanPham().getSanPham());
                DSSP.put(hdct.getChiTietSanPham().getMaChiTietSanPham(), hdct.getSoLuongMua());
            }

            model.addAttribute("listHD", listHD);
            model.addAttribute("listHDCT", listHDCT);
            model.addAttribute("hoaDon", listTN);
            model.addAttribute("DSSP", DSSP);

        }
        return "/hoadon";
    }

    @GetMapping("/hoadon/{maKhachHang}/{maHoaDon}")
    public String hienthiHoaDonChiTiet(@PathVariable("maKhachHang") Long maKhachHang, @PathVariable(name = "maHoaDon") Long maHoaDon, Model model) {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        HoaDon hd = hoaDonService.getByMa(maHoaDon);
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);

        List<HoaDonChiTiet> list = hoaDonChiTietService.getByHoaDon(hd);
        Double tongTienThanhToan = 0.0;
        for (HoaDonChiTiet hoaDonChiTiet : list) {
            tongTienThanhToan += (Double.valueOf(String.valueOf(hoaDonChiTiet.getGiaTien())) * hoaDonChiTiet.getSoLuongMua());
        }
        Double giamGia = 100 - (Double.parseDouble(String.valueOf(hd.getTongTien())) / tongTienThanhToan) * 100;
        DecimalFormat formatter = new DecimalFormat("#0.0");
        model.addAttribute("hdct", list);
        model.addAttribute("tongTien", formatter.format(tongTienThanhToan));
        model.addAttribute("giamGia", giamGia);
        model.addAttribute("tongTienThanhToan", formatter.format(hd.getTongTien()));
        return "/detailHoaDon";
    }


    //Thanh toán ngay

    @PostMapping("/thanhtoan1/{maChiTietSanPham}")
    public String muaNgay(@PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham, HttpServletRequest request, HttpServletResponse response, Model model) {
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        String check = request.getParameter("check");


        if (Integer.parseInt(check) == 0) {
            model.addAttribute("gia", request.getParameter("giaBan"));
            model.addAttribute("giaTrcGiam", request.getParameter("giaBan"));
            model.addAttribute("sl", request.getParameter("soLuong1"));
            model.addAttribute("phanTramGiamGia", 0);
//            Integer tongTien = Integer.parseInt(request.getParameter("soLuong1")) * Integer.parseInt(request.getParameter("giaBan"));
//            model.addAttribute("tongTien", tongTien);
//            model.addAttribute("tongTienTrcGiam", tongTien);
            // Lấy giá trị từ request parameter
            String soLuongString = request.getParameter("soLuong1");
            String giaBanString = request.getParameter("giaBan");

// Loại bỏ các ký tự không phải số từ chuỗi giá trị tiền
            String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
            String giaBanFormatted = giaBanString.replaceAll("[^\\d]", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
            int soLuong = Integer.parseInt(soLuongFormatted);
            int giaBan = Integer.parseInt(giaBanFormatted);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
            int tongTien = soLuong * giaBan;

// Đưa giá trị đã tính toán vào model
            model.addAttribute("tongTien", tongTien);
            model.addAttribute("tongTienTrcGiam", tongTien);
        } else {
            model.addAttribute("giaTrcGiam", request.getParameter("giaTrcGiam"));
            model.addAttribute("sl", request.getParameter("soLuong2"));
            model.addAttribute("phanTramGiamGia", request.getParameter("phanTramGiamGia"));
            model.addAttribute("gia", request.getParameter("giaSauGiam"));
//            Double tongTienTrcGiam = Double.parseDouble(request.getParameter("soLuong2")) * Double.parseDouble(request.getParameter("giaTrcGiam"));
//            model.addAttribute("tongTienTrcGiam", String.format("%.2f", tongTienTrcGiam));
            // Lấy giá trị từ request parameter
            String soLuongString = request.getParameter("soLuong2");
            String giaSauGiamString = request.getParameter("giaSauGiam");

// Loại bỏ các ký tự không phải số từ chuỗi giá trị
            String soLuongFormatted = soLuongString.replaceAll("[^\\d]", "");
            String giaSauGiamFormatted = giaSauGiamString.replaceAll("[^\\d]", "");

// Chuyển đổi chuỗi đã được xử lý thành số nguyên
            int soLuong = Integer.parseInt(soLuongFormatted);
            int giaSauGiam = Integer.parseInt(giaSauGiamFormatted);

// Tính tổng tiền sau khi đã chuyển đổi giá trị thành số nguyên
            int tongTien = soLuong * giaSauGiam;

// Đưa giá trị đã tính toán vào model
            model.addAttribute("tongTien", tongTien);
            model.addAttribute("tongTienTrcGiam", tongTien);

        }
        model.addAttribute("lol", ctsp);
        model.addAttribute("kh", khachHangRepository.findAll());
        return "chuaDangNhap/checkoutKhiChuaDangNhap";
    }

    @PostMapping("/update111")
    public String thanhToanNgay(Model model,
                                HttpServletRequest request, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        List<ChiTietSanPham> ctsp = chiTietSanPhamService.hienThi();
        model.addAttribute("ctsp", ctsp);
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listSanPham = new ArrayList<>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String tongTien = request.getParameter("tongTien1");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaTienSauGiam = request.getParameter("giaTienSauGiam");
        String giaTienSauGiamFormatted = giaTienSauGiam.replaceAll("[^\\d]", "");
        KhachHang khachHang = KhachHang.builder().
                ten(nguoiNhan).
                email(email).
                sdt(sdt).
                diaChi(diaChi).
                build();
        khachHangRepository.save(khachHang);
        HoaDon hd = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                khachHang(khachHang).
                diaChi(diaChi).
                sdt(sdt).
                trangThai(0).
                nhanVien(nhanVienMD).
                ngayTao(Date.valueOf(datenow)).
                tongTien(BigDecimal.valueOf(Double.parseDouble(tongTien))).
                loaiThanhToan(0).
                tinh(tinh).huyen(huyen).xa(xa).
                build();
        hoaDonRepository.save(hd);

        Integer sl = Integer.valueOf(request.getParameter("soLuong"));
        for (int i = 0; i < sl; i++) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(chiTietSanPhamService.getByMa(Long.parseLong(maChiTietSanPham)));
            hoaDonChiTiet.setHoaDon(hd);
            hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(Integer.parseInt(giaTienSauGiamFormatted)))));
            hoaDonChiTiet.setSoLuongMua(1);
            hoaDonChiTiet.setTrangThai(1);
            hoaDonChiTiet.setCreatedDate(new java.util.Date());
            hoaDonChiTiet.setLastUpdate(new java.util.Date());
            hoaDonChiTietRepository.save(hoaDonChiTiet);

        }

        ChiTietSanPham chi = chiTietSanPhamService.getByMa(Long.valueOf(maChiTietSanPham));
        chi.setSoLuongBan(chi.getSoLuongBan() + sl);
        //Hàm đổi trạng thái
        if (chi.getSoLuongBan() >= chi.getSoLuongNhap()) {
            chi.setTrangThai(0);
//            chi.getSanPham().setTrangThai(0);
        }
        chiTietSanPhamRepository.save(chi);

        hoaDonService.sendEmailWithAttachment(hd.getKhachHang().getEmail());

        model.addAttribute("hoaDon", listSanPham);
        model.addAttribute("DSSP", DSSP);
        return "redirect:/home";
    }


}


