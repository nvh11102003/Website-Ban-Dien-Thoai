package com.example.demo.Controller.Admin;

import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Dto.Request.ThongTinThanhToanTaiQuay;
import com.example.demo.Dto.Response.HoaDonResponse;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Service.HoaDonService;
import com.itextpdf.text.DocumentException;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.util.List;

@RequestMapping("/admin/hoa-don")
@RestController
public class HoaDonAdminController {

    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/detail/{id}")
    public ResponseEntity<HoaDonChiTietDTO> detailHoaDon(@PathVariable("id") Long maHoaDon){
        HoaDonChiTietDTO hoaDonChiTietDTO = hoaDonService.detailHoaDon(maHoaDon);
        if (hoaDonChiTietDTO != null) {
            hoaDonChiTietDTO.convertDataToString();
            return ResponseEntity.ok(hoaDonChiTietDTO);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/search")
    public List<HoaDonResponse> searchHoaDon(@RequestBody HoaDonRequest request){
        List<HoaDonResponse> hoaDonResponses = hoaDonService.searchHoaDon(request);
        for (HoaDonResponse hoaDonResponse: hoaDonResponses){
            hoaDonResponse.convertTongTien();
        }
        return hoaDonResponses;
    }

    @PostMapping("/download-result")
    public ResponseEntity<?> downLoadFile(@RequestBody HoaDonRequest request){
        File fileToDownload = new File(hoaDonService.buildSearchHoaDonResultFile(request));
        if (fileToDownload != null) {
            try {
                InputStream inputStream = new FileInputStream(fileToDownload);
                String fileName = "template_export_hoa_don.xls";
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.setContentDispositionFormData("attachment", fileName);
                InputStreamResource inputStreamResource = new InputStreamResource(inputStream);
                return ResponseEntity.ok()
                        .headers(headers)
                        .body(inputStreamResource);
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/update-trang-thai-hoan-thanh")
    public ResponseEntity<?> suaHoanThanh(@RequestBody HoaDonRequest hoaDonRequest) throws DocumentException, MessagingException, IOException {
        return hoaDonService.updateTrangThaiHoanThanh(hoaDonRequest);
    }

    @PostMapping("/update-trang-thai")
    public ResponseEntity<?> sua(@RequestBody HoaDonRequest hoaDonRequest) throws DocumentException, MessagingException, IOException {
        return hoaDonService.updateTrangThai(hoaDonRequest);
    }

    @PostMapping("/add-hoa-don-tai-quay")
    public ResponseEntity<?> addHdTaiQuay(@RequestBody ThongTinThanhToanTaiQuay thongTinThanhToanTaiQuay) throws DocumentException, MessagingException, IOException {
        return hoaDonService.addThongTinHoaDonTaiQuay(thongTinThanhToanTaiQuay);
    }

    @PostMapping("/update-all-trang-thai-hoan-thanh")
    public ResponseEntity<?> updateAllTTHoanThanh(){
        return hoaDonService.updateAllTrangThaiHoanThanh();
    }

}
