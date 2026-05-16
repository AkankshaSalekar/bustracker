-- ===========================
-- 1. User Table & Dummy User
-- ===========================
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
);

INSERT INTO `user`
(`created_at`, `created_by`, `is_active`, `updated_at`, `updated_by`, `email`, `first_name`, `middle_name`, `last_name`, `password`, `phone_number`)
VALUES
(NOW(), 'SYSTEM', b'1', NOW(), 'SYSTEM', 'dummyuser@yopmail.com', 'Dummy', NULL, 'User', '$2a$12$u1OVhbzvVJrN2mZqP4K91uKzlszvFhwocWzWLy1q/9zFHPxeYYe.C', '1234567890');

-- ===========================
-- 2. Role Table
-- ===========================
CREATE TABLE `role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- Insert Roles
INSERT INTO `role` (`name`, `created_at`, `created_by`, `is_active`)
VALUES
('ADMIN', NOW(), 'SYSTEM', b'1'),
('DRIVER', NOW(), 'SYSTEM', b'1'),
('PARENT', NOW(), 'SYSTEM', b'1'),
('STUDENT', NOW(), 'SYSTEM', b'1');

-- ===========================
-- 3. Privilege Table
-- ===========================
CREATE TABLE `privilege` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `created_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- Insert Privileges
INSERT INTO `privilege` (`name`, `created_at`, `created_by`, `is_active`)
VALUES
('ADD_USER', NOW(), 'SYSTEM', b'1'),
('GET_USER', NOW(), 'SYSTEM', b'1');

-- ===========================
-- 4. User_Role Join Table
-- ===========================
CREATE TABLE `user_role` (
  `user_id` BIGINT NOT NULL,
  `role_id` BIGINT NOT NULL,
  `assigned_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `role_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE CASCADE
);

-- Assign ADMIN Role to Dummy User
-- Suppose user_id = 1 and admin role_id = 1
INSERT INTO user_role (user_id, role_id, assigned_at)
VALUES (1, 1, NOW());

-- ===========================
-- 5. Role_Privileges Join Table
-- ===========================
CREATE TABLE `role_privileges` (
  `role_id` BIGINT NOT NULL,
  `privilege_id` BIGINT NOT NULL,
  `assigned_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`, `privilege_id`),
  FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`privilege_id`) REFERENCES `privilege`(`id`) ON DELETE CASCADE
);

-- Assign Privileges to Roles
-- Suppose role_ids: ADMIN=1, USER=2; privilege_ids: ADD_USER=1, GET_USER=2
-- ADMIN gets ADD_USER + GET_USER
INSERT INTO role_privileges (role_id, privilege_id, assigned_at)
VALUES
(1, 1, NOW()),
(1, 2, NOW());

-- USER gets only GET_USER
INSERT INTO role_privileges (role_id, privilege_id, assigned_at)
VALUES
(2, 2, NOW());
