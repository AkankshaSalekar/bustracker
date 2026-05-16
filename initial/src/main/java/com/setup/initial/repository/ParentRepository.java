package com.setup.initial.repository;

import com.setup.initial.model.Parent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ParentRepository extends JpaRepository<Parent , Long> {

  Optional<Parent> findByMobile(String mobile);
  boolean existsByMobile(String mobile);
}
