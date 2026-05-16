package com.setup.initial.dto;

import com.setup.initial.enums.ScheduleType;
import lombok.Data;

@Data
public class DriverScheduleDTO {

  private ScheduleType scheduleType;
  private String startTime; // "06:00"
  private String endTime;   // "10:00"
}

