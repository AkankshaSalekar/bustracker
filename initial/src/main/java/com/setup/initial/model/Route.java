package com.setup.initial.model;

import com.setup.initial.enums.TimeSlot;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalTime;

@Entity
@Table(name = "route")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Route extends BaseModel {



  @Column(nullable = false)
  private String routeName;         // "Sinhgad Road"

  @Column(nullable = false)
  private String startLocation;     // "Vadgaon Bridge"

  @Column(nullable = false)
  private String endLocation;       // "School Campus"

  private Double totalDistanceKm;   // 14.5

  private Integer estimatedDurationMin; // 45

  @Enumerated(EnumType.STRING)
  private TimeSlot timeSlot;        // MORNING / EVENING

  private LocalTime scheduledStartTime;

  @ManyToOne
  @JoinColumn(name = "driver_id")
  private Driver driver;
}
