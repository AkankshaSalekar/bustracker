package com.setup.initial.model;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "tracking_log")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrackingLog extends BaseModel {

  private Double latitude;
  private Double longitude;

  private LocalDateTime trackedAt;

  @ManyToOne
  @JoinColumn(name = "driver_id")
  private Driver driver;
}
