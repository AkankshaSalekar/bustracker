package com.setup.initial.repository;

import com.setup.initial.model.OtpVerification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OtpRepository extends JpaRepository<OtpVerification, Long> {

  Optional<OtpVerification> findTopByMobileOrderByCreatedAtDesc(String mobile);
}

