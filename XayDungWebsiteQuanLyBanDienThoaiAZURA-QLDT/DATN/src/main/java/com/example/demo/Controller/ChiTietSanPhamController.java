package com.example.demo.Controller;

import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Service.ChiTietSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


//@RestController
@Controller
// @RequestMapping("chitietsanpham")
public class ChiTietSanPhamController {

    @Autowired
    private ChiTietSanPhamService service;

    @GetMapping("/hien-thi1")
//    public ResponseEntity<?> hienThi1(Model model) {
//        List<ChiTietSanPham> chiTietSanPhamList = service.hienThi();
//        model.addAttribute("ctsp", chiTietSanPhamList);
//        return ResponseEntity.ok("src/main/webapp/WEB-INF/views/index.jsp");
//    }
    public String hienThi1(Model model) {
        List<ChiTietSanPham> chiTietSanPhamList = service.hienThi();
        model.addAttribute("ctsp", chiTietSanPhamList);
        return "index";
    }


}
