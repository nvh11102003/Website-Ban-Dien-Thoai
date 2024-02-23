package com.example.demo.Controller;

import com.example.demo.Dto.Request.NSXRequest;
import com.example.demo.Entity.NSX;
import com.example.demo.Service.NSXService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpRequest;

@RequestMapping("/nsx")
@RestController
public class NSXController {

    @Autowired
    private NSXService service;

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody NSXRequest nsxRequest){
        return service.add(nsxRequest);
    }

    @PutMapping("/sua")
    public ResponseEntity<?> sua(@Validated NSXRequest nsxRequest){
        return service.update(nsxRequest);
    }
    @DeleteMapping("/xoa/{id}")
    public ResponseEntity<?> xoa(@PathVariable("id") Long id){
        return service.xoa(id);
    }
}
