package com.example.demo.Controller;

import com.example.demo.Dto.Request.HinhAnhRequest;
import com.example.demo.Service.HinhAnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/hinh-anh")
@RestController
public class HinhAnhController {

    @Autowired
    private HinhAnhService hinhAnhService;

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody HinhAnhRequest hinhAnhRequest) {
        return hinhAnhService.add(hinhAnhRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@RequestBody HinhAnhRequest hinhAnhRequest) {
        return hinhAnhService.update(hinhAnhRequest);

    }
}
