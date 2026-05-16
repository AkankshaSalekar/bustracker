package com.setup.initial.model;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

import java.time.LocalTime;

@Entity
@Table(name = "route_stop")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RouteStop extends BaseModel{

  private String stopName;

  private Double latitude;
  private Double longitude;

  private Integer stopOrder;

  private LocalTime expectedPickupTime;

  @ManyToOne
  @JoinColumn(name = "route_id")
  private Route route;
}
