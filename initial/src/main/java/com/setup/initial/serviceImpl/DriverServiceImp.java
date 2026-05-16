package com.setup.initial.serviceImpl;

import com.setup.initial.dto.DriverRegisterRequestDTO;
import com.setup.initial.model.Driver;
import com.setup.initial.model.DriverSchedule;
import com.setup.initial.model.Role;
import com.setup.initial.model.User;
import com.setup.initial.repository.DriverRepository;
import com.setup.initial.repository.RoleRepository;
import com.setup.initial.repository.UserRepository;
import com.setup.initial.service.DriverService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalTime;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class DriverServiceImp implements DriverService {
  private final UserRepository userRepository;
  private final RoleRepository roleRepository;
  private final DriverRepository driverRepository;
  private final PasswordEncoder passwordEncoder;

  @Transactional
  public  String registerDriver(DriverRegisterRequestDTO dto){

    if(userRepository.findByEmail(dto.getEmail()).isPresent()){
      throw new RuntimeException("EMAIL ALREADY REGISTERED");
    }
    Role driverRole = roleRepository.findByName("DRIVER")
      .orElseThrow(() -> new RuntimeException("ROLE IS NOT FOUND"));

    User user = User.builder()
      .firstName(dto.getFirstName())
      .middleName(dto.getMiddleName())
      .lastName(dto.getLastName())
      .email(dto.getEmail())
      .phoneNumber(dto.getPhoneNumber())
      .password(passwordEncoder.encode(dto.getPassword()))

      .roles(Set.of(driverRole))
      .build();

    User saveUser = userRepository.save(user);

    Driver driver =Driver.builder()
      .licenseNumber(dto.getLicenseNumber())
      .vehicleNumber(dto.getVehicleNumber())
      .vehicleType(dto.getVehicleType())
      .capacity(Integer.valueOf(dto.getCapacity()))
      .user(saveUser)
      .build();

    // ✅ CREATE & ATTACH SCHEDULES
    List<DriverSchedule> schedules = dto.getSchedules().stream()
      .map(s -> DriverSchedule.builder()
        .scheduleType(s.getScheduleType())
        .startTime(LocalTime.parse(s.getStartTime()))
        .endTime(LocalTime.parse(s.getEndTime()))
        .driver(driver) // important
        .build()
      ).toList();

    // 🔥 THIS LINE WAS MISSING
    driver.setSchedules(schedules);

    driverRepository.save(driver);

    return "Driver registered successfully.";
  }

  @Override
  public List<Driver> getAllDriver() {
    return driverRepository.findAll();
  }

  @Override
  public Driver getDriverById(Long id) {
    return driverRepository.findById(id).orElseThrow(() -> new RuntimeException("DRIVER IS NOT FOUND"));
  }
  @Transactional
  public String updateDriver(Long driverId, DriverRegisterRequestDTO dto) {

    Driver driver = driverRepository.findById(driverId)
      .orElseThrow(() -> new RuntimeException("Driver not found"));

    driver.setVehicleNumber(dto.getVehicleNumber());
    driver.setVehicleType(dto.getVehicleType());
    driver.setCapacity(Integer.valueOf(dto.getCapacity()));

    // 🧹 REMOVE OLD SCHEDULES
    driver.getSchedules().clear();

    // ➕ ADD NEW SCHEDULES
    List<DriverSchedule> schedules = dto.getSchedules().stream()
      .map(s -> DriverSchedule.builder()
        .scheduleType(s.getScheduleType())
        .startTime(LocalTime.parse(s.getStartTime()))
        .endTime(LocalTime.parse(s.getEndTime()))
        .driver(driver)
        .build()
      ).toList();

    driver.getSchedules().addAll(schedules);

    driverRepository.save(driver);

    return "Driver updated successfully";
  }

  @Transactional
  public String deleteDriver(Long id) {

    Driver driver = driverRepository.findById(id)
      .orElseThrow(() -> new RuntimeException("Driver not found"));

    driverRepository.delete(driver);

    return "Driver deleted successfully";
  }


}
