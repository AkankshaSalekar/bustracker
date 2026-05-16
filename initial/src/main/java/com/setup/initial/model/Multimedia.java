package com.setup.initial.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "multimedia")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Multimedia extends BaseModel {

  private String fileName;

  private String fileType;

  @Lob
  @Column(columnDefinition = "LONGTEXT")
  private String filePath;
}
