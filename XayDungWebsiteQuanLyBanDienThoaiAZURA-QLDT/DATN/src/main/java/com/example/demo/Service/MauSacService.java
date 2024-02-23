package com.example.demo.Service;

import com.example.demo.Dto.Request.MauSacRequest;
import com.example.demo.Entity.Chip;
import com.example.demo.Entity.MauSac;
import com.example.demo.Repository.MauSacRepository;
import com.example.demo.Utils.Constants;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MauSacService {
    @Autowired
    private MauSacRepository repository;


    public Page<MauSac> getAll(Pageable pageable) {
        Page<MauSac> mauSacList = repository.findAllByTrangThai(Constants.ACTIVE, pageable);
        return mauSacList;
    }

    public List<MauSac> getAll() {
        List<MauSac> mauSacList = repository.findAllByOrderByTrangThaiDesc();
        return mauSacList;
    }

    public ResponseEntity<?> add(MauSacRequest mauSacRequest) {
        MauSac mauSac = new MauSac();
        if (StringUtils.isEmpty(mauSacRequest.getTenMauSac())) {
            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
        }
        String tenMauSac = mauSacRequest.getTenMauSac();
        MauSac mauSacInactiveCheck = repository.findAllInactiveByTen(tenMauSac);
        MauSac mauSacActiveCheck = repository.findAllActiveByTen(tenMauSac);
        if (mauSacInactiveCheck != null) {
            return new ResponseEntity<>("Màu sắc đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if (mauSacActiveCheck != null) {
            return new ResponseEntity<>("Màu sắc đã tồn tại!", HttpStatus.OK);
        }
        mauSac.setTenMauSac(mauSacRequest.getTenMauSac());
        mauSac.setTrangThai(mauSacRequest.getTrangThai());
        repository.save(mauSac);
        return new ResponseEntity<>("Success", HttpStatus.OK);

    }

    public MauSac getByMa(Long maMauSac) {
        MauSac mauSac = repository.getReferenceById(maMauSac);
        return mauSac;
    }

    public ResponseEntity<?> update(MauSacRequest mauSacRequest) {
        System.out.println("MaMS " + mauSacRequest.getMaMauSac());
        System.out.println("TenMS " + mauSacRequest.getTenMauSac());
        MauSac mauSac = repository.findByMaMauSac(mauSacRequest.getMaMauSac());
        String tenMauSac = mauSacRequest.getTenMauSac();
        MauSac mauSacInactiveCheck = repository.findAllInactiveByTen(tenMauSac);
        MauSac mauSacActiveCheck = repository.findAllActiveByTen(tenMauSac);
        if (mauSacInactiveCheck != null && !mauSac.getMaMauSac().equals(mauSacInactiveCheck.getMaMauSac())) {
            return new ResponseEntity<>("Màu sắc đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if (mauSacActiveCheck != null && !mauSac.getMaMauSac().equals(mauSacActiveCheck.getMaMauSac())) {
            return new ResponseEntity<>("Màu sắc đã tồn tại!", HttpStatus.OK);
        }
        mauSac.setTenMauSac(mauSacRequest.getTenMauSac());
        mauSac.setTrangThai(mauSacRequest.getTrangThai());
        repository.save(mauSac);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public ResponseEntity<?> xoa(Long id) {
        MauSac mauSac = this.getByMa(id);
        mauSac.setTrangThai(0);
        repository.save(mauSac);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
