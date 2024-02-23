package com.example.demo.Config;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.DungLuongDTO;
import com.example.demo.Dto.ListDungLuongOfSanPhamDTO;
import com.example.demo.Dto.ListMauSacOfSanPhamDTO;
import com.example.demo.Dto.Response.DetailSanPhamResponse;
import com.example.demo.Dto.SanPhamGiamGiaDTO;
import com.example.demo.Dto.SanPhamHTDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SmartPhonesController {
    @Autowired
    private ChiTietSanPhamService service;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private NSXRepository nsxRepository;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private DanhGiaRepository danhGiaRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private DungLuongRepository dungLuongRepository;

    @Autowired
    private SanPhamViewRepository sanPhamViewRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;


    @GetMapping("/hien-thi-shop/{maKhachHang}")
    public String hienThi(Model model,
                          @PathVariable(name = "maKhachHang") Long maKhachHang,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "type", required = false) Long type,
                          @RequestParam(value = "range", required = false) String range
    ) {
        int limit = 9; // Số lượng sản phẩm trên mỗi trang
        int offset = (page - 1) * limit; // Offset để truy vấn từ bản ghi nào


        KhachHang khachHangs = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHangs);

        int totalItem = service.getTotalItem(type, range, null, null); // Số lượng sản phẩm trong cơ sở dữ liệu (tổng số)
        int totalPage = (int) Math.ceil((double) totalItem / limit); // Tính tổng số trang dựa trên tổng số sản phẩm và số lượng sản phẩm trên mỗi trang
        List<SanPhamHTDTO> chiTietSanPhamList;


        if (range != null && !range.isEmpty()) {
            // Xử lý khi có range từ URL
            String[] priceRange = range.split("-");

            if (priceRange.length == 2) {
                try {
                    BigDecimal minPrice = new BigDecimal(priceRange[0]);
                    BigDecimal maxPrice = new BigDecimal(priceRange[1]);

                    if (type != null) {
                        // Lọc sản phẩm theo nhà sản xuất và khoảng giá
                        if (range.equals("0-11000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(0), BigDecimal.valueOf(10999999), offset, limit);
                        } else if (range.equals("11000-15000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(11000000), BigDecimal.valueOf(15000000), offset, limit);
                        } else if (range.equals("15000-999999999")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(15000000), BigDecimal.valueOf(999999999), offset, limit);
                        } else {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, null, null, offset, limit);
                        }
                    } else {
                        // Lọc sản phẩm chỉ theo khoảng giá
                        if (range.equals("0-11000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(0), BigDecimal.valueOf(10999999), offset, limit);
                        } else if (range.equals("11000-15000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(11000000), BigDecimal.valueOf(15000000), offset, limit);
                        } else if (range.equals("15000-999999999")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(15000000), BigDecimal.valueOf(999999999), offset, limit);
                        } else {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, null, null, offset, limit);
                        }
                    }
                } catch (NumberFormatException e) {
                    // Xử lý nếu giá không đúng định dạng số
                    e.printStackTrace();
                    chiTietSanPhamList = new ArrayList<>(); // hoặc xử lý khác theo yêu cầu
                }
            } else {
                // Xử lý nếu range không hợp lệ
                chiTietSanPhamList = new ArrayList<>(); // hoặc xử lý khác theo yêu cầu
            }
        } else {
            // Xử lý khi không có range từ URL
            if (type != null) {
                chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, null, null, offset, limit);
            } else {
                chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, null, null, offset, limit);
            }
        }

        model.addAttribute("ctsps", chiTietSanPhamList);

        List<NSX> nsxList = nsxRepository.findAll();
        model.addAttribute("listNSX", nsxList);

        List<DungLuong> dungLuongList = dungLuongRepository.findAll();
        model.addAttribute("listDungLuong", dungLuongList);

        List<MauSac> mauSacList = mauSacRepository.findAll();
        model.addAttribute("listMS", mauSacList);

        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage); // Truyền tổng số trang vào view

        return "shop";
    }


    @PostMapping("/hien-thi-shop/{maKhachHang}")
    public String timKiemSanPham(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @RequestParam("tenSanPham") String tenSanPham,
            Model model
    ) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);

        List<SanPhamHTDTO> danhSachTimKiem = sanPhamViewRepository.SearchSanPhamHTDTO(tenSanPham.trim());

        List<NSX> nsxList = nsxRepository.findAll();

        model.addAttribute("listNSX", nsxList);
        model.addAttribute("kh", khachHang);
        model.addAttribute("ctsps", danhSachTimKiem);
        return "shop"; // Trả về trang shop với kết quả tìm kiếm
    }

    @GetMapping("/view/{maKhachHang}/{tenSanPham}")
    public String ViewUpdate(Model model, @PathVariable(name = "tenSanPham") String tenSanPham,
                             @PathVariable(name = "maKhachHang") Long maKhachHang) {
        DetailSanPhamResponse sanPham = service.detailSanPhamByTenSanPham(tenSanPham);
        KhachHang khachHangs = khachHangService.getByMa(maKhachHang);
        List<ListDungLuongOfSanPhamDTO> listDungLuongOfSanPhamDTOS = sanPham.getListDungLuongOfSanPhamDTOS();
        ListDungLuongOfSanPhamDTO listDungLuongOfSanPhamDTO = listDungLuongOfSanPhamDTOS.get(0);
        List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS = service.getListMauSacOfSanPhamByDungLuong(tenSanPham, listDungLuongOfSanPhamDTO.getMaDungLuong());
        ListDungLuongOfSanPhamDTO giaSPViewTong = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, listMauSacOfSanPhamDTOS.get(0).getMaDungLuong());
        model.addAttribute("listMauSac", listMauSacOfSanPhamDTOS);
        model.addAttribute("tenDungLuongCheck", listDungLuongOfSanPhamDTO.getTenDungLuong());
        for (ListDungLuongOfSanPhamDTO luongOfSanPhamDTO : sanPham.getListDungLuongOfSanPhamDTOS()) {
            ListDungLuongOfSanPhamDTO giaSP = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, luongOfSanPhamDTO.getMaDungLuong());
            if (giaSP == null) {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(null);
            } else {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(giaSP.getGiaBanSauKhiGG());
            }
        }
        if (giaSPViewTong == null) {
            model.addAttribute("giaBan", listDungLuongOfSanPhamDTO.getGiaBan());
            model.addAttribute("giaBanGG", "");
        } else {
            model.addAttribute("giaBan", listDungLuongOfSanPhamDTO.getGiaBan());
            model.addAttribute("giaBanGG", giaSPViewTong.getGiaBanSauKhiGG());
        }
        model.addAttribute("sanPham", sanPham);
