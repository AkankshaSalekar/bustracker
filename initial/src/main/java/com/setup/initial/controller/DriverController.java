package com.setup.initial.controller;

import com.setup.initial.dto.DriverRegisterRequestDTO;
import com.setup.initial.model.Driver;
import com.setup.initial.serviceImpl.DriverServiceImp;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/driver")
@RequiredArgsConstructor
public class DriverController {

  private final DriverServiceImp driverServiceImp;

  @PostMapping("/register")
  public ResponseEntity<?> registerDriver(@RequestBody DriverRegisterRequestDTO dto){
    return ResponseEntity.ok(driverServiceImp.registerDriver(dto));
  }

  @GetMapping("/getList")
  public ResponseEntity<List<Driver>> getAllDriver(){
    return ResponseEntity.ok(driverServiceImp.getAllDriver());
  }


  @GetMapping("/getById/{id}")
  public ResponseEntity<Driver> getDriverById(@PathVariable Long id){
    return ResponseEntity.ok(driverServiceImp.getDriverById(id));
  }

  @PutMapping("/updateById/{id}")
  public ResponseEntity<String> updateDriver(
    @PathVariable Long id,
    @RequestBody DriverRegisterRequestDTO dto) {

    return ResponseEntity.ok(driverServiceImp.updateDriver(id, dto));
  }

  @DeleteMapping("/deleteById/{id}")
  public ResponseEntity<String> deleteDriver(@PathVariable Long id) {
    return ResponseEntity.ok(driverServiceImp.deleteDriver(id));
  }


}
