package com.example.demo.Service;

import com.example.demo.Dto.Request.VoucherRequest;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.GiamGiaSanPham;
import com.example.demo.Entity.Voucher;
import com.example.demo.Repository.VoucherRepository;
import com.example.demo.Utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class VoucherService {

    @Autowired
    private VoucherRepository repository;

    public ResponseEntity<?> getAll(){
        return new ResponseEntity<>(repository.findVoucherByOrderByLastUpdateDesc(), HttpStatus.OK);
    }

    public ResponseEntity<?> add(VoucherRequest voucherRequest) {
        Voucher voucher = new Voucher();
        voucher.setPhanTramVoucher(voucher.getPhanTramVoucher());
        voucher.setNgayBatDau(voucherRequest.getNgayBatDau());
        voucher.setNgayKetThuc(voucherRequest.getNgayKetThuc());
        voucher.setCreatedDate(new Date());
        voucher.setLastUpdate(new Date());
        voucher.setTrangthai(voucherRequest.getTrangThai());

        repository.save(voucher);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public Voucher getByMa(Long maVoucher) {
        Voucher voucher = repository.getReferenceById(maVoucher);
        return voucher;
    }

    public ResponseEntity<?> update(VoucherRequest voucherRequest) {
        Voucher voucher = this.getByMa(voucherRequest.getMaVoucher());
        voucher.setPhanTramVoucher(voucher.getPhanTramVoucher());
        voucher.setNgayBatDau(voucherRequest.getNgayBatDau());
        voucher.setNgayKetThuc(voucherRequest.getNgayKetThuc());
        voucher.setTrangthai(voucherRequest.getTrangThai());
        voucher.setLastUpdate(new Date());
        repository.save(voucher);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public List<Voucher> fillListVoucher(VoucherRequest request){
        List<Voucher> vouchers = repository.fillListVoucher(request.getSoLuongMuaTT(), request.getDonGiaMuaTT(),new Date());
        return vouchers;
    }

    public ResponseEntity<?> updateTTGGSP() {
        Date dateNow = new Date();
        List<Voucher> voucherList = repository.getListGGHDInactive(dateNow);

        for(Voucher voucher: voucherList){
            voucher.setTrangthai(Constants.INACTIVE);
            repository.save(voucher);
        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> updateTTDungHDALL() {
        Date dateNow = new Date();
        List<Voucher> voucherList = repository.findAll();

        for(Voucher voucher: voucherList){
            voucher.setTrangthai(Constants.INACTIVE);
            repository.save(voucher);
        }

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
}
