package com.example.demo.Controller;

import com.example.demo.Dto.Request.SanPhamRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.SanPham;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/san-pham")
@RestController
public class SanPhamController {

    private SanPham sanPham;

    @Autowired
    private SanPhamService service;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @GetMapping("/count/{id}")
    public ResponseEntity<?> count(@PathVariable("id") Long id){
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(id);
        Integer soLuongTon = chiTietSanPham.getSoLuongNhap() - chiTietSanPham.getSoLuongBan();
        return new ResponseEntity<>(soLuongTon, HttpStatus.OK);
    }
//
//
//
//    @PostMapping("/them")
//    public ResponseEntity<?> them(@RequestBody SanPhamRequest sanPhamRequest){
//        return service.add(sanPhamRequest);
//    }
}
