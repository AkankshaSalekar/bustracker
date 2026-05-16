package com.setup.initial.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
public class SmsService {

  @Value("${fast2sms.api.key}")
  private String apiKey;

  @Value("${fast2sms.api.url}")
  private String apiUrl;

  private final RestTemplate restTemplate = new RestTemplate();

  public void sendOtpSms(String mobile, String otp) {

    String url = apiUrl +
      "?authorization=" + apiKey +
      "&route=otp" +
      "&variables_values=" + otp +
      "&numbers=" + mobile;

    try {
      ResponseEntity<String> response =
        restTemplate.getForEntity(url, String.class);

      if (!response.getStatusCode().is2xxSuccessful()) {
        throw new RuntimeException("SMS sending failed");
      }

    } catch (Exception e) {
      throw new RuntimeException("Fast2SMS Authentication Failed. Check API Key.");
    }
  }
}
