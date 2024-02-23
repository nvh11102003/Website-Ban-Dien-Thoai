package com.example.demo.Service;

import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.KhachHangRepository;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private KhachHangRepository khachHangRepository;

    public void sendPasswordResetEmail(String recipientEmail, String newPassword) {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        try {
            helper.setTo(recipientEmail);
            helper.setSubject("Đặt Lại Mật Khẩu");
            helper.setText("Mật khẩu mới của bạn là: " + newPassword);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public void sendRegistrationSuccessEmail(String recipientEmail) {
        try {
            KhachHang khachHang = khachHangRepository.findByEmailAndMatKhauIsNotNull(recipientEmail);

            if (khachHang != null) {
                String email = khachHang.getEmail();
                String matKhau = khachHang.getMatKhau();

                MimeMessage message = javaMailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true);

                helper.setTo(email);
                helper.setSubject("Đăng ký thành công");
                helper.setText("Chào bạn,\n\nBạn đã đăng ký thành công tài khoản. Email của bạn là: " + email + " và mật khẩu là: " + matKhau);

                javaMailSender.send(message);
                System.out.println("Gửi email thành công!");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
