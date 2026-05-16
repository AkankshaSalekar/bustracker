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


  @GetMapping("/all")
  public ResponseEntity<?> getAllStudents(){

    return ResponseEntity.ok(
      studentService.getAllStudents());
  }

  @GetMapping("/driver/{driverId}")
  public ResponseEntity<?> getStudentsByDriverId(
    @PathVariable Long driverId){

    return ResponseEntity.ok(
      studentService
        .getStudentsByDriverId(driverId));
  }

  @GetMapping("/{studentId}")
  public ResponseEntity<?> getStudentById(
    @PathVariable Long studentId){

    return ResponseEntity.ok(
      studentService
        .getStudentById(studentId));
  }

  @GetMapping("/{driverId}/{studentId}")
  public ResponseEntity<?> getStudentByDriverAndStudentId(
    @PathVariable Long driverId,
    @PathVariable Long studentId){

    return ResponseEntity.ok(
      studentService
        .getStudentByDriverAndStudentId(
          driverId,
          studentId));
  }

  @PutMapping("/update/{studentId}")
  public ResponseEntity<?> updateStudent(
    @PathVariable Long studentId,
    @ModelAttribute Studentdto dto){

    return ResponseEntity.ok(
      studentService
        .updateStudent(studentId, dto));
  }

  @DeleteMapping("/{driverId}/{studentId}")
  public ResponseEntity<?> deleteStudent(
    @PathVariable Long driverId,
    @PathVariable Long studentId){

    return ResponseEntity.ok(
      studentService.deleteStudent(
        driverId,
        studentId));
  }

}
