package com.setup.initial.dto;

import com.setup.initial.enums.TimeSlot;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
public class RouteCreateDTO {

  private String routeName;
  private String startLocation;
  private String endLocation;

  private Double totalDistanceKm;
  private Integer estimatedDurationMin;

  private TimeSlot timeSlot;
  private LocalTime scheduledStartTime;

  private Long driverId;
}
