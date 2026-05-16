package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "parent")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Parent extends BaseModel {

  private String name;
  @Column(name = "mobile", unique = true, nullable = false, length = 10)
  private String mobile;
  private String email;

  @OneToOne
  @JoinColumn(name = "user_id")
  private User user;
}
