package com.example.demo.Service;

import com.example.demo.Dto.ChipDTO;
import com.example.demo.Dto.Request.ChipRequest;
import com.example.demo.Dto.Request.DungLuongRequest;
import com.example.demo.Entity.Chip;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Repository.ChipRepository;
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
public class ChipService {
    @Autowired
    private ChipRepository repository;

    public Page<Chip> getAll(Pageable pageable) {
        return repository.findAllByTrangThai(Constants.ACTIVE, pageable);
    }

    public ResponseEntity<?> add(ChipRequest chipRequest) {
        Chip chip = new Chip();
        if (StringUtils.isEmpty(chipRequest.getTenChip())) {
            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
        }
        String tenChip = chipRequest.getTenChip();
        Chip chipInactiveCheck = repository.findAllInactiveByTen(tenChip);
        Chip chipActiveCheck = repository.findAllActiveByTen(tenChip);
        if (chipInactiveCheck != null){
            return new ResponseEntity<>("Chip đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(chipActiveCheck != null){
            return new ResponseEntity<>("Chip đã tồn tại!", HttpStatus.OK);
        }
        chip.setTenChip(chipRequest.getTenChip());
        chip.setTrangThai(chipRequest.getTrangThai());
        repository.save(chip);
        return new ResponseEntity<>("Success", HttpStatus.OK);

    }

    public Chip getByMa(Long maChip) {
        Chip chip = repository.getReferenceById(maChip);
        return chip;
    }

    public Chip update1(ChipRequest chipRequest) {
        Chip chip = repository.getReferenceById(chipRequest.getMaChip());
        chip.setTenChip(chipRequest.getTenChip());
        chip.setTrangThai(chipRequest.getTrangThai());
        repository.save(chip);
        return chip;
    }

    public ResponseEntity<?> update(ChipRequest chipRequest) {
        Chip chip = repository.getReferenceById(chipRequest.getMaChip());
        String tenChip = chipRequest.getTenChip();
        Chip chipInactiveCheck = repository.findAllInactiveByTen(tenChip);
        Chip chipActiveCheck = repository.findAllActiveByTen(tenChip);
        if(chipInactiveCheck != null && !chip.getMaChip().equals(chipInactiveCheck.getMaChip())){
            return new ResponseEntity<>("Chip đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(chipActiveCheck != null && !chip.getMaChip().equals(chipActiveCheck.getTenChip())){
            return new ResponseEntity<>("Chip đã tồn tại!", HttpStatus.OK);
        }
        chip.setTenChip(chipRequest.getTenChip());
        chip.setTrangThai(chipRequest.getTrangThai());
        repository.save(chip);
        return new ResponseEntity<>("Success",HttpStatus.OK);
    }

    public List<ChipDTO> searchChip(ChipRequest request) {
        List<ChipDTO> chipDTOS = repository.searchChip(request.getTenChip());
        return chipDTOS;
    }

    public List<ChipDTO> viewAllC() {
        return repository.viewAllC();
    }

    public Chip update(Long maChip){
        Chip chip = repository.getReferenceById(maChip);
        chip.setTrangThai(Constants.INACTIVE);
        repository.save(chip);
        return chip;
    }

}
