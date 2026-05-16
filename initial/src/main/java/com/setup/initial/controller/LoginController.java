package com.setup.initial.controller;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.LoginDto;
import com.setup.initial.service.LoginService;
import com.setup.initial.utility.ResponseUtility;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/login")
@CrossOrigin
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @PostMapping
    @Operation(summary = "Login user by email and password", description = "Login user")
    public ApplicationResponseDto login(@RequestBody LoginDto loginDto) {
        return loginService.login(loginDto);
    }
}

