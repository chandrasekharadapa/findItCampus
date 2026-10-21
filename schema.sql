CREATE DATABASE IF NOT EXISTS findit_campus CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE findit_campus;

CREATE TABLE IF NOT EXISTS findit_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS findit_items (
  id VARCHAR(80) PRIMARY KEY,
  owner_id INT NOT NULL,
  item_type VARCHAR(20) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'active',
  data LONGTEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_items_owner (owner_id),
  INDEX idx_items_type_status (item_type, status),
  CONSTRAINT fk_findit_item_owner FOREIGN KEY (owner_id) REFERENCES findit_users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS findit_notifications (
  id VARCHAR(100) PRIMARY KEY,
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  data LONGTEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_notifications_to (to_user_id),
  INDEX idx_notifications_from (from_user_id),
  CONSTRAINT fk_findit_notification_from FOREIGN KEY (from_user_id) REFERENCES findit_users(id),
  CONSTRAINT fk_findit_notification_to FOREIGN KEY (to_user_id) REFERENCES findit_users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
