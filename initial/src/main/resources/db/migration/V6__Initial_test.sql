-- ===========================
-- 14. Driver Route Session Table
-- ===========================
CREATE TABLE `driver_route_session` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,

  `created_at` DATETIME(6) DEFAULT NULL,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME(6) DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT b'1',

  `driver_id` BIGINT NOT NULL,
  `route_id` BIGINT NOT NULL,

  `route_date` DATE NOT NULL,

  `actual_start_time` DATETIME(6) DEFAULT NULL,
  `actual_end_time` DATETIME(6) DEFAULT NULL,

  `actual_distance_km` DOUBLE DEFAULT NULL,

  `status` VARCHAR(20) NOT NULL,  -- STARTED / COMPLETED

  PRIMARY KEY (`id`),

  CONSTRAINT `FK_session_driver`
    FOREIGN KEY (`driver_id`)
    REFERENCES `user` (`id`)
    ON DELETE CASCADE,

  CONSTRAINT `FK_session_route`
    FOREIGN KEY (`route_id`)
    REFERENCES `route` (`id`)
    ON DELETE CASCADE
);
