package com.setup.initial.service;

import com.setup.initial.model.Driver;

import java.util.List;

public interface DriverService {

  public List<Driver> getAllDriver();

  public Driver getDriverById(Long id);
}
