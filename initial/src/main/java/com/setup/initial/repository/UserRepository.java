package com.setup.initial.repository;

import com.setup.initial.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.lang.ScopedValue;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByEmail(String email);

  Optional<User> findByPhoneNumber(String phoneNumber);


  Optional<User> findByEmail(String email);
}
