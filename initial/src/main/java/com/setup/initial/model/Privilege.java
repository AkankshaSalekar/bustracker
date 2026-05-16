package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "privilege")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Privilege extends BaseModel {

  private String name;

  @ManyToMany(mappedBy = "privileges")
  private Set<Role> roles = new HashSet<>();
}

