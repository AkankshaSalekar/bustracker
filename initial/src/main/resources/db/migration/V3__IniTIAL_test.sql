-- Insert Privileges
INSERT INTO `privilege` (`name`, `created_at`, `created_by`, `is_active`)
VALUES
('SHOW_BUTTON', NOW(), 'SYSTEM', b'1'),
('SHOW_TABLES', NOW(), 'SYSTEM', b'1');