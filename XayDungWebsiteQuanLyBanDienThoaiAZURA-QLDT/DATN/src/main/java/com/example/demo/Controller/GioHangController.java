package com.example.demo.Controller;

import com.example.demo.Dto.Request.GioHangRequest;
import com.example.demo.Service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/gio-hang")
public class GioHangController {
    @Autowired
    private GioHangService service;

    @GetMapping("/hien-thi")
    public ResponseEntity<?> hienThi(){
        return service.getAll();
    }

//    @PostMapping("/them")
//    public ResponseEntity<?> them(@RequestBody GioHangRequest gioHangRequest){
//        return service.add(gioHangRequest);
//    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody GioHangRequest gioHangRequest){
        return service.update(gioHangRequest);
    }
}
