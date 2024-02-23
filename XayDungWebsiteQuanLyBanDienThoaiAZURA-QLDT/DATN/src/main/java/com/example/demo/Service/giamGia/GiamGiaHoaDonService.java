package com.example.demo.Service.giamGia;

import com.example.demo.Dto.Request.GiamGiaHoaDonRequest;
import com.example.demo.Dto.VoucherDTO;
import com.example.demo.Entity.Chip;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Entity.Voucher;
import com.example.demo.Repository.GiamGia.GiamGiaHoaDonRepository;
import com.example.demo.Utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Service
public class GiamGiaHoaDonService {
    @Autowired
    private GiamGiaHoaDonRepository giamGiaHoaDonRepository;

    public List<Voucher> getAll() {
        return giamGiaHoaDonRepository.findAll();
    }

    public Voucher add(GiamGiaHoaDonRequest giamGiaHoaDonRequest) {
        Voucher voucher = new Voucher();
        voucher.setTen(giamGiaHoaDonRequest.getTenGiamGia());
        // Chuyển đổi ngày bắt đầu
        LocalDate ngayBatDau = LocalDate.parse(giamGiaHoaDonRequest.getNgayBatDau());
        voucher.setNgayBatDau(Date.from(ngayBatDau.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        // Chuyển đổi ngày kết thúc
        LocalDate ngayKetThuc = LocalDate.parse(giamGiaHoaDonRequest.getNgayKetThuc());
        voucher.setNgayKetThuc(Date.from(ngayKetThuc.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        voucher.setPhanTramVoucher(giamGiaHoaDonRequest.getPhamTramSale());
        voucher.setSoLuongToiThieu(giamGiaHoaDonRequest.getSoLuongMuaTT());
        voucher.setDonGiaToiThieu(giamGiaHoaDonRequest.getDonGiaMuaTT());
        voucher.setTrangthai(Constants.ACTIVE);
        giamGiaHoaDonRepository.save(voucher);
        return voucher;
    }

    public Voucher getByMa(Long maVouCher){
        Voucher voucher = giamGiaHoaDonRepository.getReferenceById(maVouCher);
        return voucher;
    }

    public Voucher update(GiamGiaHoaDonRequest giamGiaHoaDonRequest) {
        Voucher voucher = giamGiaHoaDonRepository.getReferenceById(giamGiaHoaDonRequest.getMaGiamGia());
        voucher.setTen(giamGiaHoaDonRequest.getTenGiamGia());
        // Chuyển đổi ngày bắt đầu
        LocalDate ngayBatDau = LocalDate.parse(giamGiaHoaDonRequest.getNgayBatDau());
        voucher.setNgayBatDau(Date.from(ngayBatDau.atStartOfDay(ZoneId.systemDefault()).toInstant()));

        // Chuyển đổi ngày kết thúc
        LocalDate ngayKetThuc = LocalDate.parse(giamGiaHoaDonRequest.getNgayKetThuc());
        voucher.setNgayKetThuc(Date.from(ngayKetThuc.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        voucher.setSoLuongToiThieu(giamGiaHoaDonRequest.getSoLuongMuaTT());
        voucher.setDonGiaToiThieu(giamGiaHoaDonRequest.getDonGiaMuaTT());
        voucher.setPhanTramVoucher(giamGiaHoaDonRequest.getPhamTramSale());
        voucher.setTrangthai(giamGiaHoaDonRequest.getTrangThai());
        giamGiaHoaDonRepository.save(voucher);
        return voucher;
    }

    public Voucher updateTrangThai(Long maVoucher){
        Voucher voucher = giamGiaHoaDonRepository.getReferenceById(maVoucher);
        voucher.setTrangthai(Constants.INACTIVE);
        giamGiaHoaDonRepository.save(voucher);
        return voucher;
    }

    public List<VoucherDTO> viewAll() {
        return giamGiaHoaDonRepository.viewAll();
    }
}
