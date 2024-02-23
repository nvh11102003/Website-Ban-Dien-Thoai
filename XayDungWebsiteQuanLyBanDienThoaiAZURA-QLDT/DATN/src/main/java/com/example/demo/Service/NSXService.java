package com.example.demo.Service;

import com.example.demo.Dto.Request.NSXRequest;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Entity.MauSac;
import com.example.demo.Entity.NSX;
import com.example.demo.Repository.NSXRepository;
import com.example.demo.Utils.Constants;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NSXService {
    @Autowired
    private NSXRepository repository;

    public Page<NSX> getAll(Pageable pageable) {
        return repository.findAllByTrangThai(Constants.ACTIVE, pageable);
    }

    public List<NSX> getAll() {
        return repository.findAllByOrderByLastUpdateDesc();
    }

    public ResponseEntity<?> add(NSXRequest nsxRequest) {
        NSX nsx = new NSX();
        if (StringUtils.isEmpty(nsxRequest.getTenNSX())) {
            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
        }
        String tenNSX = nsxRequest.getTenNSX();
        NSX nsxInactiveCheck = repository.findAllInactiveByTen(tenNSX);
        NSX nsxActiveCheck = repository.findAllActiveByTen(tenNSX);
        if(nsxInactiveCheck != null){
            return new ResponseEntity<>("NSX đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(nsxActiveCheck != null){
            return new ResponseEntity<>("NSX đã tồn tại!", HttpStatus.OK);
        }
        nsx.setTenNSX(nsxRequest.getTenNSX());
        nsx.setTrangThai(nsxRequest.getTrangThai());
        nsx.setCreatedDate(new Date());
        nsx.setLastUpdate(new Date());
        repository.save(nsx);
        return new ResponseEntity<>("Success", HttpStatus.OK);

    }

    public NSX getByMa(Long maNSX) {
        NSX nsx = repository.getReferenceById(maNSX);
        return nsx;
    }

    public ResponseEntity<?> update(NSXRequest nsxRequest) {
        NSX nsx = repository.getReferenceById(nsxRequest.getMaNSX());
        String tenNSX = nsxRequest.getTenNSX();
        NSX nsxInactiveCheck = repository.findAllInactiveByTen(tenNSX);
        NSX nsxActiveCheck = repository.findAllActiveByTen(tenNSX);
        if(nsxInactiveCheck != null && !nsx.getMaNSX().equals(nsxInactiveCheck.getMaNSX())){
            return new ResponseEntity<>("NSX đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(nsxActiveCheck != null && !nsx.getMaNSX().equals(nsxActiveCheck.getMaNSX())){
            return new ResponseEntity<>("NSX đã tồn tại!", HttpStatus.OK);
        }
        nsx.setTenNSX(nsxRequest.getTenNSX());
        nsx.setTrangThai(nsxRequest.getTrangThai());
        nsx.setLastUpdate(new Date());
        repository.save(nsx);
        return new ResponseEntity<>("Success", HttpStatus.OK);

    }

    public ResponseEntity<?> xoa(Long id) {
        NSX nsx = this.getByMa(id);
        nsx.setTrangThai(0);
        repository.save(nsx);
        return new ResponseEntity<>( HttpStatus.OK);
    }
}