//        model.addAttribute("listDungLuongOfSanPhamDTOS", chiTietSanPham);
        List<DanhGia> danhGiaList = danhGiaRepository.findAllBySanPham(sanPhamRepository.findByTenSanPham(tenSanPham));
        model.addAttribute("danhGiaList", danhGiaList);
        for (DanhGia danhGia : danhGiaList) {
            Date date = danhGia.getNgayDanhGia();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String ngayDanhGia = sdf.format(date);
            model.addAttribute("ngayDanhGia", ngayDanhGia);
        }

        model.addAttribute("kh", khachHangs);
        return "single-product";
    }

    @GetMapping("/view/{maKhachHang}/{tenSanPham}/{tenDungLuong}")
    public String viewListMauSac(Model model, @PathVariable(name = "tenSanPham") String tenSanPham,
                                 @PathVariable(name = "tenDungLuong") String tenDungLuong,
                                 @PathVariable(name = "maKhachHang") Long maKhachHang) {
        DetailSanPhamResponse sanPham = service.detailSanPhamByTenSanPham(tenSanPham);
        KhachHang khachHangs = khachHangService.getByMa(maKhachHang);
        List<ListDungLuongOfSanPhamDTO> dungLuong = dungLuongRepository.findByTenSanPhamAndTenDL(tenSanPham, tenDungLuong);
        List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS = service.getListMauSacOfSanPhamByDungLuong(tenSanPham, dungLuong.get(0).getMaDungLuong());
        ListDungLuongOfSanPhamDTO giaSPViewTong = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, listMauSacOfSanPhamDTOS.get(0).getMaDungLuong());
        model.addAttribute("listMauSac", listMauSacOfSanPhamDTOS);
        model.addAttribute("tenDungLuongCheck", tenDungLuong);
        for (ListDungLuongOfSanPhamDTO luongOfSanPhamDTO : sanPham.getListDungLuongOfSanPhamDTOS()) {
            ListDungLuongOfSanPhamDTO giaSP = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, luongOfSanPhamDTO.getMaDungLuong());
            if (giaSP == null) {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(null);
            } else {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(giaSP.getGiaBanSauKhiGG());
            }
        }
        if (giaSPViewTong == null) {
            model.addAttribute("giaBan", dungLuong.get(0).getGiaBan());
            model.addAttribute("giaBanGG", "");
        } else {
            model.addAttribute("giaBan", giaSPViewTong.getGiaBan());
            model.addAttribute("giaBanGG", giaSPViewTong.getGiaBanSauKhiGG());
        }
        model.addAttribute("sanPham", sanPham);
        model.addAttribute("dungLuong", dungLuong);
