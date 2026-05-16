package com.setup.initial.controller;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.Studentdto;
import com.setup.initial.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/students")
@RequiredArgsConstructor
public class
StudentController {

  private final StudentService studentService;

  @PostMapping(
    value = "/create",
    consumes = MediaType.MULTIPART_FORM_DATA_VALUE
  )
  public ResponseEntity<ApplicationResponseDto>
  createStudent(
    @ModelAttribute Studentdto dto) {

    return ResponseEntity.ok(
      studentService.createStudent(dto));
  }


}
