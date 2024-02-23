package com.example.demo.Service;

import com.example.demo.Dto.Request.HoaDonChiTietRequest;
import com.example.demo.Dto.Request.HoaDonRequest;
import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Dto.SanPhamBaoHanhDTO;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.HoaDonChiTiet;
import com.example.demo.Repository.HoaDonChiTietRepository;
import com.example.demo.Repository.HoaDonRepository;
import com.example.demo.Utils.Constants;
import com.example.demo.Utils.DateUtils;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class HoaDonChiTietService {

    @Autowired
    private HoaDonChiTietRepository repository;

    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public ResponseEntity<?> add(HoaDonChiTietRequest hoaDonChiTietRequest) {
        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//        if (StringUtils.isEmpty(hoaDonRequest.getDiaChi())) {
//            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
//        }
        hoaDonChiTiet.setSoLuongMua(hoaDonChiTietRequest.getSoLuongMua());
        hoaDonChiTiet.setGiaTien(hoaDonChiTietRequest.getGiaTien());
        hoaDonChiTiet.setTrangThai(hoaDonChiTietRequest.getTrangThai());

        repository.save(hoaDonChiTiet);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public HoaDonChiTiet getByMa(Long maHoaDonChiTiet) {
        HoaDonChiTiet hoaDonChiTiet = repository.getReferenceById(maHoaDonChiTiet);
        return hoaDonChiTiet;
    }

    public ResponseEntity<?> update(HoaDonChiTietRequest hoaDonChiTietRequest) {
        HoaDonChiTiet hoaDonChiTiet = this.getByMa(hoaDonChiTietRequest.getMaHoaDonChiTiet());
        hoaDonChiTiet.setSoLuongMua(hoaDonChiTietRequest.getSoLuongMua());
        hoaDonChiTiet.setGiaTien(hoaDonChiTietRequest.getGiaTien());
        hoaDonChiTiet.setTrangThai(hoaDonChiTietRequest.getTrangThai());
        repository.save(hoaDonChiTiet);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public List<HoaDonChiTiet> getByHoaDon(HoaDon hd){
        return repository.getAllByHoaDon(hd);
    }


    public ResponseEntity<?> searchSanPhamBaoHanh(SanPhamBaoHanhRequest request) {
        if(request.getImei() != null){
            if (isIMEIValid(request.getImei())) {
                System.out.println("IMEI hợp lệ!");
                return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
            }
        }
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        String tenSanPhamSearch = null;
        String imei = null;
        if (!request.getNgayBatDau().isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(request.getNgayBatDau(), "yyyy-MM-dd");
        }
        if (!request.getNgayKetThuc().isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(request.getNgayKetThuc(), "yyyy-MM-dd");
        }
        if (!request.getTenSanPhamSearch().isEmpty()) {
            tenSanPhamSearch = request.getTenSanPhamSearch();
        }
        if (!request.getImei().isEmpty()) {
            imei = request.getImei();
        }
        List<SanPhamBaoHanhDTO> sanPhamBaoHanhDTOS = repository.searchSanPhamBaoHanh(tenSanPhamSearch,
                imei, ngayBatDau, ngayKetThuc);
        for (SanPhamBaoHanhDTO sanPhamBaoHanhDTO: sanPhamBaoHanhDTOS){
            sanPhamBaoHanhDTO.convert();
        }
        return new ResponseEntity<>(sanPhamBaoHanhDTOS,HttpStatus.OK);
    }

    public static boolean isIMEIValid(String imei) {
        imei = imei.replaceAll("[\\s-]", "");
        if (imei.matches("^\\d{15}$")) {
            int sum = 0;
            for (int i = 0; i < 14; i++) {
                int digit = Character.getNumericValue(imei.charAt(i));
                if (i % 2 == 0) {
                    digit *= 2;
                    digit = digit < 10 ? digit : digit - 9;
                }
                sum += digit;
            }

            int checkDigit = (10 - (sum % 10)) % 10;
            return Character.getNumericValue(imei.charAt(14)) == checkDigit;
        }

        return false;
    }
}
