package com.setup.initial.serviceImpl;

import com.setup.initial.model.User;
import com.setup.initial.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String mobile)
    throws UsernameNotFoundException {

    User user = userRepository.findByPhoneNumber(mobile)
      .orElseThrow(() ->
        new UsernameNotFoundException(
          "User not found with mobile: " + mobile
        )
      );

    return new UserDetailsImpl(user);
  }
}

