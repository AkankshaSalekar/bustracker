package com.setup.initial.service;

import com.setup.initial.model.OtpVerification;
import com.setup.initial.repository.OtpRepository;
import com.setup.initial.repository.ParentRepository;
import com.setup.initial.utility.OtpUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ParentOtpService {

  private final ParentRepository parentRepository;
  private final OtpRepository otpRepository;
  private final OtpUtil otpUtil;
  private final SmsService smsService;


  public void sendOtp(String mobile) {

    parentRepository.findByMobile(mobile)
      .orElseThrow(() -> new RuntimeException("MOBILE NUMBER NOT REGISTERED"));

    String otp = otpUtil.generateOtp();

    OtpVerification otpEntity = new OtpVerification();
    otpEntity.setMobile(mobile);
    otpEntity.setOtp(otp);
    otpEntity.setExpiryTime(LocalDateTime.now().plusMinutes(5));

    otpRepository.save(otpEntity);

    smsService.sendOtpSms(mobile, otp);
  }

  public void verifyOtp(String mobile, String otp) {

    OtpVerification record = otpRepository
      .findTopByMobileOrderByCreatedAtDesc(mobile)
      .orElseThrow(() -> new RuntimeException("OTP not found"));

    if (record.getExpiryTime().isBefore(LocalDateTime.now())) {
      throw new RuntimeException("OTP expired");
    }

    if (!record.getOtp().equals(otp)) {
      throw new RuntimeException("Invalid OTP");
    }

    record.setVerified(true);
    otpRepository.save(record);
  }
}
