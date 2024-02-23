package com.example.demo.Config;

import com.example.demo.Config.thanhtoan.Constant;
import com.example.demo.Config.thanhtoan.Decode;
import com.example.demo.Config.thanhtoan.MomoModel;
import com.example.demo.Config.thanhtoan.ResultMoMo;
import com.example.demo.Entity.GiaoDichVi;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Entity.ViShop;
import com.example.demo.Repository.GioHangRepository;
import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Repository.NhanVienRepository;
import com.example.demo.Repository.vi.GiaoDichViRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.KhachHangService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;


@Controller
public class NapTienController {
    @Autowired
    KhachHangService khachHangService;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    NhanVienRepository nhanVienRepository;

    @Autowired
    ViShopRepository viShopRepository;

    @Autowired
    GiaoDichViRepository giaoDichViRepository;

    @Autowired
    GioHangRepository gioHangRepository;

    @PostMapping("/user/nap_tien/*")
    public String userNapTien(HttpSession session, HttpServletRequest request) throws IOException, URISyntaxException {

        String url = request.getRequestURI();
        String[] p = url.split("/user/nap_tien/");
        String maKh = p[1];

        KhachHang kh = khachHangRepository.getReferenceById(Long.parseLong(maKh));

        ViShop v = viShopRepository.getByKhachHang_MaKhachHang(kh.getMaKhachHang());

        LocalDateTime now = LocalDateTime.now();

        String soTien = request.getParameter("soTien");

        BigDecimal soTienBig = new BigDecimal(soTien);

        GiaoDichVi giaoDichVi = new GiaoDichVi();

        giaoDichVi.setMa("GDV" + now.getMonthValue() + now.getDayOfMonth() + now.getHour() + now.getMinute() + now.getSecond());
        giaoDichVi.setViShop(v);
        giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
        giaoDichVi.setDonGia(soTienBig);
        giaoDichVi.setHinhThuc(0);
        giaoDichVi.setTrangThai(0);
        giaoDichVi.setNhanVien(nhanVienRepository.getReferenceById(1L));

        giaoDichViRepository.save(giaoDichVi);

        ObjectMapper mapper = new ObjectMapper();
        String orderId = giaoDichVi.getMa();
        MomoModel jsonRequest = new MomoModel();
        jsonRequest.setPartnerCode(Constant.IDMOMO);
        jsonRequest.setOrderId(orderId);
        jsonRequest.setStoreId(orderId);
        jsonRequest.setRedirectUrl(Constant.redirectUrl);
        jsonRequest.setIpnUrl(Constant.ipnUrl);
        jsonRequest.setAmount(soTien);
        jsonRequest.setOrderInfo("Nạp tiền vào ví");
        jsonRequest.setRequestId(orderId);
        jsonRequest.setOrderType(Constant.orderType);
        jsonRequest.setRequestType(Constant.requestType);
        jsonRequest.setTransId("1");
        jsonRequest.setResultCode("200");
        jsonRequest.setMessage("");
        jsonRequest.setPayType(Constant.payType);
        jsonRequest.setResponseTime("300000");
        jsonRequest.setExtraData("");

        String decode = "accessKey=" + Constant.accessKey + "&amount=" + jsonRequest.amount + "&extraData="
                + jsonRequest.extraData + "&ipnUrl=" + Constant.ipnUrl + "&orderId=" + orderId + "&orderInfo="
                + jsonRequest.orderInfo + "&partnerCode=" + jsonRequest.getPartnerCode() + "&redirectUrl="
                + Constant.redirectUrl + "&requestId=" + jsonRequest.getRequestId() + "&requestType="
                + Constant.requestType;


        String signature = Decode.encode(Constant.serectkey, decode);
        jsonRequest.setSignature(signature);
        String json = mapper.writeValueAsString(jsonRequest);
        HttpClient client = HttpClient.newHttpClient();
        ResultMoMo res = new ResultMoMo();

        try {
            HttpRequest requestMomo = HttpRequest.newBuilder().uri(new URI(Constant.Url))
                    .POST(HttpRequest.BodyPublishers.ofString(json)).headers("Content-Type", "application/json")
                    .build();
            HttpResponse<String> response = client.send(requestMomo, HttpResponse.BodyHandlers.ofString());
            res = mapper.readValue(response.body(), ResultMoMo.class);
        } catch (InterruptedException | URISyntaxException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (res == null) {

            session.setAttribute("error_momo", "Thanh toán thất bại");
            return "redirect:/home";

        } else {
            return "redirect:" + res.payUrl;
        }
    }

    @GetMapping("/paywithmomo/*")
    public String thanhCongMomo(HttpSession session, Model model, HttpServletRequest request,
                                @CookieValue("makhachhang") Long makhachhang,
                                @RequestParam(value = "orderId", required = false) String orderId,
                                @RequestParam(value = "message", required = false) String message) {
        System.out.println("orderId la :" + orderId);
        KhachHang user = khachHangRepository.getReferenceById(makhachhang);

        if (orderId.contains("GDV")) {
            GiaoDichVi giaoDichVi = giaoDichViRepository.getByMa(orderId);
            if (message.equals("Successful.")) {
                ViShop viShop = viShopRepository.getByKhachHang(user);
                viShop.setTongTien(BigDecimal.valueOf(Double.parseDouble(String.valueOf(viShop.getTongTien()))+Double.parseDouble(String.valueOf(giaoDichVi.getDonGia()))));
                viShop.setTrangThai(1);
                viShopRepository.save(viShop);

                giaoDichVi.setNgayGiaoDich(LocalDateTime.now());
                giaoDichVi.setHinhThuc(0);
                giaoDichVi.setTrangThai(1);
                giaoDichViRepository.save(giaoDichVi);

                session.setAttribute("napThanhCong", "2");

                return "redirect:/MyAccount/" + user.getMaKhachHang();
            } else {
                session.setAttribute("napThatBai", "2");
                return "redirect:/MyAccount/" + user.getMaKhachHang();
            }
        }
        return null;
    }
}
