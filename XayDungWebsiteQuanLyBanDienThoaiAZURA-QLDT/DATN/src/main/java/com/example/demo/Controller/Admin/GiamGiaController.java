package com.example.demo.Controller.Admin;

import com.example.demo.Dto.GiamGiaCTSPDTO;
import com.example.demo.Dto.Request.GiamGiaCTSPRequest;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Service.giamGia.GiamGiaCTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin/giam-gia")
public class GiamGiaController {

    @Autowired
    private GiamGiaCTSPService giamGiaCTSPService;

    @PostMapping("/search-giam-gia-SP")
    public ResponseEntity<?> searchGiamGiaCTSP(@RequestBody GiamGiaCTSPRequest request) {
        List<GiamGiaCTSPDTO> giamGiaCTSPDTOS = new ArrayList<>();
        try {
            giamGiaCTSPDTOS = giamGiaCTSPService.searchGiamGiaCTSP(request);
            return new ResponseEntity<>(giamGiaCTSPDTOS, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @PostMapping("/add-giam-gia-SP")
    public ResponseEntity<?> addGiamGiaCTSP(@RequestBody GiamGiaCTSPRequest request) {
        return giamGiaCTSPService.addGiamGiaChoSP(request);
    }

    @PostMapping("/update-giam-gia-SP")
    public ResponseEntity<?> updateGiamGiaCTSP(@RequestBody GiamGiaCTSPRequest request) {
        return giamGiaCTSPService.updateGiamGiaChoSP(request);
    }

    @GetMapping("/detail-giam-gia-SP")
    public ResponseEntity<?> detailGiamGiaCTSP(@RequestParam("maGGCTSP") Long maGGCTSP) {
        return giamGiaCTSPService.detailGiamGiaChoSP(maGGCTSP);
    }

    @GetMapping("/fill-giam-gia-SP")
    public GiamGiaChiTietSanPham fillGGCTSP(@RequestParam("maCTSP") Long maCTSP) {
        GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPService.fillGGCTSP(maCTSP);
        return giamGiaChiTietSanPham;
    }

    @GetMapping("/update-tt-giam-gia")
    public ResponseEntity<?> updateTTGGSP() {
        return giamGiaCTSPService.updateTTHetHan();
    }

    @PostMapping("/update-dung-hoat-dong")
    public ResponseEntity<?> updateDungHD(@RequestBody GiamGiaCTSPRequest request) {
        return giamGiaCTSPService.updateDungHD(request);
    }

    @GetMapping("/fill-list-dung-luong")
    public ResponseEntity<?> fillListDL(@RequestParam("maSP") Long maSP) {
        return giamGiaCTSPService.fillListDungLuong(maSP);
    }

    @PostMapping("/update-tt-giam-gia-san-pham")
    public ResponseEntity<?> updatettGGSP() {
        return giamGiaCTSPService.updateTTGGSP();
    }

    @PostMapping("/update-dung-hoat-dong-toan-bo")
    public ResponseEntity<?> updateDungHDSPAll() {
        return giamGiaCTSPService.updateTTDungHDALL();
    }
}
