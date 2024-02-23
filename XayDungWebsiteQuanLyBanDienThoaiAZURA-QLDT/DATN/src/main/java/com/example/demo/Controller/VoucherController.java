package com.example.demo.Controller;

import com.example.demo.Dto.Request.VoucherRequest;
import com.example.demo.Entity.Voucher;
import com.example.demo.Service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/voucher")
public class VoucherController {

    @Autowired
    private VoucherService service;

    @GetMapping("/hien-thi")
    public ResponseEntity<?> hienThi(){
        return service.getAll();
    }

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody VoucherRequest voucherRequest){
        return service.add(voucherRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody VoucherRequest voucherRequest){
        return service.update(voucherRequest);
    }

    @PostMapping("/list")
    public List<Voucher> fillVoucherList(@RequestBody VoucherRequest request){
        List<Voucher> voucherList;
        try {
            voucherList = service.fillListVoucher(request);
            return voucherList;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping("/update-tt-giam-gia-hoa-don")
    public ResponseEntity<?> updatettGGSP() {
        return service.updateTTGGSP();
    }

    @PostMapping("/update-dung-hoat-dong-toan-bo")
    public ResponseEntity<?> updateDungHDSPAll() {
        return service.updateTTDungHDALL();
    }

}
