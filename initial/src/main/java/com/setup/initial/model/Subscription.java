package com.setup.initial.model;

import com.setup.initial.enums.SubscriptionPlan;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "subscription")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Subscription extends BaseModel {

  @Enumerated(EnumType.STRING)
  private SubscriptionPlan plan;
  // MONTHLY, YEARLY
  private LocalDate startDate;
  private LocalDate endDate;
  private Double amount;

  private Boolean active;

  @ManyToOne
  @JoinColumn(name = "driver_id")
  private Driver driver;
}
