package com.example.demo.Controller.Admin;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.Request.ChipRequest;
import com.example.demo.Dto.Request.KhachHangRequest;
import com.example.demo.Entity.*;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.ChipService;
import com.example.demo.Service.KhachHangService;
import com.example.demo.Service.SanPhamService;
import io.micrometer.common.util.StringUtils;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.List;

@RestController
@RequestMapping("/admin/chi-tiet-san-pham")
public class ChiTietSanPhamAdminController {

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private ChipService chipService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    ServletContext app;

    @PostMapping("/search")
    public String searchChiTietSanPham(Model model, @Validated ChiTietSanPhamRequest request) {
        List<ChiTietSanPhamDTO> chiTietSanPhamDTOS = chiTietSanPhamService.searchChiTietSanPham(request);
        model.addAttribute("ctsp", chiTietSanPhamDTOS);
        return "redirect:/admin/quan-li-san-pham";
    }

    @PostMapping("/search-tai-quay")
    public List<ChiTietSanPhamDTO> searchChiTietSanPhamTaiQuay(@RequestBody ChiTietSanPhamRequest request) {
        List<ChiTietSanPhamDTO> chiTietSanPhamDTOS = chiTietSanPhamService.searchChiTietSanPham(request);
        for (ChiTietSanPhamDTO chiTietSanPhamDTO: chiTietSanPhamDTOS){
            chiTietSanPhamDTO.convertGiaBan();
        }
        return chiTietSanPhamDTOS;
    }