//        model.addAttribute("listDungLuongOfSanPhamDTOS", chiTietSanPham);
        List<DanhGia> danhGiaList = danhGiaRepository.findAllBySanPham(sanPhamRepository.findByTenSanPham(tenSanPham));
        model.addAttribute("danhGiaList", danhGiaList);
        for (DanhGia danhGia : danhGiaList) {
            Date date = danhGia.getNgayDanhGia();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String ngayDanhGia = sdf.format(date);
            model.addAttribute("ngayDanhGia", ngayDanhGia);
        }

        model.addAttribute("kh", khachHangs);
        return "single-product";
    }

//    @GetMapping("/getSoLuongTon")
//    public Map<String, Integer> getSoLuongTon(@RequestParam String tenSanPham, @RequestParam String tenDungLuong, @RequestParam String tenMauSac) {
//        Integer soLuongNhap = chiTietSanPhamRepository.countSoLuongNhapByTenSanPhamAndDungLuongAndMauSac(tenSanPham, tenDungLuong, tenMauSac);
//        Integer soLuongBan = chiTietSanPhamRepository.countSoLuongBanByTenSanPhamAndDungLuongAndMauSac(tenSanPham, tenDungLuong, tenMauSac);
//
//        Integer soLuongTon =soLuongNhap-soLuongBan;
//
//        Map<String, Integer> response = new HashMap<>();
//        response.put("soLuongTon", soLuongTon);
//        return response;
//    }

    @PostMapping("/add_danh_gia")
    public String add_Danh_Gia(HttpServletRequest request) {

        String idKh = request.getParameter("maKhachHang");
        String tenSanPham = request.getParameter("san-pham");
        String binhLuan = request.getParameter("comment");

//        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(Long.parseLong(tenSanPham));
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

        return "redirect:/view/" + idKh + "/" + tenSanPham;
    }

    @PostMapping("/home_clients/{maKhachHang}")
    public String timKiem(@PathVariable("maKhachHang") Long maKhachHang, Model model, @RequestParam("tenSanPham") String tenSanPham) {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<ChiTietSanPham> danhSachTimKiem = chiTietSanPhamRepository.findByTenSanPhamContaining(tenSanPham);
        model.addAttribute("kh", kh);
        model.addAttribute("ctsps", danhSachTimKiem);
        return "shop";
    }

    //Chưa đăng nhập
    @GetMapping("/hien-thi-shop")
    public String hienThi1(Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "type", required = false) Long type,
                           @RequestParam(value = "range", required = false) String range) {
        int limit = 9; // Số lượng sản phẩm trên mỗi trang
        int offset = (page - 1) * limit; // Offset để truy vấn từ bản ghi nào


        int totalItem = service.getTotalItem(type, range, null, null); // Số lượng sản phẩm trong cơ sở dữ liệu (tổng số)
        int totalPage = (int) Math.ceil((double) totalItem / limit);


        List<SanPhamHTDTO> chiTietSanPhamList;

        if (range != null && !range.isEmpty()) {
            // Xử lý khi có range từ URL
            String[] priceRange = range.split("-");

            if (priceRange.length == 2) {
                try {
                    BigDecimal minPrice = new BigDecimal(priceRange[0]);
                    BigDecimal maxPrice = new BigDecimal(priceRange[1]);

                    if (type != null) {
                        // Lọc sản phẩm theo nhà sản xuất và khoảng giá
                        if (range.equals("0-11000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(0), BigDecimal.valueOf(10999999), offset, limit);
                        } else if (range.equals("11000-15000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(11000000), BigDecimal.valueOf(15000000), offset, limit);
                        } else if (range.equals("15000-999999999")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, BigDecimal.valueOf(15000000), BigDecimal.valueOf(999999999), offset, limit);
                        } else {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, null, null, offset, limit);
                        }
                    } else {
                        // Lọc sản phẩm chỉ theo khoảng giá
                        if (range.equals("0-11000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(0), BigDecimal.valueOf(10999999), offset, limit);
                        } else if (range.equals("11000-15000")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(11000000), BigDecimal.valueOf(15000000), offset, limit);
                        } else if (range.equals("15000-999999999")) {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, BigDecimal.valueOf(15000000), BigDecimal.valueOf(999999999), offset, limit);
                        } else {
                            chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, null, null, offset, limit);
                        }
                    }
                } catch (NumberFormatException e) {
                    // Xử lý nếu giá không đúng định dạng số
                    e.printStackTrace();
                    chiTietSanPhamList = new ArrayList<>(); // hoặc xử lý khác theo yêu cầu
                }
            } else {
                // Xử lý nếu range không hợp lệ
                chiTietSanPhamList = new ArrayList<>(); // hoặc xử lý khác theo yêu cầu
            }
        } else {
            // Xử lý khi không có range từ URL
            if (type != null) {
                chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(type, null, null, offset, limit);
            } else {
                chiTietSanPhamList = sanPhamViewRepository.fetchSanPhamHTDTO(null, null, null, offset, limit);
            }
        }


        model.addAttribute("ctsps", chiTietSanPhamList);

        List<NSX> nsxList = nsxRepository.findAll();
        model.addAttribute("listNSX", nsxList);

        List<DungLuong> dungLuongList = dungLuongRepository.findAll();
        model.addAttribute("listDungLuong", dungLuongList);

        List<MauSac> mauSacList = mauSacRepository.findAll();
        model.addAttribute("listMS", mauSacList);

        model.addAttribute("page", page);
        model.addAttribute("totalItems", totalItem);
        model.addAttribute("totalPage", totalPage); // Truyền tổng số trang vào view
        return "/chuadn/shopchuadn";
    }


    @PostMapping("/hien-thi-shop")
    public String timKiemSanPham1(@RequestParam("tenSanPham") String tenSanPham, Model model) {
        List<SanPhamHTDTO> danhSachTimKiem = sanPhamViewRepository.SearchSanPhamHTDTO(tenSanPham);

        List<NSX> nsxList = nsxRepository.findAll();

        model.addAttribute("listNSX", nsxList);
        model.addAttribute("ctsps", danhSachTimKiem);
        return "/chuadn/shopchuadn"; // Trả về trang shop với kết quả tìm kiếm
    }

    @GetMapping("/viewCDN/{tenSanPham}")
    public String ViewUpdateChuaDangNhap(Model model, @PathVariable(name = "tenSanPham") String tenSanPham) {
        DetailSanPhamResponse sanPham = service.detailSanPhamByTenSanPham(tenSanPham);
        List<ListDungLuongOfSanPhamDTO> listDungLuongOfSanPhamDTOS = sanPham.getListDungLuongOfSanPhamDTOS();
        ListDungLuongOfSanPhamDTO listDungLuongOfSanPhamDTO = listDungLuongOfSanPhamDTOS.get(0);
        ListDungLuongOfSanPhamDTO giaSP = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, listDungLuongOfSanPhamDTO.getMaDungLuong());
        List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS = service.getListMauSacOfSanPhamByDungLuong(tenSanPham, listDungLuongOfSanPhamDTO.getMaDungLuong());
        model.addAttribute("listMauSac", listMauSacOfSanPhamDTOS);
        model.addAttribute("tenDungLuongCheck", listDungLuongOfSanPhamDTO.getTenDungLuong());
        for (ListDungLuongOfSanPhamDTO luongOfSanPhamDTO : sanPham.getListDungLuongOfSanPhamDTOS()) {
            ListDungLuongOfSanPhamDTO giaSPCheck = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, luongOfSanPhamDTO.getMaDungLuong());
            if (giaSPCheck == null) {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(null);
            } else {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(giaSPCheck.getGiaBanSauKhiGG());
            }
        }
        if (giaSP == null) {
            model.addAttribute("giaBan", listDungLuongOfSanPhamDTO.getGiaBan());
            model.addAttribute("giaBanGG", "");
        } else {
            model.addAttribute("giaBan", listDungLuongOfSanPhamDTO.getGiaBan());
            model.addAttribute("giaBanGG", giaSP.getGiaBanSauKhiGG());
        }
        model.addAttribute("sanPham", sanPham);

        List<DanhGia> danhGiaList = danhGiaRepository.findAllBySanPham(sanPhamRepository.findByTenSanPham(tenSanPham));
        model.addAttribute("danhGiaList", danhGiaList);
        for (DanhGia danhGia : danhGiaList) {
            Date date = danhGia.getNgayDanhGia();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String ngayDanhGia = sdf.format(date);
            model.addAttribute("ngayDanhGia", ngayDanhGia);
        }
