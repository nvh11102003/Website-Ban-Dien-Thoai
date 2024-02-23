package com.example.demo.Service;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.ListDungLuongOfSanPhamDTO;
import com.example.demo.Dto.ListMauSacOfSanPhamDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.Response.DetailSanPhamResponse;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.SanPham;
import com.example.demo.Repository.*;
import com.example.demo.Utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class ChiTietSanPhamService {

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private ChipRepository chipRepository;

    @Autowired
    private NSXRepository nsxRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private DungLuongRepository dungLuongRepository;

    @Autowired
    private HinhAnhRepository hinhAnhRepository;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamViewRepository sanPhamViewRepository;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    public List<ChiTietSanPhamDTO> searchChiTietSanPham(ChiTietSanPhamRequest request) {
        List<ChiTietSanPhamDTO> chiTietSanPhamDTOS = chiTietSanPhamRepository.searchChiTietSanPham(request.getTenSanPham(),
                null, request.getTrangThai(), request.getMaMauSac(), request.getMaDungLuong(), request.getMaNSX());
        return chiTietSanPhamDTOS;
    }

    public List<ChiTietSanPhamDTO> viewAllQuanLi() {
        return chiTietSanPhamRepository.viewAllCTSP();
    }

    public List<ChiTietSanPhamDTO> viewAllGanGG() {
        return chiTietSanPhamRepository.viewAllCTSPGanGG();
    }

    public List<ChiTietSanPham> hienThi() {
        return chiTietSanPhamRepository.findAllNotGiamGia();
    }

    public List<ChiTietSanPham> hienThiTheoNSX() {
        return chiTietSanPhamRepository.findAll();
    }

    public int getTotalItem(Long type, String range, BigDecimal minRange, BigDecimal maxRange) {
        if (type == null && range == null) {
            return sanPhamViewRepository.SanPhamHTDTOAll(type, minRange, maxRange).size();
        } else if (type != null && range == null) {
            return sanPhamViewRepository.SanPhamHTDTOAll(type, null, null).size();
        } else if (range != null && type != null) {
            minRange = null;
            maxRange = null;

            if (range.equals("0-11000")) {
                minRange = BigDecimal.valueOf(0);
                maxRange = BigDecimal.valueOf(10999999);
            } else if (range.equals("11000-15000")) {
                minRange = BigDecimal.valueOf(11000000);
                maxRange = BigDecimal.valueOf(15000000);
            } else if (range.equals("15000-999999999")) {
                minRange = BigDecimal.valueOf(15000000);
                maxRange = BigDecimal.valueOf(999999999);
            }

//            return chiTietSanPhamRepository.findByGiaBanBetweenAndNsxMaNSXAndTrangThai(minRange, maxRange, type, 1).size();
            return sanPhamViewRepository.SanPhamHTDTOAll(type, minRange, maxRange).size();
        } else {
            minRange = null;
            maxRange = null;
            if (range.equals("0-11000")) {
                minRange = BigDecimal.valueOf(0);
                maxRange = BigDecimal.valueOf(10999999);
            } else if (range.equals("11000-15000")) {
                minRange = BigDecimal.valueOf(11000000);
                maxRange = BigDecimal.valueOf(15000000);
            } else if (range.equals("15000-999999999")) {
                minRange = BigDecimal.valueOf(15000000);
                maxRange = BigDecimal.valueOf(999999999);
            }
//            return chiTietSanPhamRepository.findByGiaBanBetweenAndTrangThai(minRange, maxRange, 1).size();
            return sanPhamViewRepository.SanPhamHTDTOAll(null, minRange, maxRange).size();
        }
    }


    public ChiTietSanPham addCTSP(ChiTietSanPhamRequest chiTietSanPhamRequest) {
        ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
        chiTietSanPham.setSoLuongNhap(chiTietSanPhamRequest.getSoLuongNhap());
        chiTietSanPham.setSoLuongBan(0);
        chiTietSanPham.setNgayNhap(new Date());
        chiTietSanPham.setGiaBan(chiTietSanPhamRequest.getGiaBan());
        chiTietSanPham.setGiaNhap(chiTietSanPhamRequest.getGiaNhap());
        chiTietSanPham.setMoTa(chiTietSanPhamRequest.getMoTa());
        chiTietSanPham.setTrangThai(Constants.ACTIVE);
        chiTietSanPham.setDungLuong(dungLuongRepository.findById(chiTietSanPhamRequest.getMaDungLuong()).get());
        chiTietSanPham.setSanPham(sanPhamRepository.findById(chiTietSanPhamRequest.getMaSanPham()).get());
        chiTietSanPham.setHinhAnhURL(chiTietSanPhamRequest.getHinhAnhURL());
        chiTietSanPham.setChip(chipRepository.findById(chiTietSanPhamRequest.getMaChip()).get());
        chiTietSanPham.setNsx(nsxRepository.findById(chiTietSanPhamRequest.getMaNSX()).get());
        chiTietSanPham.setMauSac(mauSacRepository.findById(chiTietSanPhamRequest.getMaMauSac()).get());
        chiTietSanPham.setCreatedDate(new Date());
        chiTietSanPham.setLastUpdate(new Date());
        chiTietSanPhamRepository.save(chiTietSanPham);
        return chiTietSanPham;
    }

    public ChiTietSanPham getByMa(Long maHoaDonChiTiet) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(maHoaDonChiTiet);
        return chiTietSanPham;
    }

    public ChiTietSanPham update(ChiTietSanPhamRequest chiTietSanPhamRequest) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(chiTietSanPhamRequest.getMaChiTietSanPham());
        SanPham sanPham = sanPhamService.getByMa(chiTietSanPhamRequest.getMaSanPham());
        if (chiTietSanPham != null) {
            chiTietSanPham.setSoLuongNhap(chiTietSanPhamRequest.getSoLuongNhap());
            chiTietSanPham.setSoLuongBan(chiTietSanPhamRequest.getSoLuongBan());
            chiTietSanPham.setNgayNhap(new Date());
            chiTietSanPham.setGiaBan(chiTietSanPhamRequest.getGiaBan());
            chiTietSanPham.setGiaNhap(chiTietSanPhamRequest.getGiaNhap());
            chiTietSanPham.setDungLuong(dungLuongRepository.findById(chiTietSanPhamRequest.getMaDungLuong()).get());
            chiTietSanPham.setLastUpdate(new Date());
            if (chiTietSanPhamRequest.getHinhAnhURL() != null) {
                chiTietSanPham.setHinhAnhURL(chiTietSanPhamRequest.getHinhAnhURL());
            }
            if (chiTietSanPhamRequest.getSoLuongNhap() > chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(Constants.ACTIVE);
                if (sanPham != null) {
                    sanPham.setTrangThai(Constants.ACTIVE);
                }
            } else {
                chiTietSanPham.setTrangThai(Constants.INACTIVE);
                if (sanPham != null) {
                    sanPham.setTrangThai(Constants.INACTIVE);
                }
            }
            chiTietSanPham.setChip(chipRepository.findById(chiTietSanPhamRequest.getMaChip()).get());
            chiTietSanPham.setNsx(nsxRepository.findById(chiTietSanPhamRequest.getMaNSX()).get());
            chiTietSanPham.setMauSac(mauSacRepository.findById(chiTietSanPhamRequest.getMaMauSac()).get());
            chiTietSanPhamRepository.save(chiTietSanPham);


            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.findByChiTietSanPham(chiTietSanPham);
            if(giamGiaChiTietSanPham != null){
                Double giaSauGiam = Double.parseDouble(String.valueOf(chiTietSanPham.getGiaBan())) - (Double.parseDouble(String.valueOf(chiTietSanPham.getGiaBan())) * giamGiaChiTietSanPham.getGiamGiaSanPham().getPhanTramSale() / 100);
                giamGiaChiTietSanPham.setGiaSauKhiGiam(BigDecimal.valueOf(giaSauGiam));
                giamGiaCTSPRepository.save(giamGiaChiTietSanPham);
            }
        }
        return chiTietSanPham;
    }

    public ChiTietSanPham delete(Long maChiTietSanPham) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getReferenceById(maChiTietSanPham);
        if (chiTietSanPham != null) {
//            SanPham sanPham = sanPhamService.delete(chiTietSanPham.getSanPham().getMaSanPham());
//            chiTietSanPham.setSanPham(sanPham);
            chiTietSanPham.setTrangThai(Constants.INACTIVE);
            chiTietSanPhamRepository.save(chiTietSanPham);
        }
        return chiTietSanPham;
    }

    public List<ChiTietSanPham> hienThiPhanTrang1(int page, Long type) {
        int limit = 9;
        Pageable pageable = PageRequest.of(page - 1, limit);
        if (type == null) {
            return chiTietSanPhamRepository.findByTrangThai(1, pageable);
        } else {
            return chiTietSanPhamRepository.findByNsxMaNSXAndTrangThai(type, 1, pageable);
        }
    }

    // Phương thức lấy tổng số sản phẩm theo trạng thái
    public int getTotalItemByTrangThai(int trangThai) {
        return chiTietSanPhamRepository.countByTrangThai(trangThai);
    }

    // Phương thức lấy tổng số sản phẩm theo loại và trạng thái
    public int getTotalItemByTypeAndTrangThai(Long maNSX, int trangThai) {
        return chiTietSanPhamRepository.countByNsxMaNSXAndTrangThai(maNSX, trangThai);
    }

    public ChiTietSanPham detailCtsp(Long maCtsp) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(maCtsp).orElse(null);
        return chiTietSanPham;
    }

    public DetailSanPhamResponse detailSanPhamByTenSanPham(String tenSanPham) {
        DetailSanPhamResponse detailSanPhamResponse = chiTietSanPhamRepository.detailSanPham(tenSanPham);

        List<ListDungLuongOfSanPhamDTO> dungLuongOfSanPhamDTOS = chiTietSanPhamRepository.getListDungLuongOfSanPham(tenSanPham);
        detailSanPhamResponse.setListDungLuongOfSanPhamDTOS(dungLuongOfSanPhamDTOS);
        return detailSanPhamResponse;
    }

    public List<ListMauSacOfSanPhamDTO> getListMauSacOfSanPhamByDungLuong(String tenSanPham, Long maDungLuong) {
        List<ListMauSacOfSanPhamDTO> listMauSacOfSanPhamDTOS = chiTietSanPhamRepository.getListMauSacOfSanPham(tenSanPham, maDungLuong);
        return listMauSacOfSanPhamDTOS;
    }

}
