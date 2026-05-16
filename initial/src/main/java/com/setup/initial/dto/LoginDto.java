package com.setup.initial.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDto {
    private String mobile;
    private String password;

  // 🔥 Device info from frontend
  private String deviceName;   // WEB / ANDROID / IOS
  private String os;           // Windows / Android / iOS
  private String browser;      // Chrome / Firefox / App
  private String ipAddress;    // optional
  private Double latitude;     // optional
  private Double longitude;    // optional
}