    @PostMapping("/add")
    public ResponseEntity<?> addCTSP(@Validated ChiTietSanPhamRequest chiTietSanPhamRequest, @RequestParam("image") MultipartFile image) throws IOException {
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaSanPham()))){
            return new ResponseEntity<>("Tên không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getSoLuongNhap()))) {
            return new ResponseEntity<>("Số lượng nhập không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaDungLuong()))){
            return new ResponseEntity<>("Dung lượng không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaChip()))){
            return new ResponseEntity<>("Chip không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaNSX()))){
            return new ResponseEntity<>("Nhà cung cấp không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaMauSac()))){
            return new ResponseEntity<>("Màu sắc không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getGiaBan()))){
            return new ResponseEntity<>("Giá bán không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getGiaNhap()))){
            return new ResponseEntity<>("Giá nhập không được để trống", HttpStatus.OK);
        }
//        if(StringUtils.isEmpty(chiTietSanPhamRequest.getHinhAnhURL())){
//            return new ResponseEntity<>("Hình ảnh không được để trống", HttpStatus.OK);
//        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getMoTa())){
            return new ResponseEntity<>("Mô tả sản phẩm không được để trống", HttpStatus.OK);
        }

        //validate số
        if(chiTietSanPhamRequest.getSoLuongNhap() <= 0){
            return new ResponseEntity<>("Số lượng nhập phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaBan())) <= 0){
            return new ResponseEntity<>("Giá Bán phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaNhap())) <= 0){
            return new ResponseEntity<>("Giá nhập phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaNhap())) >= Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaBan()))){
            return new ResponseEntity<>("Giá bán phải lớn hơn giá Nhập", HttpStatus.OK);
        }

        try {
            int soLuongNhap = chiTietSanPhamRequest.getSoLuongNhap();
        } catch (NumberFormatException e) {
            return new ResponseEntity<>("Số lượng nhập phải là số", HttpStatus.BAD_REQUEST);
        }
        SanPham sanPhamCheck = sanPhamService.sanPhamCheckTonTai(null, chiTietSanPhamRequest.getMaDungLuong(), chiTietSanPhamRequest.getMaMauSac(), chiTietSanPhamRequest.getMaSanPham());

        if(sanPhamCheck != null){
            return new ResponseEntity<>("Sản phẩm chi tiết đã tồn tại", HttpStatus.BAD_REQUEST);
        }
        if (!image.isEmpty()) {

            String fileOrigionalName = image.getOriginalFilename();

            System.out.println(fileOrigionalName);

            //Date
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();
            File file = new File(app.getRealPath("/img/" + datenow + "_" + fileOrigionalName));

            System.out.println(file.getAbsolutePath());

            image.transferTo(file);

            FileInputStream fis = new FileInputStream(file);

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(buf)) != -1; ) {
                    //Writes to this byte array output stream
                    bos.write(buf, 0, readNum);
//                    System.out.println("read " + readNum + " bytes,");
                }
            } catch (IOException ex) {
                // Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
            }
            byte[] bytes = bos.toByteArray();

            String base64Encoded = Base64.getEncoder().encodeToString(bytes);

            System.out.println(file.getName());
            chiTietSanPhamRequest.setHinhAnhURL(file.getName());

        }else{
            return new ResponseEntity<>("Ảnh không được để trống!", HttpStatus.BAD_REQUEST);
        }

        chiTietSanPhamService.addCTSP(chiTietSanPhamRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    //thêm sản phẩm
    @PostMapping("/addSanPham")
    public ResponseEntity<?> addSanPham(@Validated ChiTietSanPhamRequest chiTietSanPhamRequest) throws IOException {
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getTenSanPham())){
            return new ResponseEntity<>("Tên không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getDungLuongPin()))){
            return new ResponseEntity<>("Dung lượng pin không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getManHinh())){
            return new ResponseEntity<>("Màn hình không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getHeDieuHanh())){
            return new ResponseEntity<>("Hệ điều hành không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getRam()))){
            return new ResponseEntity<>("Ram không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getCamerasau())){
            return new ResponseEntity<>("Camera không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getCameratruoc())){
            return new ResponseEntity<>("Camera không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getSim()))){
            return new ResponseEntity<>("Sim không được để trống", HttpStatus.OK);
        }
        SanPham sanPhamCheck = sanPhamService.sanPhamCheckTonTai(chiTietSanPhamRequest.getTenSanPham(), null, null, null);
        if(sanPhamCheck != null){
            return new ResponseEntity<>("Sản phẩm đã tồn tại", HttpStatus.BAD_REQUEST);
        }
        sanPhamService.addSP(chiTietSanPhamRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<?> updateCTSP(@Validated ChiTietSanPhamRequest chiTietSanPhamRequest,  @RequestParam("image") MultipartFile image) throws IOException {
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getTenSanPham())){
            return new ResponseEntity<>("Tên không được để trống", HttpStatus.OK);
        }

        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getSoLuongNhap()))) {
            return new ResponseEntity<>("Số lượng nhập không được để trống", HttpStatus.OK);
        }
//        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getDungLuongPin()))){
//            return new ResponseEntity<>("Dung lượng pin không được để trống", HttpStatus.OK);
//        }
//        if(StringUtils.isEmpty(chiTietSanPhamRequest.getManHinh())){
//            return new ResponseEntity<>("Màn hình không được để trống", HttpStatus.OK);
//        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaDungLuong()))){
            return new ResponseEntity<>("Dung lượng không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaChip()))){
            return new ResponseEntity<>("Chip không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaNSX()))){
            return new ResponseEntity<>("Nhà cung cấp không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getMaMauSac()))){
            return new ResponseEntity<>("Màu sắc không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getGiaBan()))){
            return new ResponseEntity<>("Giá bán không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getGiaNhap()))){
            return new ResponseEntity<>("Giá nhập không được để trống", HttpStatus.OK);
        }
//        if(StringUtils.isEmpty(chiTietSanPhamRequest.getHinhAnhURL())){
//            return new ResponseEntity<>("Hình ảnh không được để trống", HttpStatus.OK);
//        }

        //validate số
        if(chiTietSanPhamRequest.getSoLuongNhap() <= 0){
            return new ResponseEntity<>("Số lượng nhập phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaBan())) <= 0){
            return new ResponseEntity<>("Giá Bán phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaNhap())) <= 0){
            return new ResponseEntity<>("Giá nhập phải lớn hơn 0", HttpStatus.OK);
        }

        if(Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaNhap())) >= Double.parseDouble(String.valueOf(chiTietSanPhamRequest.getGiaBan()))){
            return new ResponseEntity<>("Giá bán phải lớn hơn giá Nhập", HttpStatus.OK);
        }
        try {
            int soLuongNhap = chiTietSanPhamRequest.getSoLuongNhap();
        } catch (NumberFormatException e) {
            return new ResponseEntity<>("Số lượng nhập phải là số", HttpStatus.BAD_REQUEST);
        }
        SanPham sanPhamCheck = sanPhamService.sanPhamCheckTonTai(null, chiTietSanPhamRequest.getMaDungLuong(), chiTietSanPhamRequest.getMaMauSac(), chiTietSanPhamRequest.getMaSanPham());
        SanPham sanPhamDetail = sanPhamService.getByMa(chiTietSanPhamRequest.getMaSanPham());
        if(sanPhamCheck != null && !sanPhamCheck.getTenSanPham().equals(sanPhamDetail.getTenSanPham())){
            return new ResponseEntity<>("Sản phẩm chi tiết đã tồn tại", HttpStatus.BAD_REQUEST);
        }
        if (!image.isEmpty()) {

            String fileOrigionalName = image.getOriginalFilename();

            System.out.println(fileOrigionalName);

            //Date
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();
            File file = new File(app.getRealPath("/img/" + datenow + "_" + fileOrigionalName));

            System.out.println(file.getAbsolutePath());

            image.transferTo(file);

            FileInputStream fis = new FileInputStream(file);

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(buf)) != -1; ) {
                    //Writes to this byte array output stream
                    bos.write(buf, 0, readNum);
//                    System.out.println("read " + readNum + " bytes,");
                }
            } catch (IOException ex) {
                // Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
            }
            byte[] bytes = bos.toByteArray();

            String base64Encoded = Base64.getEncoder().encodeToString(bytes);

            System.out.println(file.getName());
            chiTietSanPhamRequest.setHinhAnhURL(file.getName());

        }
        chiTietSanPhamService.update(chiTietSanPhamRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @GetMapping("/delete/{maChiTietSanPham}")
    public ResponseEntity<?> deleteCTSP(@PathVariable("maChiTietSanPham") Long maChiTietSanPham) {
        chiTietSanPhamService.delete(maChiTietSanPham);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    // đổi trạng thái san pham
    @GetMapping("/deleteSP/{maSanPham}")
    public ResponseEntity<?> deleteSP(@PathVariable("maSanPham") Long maSanPham) {
        sanPhamService.delete(maSanPham);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    // update san phẩm
    //thêm sản phẩm
    @PostMapping("/updateSanPham")
    public ResponseEntity<?> updateSanPham(@Validated ChiTietSanPhamRequest chiTietSanPhamRequest) throws IOException {
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getTenSanPham())){
            return new ResponseEntity<>("Tên không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getDungLuongPin()))){
            return new ResponseEntity<>("Dung lượng pin không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getManHinh())){
            return new ResponseEntity<>("Màn hình không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getRam()))){
            return new ResponseEntity<>("Ram không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getCamerasau())){
            return new ResponseEntity<>("Camera không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(chiTietSanPhamRequest.getCameratruoc())){
            return new ResponseEntity<>("Camera không được để trống", HttpStatus.OK);
        }
        if(StringUtils.isEmpty(String.valueOf(chiTietSanPhamRequest.getSim()))){
            return new ResponseEntity<>("Sim không được để trống", HttpStatus.OK);
        }

        SanPham sanPhamCheck = sanPhamService.sanPhamCheckTonTai(chiTietSanPhamRequest.getTenSanPham(), null, null, null);
        SanPham sanPhamDetail = sanPhamService.getByMa(chiTietSanPhamRequest.getMaSanPham());
        if(sanPhamCheck != null && !sanPhamCheck.getTenSanPham().equals(sanPhamDetail.getTenSanPham())){
            return new ResponseEntity<>("Tên Sản phẩm đã tồn tại", HttpStatus.BAD_REQUEST);
        }
        sanPhamService.update(chiTietSanPhamRequest);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }



    @PostMapping("/add-khach-hang")
    public KhachHang addKH(@RequestBody KhachHangRequest khachHangRequest) {
        KhachHang khachHang = khachHangService.themMoi(khachHangRequest);
        return khachHang;
    }

    @GetMapping("/detailCtsp")
    public ChiTietSanPham detailCtsp(@RequestParam(name = "maChiTietSanPham") Long maCtsp) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamService.detailCtsp(maCtsp);
        return chiTietSanPham;
    }



}
