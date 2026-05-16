package com.setup.initial.service;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.StudentResponseDto;
import com.setup.initial.dto.Studentdto;
import com.setup.initial.model.*;
import com.setup.initial.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
@RequiredArgsConstructor
public class StudentService {

  private final StudentRepository studentRepository;
  private final ParentRepository parentRepository;
  private final DriverRepository driverRepository;
  private final UserRepository userRepository;
  private final RoleRepository roleRepository;
  private final PasswordEncoder passwordEncoder;
  private final MultimediaService multimediaService;

  @Transactional
  public ApplicationResponseDto createStudent(Studentdto dto){

    Driver driver = driverRepository.findById(dto.getDriverId())
      .orElseThrow(() ->
        new RuntimeException("Driver not found"));

    // email validation
    if(userRepository.existsByEmail(
      dto.getParentEmail())) {

      throw new RuntimeException(
        "Parent email already registered");
    }

    // mobile validation
    if(parentRepository.existsByMobile(
      dto.getParentMobile())) {

      throw new RuntimeException(
        "Parent mobile already registered");
    }

    // role fetch
    Role parentRole = roleRepository
      .findByName("PARENT")
      .orElseThrow(() ->
        new RuntimeException(
          "Parent role not found"));

    // create user
    User parentUser = User.builder()
      .firstName(dto.getParentName())
      .email(dto.getParentEmail())
      .phoneNumber(dto.getParentMobile())
      .password(passwordEncoder.encode(
        dto.getParentPassword()))
      .roles(Set.of(parentRole))
      .build();

    User savedUser =
      userRepository.save(parentUser);

    // create parent
    Parent parent = Parent.builder()
      .name(dto.getParentName())
      .mobile(dto.getParentMobile())
      .email(dto.getParentEmail())
      .user(savedUser)
      .build();

    Parent savedParent =
      parentRepository.save(parent);

    // image upload
    Multimedia media = null;

    if(dto.getImage() != null &&
      !dto.getImage().isEmpty()) {

      media = multimediaService
        .uploadFile(dto.getImage());

    } else if(dto.getMultimediaId() != null){

      media = multimediaService
        .getById(dto.getMultimediaId());
    }

    // create student
    Student student = Student.builder()
      .name(dto.getStudentName())
      .schoolName(dto.getSchoolName())
      .address(dto.getAddress())
      .pickupLat(dto.getPickupLat())
      .pickupLng(dto.getPickupLng())
      .pickupTime(dto.getPickupTime())
      .dropTime(dto.getDropTime())
      .monthlyFees(dto.getMonthlyFees())
      .vehicleSeatNo(dto.getVehicleSeatNo())
      .driver(driver)
      .parent(savedParent)
      .image(media)
      .build();

    Student savedStudent =
      studentRepository.save(student);

    // custom response dto
    StudentResponseDto responseDto =
      new StudentResponseDto();

    responseDto.setStudentId(
      savedStudent.getId());

    responseDto.setStudentName(
      savedStudent.getName());

    responseDto.setSchoolName(
      savedStudent.getSchoolName());

    responseDto.setParentName(
      savedParent.getName());

    // final response
    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage(
      "Student created successfully");
    response.setData(responseDto);

    return response;
  }


  public ApplicationResponseDto getAllStudents() {

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage("All students fetched");
    response.setData(studentRepository.findAll());

    return response;
  }
  public ApplicationResponseDto getStudentsByDriverId(Long driverId) {

    Driver driver = driverRepository.findById(driverId)
      .orElseThrow(() ->
        new RuntimeException("Driver not found"));

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage("Students fetched successfully");
    response.setData(
      studentRepository.findByDriver(driver));

    return response;
  }
  public ApplicationResponseDto getStudentById(Long studentId) {

    Student student = studentRepository.findById(studentId)
      .orElseThrow(() ->
        new RuntimeException("Student not found"));

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage("Student fetched successfully");
    response.setData(student);

    return response;
  }

  public ApplicationResponseDto getStudentByDriverAndStudentId(
    Long driverId,
    Long studentId) {

    Student student =
      studentRepository
        .findByIdAndDriverId(
          studentId,
          driverId)
        .orElseThrow(() ->
          new RuntimeException(
            "Student not found"));

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage("Student fetched successfully");
    response.setData(student);

    return response;
  }

  @Transactional
  public ApplicationResponseDto deleteStudent(
    Long driverId,
    Long studentId) {

    Student student =
      studentRepository
        .findByIdAndDriverId(
          studentId,
          driverId)
        .orElseThrow(() ->
          new RuntimeException(
            "Student not found"));

    studentRepository.delete(student);

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage(
      "Student deleted successfully");

    return response;
  }

  @Transactional
  public ApplicationResponseDto updateStudent(
    Long studentId,
    Studentdto dto) {

    Student student =
      studentRepository.findById(studentId)
        .orElseThrow(() ->
          new RuntimeException(
            "Student not found"));

    if(dto.getStudentName() != null) {
      student.setName(dto.getStudentName());
    }

    if(dto.getSchoolName() != null) {
      student.setSchoolName(dto.getSchoolName());
    }

    if(dto.getAddress() != null) {
      student.setAddress(dto.getAddress());
    }

    if(dto.getPickupLat() != null) {
      student.setPickupLat(dto.getPickupLat());
    }

    if(dto.getPickupLng() != null) {
      student.setPickupLng(dto.getPickupLng());
    }

    if(dto.getPickupTime() != null) {
      student.setPickupTime(dto.getPickupTime());
    }

    if(dto.getDropTime() != null) {
      student.setDropTime(dto.getDropTime());
    }

    if(dto.getMonthlyFees() != null) {
      student.setMonthlyFees(dto.getMonthlyFees());
    }

    if(dto.getVehicleSeatNo() != null) {
      student.setVehicleSeatNo(
        dto.getVehicleSeatNo());
    }

    // update image
    if(dto.getImage() != null &&
      !dto.getImage().isEmpty()) {

      Multimedia media =
        multimediaService
          .uploadFile(dto.getImage());

      student.setImage(media);
    }

    Student updatedStudent =
      studentRepository.save(student);

    ApplicationResponseDto response =
      new ApplicationResponseDto();

    response.setStatusCode(200);
    response.setMessage(
      "Student updated successfully");
    response.setData(updatedStudent);

    return response;
  }

}
