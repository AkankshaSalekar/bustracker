package com.setup.initial.serviceImpl;

import com.setup.initial.dto.LoginDto;
import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.dto.LoginResponseDTO;
import com.setup.initial.model.Role;
import com.setup.initial.model.User;
import com.setup.initial.model.UserDeviceSession;
import com.setup.initial.repository.UserDeviceSessionRepository;
import com.setup.initial.repository.UserRepository;
import com.setup.initial.service.LoginService;
import com.setup.initial.utility.DeviceUtil;
import com.setup.initial.utility.ResponseUtility;
import com.setup.initial.config.JwtService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    private final UserDeviceSessionRepository sessionRepository;
    private final HttpServletRequest request;

  @Override
  @Transactional
  public ApplicationResponseDto login(LoginDto loginDto) {

    User user = userRepository.findByPhoneNumber(loginDto.getMobile())
      .orElseThrow(() -> new RuntimeException("Invalid mobile or password"));

    if (!passwordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
      throw new RuntimeException("Invalid email or password");
    }

    // 🔥 Generate token using mobile
    String token = jwtService.generateToken(user.getPhoneNumber());

    // ===== DEVICE & LOGIN TRACKING (FROM FRONTEND) =====
    UserDeviceSession session = UserDeviceSession.builder()
      .user(user)
      .deviceName(loginDto.getDeviceName())       // 🔥 from FE
      .os(loginDto.getOs())                       // 🔥 from FE
      .browser(loginDto.getBrowser())             // 🔥 from FE
      .ipAddress(
        loginDto.getIpAddress() != null
          ? loginDto.getIpAddress()
          : DeviceUtil.getIp(request)
      )
      .latitude(loginDto.getLatitude())
      .longitude(loginDto.getLongitude())
      .loginTime(LocalDateTime.now())
      .build();

    sessionRepository.save(session);
    // ==================================================

    Set<String> roles = user.getRoles()
      .stream()
      .map(Role::getName)
      .collect(Collectors.toSet());

    Set<String> privileges = user.getRoles()
      .stream()
      .flatMap(r -> r.getPrivileges().stream())
      .map(p -> p.getName())
      .collect(Collectors.toSet());

    LoginResponseDTO loginResponse = LoginResponseDTO.builder()
      .token(token)
      .mobile(user.getPhoneNumber())
      .firstName(user.getFirstName())
      .lastName(user.getLastName())
      .roles(roles)
      .privileges(privileges)
      .build();

    return ResponseUtility.response(loginResponse, "Login successful");
  }


  @Override
  public ApplicationResponseDto logout(Long userId) {

    UserDeviceSession session = sessionRepository
      .findTopByUserIdAndLogoutTimeIsNullOrderByLoginTimeDesc(userId)
      .orElseThrow(() -> new RuntimeException("Active session not found"));

    session.setLogoutTime(LocalDateTime.now());
    sessionRepository.save(session);

    return ResponseUtility.response(null, "Logout successful");
  }

}

