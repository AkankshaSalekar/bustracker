package com.setup.initial.dto;


import lombok.Data;

@Data
public class StudentResponseDto {

  private Long studentId;

  private String studentName;

  private String schoolName;

  private String parentName;
}
