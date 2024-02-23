package com.example.demo.Controller;

import com.example.demo.Dto.Request.MauSacRequest;
import com.example.demo.Service.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/mau-sac")
@RestController
public class MauSacController {
    @Autowired
    private MauSacService service;


    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody MauSacRequest mauSacRequest){
        return service.add(mauSacRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@Validated MauSacRequest mauSacRequest){
        return service.update(mauSacRequest);
    }
    @DeleteMapping("/xoa/{id}")
    public ResponseEntity<?> xoa(@PathVariable("id") Long id){
        return service.xoa(id);
    }
}
