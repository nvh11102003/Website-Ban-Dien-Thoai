package com.example.demo.Service;

import com.example.demo.Dto.Request.HinhAnhRequest;
import com.example.demo.Entity.HinhAnh;
import com.example.demo.Repository.HinhAnhRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HinhAnhService {

    @Autowired
    private HinhAnhRepository repository;

    public List<HinhAnh> getAll() {
        return repository.findAll();
    }

    public ResponseEntity<?> add(HinhAnhRequest hinhAnhRequest) {
        HinhAnh hinhAnh = new HinhAnh();
//        if (StringUtils.isEmpty(hinhAnhRequest.getHinhAnhURL())) {
//            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
//        }
        hinhAnh.setTenHinhAnh(hinhAnhRequest.getTenHinhAnh());
        hinhAnh.setHinhAnhURL(hinhAnhRequest.getHinhAnhURL());
        hinhAnh.setTrangThai(hinhAnhRequest.getTrangThai());

        repository.save(hinhAnh);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public HinhAnh getByMa(Long maHinhAnh) {
        HinhAnh hinhAnh = repository.getReferenceById(maHinhAnh);
        return hinhAnh;
    }

    public ResponseEntity<?> update(HinhAnhRequest hinhAnhRequest) {
        HinhAnh hinhAnh = this.getByMa(hinhAnhRequest.getMaHinhAnh());

        hinhAnh.setTenHinhAnh(hinhAnhRequest.getTenHinhAnh());
        hinhAnh.setHinhAnhURL(hinhAnhRequest.getHinhAnhURL());
        hinhAnh.setTrangThai(hinhAnhRequest.getTrangThai());

        repository.save(hinhAnh);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}


