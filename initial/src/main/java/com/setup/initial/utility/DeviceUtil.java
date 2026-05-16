package com.setup.initial.utility;

import jakarta.servlet.http.HttpServletRequest;

public class DeviceUtil {

  public static String getBrowser(String userAgent) {
    if (userAgent == null) return "UNKNOWN";
    if (userAgent.contains("Chrome")) return "Chrome";
    if (userAgent.contains("Firefox")) return "Firefox";
    if (userAgent.contains("Safari")) return "Safari";
    return "OTHER";
  }

  public static String getOS(String userAgent) {
    if (userAgent == null) return "UNKNOWN";
    if (userAgent.contains("Windows")) return "Windows";
    if (userAgent.contains("Mac")) return "Mac";
    if (userAgent.contains("Linux")) return "Linux";
    if (userAgent.contains("Android")) return "Android";
    if (userAgent.contains("iPhone")) return "iOS";
    return "OTHER";
  }

  public static String getIp(HttpServletRequest request) {
    String ip = request.getHeader("X-Forwarded-For");
    return (ip == null) ? request.getRemoteAddr() : ip;
  }
}
