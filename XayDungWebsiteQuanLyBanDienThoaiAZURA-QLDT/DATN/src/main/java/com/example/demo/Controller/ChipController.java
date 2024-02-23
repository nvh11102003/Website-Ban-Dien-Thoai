package com.example.demo.Controller;

import com.example.demo.Dto.Request.ChipRequest;
import com.example.demo.Service.ChipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/chip")
@RestController
public class ChipController {
    @Autowired
    private ChipService chipService;


    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody ChipRequest chipRequest) {
        return chipService.add(chipRequest);
    }

    @PutMapping("/update")
    public ResponseEntity<?> sua(@Validated ChipRequest chipRequest) {
        return chipService.update(chipRequest);
    }

    @PutMapping("/sua/{maChip}")
    public ResponseEntity<?> deleteChip(@PathVariable("maChip") Long maChip) {
        chipService.update(maChip);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
}
