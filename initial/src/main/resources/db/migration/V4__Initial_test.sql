-- ===========================
-- 6. Driver Table
-- ===========================
CREATE TABLE `driver` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `license_number` VARCHAR(100) NOT NULL,
  `vehicle_number` VARCHAR(50) NOT NULL,
  `vehicle_type` VARCHAR(50) NOT NULL,
  `capacity` INT DEFAULT NULL,
  `approved` BIT(1) DEFAULT b'0',

  `user_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_driver_license` (`license_number`),
  UNIQUE KEY `UK_driver_vehicle` (`vehicle_number`),
  CONSTRAINT `FK_driver_user`
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
    ON DELETE CASCADE
);

-- ===========================
-- 7. Parent Table
-- ===========================
CREATE TABLE `parent` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `name` VARCHAR(255) NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `email` VARCHAR(255) DEFAULT NULL,

  `user_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_parent_mobile` (`mobile`),
  UNIQUE KEY `UK_parent_email` (`email`),

  CONSTRAINT `FK_parent_user`
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
    ON DELETE CASCADE
);


-- ===========================
-- 8. Route Table
-- ===========================
CREATE TABLE `route` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,

  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `route_name` VARCHAR(255) NOT NULL,
  `start_location` VARCHAR(255) NOT NULL,
  `end_location` VARCHAR(255) NOT NULL,

  `total_distance_km` DOUBLE DEFAULT NULL,
  `estimated_duration_min` INT DEFAULT NULL,

  `time_slot` VARCHAR(20) NOT NULL,     -- MORNING / EVENING
  `scheduled_start_time` TIME DEFAULT NULL,

  `driver_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),

  CONSTRAINT `FK_route_driver`
    FOREIGN KEY (`driver_id`)
    REFERENCES `driver` (`id`)
    ON DELETE CASCADE
);

-- ===========================
-- 9. Student Table
-- ===========================
CREATE TABLE `student` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `name` VARCHAR(255) NOT NULL,
  `school_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(500) NOT NULL,

  `pickup_lat` DOUBLE NOT NULL,
  `pickup_lng` DOUBLE NOT NULL,
  `monthly_fees` DOUBLE NOT NULL,

  `pickup_time` VARCHAR(20) NOT NULL,
  `drop_time` VARCHAR(20) NOT NULL,

  `driver_id` BIGINT NOT NULL,
  `parent_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),

  CONSTRAINT `FK_student_driver`
    FOREIGN KEY (`driver_id`) REFERENCES `driver`(`id`)
    ON DELETE CASCADE,

  CONSTRAINT `FK_student_parent`
    FOREIGN KEY (`parent_id`) REFERENCES `parent`(`id`)
    ON DELETE CASCADE
);

-- ===========================
-- 10. Tracking Log Table
-- ===========================
CREATE TABLE `tracking_log` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `latitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `tracked_at` DATETIME NOT NULL,

  `driver_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),
  INDEX `IDX_tracking_driver_time` (`driver_id`, `tracked_at`),
  CONSTRAINT `FK_tracking_driver`
    FOREIGN KEY (`driver_id`) REFERENCES `driver`(`id`)
    ON DELETE CASCADE
);

-- ===========================
-- 11. Subscription Table
-- ===========================
CREATE TABLE `subscription` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `plan` VARCHAR(50) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `amount` DOUBLE NOT NULL,
  `active` BIT(1) DEFAULT b'1',

  `driver_id` BIGINT NOT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `FK_subscription_driver`
    FOREIGN KEY (`driver_id`) REFERENCES `driver`(`id`)
    ON DELETE CASCADE
);
