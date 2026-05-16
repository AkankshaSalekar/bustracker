package com.setup.initial.controller;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.RouteCreateDTO;
import com.setup.initial.model.Route;
import com.setup.initial.service.RouteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/bus/routes")
@RequiredArgsConstructor
public class RouteController {

  private final RouteService routeService;

  @PostMapping("/save")
  public ResponseEntity<ApplicationResponseDto> createRoute(
    @RequestBody RouteCreateDTO routeCreateDTO) {

    ApplicationResponseDto response = routeService.createRoute(routeCreateDTO);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }


}
