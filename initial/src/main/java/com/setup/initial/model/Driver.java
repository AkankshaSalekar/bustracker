package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "driver")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Driver extends BaseModel {

  private String licenseNumber;

  private String vehicleNumber;
  private String vehicleType; // BUS / VAN
  private Integer capacity;

  @Builder.Default
  private Boolean approved = false;

  @OneToOne
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Builder.Default
  @OneToMany(
    mappedBy = "driver",
    cascade = CascadeType.ALL,
    orphanRemoval = true
  )
  private List<DriverSchedule> schedules = new ArrayList<>();

  @PrePersist
  public void setDefaults() {
    if (approved == null) {
      approved = false;
    }
    if (schedules == null) {
      schedules = new ArrayList<>();
    }
  }
}

