package com.example.demo.Service;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.DanhSachSanPhamHoaDonDTO;
import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Dto.Request.ThongTinThanhToanTaiQuay;
import com.example.demo.Dto.Response.HoaDonResponse;
import com.example.demo.Dto.SanPhamThanhToanTaiQuayDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Repository.vi.GiaoDichViRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Utils.Constants;
import com.example.demo.Utils.DateUtils;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import io.micrometer.common.util.StringUtils;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.task.TaskExecutor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.List;


@Service
public class HoaDonService {

    public static final int TAI_QUAY = 4;
    @Autowired
    private HoaDonRepository repository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private JavaMailSender mailSender;

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
    KhachHangService userService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    SanPhamService sanPhamService;


    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    NhanVienRepository nhanVienRepository;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Value("${TEMPLATE_PATH}")
    private String templateFolder;

    @Value("${FILE_TEMP_UPLOAD_PATH}")
    private String fileNameFullFolder;

    @Value("${FONT}")
    private String font;

    @Value("${PDF_DIRECTORY}")
    private String pdfDirectory;

    @Value("${PDF_DIRECTORY_Quay}")
    private String pdfDirectoryQuay;

    @Value("${IMG_LOGO_PATH}")
    private String imgLogoPath;

    @Autowired
    ViShopRepository viShopRepository;

    @Autowired
    private VoucherRepository voucherRepository;

    @Autowired
    GiaoDichViRepository giaoDichViRepository;

    public List<HoaDonResponse> getAll() {
        return repository.viewALl();
    }

