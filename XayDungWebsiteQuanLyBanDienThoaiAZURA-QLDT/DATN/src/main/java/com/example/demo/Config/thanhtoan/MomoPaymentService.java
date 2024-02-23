package com.example.demo.Config.thanhtoan;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MomoPaymentService {
    public ResultMoMo initiateMoMoPayment(MomoModel paymentRequest) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("accessKey", Constant.accessKey);
        headers.set("secretKey", Constant.serectkey);

        HttpEntity<MomoModel> entity = new HttpEntity<>(paymentRequest, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResultMoMo> response = restTemplate.exchange(Constant.Url, HttpMethod.POST, entity, ResultMoMo.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        } else {
            // Xử lý lỗi khi gọi MoMo API không thành công
            return null;
        }
    }
}
