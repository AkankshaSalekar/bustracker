package com.setup.initial.repository;

import com.setup.initial.model.Driver;
import com.setup.initial.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverRepository extends JpaRepository<Driver , Long> {
  boolean existsByUser(User user);
}