    public List<HoaDonResponse> searchHoaDon(HoaDonRequest request) {
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!request.getNgayBatDau().isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(request.getNgayBatDau(), "yyyy-MM-dd");
        }
        if (!request.getNgayKetThuc().isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(request.getNgayKetThuc(), "yyyy-MM-dd");
        }
        List<HoaDonResponse> hoaDonResponses = repository.searchHoaDon(request.getTrangThai(), ngayBatDau, ngayKetThuc, request.getKhachHang(), request.getNguoiNhan());
        for (HoaDonResponse hoaDonResponse: hoaDonResponses){
            if(hoaDonResponse.getMaVoucher() != null){
                Voucher voucher = voucherRepository.getReferenceById(hoaDonResponse.getMaVoucher());
                hoaDonResponse.setTenVoucher(voucher.getTen());
                hoaDonResponse.setPhanTramGiam(voucher.getPhanTramVoucher());
            }else{
                hoaDonResponse.setTenVoucher("");
                hoaDonResponse.setPhanTramGiam(0);
            }
        }
        return hoaDonResponses;
    }

    public ResponseEntity<?> add(HoaDonRequest hoaDonRequest) {
        HoaDon hoaDon = new HoaDon();
        if (StringUtils.isEmpty(hoaDonRequest.getDiaChi())) {
            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
        }
        hoaDon.setNgayTao(hoaDonRequest.getNgayTao());
        hoaDon.setDiaChi(hoaDonRequest.getDiaChi());
        hoaDon.setTongTien(hoaDonRequest.getTongTien());
        hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
        hoaDon.setCreatedDate(new Date());
        hoaDon.setLastUpdate(new Date());
        repository.save(hoaDon);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public HoaDon getByMa(Long maHoaDon) {
        HoaDon hoaDon = repository.getReferenceById(maHoaDon);
        return hoaDon;
    }

    public ResponseEntity<?> update(HoaDonRequest hoaDonRequest) {
        HoaDon hoaDon = this.getByMa(hoaDonRequest.getMaHoaDon());
        hoaDon.setNgayTao(hoaDonRequest.getNgayTao());
        hoaDon.setDiaChi(hoaDonRequest.getDiaChi());
        hoaDon.setTongTien(hoaDonRequest.getTongTien());
        hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
        hoaDon.setLastUpdate(new Date());
        repository.save(hoaDon);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    public List<HoaDon> getAllBykhachHang(KhachHang khachHang) {
        return repository.findAllBykhachHang(khachHang);
    }

    public void add(HoaDon hoaDon, HoaDonChiTiet hoaDonChiTiet) {
        repository.saveAndFlush(hoaDon);
//        HoaDonChiTiet hoaDonChiTiet = (HoaDonChiTiet) hoaDonChiTietRepository.getByHoaDon(hoaDon);
        hoaDonChiTietRepository.save(hoaDonChiTiet);
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

    public boolean addHD(Long maKhachHang, Model model, HttpServletRequest request, HttpServletResponse response) throws DocumentException, MessagingException, IOException {
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        KhachHang user = userService.getByMa(maKhachHang);
        model.addAttribute("kh", user);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        List<HoaDon> listHD = getAllBykhachHang(user);
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();

        BigDecimal tongTien = gioHangService.tongTien(gh);
        model.addAttribute("tongTien", tongTien);

        // Lấy thông tin người dùng và hóa đơn

        List<String> spp = new ArrayList<>();
        BigDecimal tongtien = null;


        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        HoaDon hd1 = HoaDon.builder().
                nguoiNhan(nguoiNhan).
                khachHang(user).
                diaChi(diaChi).
                ngayTao(java.sql.Date.valueOf(datenow)).
                nhanVien(nhanVienMD).
                trangThai(1).
                loaiThanhToan(1).
                createdDate(new Date()).
                lastUpdate(new Date()).
                ngayThanhToan(java.sql.Date.valueOf(datenow)).
                sdt(sdt).
                build();
        hoaDonRepository.save(hd1);
        for (GioHangChiTiet ghct : listGHCT) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setChiTietSanPham(ghct.getChiTietSanPham());
            hoaDonChiTiet.setHoaDon(hd1);
            hoaDonChiTiet.setGiaTien(gioHangService.tongTien(gh));
            hoaDonChiTiet.setSoLuongMua(ghct.getSoLuong());
            hoaDonChiTiet.setTrangThai(0);

            hoaDonChiTietRepository.save(hoaDonChiTiet);

        }

        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd1);
        for (HoaDonChiTiet hdct : listHDCT) {
            ChiTietSanPham ctsp = hdct.getChiTietSanPham();

            if (ctsp != null) {

                ctsp.setSoLuongBan(ctsp.getSoLuongBan() + hdct.getSoLuongMua());
                ctsp.setMaChiTietSanPham(ctsp.getMaChiTietSanPham());
                //Hàm đổi trạng thái
                if (ctsp.getSoLuongBan() >= ctsp.getSoLuongNhap()) {
                    ctsp.setTrangThai(0);
                    ctsp.getSanPham().setTrangThai(0);
                    System.out.println(ctsp.getMaChiTietSanPham());
                }

                ctsp.setGiaBan(ctsp.getGiaBan());
                ctsp.setHinhAnh(ctsp.getHinhAnh());
                ctsp.setGiaNhap(ctsp.getGiaNhap());
                ctsp.setMoTa(ctsp.getMoTa());
                chiTietSanPhamRepository.save(ctsp);

//                String tensp = null;
//                Integer sl = null;
//                String test = " ";
//                for (HoaDonChiTiet hdct2 : listHDCT) {
//                    tensp = hdct2.getChiTietSanPham().getSanPham().getTenSanPham();
//                    sl = hdct2.getSoLuongMua();
//                    tongtien = hdct2.getGiaTien();
//                    String all = "\n" + tensp + " x " + sl;
//                    spp.add(all);
//                }
//
//                this.sendPdfToMail(hd1, maKhachHang, user, spp, tongtien, response);
            }
            // Lưu thông tin khách hàng vào cookie
            Cookie cookie = new Cookie("makhachhang", String.valueOf(user.getMaKhachHang()));
            Cookie cookie1 = new Cookie("maHoaDon", String.valueOf(hd1.getMaHoaDon()));
            cookie.setMaxAge(3600); // Thời gian sống của cookie (đơn vị là giây), ở đây là 1 giờ
            cookie1.setMaxAge(3600);
            response.addCookie(cookie);
            response.addCookie(cookie1);
            listSP.add(hdct.getChiTietSanPham().getSanPham());
            DSSP.put(hdct.getChiTietSanPham().getSanPham().getTenSanPham(), hdct.getSoLuongMua());
        }
        for (GioHangChiTiet ghct : listGHCT) {
            gioHangChiTietRepository.delete(ghct);
        }
        model.addAttribute("hd", hd1);
        model.addAttribute("listHD", listHD);
        model.addAttribute("sanPham", listSP);
        model.addAttribute("DSSP", DSSP);


        return true;
    }


    // Phương thức gửi email với tệp PDF đính kèm
    private void sendEmailWithAttachmentQuay(String toEmail, String pdfFileName) throws MessagingException {

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
    }

    // Phương thức gửi email với tệp PDF đính kèm
    public void sendEmailWithAttachment(String toEmail) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        // Đặt thông tin email
        helper.setTo(toEmail);
        helper.setSubject("Thông tin đơn hàng");

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
//        FileSystemResource file = new FileSystemResource(new File(pdfFileName));
//        helper.addAttachment("invoice.pdf", file);

        // Gửi email
        mailSender.send(message);
    }

    public void sendPdfToMailDangGiao(HoaDon hd, Long id, KhachHang user, List<String> tenSp, String tongTien) throws IOException, DocumentException, MessagingException {

        Document document = new Document();
        String pdfFileName = this.pdfDirectory + "HoaDon_" + id + ".pdf";
        PdfWriter writer = PdfWriter.getInstance(document, Files.newOutputStream(Paths.get(pdfFileName), StandardOpenOption.CREATE));

        // Mở tài liệu PDF
        document.open();
        // Đường dẫn tới tệp hình ảnh logo của cửa hàng
        String logoImagePath = this.imgLogoPath; // Thay đổi đường dẫn đến tệp logo.png// Thay đổi đường dẫn đến tệp logo.png

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
        sendEmailDangGiao(user.getEmail(), pdfFileName);
    }

    public void sendPdfToMail(HoaDon hd, Long id, KhachHang user, List<String> tenSp, String tongTien, HttpServletResponse response) throws IOException, DocumentException, MessagingException {

        Document document = new Document();
        String pdfFileName = this.pdfDirectory + "HoaDon_" + id + ".pdf";
        PdfWriter writer = PdfWriter.getInstance(document, Files.newOutputStream(Paths.get(pdfFileName), StandardOpenOption.CREATE));

        // Mở tài liệu PDF
        document.open();
        // Đường dẫn tới tệp hình ảnh logo của cửa hàng
        String logoImagePath = this.imgLogoPath; // Thay đổi đường dẫn đến tệp logo.png// Thay đổi đường dẫn đến tệp logo.png

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
        sendEmailDangGiao(user.getEmail(), pdfFileName);
    }

    public void sendPdfToMailQuay(HoaDon hd, Long id, KhachHang user, List<String> tenSp, String tongTien) throws IOException, DocumentException, MessagingException {

        Document document = new Document();
        String pdfFileName = this.pdfDirectoryQuay + "HoaDon_" + id + ".pdf";
        PdfWriter writer = PdfWriter.getInstance(document, Files.newOutputStream(Paths.get(pdfFileName), StandardOpenOption.CREATE));

        // Mở tài liệu PDF
        document.open();

        // Đường dẫn tới tệp hình ảnh logo của cửa hàng
        String logoImagePath = this.imgLogoPath; // Thay đổi đường dẫn đến tệp logo.png

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

        cell = new PdfPCell(new Phrase(hd.getDiaChi(), contentFont));

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

        cell = new PdfPCell(new Phrase(String.join("\n", tenSp), contentFont));

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

//        sendEmailWithAttachmentQuay(user.getEmail(), pdfFileName);

    }


    public HoaDonChiTietDTO detailHoaDon(Long maHoaDon) {
        HoaDonChiTietDTO hoaDonChiTietDTO = hoaDonRepository.getDetailHD(maHoaDon);
        List<DanhSachSanPhamHoaDonDTO> danhSachSanPhamHoaDonDTOS = hoaDonChiTietRepository.getDsSPOFHoaDon(maHoaDon);
        for (DanhSachSanPhamHoaDonDTO danhSachSanPhamHoaDonDTO : danhSachSanPhamHoaDonDTOS) {
            danhSachSanPhamHoaDonDTO.convertGiaTien();
        }
        hoaDonChiTietDTO.setDanhSachSanPhamHoaDonDTOS(danhSachSanPhamHoaDonDTOS);
        return hoaDonChiTietDTO;
    }

    public String buildSearchHoaDonResultFile(HoaDonRequest request) {
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!request.getNgayBatDau().isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(request.getNgayBatDau(), "yyyy-MM-dd");
        }
        if (!request.getNgayKetThuc().isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(request.getNgayKetThuc(), "yyyy-MM-dd");
        }
        List<HoaDonResponse> hoaDonResponses = repository.searchHoaDon(request.getTrangThai(), ngayBatDau, ngayKetThuc,
                request.getKhachHang(), request.getNguoiNhan());
        for (HoaDonResponse hoaDonResponse : hoaDonResponses) {
            hoaDonResponse.convertTongTien();
        }
        String templateFolder = this.templateFolder;
        String fileName = "template_export_hoa_don.xls";
        String fileNameFull = this.fileNameFullFolder + File.separator + fileName;
        String fileTemplate = "template_export_hoa_don.xls";
        File templateFile = new File(templateFolder, fileTemplate);
        try {
            InputStream is = new FileInputStream(templateFile);
            File fileResult = new File(fileNameFull);
            OutputStream os = new FileOutputStream(fileResult);

            Context context = new Context();
            context.putVar("hds", hoaDonResponses);
            JxlsHelper.getInstance().processTemplate(is, os, context);
            return fileNameFull;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResponseEntity<?> updateTrangThai(HoaDonRequest hoaDonRequest) throws MessagingException, IOException, DocumentException {
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonRequest.getMaHoaDon()).orElse(null);
        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        if (hoaDon != null) {
            if (hoaDonRequest.getTrangThai() == 3 | hoaDonRequest.getTrangThai() == 5) {
                ViShop viShop = viShopRepository.getByKhachHang(hoaDon.getKhachHang());
                if(viShop !=null && hoaDon.getLoaiThanhToan() !=0){

                    viShop.setTongTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(viShop.getTongTien())) + Double.parseDouble(String.valueOf(hoaDon.getTongTien()))));
                    viShopRepository.save(viShop);

                    GiaoDichVi giaoDichVi = new GiaoDichVi();
                    giaoDichVi.setViShop(viShopRepository.getByKhachHang(hoaDon.getKhachHang()));
                    giaoDichVi.setDonGia(hoaDon.getTongTien());
                    giaoDichVi.setNhanVien(nhanVienRepository.getReferenceById(1L));
                    giaoDichVi.setHinhThuc(1);
                    giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
                    giaoDichVi.setTrangThai(1);
                    giaoDichViRepository.save(giaoDichVi);
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
                        }
                        chiTietSanPhamRepository.save(ctsp);


                    }
                    listSP.add(hdct.getChiTietSanPham().getSanPham());
                    DSSP.put(hdct.getChiTietSanPham().getSanPham().getTenSanPham(), hdct.getSoLuongMua());
                }

                hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
                hoaDon.setGhiChu(hoaDonRequest.getGhiChu());
                repository.save(hoaDon);

                return new ResponseEntity<>("Success", HttpStatus.OK);
            }

            if (hoaDonRequest.getDanhSachSanPhamHoaDonDTOS() != null) {
                for (DanhSachSanPhamHoaDonDTO dshdct : hoaDonRequest.getDanhSachSanPhamHoaDonDTOS()) {
                    if (StringUtils.isEmpty(dshdct.getImei())) {
                        return new ResponseEntity<>("Imei không được trống!", HttpStatus.OK);
                    }
                    HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(dshdct.getMaHDCT()).orElse(null);
                    HoaDonChiTiet checkImei = hoaDonChiTietRepository
                            .checkImei(dshdct.getImei().trim());

                    String checkImeiTrung = "Imei " + dshdct.getImei() + " đã được bán vui lòng nhập lại imei!";
                    if (checkImei != null) {
                        return new ResponseEntity<>(checkImeiTrung, HttpStatus.OK);
                    }
                    if (checkImei != null && !checkImei.getMaHoaDonChiTiet().equals(hoaDonChiTiet.getMaHoaDonChiTiet())) {
                        return new ResponseEntity<>(checkImeiTrung, HttpStatus.OK);
                    } else {
                        hoaDonChiTiet.setImei(dshdct.getImei());
                    }
                    if (isIMEIValid(dshdct.getImei())) {
                        System.out.println("IMEI hợp lệ!");
                        String checkImeiHopLe = "Imei " + dshdct.getImei() + " Không hợp lệ!";
                        return new ResponseEntity<>(checkImeiHopLe, HttpStatus.OK);
                    }
                    hoaDon.setLastUpdate(new Date());
                    hoaDonChiTietRepository.save(hoaDonChiTiet);
                }
            }

            hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
            repository.save(hoaDon);

            List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hoaDon);
            List<String> spp = new ArrayList<>();
            String tensp = null;
            String imei = null;
            String tenMauSac = null;
            String tenDungLuong = null;
            Integer sl = null;
            String test = " ";

            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);

            for (int i = 0; i < listHDCT.size(); i++) {

                tensp = listHDCT.get(i).getChiTietSanPham().getSanPham().getTenSanPham();
                imei = listHDCT.get(i).getImei();
                tenDungLuong = listHDCT.get(i).getChiTietSanPham().getDungLuong().getTenDungLuong();
                tenMauSac = listHDCT.get(i).getChiTietSanPham().getMauSac().getTenMauSac();

                String all = tensp + " " + tenDungLuong + " " + tenMauSac + " " + " (Imei: " + imei + ")\n";
                spp.add(all);
            }
            this.sendPdfToMailDangGiao(hoaDon, hoaDon.getKhachHang().getMaKhachHang(), hoaDon.getKhachHang(), spp, currencyFormat.format(hoaDon.getTongTien()));

        }
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> updateTrangThaiHoanThanh(HoaDonRequest hoaDonRequest) throws MessagingException, IOException, DocumentException {
        HoaDon hoaDon = hoaDonRepository.findById(hoaDonRequest.getMaHoaDon()).orElse(null);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        if (hoaDon != null) {
            hoaDon.setTrangThai(hoaDonRequest.getTrangThai());
            hoaDon.setNgayThanhToan(java.sql.Date.valueOf(datenow));
            hoaDon.setLastUpdate(new Date());
            repository.save(hoaDon);
//            this.sendEmailHoanThanh(hoaDon.getKhachHang().getEmail());
        }
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }


    public Integer countHoaDon() {
        return repository.tongDonHang();
    }

    public Integer countHoaDonHuy() {
        return repository.tongDonHangHuy();
    }

    public String tongDoanhThu() {
        BigDecimal tongDoanhThu = repository.tongDoangThu();
        if (tongDoanhThu == null) {
            return "0đ";
        }
        Double tongDoanhThuDouble = tongDoanhThu.doubleValue();
        Locale vietnameseLocale = new Locale("vi", "VN");
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
        return currencyFormat.format(tongDoanhThuDouble);
    }

    public List<HoaDonChiTietDTO> danhSachHoaDonHoanThanh() {
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonRepository.danhSachDOnHangThanhCong();
        for (HoaDonChiTietDTO hoaDonChiTietDTO : hoaDonChiTietDTOS) {
            List<String> danhSachSP = new ArrayList<>();
            Integer soLuongMua = 0;
            List<DanhSachSanPhamHoaDonDTO> danhSachSanPhamHoaDonDTOS = hoaDonChiTietRepository.getDsSPOFHoaDon(hoaDonChiTietDTO.getMaHoaDon());
            for (DanhSachSanPhamHoaDonDTO danhSachSanPhamHoaDonDTO : danhSachSanPhamHoaDonDTOS) {
                danhSachSP.add(danhSachSanPhamHoaDonDTO.getTenSanpham());
                soLuongMua += danhSachSanPhamHoaDonDTO.getSoLuong();
            }
            hoaDonChiTietDTO.setSoLuongMua(soLuongMua);
            hoaDonChiTietDTO.convertDataToString();
            hoaDonChiTietDTO.setDanhSachSanPham(danhSachSP);
            hoaDonChiTietDTO.setDanhSachSanPhamHoaDonDTOS(danhSachSanPhamHoaDonDTOS);
        }
        return hoaDonChiTietDTOS;
    }

    public String tongTienDanhSachHoaDonHoanThanh() {
        Double tongTien = 0.0;
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonRepository.danhSachDOnHangThanhCong();
        for (HoaDonChiTietDTO hoaDonChiTietDTO : hoaDonChiTietDTOS) {
            tongTien += Double.parseDouble(String.valueOf(hoaDonChiTietDTO.getTongTien()));
        }
        Locale vietnameseLocale = new Locale("vi", "VN");
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
        String tongTienString = currencyFormat.format(BigDecimal.valueOf(tongTien));
        return tongTienString;
    }

    public List<HoaDonChiTietDTO> danhSachHoaDonHoanThanhTheoNgay(String ngayBatDauStr, String ngayKetThucStr) {
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonRepository.danhSachDOnHangThanhCongTheoNgay(ngayBatDau, ngayKetThuc);
        for (HoaDonChiTietDTO hoaDonChiTietDTO : hoaDonChiTietDTOS) {
            List<String> danhSachSP = new ArrayList<>();
            Integer soLuongMua = 0;
            List<DanhSachSanPhamHoaDonDTO> danhSachSanPhamHoaDonDTOS = hoaDonChiTietRepository.getDsSPOFHoaDon(hoaDonChiTietDTO.getMaHoaDon());
            for (DanhSachSanPhamHoaDonDTO danhSachSanPhamHoaDonDTO : danhSachSanPhamHoaDonDTOS) {
                danhSachSP.add(danhSachSanPhamHoaDonDTO.getTenSanpham());
                soLuongMua += danhSachSanPhamHoaDonDTO.getSoLuong();
            }
            hoaDonChiTietDTO.setSoLuongMua(soLuongMua);
            hoaDonChiTietDTO.convertDataToString();
            hoaDonChiTietDTO.setDanhSachSanPham(danhSachSP);
            hoaDonChiTietDTO.setDanhSachSanPhamHoaDonDTOS(danhSachSanPhamHoaDonDTOS);
        }
        return hoaDonChiTietDTOS;
    }

    public String tongTienDanhSachHoaDonHoanThanhTheoNgay(String ngayBatDauStr, String ngayKetThucStr) {
        Double tongTien = 0.0;
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonRepository.danhSachDOnHangThanhCongTheoNgay(ngayBatDau, ngayKetThuc);
        for (HoaDonChiTietDTO hoaDonChiTietDTO : hoaDonChiTietDTOS) {
            tongTien += Double.parseDouble(String.valueOf(hoaDonChiTietDTO.getTongTien()));
        }
        Locale vietnameseLocale = new Locale("vi", "VN");
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
        String tongTienString = currencyFormat.format(BigDecimal.valueOf(tongTien));
        return tongTienString;
    }

    public ResponseEntity<?> addThongTinHoaDonTaiQuay(ThongTinThanhToanTaiQuay thongTinThanhToanTaiQuay) throws DocumentException, MessagingException, IOException {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        List<SanPhamThanhToanTaiQuayDTO> DSSP = thongTinThanhToanTaiQuay.getSanPhamThanhToanTaiQuayDTOS();
        Integer totalSoLuongMua = 0;
        for (SanPhamThanhToanTaiQuayDTO sanPhamThanhToanTaiQuayDTO: DSSP){
            ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(sanPhamThanhToanTaiQuayDTO.getMaChiTietSanPham()).orElse(null);
            Integer soLuongTon = chiTietSanPham.getSoLuongNhap() - chiTietSanPham.getSoLuongBan();
            totalSoLuongMua += sanPhamThanhToanTaiQuayDTO.getSoLuongMua();
            if (totalSoLuongMua > soLuongTon){
                return new ResponseEntity<>("Số lượng sản phẩm trong kho không đủ, hãy kiểm tra lại", HttpStatus.OK);
            }
            if (isIMEIValid(sanPhamThanhToanTaiQuayDTO.getImei())) {
                String checkImeiHopLe = "Imei " + sanPhamThanhToanTaiQuayDTO.getImei() + " Không hợp lệ!";
                return new ResponseEntity<>(checkImeiHopLe, HttpStatus.OK);
            }
        }
        KhachHang khachHang = new KhachHang();
        khachHang.setTen(thongTinThanhToanTaiQuay.getTenKhachHang());
        khachHang.setDiaChi(thongTinThanhToanTaiQuay.getDiaChi());
        khachHang.setSdt(thongTinThanhToanTaiQuay.getSdt());
        khachHang.setEmail(null);
        khachHang.setGioiTinh(true);
        khachHang.setTrangThai(1);
        khachHang.setCccd(null);
        khachHang.setNgaySinh(null);
        khachHang.setCreatedDate(new Date());
        khachHang.setLastUpdate(new Date());
        khachHangRepository.save(khachHang);

        KhachHang khachHang1 = khachHangRepository.findById(khachHang.getMaKhachHang()).orElse(null);
        NhanVien nhanVienMD = nhanVienRepository.findById(thongTinThanhToanTaiQuay.getMaNhanVien()).orElse(null);
        HoaDon hd;
        if (thongTinThanhToanTaiQuay.getLoaiThanhToan() == 0) {
            hd = HoaDon.builder().
                    nguoiNhan(thongTinThanhToanTaiQuay.getTenKhachHang()).
                    diaChi(thongTinThanhToanTaiQuay.getDiaChi()).
                    sdt(thongTinThanhToanTaiQuay.getSdt()).
                    trangThai(1).
                    khachHang(khachHang1).
                    tongTien(thongTinThanhToanTaiQuay.getTongTien()).
                    nhanVien(nhanVienMD).
                    ngayTao(java.sql.Date.valueOf(datenow)).
                    ngayThanhToan(java.sql.Date.valueOf(datenow)).
                    loaiThanhToan(thongTinThanhToanTaiQuay.getLoaiThanhToan()).
                    ghiChu(thongTinThanhToanTaiQuay.getGhiChu()).
                    createdDate(new Date()).
                    lastUpdate(new Date()).
                    maVoucher(thongTinThanhToanTaiQuay.getMaVoucher()).
                    build();
            hoaDonRepository.save(hd);
        } else {
            hd = HoaDon.builder().
                    nguoiNhan(thongTinThanhToanTaiQuay.getTenKhachHang()).
                    diaChi("Số nhà 14A, 80/47 Xuân Phương").
                    tinh("Hà Nội").huyen("NamTừ Liêm").xa("Xuân Phương").
                    sdt(thongTinThanhToanTaiQuay.getSdt()).
                    trangThai(TAI_QUAY).
                    khachHang(khachHang1).
                    tongTien(thongTinThanhToanTaiQuay.getTongTien()).
                    nhanVien(nhanVienMD).
                    ngayTao(java.sql.Date.valueOf(datenow)).
                    ngayThanhToan(java.sql.Date.valueOf(datenow)).
                    loaiThanhToan(thongTinThanhToanTaiQuay.getLoaiThanhToan()).
                    ghiChu(thongTinThanhToanTaiQuay.getGhiChu()).
                    createdDate(new Date()).
                    lastUpdate(new Date()).
                    maVoucher(thongTinThanhToanTaiQuay.getMaVoucher()).
                    build();
            hoaDonRepository.save(hd);
        }

        for (SanPhamThanhToanTaiQuayDTO sanPhamThanhToanTaiQuayDTO : DSSP) {
            ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(sanPhamThanhToanTaiQuayDTO.getMaChiTietSanPham()).orElse(null);
            //hdct
            for (int i = 0; i < sanPhamThanhToanTaiQuayDTO.getSoLuongMua(); i++) {
                HoaDonChiTiet checkImei = hoaDonChiTietRepository
                        .checkImei(sanPhamThanhToanTaiQuayDTO.getImei().trim());
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                if (sanPhamThanhToanTaiQuayDTO.getImei().isEmpty()) {
                    return new ResponseEntity<>("Vui lòng nhập imei máy!", HttpStatus.OK);
                }
                String checkImeiTrung = "Imei " + sanPhamThanhToanTaiQuayDTO.getImei() + " đã được bán vui lòng nhập lại imei!";
                if (checkImei != null ) {
                    return new ResponseEntity<>(checkImeiTrung, HttpStatus.OK);
                }
                if (checkImei != null && !checkImei.getMaHoaDonChiTiet().equals(hoaDonChiTiet.getMaHoaDonChiTiet())) {
                    return new ResponseEntity<>(checkImeiTrung, HttpStatus.OK);
                } else {
                    hoaDonChiTiet.setImei(sanPhamThanhToanTaiQuayDTO.getImei());
                }
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setHoaDon(hd);
                hoaDonChiTiet.setGiaTien(sanPhamThanhToanTaiQuayDTO.getGiaTien());
                hoaDonChiTiet.setSoLuongMua(1);
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTiet.setCreatedDate(new Date());
                hoaDonChiTiet.setLastUpdate(new Date());
                hoaDonChiTietRepository.save(hoaDonChiTiet);
            }
            //cap nhap slban
            chiTietSanPham.setSoLuongBan(chiTietSanPham.getSoLuongBan() + sanPhamThanhToanTaiQuayDTO.getSoLuongMua());
            chiTietSanPhamRepository.save(chiTietSanPham);
            if (chiTietSanPham.getSoLuongNhap() <= chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(0);
                SanPham sp = sanPhamRepository.findById(chiTietSanPham.getSanPham().getMaSanPham()).orElse(null);
                sp.setTrangThai(0);
                sanPhamRepository.save(sp);
                chiTietSanPhamRepository.save(chiTietSanPham);
            }
        }
        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getByHoaDon(hd);
        List<String> spp = new ArrayList<>();
        String tensp = null;
        String imei = null;
        String tenMauSac = null;
        String tenDungLuong = null;
        Integer sl = null;
        String test = " ";

        Locale vietnameseLocale = new Locale("vi", "VN");
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);

        for (int i = 0; i < listHDCT.size(); i++) {
            tensp = listHDCT.get(i).getChiTietSanPham().getSanPham().getTenSanPham();
            imei = listHDCT.get(i).getImei();
            tenDungLuong = listHDCT.get(i).getChiTietSanPham().getDungLuong().getTenDungLuong();
            tenMauSac = listHDCT.get(i).getChiTietSanPham().getMauSac().getTenMauSac();

            String all = tensp + " " + tenDungLuong + " " + tenMauSac + " " + " (Imei: " + imei + ")\n";

            spp.add(all);
        }
        this.sendPdfToMailQuay(hd, khachHang.getMaKhachHang(), khachHang, spp, currencyFormat.format(hd.getTongTien()));

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    private void sendEmailDangGiao(String toEmail, String pdfFileName) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");


        // Đặt thông tin email
        helper.setTo(toEmail);
        helper.setSubject("Thông tin Đơn hàng");

        helper.setText("Cảm ơn khách hàng đã mua hàng của chúng tôi.\n Đơn hàng của bạn đã được xác nhận và đang trên đường giao hàng.Dưới đây là hóa đơn của bạn. ");

