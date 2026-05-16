package com.setup.initial.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(MaxUploadSizeExceededException.class)
  public ResponseEntity<?> handleMaxUploadException(
    MaxUploadSizeExceededException ex) {

    Map<String, Object> map = new HashMap<>();

    map.put("statusCode", 400);
    map.put("message", "Image size exceeded. Please upload file below 100MB");
    map.put("data", null);

    return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
  }
}
