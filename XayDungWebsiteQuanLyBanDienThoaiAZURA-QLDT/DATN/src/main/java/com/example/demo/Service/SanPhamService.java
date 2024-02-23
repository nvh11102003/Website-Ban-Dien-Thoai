package com.example.demo.Service;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.Request.SanPhamRequest;
import com.example.demo.Dto.SanPhamTHongKeDTO;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.SanPham;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.SanPhamRepository;
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
public class SanPhamService {

    @Autowired
    private SanPhamRepository repository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    public List<SanPham> getAll() {
        return repository.findAll();
    }

    public SanPham addSP(ChiTietSanPhamRequest sanPhamRequest) {
        SanPham sanPham = new SanPham();
        sanPham.setTenSanPham(sanPhamRequest.getTenSanPham());
        sanPham.setRam(sanPhamRequest.getRam());
        sanPham.setHeDieuHanh(sanPhamRequest.getHeDieuHanh());
        sanPham.setManhinh(sanPhamRequest.getManHinh());
        sanPham.setCameratruoc(sanPhamRequest.getCameratruoc());
        sanPham.setCamerasau(sanPhamRequest.getCamerasau());
        sanPham.setSim(sanPhamRequest.getSim());
        sanPham.setDungLuongPin(sanPhamRequest.getDungLuongPin());
        sanPham.setTrangThai(Constants.ACTIVE);
        repository.save(sanPham);
        return sanPham;
    }

    public SanPham getByMa(Long maSanPham) {
        SanPham sanPham = repository.getReferenceById(maSanPham);
        return sanPham;
    }

    public SanPham update(ChiTietSanPhamRequest sanPhamRequest) {
        SanPham sanPham = this.getByMa(sanPhamRequest.getMaSanPham());
        if(sanPham != null){
            sanPham.setTenSanPham(sanPhamRequest.getTenSanPham());
            sanPham.setRam(sanPhamRequest.getRam());
            sanPham.setHeDieuHanh(sanPhamRequest.getHeDieuHanh());
            sanPham.setManhinh(sanPhamRequest.getManHinh());
            sanPham.setCameratruoc(sanPhamRequest.getCameratruoc());
            sanPham.setCamerasau(sanPhamRequest.getCamerasau());
            sanPham.setSim(sanPhamRequest.getSim());
            sanPham.setDungLuongPin(sanPhamRequest.getDungLuongPin());
            repository.save(sanPham);
        }
        return sanPham;
    }

    public SanPham delete(Long maSP){
        SanPham sanPham = this.getByMa(maSP);
        if(sanPham != null){
            sanPham.setTrangThai(Constants.INACTIVE);
            repository.save(sanPham);
        }
        return sanPham;
    }

    public Integer checkSoLuongTon(SanPhamRequest request){
        ChiTietSanPham sanPhamCheck = chiTietSanPhamRepository.getChiTietSanPhamCheckSoLuong(request.getMaSanPham());
        Integer soLuongTon = null;
        if (sanPhamCheck != null){
            soLuongTon = sanPhamCheck.getSoLuongNhap() - sanPhamCheck.getSoLuongBan();
        }
        return soLuongTon;
    }

    public Integer countSanPhamDangCo(){
        return repository.countSanPhamDangCo();
    }

    public Integer countSanPhamHetHang(){
        return chiTietSanPhamRepository.countSanPhamHetHang();
    }

    public List<SanPhamTHongKeDTO> top10SanPhamBanChayNhat(){
        List<SanPhamTHongKeDTO> sanPhamTHongKeDTOS = repository.top10SanPhamBanChayNhat();
        List<SanPhamTHongKeDTO> top10SanPhamBanChayNhat = new ArrayList<>();
        if (sanPhamTHongKeDTOS.size() >= 10) {
            top10SanPhamBanChayNhat = sanPhamTHongKeDTOS.subList(0, 10);
        }else {
            top10SanPhamBanChayNhat = sanPhamTHongKeDTOS;
        }
        for (SanPhamTHongKeDTO sanPhamTHongKeDTO: top10SanPhamBanChayNhat){
            sanPhamTHongKeDTO.convert();
        }
        return top10SanPhamBanChayNhat;
    }

    public List<ChiTietSanPhamDTO> danhSachSanPhamHetHang(){
        return chiTietSanPhamRepository.getDanhSachSanPhamHetHang();
    }

    public Integer tongSoLuongBan(String ngayBatDauStr, String ngayKetThucStr){
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        return repository.tongSoLuongBan(null, ngayBatDau, ngayKetThuc);
    }

    public Integer tongSoLuongNhap(){
        return repository.tongSoLuongNhap(null);
    }

    public List<SanPham> danhSachSPConHang() {
        return repository.danhSachSPConHang();
    }

    public Integer tongSoLuongBanTheoSanPham(Long maSP, String ngayBatDauStr, String ngayKetThucStr){
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        return repository.tongSoLuongBan(maSP, ngayBatDau, ngayKetThuc);
    }

    public Integer tongSoLuongNhapTheoSanPham(Long maSP){
        return repository.tongSoLuongNhap(maSP);
    }

    public SanPham sanPhamCheckTonTai(String tenSanPham, Long maDungLuong, Long maMauSac, Long maSP){
        return repository.sanPhamCheckTT(tenSanPham, maDungLuong, maMauSac, maSP);
    }


}
