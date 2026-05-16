package com.setup.initial.dto;

import lombok.Data;

import java.util.List;

@Data
public class DriverRegisterRequestDTO {
  //User Details
  private  String firstName;
  private String middleName;
  private String lastName;
  private String email;
  private String phoneNumber;
  private String password;

  //Driver Details
  private String licenseNumber;
  private String vehicleNumber;
  private String vehicleType;
  private String capacity;

  // 🕒 SCHEDULES
  private List<DriverScheduleDTO> schedules;
}
