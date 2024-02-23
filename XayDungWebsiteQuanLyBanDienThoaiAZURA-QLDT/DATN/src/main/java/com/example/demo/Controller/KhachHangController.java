package com.example.demo.Controller;

import com.example.demo.Dto.KhachHangDTO;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Dto.Request.KhachHangRequest;
import com.example.demo.Dto.Response.HoaDonResponse;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/khach-hang")
public class KhachHangController {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @PostMapping("/search")
    public List<KhachHangDTO> searchHoaDon(@RequestBody KhachHangRequest request){
        List<KhachHangDTO> khachHangDTOS = khachHangService.searchKhachHang(request);
        for (KhachHangDTO khachHangDTO: khachHangDTOS){
            khachHangDTO.convertString();
        }
        return khachHangDTOS;
    }
    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody KhachHangRequest khachHangRequest){
        return khachHangService.add(khachHangRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody KhachHangRequest khachHangRequest){
        return khachHangService.update(khachHangRequest);
    }

    @PostMapping("/download-result")
    public ResponseEntity<?> downLoadFile(@Validated KhachHangRequest khachHangRequest) {
        File fileToDownload = new File(khachHangService.buildSearchKhachHangResultFile(khachHangRequest));
        if (fileToDownload != null) {
            try {
                InputStream inputStream = new FileInputStream(fileToDownload);
                String fileName = "template_export_khach_hang.xls";
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
}
