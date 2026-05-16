package com.setup.initial.controller;

import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.UserDTO;
import com.setup.initial.dto.UserResponseDTO;
import com.setup.initial.exception.ApplicationException;
import com.setup.initial.service.UserService;
import com.setup.initial.utility.ResponseUtility;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping
    @RequestMapping("/save")
    public ApplicationResponseDto create(@RequestBody UserDTO dto) throws ApplicationException {
        return ResponseUtility.response(userService.create(dto),"Saved successful.");
    }

    @GetMapping("/{id}")
    public ApplicationResponseDto getById(@PathVariable Long id) {
        return ResponseUtility.response(userService.getById(id),"Fetched successful.");
    }
}