//        if (check > 0) {
//            model.addAttribute("check", 1);
//        } else {
//            model.addAttribute("check", 0);
//        }
//        ChiTietSanPham chiTietSanPham = service.getByMa(maChiTietSanPham);
//        SanPhamGiamGiaDTO sanPhamGiamGiaDTO = chiTietSanPhamRepository.detailSanPhamGiamGia(maChiTietSanPham);
//        model.addAttribute("maChiTietSanPham", chiTietSanPham);
//        model.addAttribute("maChiTietSanPhamGG", sanPhamGiamGiaDTO);
        return "/chuadn/single-product_chuadn";
    }

    @GetMapping("/viewCDN/{tenSanPham}/{tenDungLuong}")
    public String viewListMauSac(Model model, @PathVariable(name = "tenSanPham") String tenSanPham,
                                 @PathVariable(name = "tenDungLuong") String tenDungLuong) {
        DetailSanPhamResponse sanPham = service.detailSanPhamByTenSanPham(tenSanPham);
        List<ListDungLuongOfSanPhamDTO> dungLuong = dungLuongRepository.findByTenSanPhamAndTenDL(tenSanPham, tenDungLuong);
        ListDungLuongOfSanPhamDTO giaSP = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, dungLuong.get(0).getMaDungLuong());
        List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS = service.getListMauSacOfSanPhamByDungLuong(tenSanPham, dungLuong.get(0).getMaDungLuong());
        for (ListDungLuongOfSanPhamDTO luongOfSanPhamDTO : sanPham.getListDungLuongOfSanPhamDTOS()) {
            ListDungLuongOfSanPhamDTO giaSPCheck = chiTietSanPhamRepository.getGiaBanOfSP(tenSanPham, luongOfSanPhamDTO.getMaDungLuong());
            if (giaSPCheck == null) {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(null);
            } else {
                luongOfSanPhamDTO.setGiaBanSauKhiGG(giaSPCheck.getGiaBanSauKhiGG());
            }
        }
        if (giaSP == null) {
            model.addAttribute("giaBan", dungLuong.get(0).getGiaBan());
            model.addAttribute("giaBanGG", "");
        } else {
            model.addAttribute("giaBan", giaSP.getGiaBan());
            model.addAttribute("giaBanGG", giaSP.getGiaBanSauKhiGG());
        }
        model.addAttribute("sanPham", sanPham);
        model.addAttribute("listMauSac", listMauSacOfSanPhamDTOS);
        model.addAttribute("dungLuong", dungLuong);
        model.addAttribute("tenDungLuongCheck", tenDungLuong);
