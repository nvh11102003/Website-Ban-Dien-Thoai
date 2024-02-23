package com.example.demo.Service.giamGia;

import com.example.demo.Dto.GiamGiaSanPhamDTO;
import com.example.demo.Dto.Request.GiamGiaHoaDonRequest;
import com.example.demo.Dto.Request.GiamGiaSanPhamRequest;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.GiamGiaSanPham;
import com.example.demo.Entity.Voucher;
import com.example.demo.Repository.GiamGia.GiamGiaHoaDonRepository;
import com.example.demo.Repository.GiamGia.GiamGiaSanPhamRepository;
import com.example.demo.Repository.GiamGiaCTSPRepository;
import com.example.demo.Utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Service
public class GiamGiaSanPhamService {
    @Autowired
    private GiamGiaSanPhamRepository giamGiaSanPhamRepository;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    public List<GiamGiaSanPham> getAll() {
        return giamGiaSanPhamRepository.findAll();
    }

    public GiamGiaSanPham add(GiamGiaSanPhamRequest giamGiaSanPhamRequest) {
        GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
        giamGiaSanPham.setTenGiamGia(giamGiaSanPhamRequest.getTenGiamGia());

        // Chuyển đổi ngày bắt đầu
        LocalDate ngayBatDau = LocalDate.parse(giamGiaSanPhamRequest.getNgayBatDau());
        giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDau.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        // Chuyển đổi ngày kết thúc
        LocalDate ngayKetThuc = LocalDate.parse(giamGiaSanPhamRequest.getNgayKetThuc());
        giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThuc.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        giamGiaSanPham.setPhanTramSale(giamGiaSanPhamRequest.getPhamTramSale());
        giamGiaSanPham.setTrangThai(Constants.ACTIVE);
        giamGiaSanPhamRepository.save(giamGiaSanPham);
        return giamGiaSanPham;
    }

    public GiamGiaSanPham getByMa(Long maGiamGiaSanPham){
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamRepository.getReferenceById(maGiamGiaSanPham);
        return giamGiaSanPham;
    }

    public GiamGiaSanPham update(GiamGiaSanPhamRequest giamGiaSanPhamRequest) {
        GiamGiaSanPham giamGiaSanPham =  giamGiaSanPhamRepository.getReferenceById(giamGiaSanPhamRequest.getMaGiamGia());
        giamGiaSanPham.setTenGiamGia(giamGiaSanPhamRequest.getTenGiamGia());

        // Chuyển đổi ngày bắt đầu
        LocalDate ngayBatDau = LocalDate.parse(giamGiaSanPhamRequest.getNgayBatDau());
        giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDau.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        // Chuyển đổi ngày kết thúc
        LocalDate ngayKetThuc = LocalDate.parse(giamGiaSanPhamRequest.getNgayKetThuc());
        giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThuc.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        giamGiaSanPham.setPhanTramSale(giamGiaSanPhamRequest.getPhamTramSale());
        giamGiaSanPham.setTrangThai(giamGiaSanPhamRequest.getTrangThai());
        if(giamGiaSanPhamRequest.getTrangThai() == Constants.INACTIVE){
            List<GiamGiaChiTietSanPham> giamGiaChiTietSanPhams = giamGiaCTSPRepository.getGGCTSPBymaGGSP(giamGiaSanPham.getMaGiamGia());
            for(GiamGiaChiTietSanPham giamGiaChiTietSanPham: giamGiaChiTietSanPhams){
                giamGiaChiTietSanPham.setTrangThai(Constants.INACTIVE);
                giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
            }
        }
        giamGiaSanPhamRepository.save(giamGiaSanPham);
        return giamGiaSanPham;
    }

    public GiamGiaSanPham updateTrangThai(Long maGiamGia){
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamRepository.getReferenceById(maGiamGia);
        giamGiaSanPham.setTrangThai(Constants.INACTIVE);
        giamGiaSanPhamRepository.save(giamGiaSanPham);
        return giamGiaSanPham;
    }

    public List<GiamGiaSanPhamDTO> viewAll() {
        return giamGiaSanPhamRepository.viewALl();
    }

    public List<GiamGiaSanPham> getAllActive() {
        Date dateNow = new Date();
        return giamGiaSanPhamRepository.findALlActiveAndNotActive();
    }
}
