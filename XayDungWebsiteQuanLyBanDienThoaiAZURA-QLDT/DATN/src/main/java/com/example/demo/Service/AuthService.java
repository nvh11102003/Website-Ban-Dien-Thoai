package com.example.demo.Service;

import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class AuthService {
    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private EmailService emailService;

    public void guiMatKhauMoi(String email) {
        KhachHang khachHang = khachHangRepository.findByEmailAndMatKhauIsNotNull(email);
        if (khachHang != null) {
            String matKhauMoi = generateRandomNumericPassword(8); // Ví dụ: tạo mật khẩu gồm 8 chữ số

            khachHang.setMatKhau(matKhauMoi);
            khachHangRepository.save(khachHang);

            emailService.sendPasswordResetEmail(khachHang.getEmail(), matKhauMoi);
        } else {
            throw new RuntimeException("Email không tồn tại trong hệ thống");
        }
    }

    private String generateRandomNumericPassword(int length) {
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            sb.append(secureRandom.nextInt(10)); // Sử dụng nextInt để sinh số ngẫu nhiên từ 0 đến 9
        }

        return sb.toString();
    }
}