package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_device_session")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDeviceSession {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  private String deviceName;
  private String os;
  private String browser;

  private String ipAddress;
  private Double latitude;
  private Double longitude;

  private LocalDateTime loginTime;
  private LocalDateTime logoutTime;
}
