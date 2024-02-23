package com.example.demo.Controller;

import com.example.demo.Dto.Request.DungLuongRequest;
import com.example.demo.Service.DungLuongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/dung-luong")
@RestController
public class DungLuongController {
    @Autowired
    private DungLuongService service;

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody DungLuongRequest dungLuongRequest) {
        return service.add(dungLuongRequest);
    }

    @PutMapping("/sua1")
    public ResponseEntity<?> sua(@Validated DungLuongRequest dungLuongRequest) {
        return service.update(dungLuongRequest);
    }

    @PutMapping("/sua/{maDungLuong}")
    public ResponseEntity<?> deleteChip(@PathVariable("maDungLuong") Long maDungLuong) {
        service.update(maDungLuong);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
}

