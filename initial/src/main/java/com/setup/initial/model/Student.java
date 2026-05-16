package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "student")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Student extends BaseModel {

  private String name;

  private String schoolName;

  private String address;

  private Double pickupLat;

  private Double pickupLng;

  private String pickupTime;

  private String dropTime;

  private Double monthlyFees;

  private String vehicleSeatNo;

  @ManyToOne
  @JoinColumn(name = "driver_id")
  private Driver driver;

  @ManyToOne
  @JoinColumn(name = "parent_id")
  private Parent parent;

  @ManyToOne
  @JoinColumn(name = "multimedia_id")
  private Multimedia image;
}
