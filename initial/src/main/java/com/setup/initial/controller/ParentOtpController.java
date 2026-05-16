package com.setup.initial.controller;

import com.setup.initial.service.ParentOtpService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/bus/parent")
@RequiredArgsConstructor
public class ParentOtpController {

  private final ParentOtpService parentOtpService;

  @PostMapping("/send-otp")
  public ResponseEntity<String> sendOtp(@RequestParam String mobile) {
    parentOtpService.sendOtp(mobile);
    return ResponseEntity.ok("OTP sent successfully");
  }

  @PostMapping("/verify-otp")
  public ResponseEntity<String> verifyOtp(
    @RequestParam String mobile,
    @RequestParam String otp) {

    parentOtpService.verifyOtp(mobile, otp);
    return ResponseEntity.ok("Login successful");
  }
}

