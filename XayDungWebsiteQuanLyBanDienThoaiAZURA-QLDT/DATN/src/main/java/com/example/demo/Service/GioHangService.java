package com.example.demo.Service;

import com.example.demo.Dto.Request.GioHangRequest;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.GioHangChiTiet;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.GioHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class GioHangService {
    @Autowired
    private GioHangRepository repository;

    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public ResponseEntity<?> add(GioHang gioHang) {
        gioHang.setMoTa(gioHang.getMoTa());
        gioHang.setTrangThai(gioHang.getTrangThai());
        gioHang.setKhachHang(KhachHang.builder().maKhachHang(gioHang.getKhachHang().getMaKhachHang()).build());
        repository.save(gioHang);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public GioHang addCart(GioHang gioHang) {
        gioHang.setMoTa(gioHang.getMoTa());
        gioHang.setTrangThai(gioHang.getTrangThai());
        gioHang.setKhachHang(KhachHang.builder().maKhachHang(gioHang.getKhachHang().getMaKhachHang()).build());
        repository.save(gioHang);
        return gioHang;
    }

    public GioHang getByMa(Long maGioHang) {
        GioHang gioHang = repository.getReferenceById(maGioHang);
        return gioHang;
    }

    public ResponseEntity<?> update(GioHangRequest gioHangRequest) {
        GioHang gioHang = this.getByMa(gioHangRequest.getMaGioHang());
        gioHang.setMoTa(gioHangRequest.getMoTa());
        gioHang.setTrangThai(gioHangRequest.getTrangThai());
        repository.save(gioHang);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public GioHang getByKhachHang(KhachHang khachHang) {
        return repository.getByKhachHang(khachHang);
    }

    public BigDecimal tongTien(GioHang g) {
        double tongTien = 0;
        List<GioHangChiTiet> gioHangChiTietList = g.getGioHangChiTietList();
        for (GioHangChiTiet ghct : gioHangChiTietList) {
            double thanhTien = ghct.getSoLuong() * Double.parseDouble(String.valueOf(ghct.getChiTietSanPham().getGiaBan()));
            tongTien += thanhTien;
        }
        int integerNumber = (int) Math.floor(tongTien);
        return BigDecimal.valueOf(integerNumber);
    }

    public BigDecimal tongTienSG(GioHang g) {
        double tongTien = 0;
        List<GioHangChiTiet> gioHangChiTietList = g.getGioHangChiTietList();
        for (GioHangChiTiet ghct : gioHangChiTietList) {
            if (ghct.getChiTietSanPham().getGiaBan() != null) {
                double thanhTien = ghct.getSoLuong() * Double.parseDouble(String.valueOf(ghct.getChiTietSanPham().getGiaBan()));
                tongTien += thanhTien;
            }else{
                tongTien =0;
            }
        }
        int integerNumber = (int) Math.floor(tongTien);
        return BigDecimal.valueOf(integerNumber);
    }
}
