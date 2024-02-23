package com.example.demo.Controller.Admin;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.ChipDTO;
import com.example.demo.Dto.DungLuongDTO;
import com.example.demo.Dto.GiamGiaSanPhamDTO;
import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Request.GiamGiaHoaDonRequest;
import com.example.demo.Dto.Request.GiamGiaSanPhamRequest;
import com.example.demo.Dto.SanPhamTHongKeDTO;
import com.example.demo.Dto.VoucherDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Service.*;
import com.example.demo.Service.giamGia.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class HomeAdminController {

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private DungLuongService dungLuongService;

    @Autowired
    private ChipService chipService;

    @Autowired
    private NSXService nsxService;

    @Autowired
    private HinhAnhService hinhAnhService;

    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private ChucVuService chucVuService;

    @Autowired
    private NSXRepository nsxRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private DungLuongRepository dungLuongRepository;

    @Autowired
    private ChipRepository chipRepository;

    @Autowired
    private GiamGiaHoaDonService giamGiaHoaDonService;

    @Autowired
    private GiamGiaSanPhamService giamGiaSanPhamService;

    @GetMapping("/login")
    public String login() {
        return "Admin/DangNhap";
    }

    @GetMapping("{maNhanVien}/home")
    public String home(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {

        //Lấy nhân viên theo mã
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/Home";
    }

    @GetMapping("{maNhanVien}/pos_banHang")
    public String homeaa(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy nhân viên theo mã
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<MauSac> mauSacList = mauSacService.getAll();
        List<DungLuong> dungLuongList = dungLuongService.getAllActive();
        List<NSX> nsxList = nsxService.getAll();

        model.addAttribute("mauSacs", mauSacList);
        model.addAttribute("dungLuongs", dungLuongList);
        model.addAttribute("nsxs", nsxList);

        return "Admin/doc/phan-mem-ban-hang";
    }

    @GetMapping("{maNhanVien}/thong-ke")
    public String qltk(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy nhân viên theo mã
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        //tổng nhân viên hoạt động
        Integer tongNvHoatDong = nhanVienService.tongNhanVienDangHoatDong();
        model.addAttribute("tongNvHoatDong", tongNvHoatDong);

        //tổng sản phẩm đang có
        Integer tongSanPhamDangCo = sanPhamService.countSanPhamDangCo();
        model.addAttribute("tongSanPhamDangCo", tongSanPhamDangCo);

        //tổng sản phẩm hết hàng
        Integer tongSanPhamHetHang = sanPhamService.countSanPhamHetHang();
        model.addAttribute("tongSanPhamHetHang", tongSanPhamHetHang);

        //Tổng đơn hàng
        Integer tongDonHang = hoaDonService.countHoaDon();
        model.addAttribute("tongDonHang", tongDonHang);

        //Tổng đơn hàng hủy
        Integer tongDonHangHuy = hoaDonService.countHoaDonHuy();
        model.addAttribute("tongDonHangHuy", tongDonHangHuy);

        //Tổng doanh thu
        String tongDoanhThu = hoaDonService.tongDoanhThu();
        model.addAttribute("tongDoanhThu", tongDoanhThu);

        //Top 10 sản phẩm bán chạy nhất
        List<SanPhamTHongKeDTO> sanPhamTHongKeDTOS = sanPhamService.top10SanPhamBanChayNhat();
        model.addAttribute("sanPhamTHongKeDTOS", sanPhamTHongKeDTOS);

        //Top 10 sản phẩm bán chạy nhất
        List<ChiTietSanPhamDTO> danhSachSanPhamHetHang = sanPhamService.danhSachSanPhamHetHang();
        for (ChiTietSanPhamDTO sanPhamTHongKeDTO: danhSachSanPhamHetHang){
            sanPhamTHongKeDTO.convertGiaBan();
        }
        model.addAttribute("danhSachSanPhamHetHang", danhSachSanPhamHetHang);

        //Tổng đơn hàng
        List<HoaDonChiTietDTO> hoaDonChiTietDTOS = hoaDonService.danhSachHoaDonHoanThanh();
        model.addAttribute("hoaDonChiTietDTOS", hoaDonChiTietDTOS);

        //Tổng tiền của tổng đơn hàng
        String tongTienDonHangHoanThanh = hoaDonService.tongTienDanhSachHoaDonHoanThanh();
        model.addAttribute("tongTienDonHangHoanThanh", tongTienDonHangHoanThanh);

        //thống kê số lượng nhập và bán
//        Integer tongSoLuongBan = sanPhamService.tongSoLuongBan();
//        Integer tongSoLuongNhap = sanPhamService.tongSoLuongNhap();

//        model.addAttribute("tongSoLuongBan", tongSoLuongBan);
//        model.addAttribute("tongSoLuongNhap", tongSoLuongNhap);

        //danh sách sản phẩm còn hàng
        List<SanPham> danhSachSPConHang = sanPhamService.danhSachSPConHang();
        model.addAttribute("danhSachSPConHang",danhSachSPConHang);
        return "Admin/doc/quan-ly-bao-cao";
    }

    @GetMapping("{maNhanVien}/quan-li-nhan-vien")
    public String qlnv(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {

        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<NhanVien> nhanVienList = nhanVienService.getAll();
        List<ChucVu> listChucVu = chucVuService.getAll();
        model.addAttribute("nhanVienList", nhanVienList);
        model.addAttribute("listChucVu", listChucVu);
        return "Admin/doc/quan-li-nhan-vien";
    }

    @GetMapping("{maNhanVien}/add/quan-li-nhan-vien")
    public String addQlnv(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<ChucVu> listChucVu = chucVuService.getAll();
        model.addAttribute("listChucVu", listChucVu);
        return "Admin/doc/form-add-nhan-vien";
    }

    @GetMapping("{maNhanVien}/quan-li-hoa-don")
    public String qlhd(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/quan-li-hoa-don";
    }

    @GetMapping("{maNhanVien}/quan-li-san-pham")
    public String qlsp(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien,
                       @RequestParam(defaultValue = "1") int page) {


        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, Integer.MAX_VALUE);
//Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<MauSac> mauSacList = mauSacService.getAll(pageable).getContent();
        model.addAttribute("mauSacList", mauSacList);

        List<DungLuong> dungLuongList = dungLuongService.getAll(pageable).getContent();
        model.addAttribute("dungLuongList", dungLuongList);

        List<Chip> chipList = chipService.getAll(pageable).getContent();
        model.addAttribute("chipList", chipList);

        List<NSX> nsxList = nsxService.getAll(pageable).getContent();
        model.addAttribute("nsxList", nsxList);


        List<ChiTietSanPhamDTO> chiTietSanPhamDTOS = chiTietSanPhamService.viewAllQuanLi();
        for (ChiTietSanPhamDTO chiTietSanPhamDTO : chiTietSanPhamDTOS) {
            chiTietSanPhamDTO.convertGiaBan();
        }
        model.addAttribute("ctsp", chiTietSanPhamDTOS);
        return "Admin/doc/quan-li-san-pham";
    }

    //Hiện thị form thêm ctsp
    @GetMapping("{maNhanVien}/add-san-pham")
    public String addCTSP(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien,
                      @RequestParam(defaultValue = "1") int page) {
        //Lấy mã nhân viên

        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, Integer.MAX_VALUE);
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<SanPham> sanPhamList = sanPhamService.getAll();
        model.addAttribute("sanPhamList", sanPhamList);
        Page<MauSac> mauSacList = mauSacService.getAll(pageable);
        model.addAttribute("mauSacList", mauSacList);
        Page<DungLuong> dungLuongList = dungLuongService.getAll(pageable);
        model.addAttribute("dungLuongList", dungLuongList);
        Page<Chip> chipList = chipService.getAll(pageable);
        model.addAttribute("chipList", chipList);
        Page<NSX> nsxList = nsxService.getAll(pageable);
        model.addAttribute("nsxList", nsxList);

        return "Admin/doc/form-add-san-pham";
    }

    //Hiện thị danhsach sản phẩm
    @GetMapping("{maNhanVien}/quan-li-ten-san-pham")
    public String getTenSanPhamAll(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<SanPham> sanPham =  sanPhamService.getAll();
        model.addAttribute("sanPham", sanPham);
        return "Admin/doc/quan-li-ten-san-pham";
    }

    //Hiện thị danhsach sản phẩm
    @GetMapping("{maNhanVien}/add-ten-san-pham")
    public String addSanPham(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/form-add-ten-san-pham";
    }

    @GetMapping("{maNhanVien}/quan-li-khach-hang")
    public String qlkh(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/quan-li-khach-hang";
    }

    //hien thi dung luong
    @GetMapping("{maNhanVien}/quan-li-dung-luong")
    public String qlDungLuong(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<DungLuongDTO> dungLuongDTOS = dungLuongService.viewAllDl();
        model.addAttribute("dl", dungLuongDTOS);
        return "Admin/doc/quan-li-dung-luong";
    }

    //hien thi chip
    @GetMapping("{maNhanVien}/quan-li-chip")
    public String qlChip(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<ChipDTO> chipDTOS = chipService.viewAllC();
        model.addAttribute("chipList", chipDTOS);
        return "Admin/doc/quan-li-chip";
    }

    //add NSX
    @PostMapping("/{maNhanVien}/add-NSX")
    public String addNSX(HttpServletRequest request, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        NSX nsx = new NSX();
        nsx.setTenNSX(request.getParameter("tenNSX"));
        nsx.setTrangThai(1);
        nsxRepository.save(nsx);
        return "redirect:/admin/{maNhanVien}/add-san-pham";
    }

    //add Mau sac
    @PostMapping("/{maNhanVien}/add-Mau-Sac")
    public String addMauSac(HttpServletRequest request, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        MauSac nsx = new MauSac();
        nsx.setTenMauSac(request.getParameter("tenMauSac"));
        nsx.setTrangThai(1);
        mauSacRepository.save(nsx);
        return "redirect:/admin/{maNhanVien}/add-san-pham";
    }

    //add chip
    @PostMapping("/{maNhanVien}/add-Chip")
    public String addChip(HttpServletRequest request, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        Chip chip = new Chip();
        chip.setTenChip(request.getParameter("tenChip1"));
        chip.setTrangThai(1);
        chipRepository.save(chip);
        return "redirect:/admin/{maNhanVien}/quan-li-chip";
    }

    //add dung luong
    @PostMapping("/{maNhanVien}/add-Dung-Luong")
    public String addDungLuong(HttpServletRequest request, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        DungLuong dungLuong = new DungLuong();
        dungLuong.setTenDungLuong(request.getParameter("tenDungLuong1"));
        dungLuong.setTrangThai(1);
        dungLuongRepository.save(dungLuong);
        return "redirect:/admin/{maNhanVien}/quan-li-dung-luong";
    }

    //quan li voucher san pham
    @GetMapping("{maNhanVien}/quan-li-ma-giam-gia-san-pham")
    public String qlVoucherSanPham(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<GiamGiaSanPhamDTO> giamGiaSanPhamList = giamGiaSanPhamService.viewAll();
        for (GiamGiaSanPhamDTO giamGiaSanPhamDTO: giamGiaSanPhamList){
            giamGiaSanPhamDTO.convertStatus();
        }
        model.addAttribute("ggsp", giamGiaSanPhamList);
        return "Admin/doc/quan-li-ma-giam-gia-san-pham";
    }

    //Update voucher san pham
    @PostMapping("{maNhanVien}/update-giam-gia-ma-san-pham")
    public ResponseEntity<?> updateMSP(@Validated GiamGiaSanPhamRequest giamGiaSanPhamRequest, Model model, @PathVariable(name = "maNhanVien") Long maNhanVien){
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        giamGiaSanPhamService.update(giamGiaSanPhamRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    //Delete voucher sanpham
    @PutMapping("{maNhanVien}/xoa-ma-giam-gia-san-pham/{maGiamGia}")
    public ResponseEntity<?> deleteMGGSP(@PathVariable("maGiamGia") Long maGiamGia ,Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        giamGiaSanPhamService.updateTrangThai(maGiamGia);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    //quan li voucher hoa don
    @GetMapping("{maNhanVien}/quan-li-ma-giam-gia-hoa-don")
    public String qlVoucherHoaDon(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<VoucherDTO> vouchers = giamGiaHoaDonService.viewAll();
        for (VoucherDTO voucherDTO: vouchers){
            voucherDTO.convertStatus();
        }
        model.addAttribute("gghd", vouchers);
        return "Admin/doc/quan-li-ma-giam-gia-hoa-don";
    }

    //Update voucher hoa don
    @PostMapping("{maNhanVien}/update-giam-gia-ma-hoa-don")
    public ResponseEntity<?> updateMHD(@Validated GiamGiaHoaDonRequest giamGiaHoaDonRequest, Model model, @PathVariable(name = "maNhanVien") Long maNhanVien){
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        giamGiaHoaDonService.update(giamGiaHoaDonRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    //Delete voucher hoadon
    @PutMapping("{maNhanVien}/xoa-ma-giam-gia-hoa-don/{maVoucher}")
    public ResponseEntity<?> deleteMGGHD(@PathVariable("maVoucher") Long maVoucher ,Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        giamGiaHoaDonService.updateTrangThai(maVoucher);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @GetMapping("{maNhanVien}/ma-giam-gia/add_view")
    public String viewAdd(Model model, HttpServletRequest request,@PathVariable(name = "maNhanVien") Long maNhanVien) {
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
                model.addAttribute("loai", "giamgia_sp");
        return "Admin/doc/form-add-ma-giam-gia";
    }

    //them  voucher
    @PostMapping("{maNhanVien}/add-ma-giam-gia")
    public String add(Model model, HttpServletRequest request,@PathVariable(name = "maNhanVien") Long maNhanVien) {
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");
        String soLuongMuaTT = request.getParameter("soLuongMuaTT");
        String donGiaMuaTTString = request.getParameter("donGiaMuaTT");

        if (loai.equals("giamgia_sp")) {
            GiamGiaSanPhamRequest giamGiaSanPham = new GiamGiaSanPhamRequest();
            giamGiaSanPham.setTenGiamGia(ten);
            giamGiaSanPham.setPhamTramSale(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            String ngayBatDauSP = ngayBatDauSPString;
            giamGiaSanPham.setNgayBatDau(ngayBatDauSP);

            String ngayKetThucSPString = request.getParameter("ngaykt");
            String ngayKetThucSP = ngayKetThucSPString;
            giamGiaSanPham.setNgayKetThuc(ngayKetThucSP);
            giamGiaSanPhamService.add(giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {
            Double donGiaMuaTTDouble = null;
            if(donGiaMuaTTString != null){
                donGiaMuaTTDouble = Double.valueOf(donGiaMuaTTString);
            }
            GiamGiaHoaDonRequest giamGiaHoaDon = new GiamGiaHoaDonRequest();
            giamGiaHoaDon.setTenGiamGia(ten);
            giamGiaHoaDon.setPhamTramSale(Integer.parseInt(phanTramGiamHD));

            giamGiaHoaDon.setSoLuongMuaTT(Integer.parseInt(soLuongMuaTT));
            giamGiaHoaDon.setDonGiaMuaTT(BigDecimal.valueOf(donGiaMuaTTDouble));
            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            String ngayBatDauSP = ngayBatDauSPString;
            giamGiaHoaDon.setNgayBatDau(ngayBatDauSP);

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            String ngayKetThucSP = ngayKetThucSPString;
            giamGiaHoaDon.setNgayKetThuc(ngayKetThucSP);

            giamGiaHoaDonService.add(giamGiaHoaDon);
        }
        return "Admin/doc/form-add-ma-giam-gia";
    }


    @GetMapping("/{maNhanVien}/quan-li-mau-sac")
    public String quanLyMauSac(Model model,  @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<MauSac> listMauSac = mauSacService.getAll();
        model.addAttribute("listMauSac", listMauSac);
        return "Admin/doc/quan-ly-mau-sac";
    }

    @GetMapping("{maNhanVien}/add/quan-li-mau-sac")
    public String addMauSac(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        return "Admin/doc/form-add-mau-sac";
    }

    @GetMapping("/{maNhanVien}/quan-li-nsx")
    public String quanLyNSX(Model model,  @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        List<NSX> listNSX = nsxService.getAll();
        model.addAttribute("listNSX", listNSX);
        return "Admin/doc/quan-ly-nsx";
    }

    @GetMapping("{maNhanVien}/add/quan-li-nsx")
    public String addNSX(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        return "Admin/doc/form-add-nsx";
    }

    @GetMapping("{maNhanVien}/add/quan-li-dung-luong")
    public String addDL(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        return "Admin/doc/form-add-dung-luong";
    }

    @GetMapping("{maNhanVien}/add/quan-li-chip")
    public String addChip(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        //Lấy mã nhân viên
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        return "Admin/doc/form-add-chip";
    }

    @GetMapping("{maNhanVien}/cai-dat")
    public String caiDat(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/cai-dat-tai-khoan";
    }


    //add ma giam gia cho san pham
    @GetMapping("{maNhanVien}/add-giam-gia-cho-SP")
    public String addGGChoSP(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);

        List<ChiTietSanPhamDTO> chiTietSanPhamDTOS = chiTietSanPhamService.viewAllGanGG();
        for (ChiTietSanPhamDTO chiTietSanPhamDTO : chiTietSanPhamDTOS) {
            chiTietSanPhamDTO.convertGiaBan();
        }
        List<MauSac> mauSacList = mauSacService.getAll();
        List<DungLuong> dungLuongList = dungLuongService.getAllActive();

        model.addAttribute("mauSacs", mauSacList);
        model.addAttribute("dungLuongs", dungLuongList);
        model.addAttribute("ctsp", chiTietSanPhamDTOS);

        List<GiamGiaSanPham> giamGiaSanPhamList = giamGiaSanPhamService.getAllActive();
        for (GiamGiaSanPham giamGiaSanPham: giamGiaSanPhamList){
            giamGiaSanPham.convert();
        }
        model.addAttribute("ggsp", giamGiaSanPhamList);
        return "Admin/doc/form-add-giam-gia-cho-SP";
    }

    @GetMapping("/{maSanPham}")
    public ResponseEntity<List<DungLuong>> getDungLuongByMaSanPham(@PathVariable Long maSanPham) {
        List<DungLuong> dungLuongList = dungLuongService.getDungLuongByMaSanPham(maSanPham); // Gọi service để lấy danh sách dung lượng
        return ResponseEntity.ok(dungLuongList); // Trả về danh sách dung lượng
    }

    @GetMapping("/{maNhanVien}/san-pham-bao-hanh")
    public String sanPhamBaoHanh(Model model, @PathVariable(name = "maNhanVien") Long maNhanVien) {
        NhanVien nhanVien = nhanVienRepository.getReferenceById(maNhanVien);
        model.addAttribute("nhanVien", nhanVien);
        return "Admin/doc/quan-li-san-pham-bao-hanh";
    }
}
