package com.example.demo.Service;

import com.example.demo.Dto.Request.GioHangChiTietRequest;
import com.example.demo.Dto.Request.GioHangRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.GioHangChiTiet;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.GioHangChiTietRepository;
import com.example.demo.Repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class GioHangChiTietService {

    @Autowired
    private GioHangChiTietRepository repository;

    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public ResponseEntity<?> add(GioHangChiTietRequest gioHangChiTietRequest) {
        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
        gioHangChiTiet.setSoLuong(gioHangChiTietRequest.getSoLuong());
        gioHangChiTiet.setTrangThai(gioHangChiTietRequest.getTrangThai());
        gioHangChiTiet.setGioHang(GioHang.builder().maGioHang(gioHangChiTietRequest.getMaGioHang()).build());
        gioHangChiTiet.setChiTietSanPham(ChiTietSanPham.builder().maChiTietSanPham(gioHangChiTietRequest.getMaChiTietSanPham()).build());
        repository.save(gioHangChiTiet);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public GioHangChiTiet addGHCT(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
        gioHangChiTiet.setTrangThai(gioHangChiTiet.getTrangThai());
        gioHangChiTiet.setGioHang(GioHang.builder().maGioHang(gioHangChiTiet.getGioHang().getMaGioHang()).build());
        gioHangChiTiet.setChiTietSanPham(ChiTietSanPham.builder().maChiTietSanPham(gioHangChiTiet.getChiTietSanPham().getMaChiTietSanPham()).build());
        repository.save(gioHangChiTiet);
        return gioHangChiTiet;
    }

    public GioHangChiTiet getByMa(Long maGioHangChiTiet) {
        GioHangChiTiet gioHangChiTiet = repository.getReferenceById(maGioHangChiTiet);
        return gioHangChiTiet;
    }

    public ResponseEntity<?> update(GioHangChiTietRequest gioHangChiTietRequest) {
        GioHangChiTiet gioHangChiTiet = this.getByMa(gioHangChiTietRequest.getMagiohangchitiet());
        gioHangChiTiet.setSoLuong(gioHangChiTietRequest.getSoLuong());
        gioHangChiTiet.setTrangThai(gioHangChiTietRequest.getTrangThai());
        repository.save(gioHangChiTiet);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