//        model.addAttribute("listDungLuongOfSanPhamDTOS", chiTietSanPham);
        List<DanhGia> danhGiaList = danhGiaRepository.findAllBySanPham(sanPhamRepository.findByTenSanPham(tenSanPham));
        model.addAttribute("danhGiaList", danhGiaList);
        for (DanhGia danhGia : danhGiaList) {
            Date date = danhGia.getNgayDanhGia();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String ngayDanhGia = sdf.format(date);
            model.addAttribute("ngayDanhGia", ngayDanhGia);
        }
        return "/chuadn/single-product_chuadn";
    }


    @PostMapping("/home")
    public String timKiem1(Model model, @RequestParam("tenSanPham") String tenSanPham) {
        List<ChiTietSanPham> chiTietSanPhamList = service.hienThi();
        model.addAttribute("ctsps", chiTietSanPhamList);
        List<ChiTietSanPham> danhSachTimKiem = chiTietSanPhamRepository.findByTenSanPhamContaining(tenSanPham);
        model.addAttribute("ctsps", danhSachTimKiem);
        return "/chuadn/shopchuadn";
//        return "home";
    }

    @GetMapping("/soluongton")
    public ResponseEntity<Integer> getStock(
            @RequestParam String tenSanPham,
            @RequestParam String tenDungLuong,
            @RequestParam String tenMauSac,
            @CookieValue("makhachhang") Long maKhachHang
    ) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getCTSPByMauSacAndDungLuongAndTen(tenSanPham, tenDungLuong, tenMauSac);

        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(chiTietSanPham, gioHangRepository.getByKhachHang(khachHangService.getByMa(maKhachHang)));

        if (gioHangChiTiet != null) {
            Integer soLuongNhap = chiTietSanPhamRepository.findSoLuongNhapBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                    tenSanPham, tenDungLuong, tenMauSac
            );
            Integer soLuongBan = chiTietSanPhamRepository.findSoLuongBanBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                    tenSanPham, tenDungLuong, tenMauSac
            );
            Integer soLuongTon = 0;
            if (gioHangChiTiet.getSoLuong() != null) {
                soLuongTon = soLuongNhap - soLuongBan - gioHangChiTiet.getSoLuong();
            } else {
                soLuongTon = soLuongNhap - soLuongBan;
            }
            return ResponseEntity.ok().body(soLuongTon);
        }

        Integer soLuongNhap = chiTietSanPhamRepository.findSoLuongNhapBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                tenSanPham, tenDungLuong, tenMauSac
        );
        Integer soLuongBan = chiTietSanPhamRepository.findSoLuongBanBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                tenSanPham, tenDungLuong, tenMauSac
        );
        Integer soLuongTon = soLuongNhap - soLuongBan;

        return ResponseEntity.ok().body(soLuongTon);
    }
    @GetMapping("/soluongtonChuaDangNhap")
    public ResponseEntity<Integer> getStock(
            @RequestParam String tenSanPham,
            @RequestParam String tenDungLuong,
            @RequestParam String tenMauSac
    ) {
        Integer soLuongNhap = chiTietSanPhamRepository.findSoLuongNhapBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                tenSanPham, tenDungLuong, tenMauSac
        );
        Integer soLuongBan = chiTietSanPhamRepository.findSoLuongBanBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(
                tenSanPham, tenDungLuong, tenMauSac
        );
        Integer soLuongTon = soLuongNhap - soLuongBan;

        return ResponseEntity.ok().body(soLuongTon);
    }
    @GetMapping("/hinhAnhURL")
    public ResponseEntity<String> getImagePathByColor(@RequestParam String tenSanPham,
                                                      @RequestParam String tenDungLuong,
                                                      @RequestParam String tenMauSac) {

        String hinhAnhURL = chiTietSanPhamRepository.findHinhAnhURLBySanPham_TenSanPhamAndDungLuong_TenDungLuongAndMauSac_TenMauSac(tenSanPham, tenDungLuong, tenMauSac); // Thay thế bằng phương thức thực tế của bạn

        return ResponseEntity.ok().body(hinhAnhURL);
    }

}
