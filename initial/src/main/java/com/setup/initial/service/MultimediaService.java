package com.setup.initial.service;

import com.setup.initial.model.Multimedia;
import com.setup.initial.repository.MultimediaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MultimediaService {

  private final MultimediaRepository multimediaRepository;

  private static final String UPLOAD_DIR =
    System.getProperty("user.dir") + "/uploads/";

  public Multimedia uploadFile(MultipartFile file) {

    try {

      // create uploads folder
      Path uploadPath = Paths.get(UPLOAD_DIR);

      if (!Files.exists(uploadPath)) {
        Files.createDirectories(uploadPath);
      }

      // unique file name
      String fileName =
        UUID.randomUUID() + "_" + file.getOriginalFilename();

      // full file path
      Path filePath = uploadPath.resolve(fileName);

      // save file
      Files.copy(file.getInputStream(), filePath);

      // save in db
      Multimedia multimedia = Multimedia.builder()
        .fileName(fileName)
        .fileType(file.getContentType())
        .filePath(filePath.toString())
        .build();

      return multimediaRepository.save(multimedia);

    } catch (IOException e) {

      e.printStackTrace();

      throw new RuntimeException(
        "File upload failed : " + e.getMessage());
    }
  }

  public Multimedia getById(Long id) {

    return multimediaRepository.findById(id)
      .orElseThrow(() ->
        new RuntimeException("Image not found"));
  }
}
