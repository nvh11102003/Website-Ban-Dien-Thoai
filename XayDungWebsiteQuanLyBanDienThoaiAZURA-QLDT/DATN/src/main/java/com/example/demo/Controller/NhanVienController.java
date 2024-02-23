package com.example.demo.Controller;

import com.example.demo.Dto.Request.NhanVienRequest;
import com.example.demo.Service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.ParseException;

@RestController
@RequestMapping("/admin/nhan-vien")
public class NhanVienController {
    @Autowired
    private NhanVienService nhanVienService;

    @GetMapping("/hien-thi")
    public ResponseEntity<?> hienThi(){
        return new ResponseEntity<>(nhanVienService.getAll(), HttpStatus.OK);
    }

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody NhanVienRequest nhanVienRequest) throws ParseException {
        return nhanVienService.add(nhanVienRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody NhanVienRequest nhanVienRequest) throws ParseException {
        return nhanVienService.update(nhanVienRequest);
    }

    @DeleteMapping("/xoa/{id}")
    public ResponseEntity<?> sua(@PathVariable("id") Long maNhanVien){
        return nhanVienService.xoa(maNhanVien);
    }

    @PostMapping("/download-result")
    public ResponseEntity<?> downLoadFile(){
        File fileToDownload = new File(nhanVienService.buildSearchNhanVienResultFile());
        if (fileToDownload != null) {
            try {
                InputStream inputStream = new FileInputStream(fileToDownload);
                String fileName = "template_export_nhan_vien.xls";
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

    @PutMapping("/update-password/{id}")
    public ResponseEntity<?> sua(@PathVariable("id") Long id, @RequestParam("matKhau") String matKhau) {
        return nhanVienService.updateMatKhau(id, matKhau);
    }
}