// Đính kèm tệp PDF vào email
        FileSystemResource file = new FileSystemResource(new File(pdfFileName));
        helper.addAttachment("invoice.pdf", file);
        // Gửi email
        mailSender.send(message);
    }

    private void sendEmailHoanThanh(String toEmail) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        // Đặt thông tin email
        helper.setTo(toEmail);
        helper.setSubject("Thông tin Đơn hàng");


        helper.setText("Cảm ơn Bạn đã mua hàng của chúng tôi. Đơn hàng của bạn hoàn thành.");

//        // Đính kèm tệp PDF vào email
//        FileSystemResource file = new FileSystemResource(new File(pdfFileName));
//        helper.addAttachment("invoice.pdf", file);

        // Gửi email
        mailSender.send(message);
    }

    public ResponseEntity<?> updateAllTrangThaiHoanThanh() {
        List<HoaDon> hoaDonTTGiaoHang = hoaDonRepository.findAllHoaDonTTGiaoHang();
        if (hoaDonTTGiaoHang != null) {
            for (HoaDon hoaDon : hoaDonTTGiaoHang) {
                hoaDon.setTrangThai(Constants.HOAN_THANH);
                hoaDon.setLastUpdate(new Date());
                hoaDonRepository.save(hoaDon);
            }
        }
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public static boolean isIMEIValid(String imei) {
        imei = imei.replaceAll("[\\s-]", "");
        if (imei.matches("^\\d{15}$")) {
            int sum = 0;
            for (int i = 0; i < 14; i++) {
                int digit = Character.getNumericValue(imei.charAt(i));
                if (i % 2 == 0) {
                    digit *= 2;
                    digit = digit < 10 ? digit : digit - 9;
                }
                sum += digit;
            }

            int checkDigit = (10 - (sum % 10)) % 10;
            return Character.getNumericValue(imei.charAt(14)) == checkDigit;
        }

        return false;
    }
}