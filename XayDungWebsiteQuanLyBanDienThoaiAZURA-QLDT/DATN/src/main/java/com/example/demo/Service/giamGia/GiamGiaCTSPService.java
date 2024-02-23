package com.example.demo.Service.giamGia;

import com.example.demo.Dto.GiamGiaCTSPDTO;
import com.example.demo.Dto.Request.GiamGiaCTSPRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.GiamGiaSanPham;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.DungLuongRepository;
import com.example.demo.Repository.GiamGia.GiamGiaSanPhamRepository;
import com.example.demo.Repository.GiamGiaCTSPRepository;
import com.example.demo.Utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class GiamGiaCTSPService {

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    @Autowired
    private DungLuongRepository dungLuongRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private GiamGiaSanPhamRepository giamGiaSanPhamRepository;

    public List<GiamGiaCTSPDTO> searchGiamGiaCTSP(GiamGiaCTSPRequest request) {
        List<GiamGiaCTSPDTO> giamGiaCTSPDTOS = giamGiaCTSPRepository.searchGiamGiaCTSP(request.getMaSP(), request.getMaDL(), request.getMaMS(), request.getMaGG());
        for (GiamGiaCTSPDTO giamGiaCTSPDTO : giamGiaCTSPDTOS) {
            giamGiaCTSPDTO.convert();
        }
        return giamGiaCTSPDTOS;
    }

    public ResponseEntity<?> addGiamGiaChoSP(GiamGiaCTSPRequest request) {
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamRepository.getReferenceById(request.getMaGG());
        List<ChiTietSanPham> chiTietSanPhams = chiTietSanPhamRepository.getCTSPByMaMauSacAndDungLuongAndTen(request.getMaSP(), request.getMaDL(), request.getMaMS());
        for(ChiTietSanPham chiTietSanPham: chiTietSanPhams){
            BigDecimal giaSauKhiGiam = BigDecimal.valueOf(((100 - (giamGiaSanPham.getPhanTramSale()).doubleValue()) * chiTietSanPham.getGiaBan().doubleValue()) / 100);
            GiamGiaChiTietSanPham checkSPGG = giamGiaCTSPRepository.checkGiamGiaTonTai(chiTietSanPham.getMaChiTietSanPham());
            if (checkSPGG != null) {
                return new ResponseEntity<>("Sản phẩm đang được áp mã giảm giá !", HttpStatus.OK);
            }

            GiamGiaChiTietSanPham checkSPGGUSE = giamGiaCTSPRepository.checkGiamGiaAndMaGG(chiTietSanPham.getMaChiTietSanPham(), request.getMaGG());
            if (checkSPGGUSE != null) {
                return new ResponseEntity<>("Sản phẩm đang được áp mã giảm giá này rồi hãy active lên !", HttpStatus.OK);
            }

            if(giamGiaSanPham.getNgayKetThuc().before(new Date())){
                return new ResponseEntity<>("Mã giảm giá đã hết hạn vui lòng chọn mã khác!", HttpStatus.OK);
            }
            GiamGiaChiTietSanPham giamGiaChiTietSanPham = new GiamGiaChiTietSanPham();
            giamGiaChiTietSanPham.setMoTa(request.getMoTa());
            giamGiaChiTietSanPham.setChiTietSanPham(chiTietSanPham);
            giamGiaChiTietSanPham.setGiamGiaSanPham(giamGiaSanPham);
            giamGiaChiTietSanPham.setMaSanPham(request.getMaSP());
            giamGiaChiTietSanPham.setGiaSauKhiGiam(giaSauKhiGiam);
            giamGiaChiTietSanPham.setTrangThai(Constants.ACTIVE);
            giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> updateGiamGiaChoSP(GiamGiaCTSPRequest request) {
        System.out.println(request);
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamRepository.getReferenceById(request.getMaGG());
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(request.getMaCTSP());
        BigDecimal giaSauKhiGiam = BigDecimal.valueOf(((100 - (giamGiaSanPham.getPhanTramSale()).doubleValue()) * chiTietSanPham.getGiaBan().doubleValue()) / 100);
        GiamGiaChiTietSanPham checkSPGG = giamGiaCTSPRepository.checkGiamGiaTonTai(request.getMaCTSP());
        GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.getReferenceById(request.getMaGGCTSP());
        if (checkSPGG != null) {
            if (request.getTrangThai() == 1 && checkSPGG.getMaGiamGiaChiTiet() != giamGiaChiTietSanPham.getMaGiamGiaChiTiet()) {
                return new ResponseEntity<>("Sản phẩm đang được áp mã giảm giá !", HttpStatus.OK);
            }
        }
        if(giamGiaSanPham.getNgayKetThuc().before(new Date())){
            return new ResponseEntity<>("Mã giảm giá đã hết hạn vui lòng chọn mã khác!", HttpStatus.OK);
        }
        giamGiaChiTietSanPham.setGiamGiaSanPham(giamGiaSanPham);
        giamGiaChiTietSanPham.setGiaSauKhiGiam(giaSauKhiGiam);
        giamGiaChiTietSanPham.setTrangThai(request.getTrangThai());
        giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> detailGiamGiaChoSP(Long maGGCTSP) {
        GiamGiaCTSPDTO giamGiaCTSPDTO = giamGiaCTSPRepository.detailGiamGiaCTSP(maGGCTSP);
        return new ResponseEntity<>(giamGiaCTSPDTO, HttpStatus.OK);
    }

    public GiamGiaChiTietSanPham fillGGCTSP(Long maCTSP) {
        GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(maCTSP);
        return giamGiaChiTietSanPham;
    }

    public ResponseEntity<?> updateTTHetHan() {
        Date dateNow = new Date();
        List<GiamGiaChiTietSanPham> giamGiaChiTietSanPhams = giamGiaCTSPRepository.findAllHetHan(dateNow);
        for (GiamGiaChiTietSanPham giamGiaChiTietSanPham: giamGiaChiTietSanPhams){
            giamGiaChiTietSanPham.setTrangThai(0);
            giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
        }
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> updateDungHD(GiamGiaCTSPRequest request) {
        List<GiamGiaChiTietSanPham> giamGiaChiTietSanPhams = giamGiaCTSPRepository.getListGGBySPAndDL(request.getMaSP(), request.getMaDL());

        for(GiamGiaChiTietSanPham giamGiaChiTietSanPham: giamGiaChiTietSanPhams){
            giamGiaChiTietSanPham.setTrangThai(Constants.INACTIVE);
            giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> fillListDungLuong(Long maSP) {
        List<DungLuong> dungLuongList = dungLuongRepository.fillListDungLuongBySp(maSP);
        return new ResponseEntity<>(dungLuongList, HttpStatus.OK);
    }

    public ResponseEntity<?> updateTTGGSP() {
        Date dateNow = new Date();
        List<GiamGiaSanPham> giamGiaSanPhams = giamGiaSanPhamRepository.findALlInactive(dateNow);

        for(GiamGiaSanPham giamGiaSanPham: giamGiaSanPhams){
            List<GiamGiaChiTietSanPham> giamGiaChiTietSanPhams = giamGiaCTSPRepository.getGGCTSPBymaGGSP(giamGiaSanPham.getMaGiamGia());
            for(GiamGiaChiTietSanPham giamGiaChiTietSanPham: giamGiaChiTietSanPhams){
                giamGiaChiTietSanPham.setTrangThai(Constants.INACTIVE);
                giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
            }
            giamGiaSanPham.setTrangThai(Constants.INACTIVE);
            giamGiaSanPhamRepository.save(giamGiaSanPham);
        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> updateTTDungHDALL() {
        Date dateNow = new Date();
        List<GiamGiaSanPham> giamGiaSanPhams = giamGiaSanPhamRepository.findAll();

        for(GiamGiaSanPham giamGiaSanPham: giamGiaSanPhams){
            giamGiaSanPham.setTrangThai(Constants.INACTIVE);
            List<GiamGiaChiTietSanPham> giamGiaChiTietSanPhams = giamGiaCTSPRepository.getGGCTSPBymaGGSP(giamGiaSanPham.getMaGiamGia());
            for(GiamGiaChiTietSanPham giamGiaChiTietSanPham: giamGiaChiTietSanPhams){
                giamGiaChiTietSanPham.setTrangThai(Constants.INACTIVE);
                giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
            }
            giamGiaSanPhamRepository.save(giamGiaSanPham);

        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
}
