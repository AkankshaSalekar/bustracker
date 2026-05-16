package com.setup.initial.service;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.RouteCreateDTO;
import com.setup.initial.model.Driver;
import com.setup.initial.model.Route;
import com.setup.initial.repository.DriverRepository;
import com.setup.initial.repository.RouteRepository;
import com.setup.initial.utility.ResponseUtility;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RouteService {

  private final RouteRepository routeRepository;
  private final DriverRepository driverRepository;

  public ApplicationResponseDto createRoute(RouteCreateDTO dto) {

    Driver driver = driverRepository.findById(dto.getDriverId())
      .orElseThrow(() -> new RuntimeException("DRIVER NOT FOUND"));

    Route route = Route.builder()
      .routeName(dto.getRouteName())
      .startLocation(dto.getStartLocation())
      .endLocation(dto.getEndLocation())
      .totalDistanceKm(dto.getTotalDistanceKm())
      .estimatedDurationMin(dto.getEstimatedDurationMin())
      .timeSlot(dto.getTimeSlot())
      .scheduledStartTime(dto.getScheduledStartTime())
      .driver(driver)
      .build();

    Route savedRoute = routeRepository.save(route);

    return ResponseUtility.response(
      savedRoute,
      "Route created successfully",
      HttpStatus.CREATED.value()
    );
  }


}
