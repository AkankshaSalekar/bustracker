package com.setup.initial.repository;

import com.setup.initial.model.UserDeviceSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDeviceSessionRepository extends JpaRepository<UserDeviceSession , Long> {

  Optional<UserDeviceSession> findTopByUserIdAndLogoutTimeIsNullOrderByLoginTimeDesc(Long userId);
}
