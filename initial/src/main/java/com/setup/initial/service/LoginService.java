package com.setup.initial.service;

import com.setup.initial.dto.LoginDto;
import com.setup.initial.dto.ApplicationResponseDto;

public interface LoginService {
    ApplicationResponseDto login(LoginDto loginDto);
  ApplicationResponseDto logout(Long userId);
}
