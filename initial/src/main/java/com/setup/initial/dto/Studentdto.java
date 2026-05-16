package com.setup.initial.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class Studentdto {

  // Student
  private String studentName;
  private String schoolName;
  private String address;
  private Double pickupLat;
  private Double pickupLng;
  private String pickupTime;
  private String dropTime;
  private Double monthlyFees;

  // Parent
  private String parentName;
  private String parentMobile;
  private String parentEmail;
  private String parentPassword;

  // Driver
  private Long driverId;

  private String vehicleSeatNo;

  private Long multimediaId; // for existing image

  // OR for upload
  private MultipartFile image;
}
