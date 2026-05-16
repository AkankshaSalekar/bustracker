package com.setup.initial.model;

import com.setup.initial.enums.ScheduleType;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalTime;

@Entity
@Table(name = "driver_schedule")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DriverSchedule extends BaseModel {

  @Enumerated(EnumType.STRING)
  private ScheduleType scheduleType; // MORNING / AFTERNOON / EVENING

  private LocalTime startTime;
  private LocalTime endTime;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "driver_id", nullable = false)
  private Driver driver;
}
