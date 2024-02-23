package com.example.demo.Service;

import com.example.demo.Dto.Request.ChucVuRequest;
import com.example.demo.Entity.ChucVu;
import com.example.demo.Repository.ChucVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChucVuService {
    @Autowired
    private ChucVuRepository repository;

    public List<ChucVu> getAll() {
        return repository.findAll();
    }

    public ResponseEntity<?> add(ChucVuRequest chucVuRequest) {
        ChucVu chucVu = new ChucVu();
//        if (StringUtils.isEmpty(giaoCaRequest.getDiaChi())) {
//            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
//        }
        chucVu.setTenChucVu(chucVuRequest.getTenChucVu());
        chucVu.setTrangThai(chucVuRequest.getTrangThai());
        repository.save(chucVu);
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    public ChucVu getByMaChucVu(Long maChucVu) {
        ChucVu chucVu = repository.getReferenceById(maChucVu);
        return chucVu;
    }

    public ResponseEntity<?> update(ChucVuRequest chucVuRequest) {
        ChucVu chucVu = this.getByMaChucVu(chucVuRequest.getMaChucVu());
        chucVu.setTenChucVu(chucVuRequest.getTenChucVu());
        chucVu.setTrangThai(chucVuRequest.getTrangThai());
        repository.save(chucVu);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
