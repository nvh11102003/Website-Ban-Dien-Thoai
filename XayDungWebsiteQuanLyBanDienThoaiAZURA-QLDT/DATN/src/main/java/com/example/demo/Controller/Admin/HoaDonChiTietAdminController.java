package com.example.demo.Controller.Admin;

import com.example.demo.Dto.Request.HoaDonChiTietRequest;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/hoa-don-chi-tiet")
public class HoaDonChiTietAdminController {
    @Autowired
    private HoaDonChiTietService service;

    @GetMapping("/hien-thi")
    public ResponseEntity<?> hienThi(){
        return service.getAll();
    }

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody HoaDonChiTietRequest hoaDonChiTietRequest){
        return service.add(hoaDonChiTietRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody HoaDonChiTietRequest hoaDonChiTietRequest){
        return service.update(hoaDonChiTietRequest);
    }

    @PostMapping("/search-san-pham-bao-hanh")
    public ResponseEntity<?> searchSanPhamBaoHanh(@RequestBody SanPhamBaoHanhRequest request){
        return service.searchSanPhamBaoHanh(request);
    }
}
