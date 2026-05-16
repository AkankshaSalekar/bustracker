package com.setup.initial.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "role")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Role extends BaseModel {

  private String name;

  // Prevent infinite recursion
  @Builder.Default
  @ManyToMany(mappedBy = "roles")
  @JsonIgnore
  private Set<User> users = new HashSet<>();

  @Builder.Default
  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(
    name = "role_privileges",
    joinColumns = @JoinColumn(name = "role_id"),
    inverseJoinColumns = @JoinColumn(name = "privilege_id")
  )
  private Set<Privilege> privileges = new HashSet<>();

  @PrePersist
  public void initDefaults() {
    if (users == null) {
      users = new HashSet<>();
    }
    if (privileges == null) {
      privileges = new HashSet<>();
    }
  }
}
