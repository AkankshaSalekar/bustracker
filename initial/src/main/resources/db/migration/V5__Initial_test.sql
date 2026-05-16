-- ===========================
-- 12. User Device Session Table
-- ===========================
CREATE TABLE `user_device_session` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,

  `user_id` BIGINT NOT NULL,

  `device_name` VARCHAR(255) DEFAULT NULL,
  `os` VARCHAR(255) DEFAULT NULL,
  `browser` VARCHAR(255) DEFAULT NULL,

  `ip_address` VARCHAR(100) DEFAULT NULL,
  `latitude` DOUBLE DEFAULT NULL,
  `longitude` DOUBLE DEFAULT NULL,

  `login_time` DATETIME DEFAULT NULL,
  `logout_time` DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),

  CONSTRAINT `fk_user_device_session_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE CASCADE
);

-- ===========================
-- 13. Driver Schedule Table
-- ===========================
CREATE TABLE `driver_schedule` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,

  `created_at` DATETIME DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT 1,

  `schedule_type` VARCHAR(50) NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,

  `driver_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),

  CONSTRAINT `fk_driver_schedule_driver`
    FOREIGN KEY (`driver_id`)
    REFERENCES `driver` (`id`)
    ON DELETE CASCADE
);
