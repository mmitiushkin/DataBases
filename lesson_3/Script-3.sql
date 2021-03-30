DROP DATABASE IF EXISTS vk;

CREATE DATABASE vk;

-- ���������� �� vk
USE vk;

-- ���������� ��� �������
SHOW tables;

/*
 * 1. �������� ������� users.
*/

/*
 * ������� � ��������������.
 * 
 * ��������: ���������� ������� ������ ������������������ �������������.
 * 
 * ��� ���� � �������������: ���� - ���������� ������������� ������������,
 * ���, �������, �������, �����.
 * 
 * ��� ��� � ��� ���� ���� - �� ���������� primary key. � ������ ������ ����������� �������
 * ������ ���� primary key. �� �������� ����� �� �������� � �����������, ��� ��� �������� � �������
 * ���������.
 * ����� ���� ������������� ����������������, ����� ��������� �������� (1,2,3,...)
 * 
 * �����, ����� ������������ ��� ����������� ����������� �������� ��� ��� ������.
 * ����� ��������� � ����������� ������� NOT NULL.
 * 
 * ����� ����� ������� ������ (���-������), � ����� � ������������ ���� ����������� �� �������� 
 * ������ ��� �����������.
 * ��������� � ����������� ������� password_hash DEFAULT NULL.
 * 
 * ����� ����� ������� ���� � ����� ����������� ������������.
 * ��������� ������� created_at, ������� �� ������� �������� ������� ���� � ����� ���������
 * DEFAULT CURRENT_TIMESTAMP.
 * 
 * ����� �� �����, ����� ����� � ������� ������������ ��� ����������� ���� �����������.
 * �� ����, ����� ������������ �� ��� ���������������� ��� ����� ������� �������� ��� ������
 * ��� ��������.
 * ���� ���������� � ����������� ������� UNIQUE,
 * ���� ������� UNIQUE INDEX �� ������ �� �������.
 * 
 * INDEX �������� �� ������� �����. ����� ������� ����� - �� primary key. �� primary key ����� ����
 * ������ ���� � �������.
 * 
 * ����� ������������ ������?
 * ����� �� ����� ���� �����-�� ���������� ��� ��������, ������� ��������� � �������.
 * ��������, �� ���� ��� ������������, ���� ��� email (��� ����� ������ ������ � ��).
 * �� email ���� ������, ������ ����� ���������� �������.
 * 
 * ���������� ������ - ��� �� ����� ������, ������� ������������� �����������, ��� ��� �������� � ������� ���������.
 * 
 * �������������� ��������� ������. ����� �������� - �������� �������� �������.
 * 
 */
CREATE TABLE users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(145) NOT NULL, -- COMMENT "���",
  last_name VARCHAR(145) NOT NULL,
  email VARCHAR(145) NOT NULL,
  phone CHAR(11) NOT NULL,
  password_hash CHAR(65) DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- NOW()
  UNIQUE INDEX email_unique_idx (email),
  UNIQUE INDEX phone_unique_idx (phone)
) ENGINE=InnoDB;

-- �������� �������, ������� ���� � ����
INSERT INTO users VALUES (DEFAULT, 'Petya', 'Petukhov', 'petya@mail.com', '89212223334', DEFAULT, DEFAULT);
INSERT INTO users VALUES (DEFAULT, 'Vasya', 'Vasilkov', 'vasya@mail.com', '89212023334', DEFAULT, DEFAULT);

-- ��������� �� ���������� �������
SELECT * FROM users;

-- �������� �������
DESCRIBE users;

-- ������ �������� �������
SHOW CREATE TABLE users; 

-- �������� �������
-- DROP TABLE users;

/*
 * 2. ���������� � �������� ������� users, �����������, ������������, ���������
*/

-- ������� ������� � ������� ��������
ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);

-- ������� �� ���
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);

-- ����������� ��
ALTER TABLE users RENAME COLUMN passport_number TO passport;

-- ������� ���������� ������ �� �������
ALTER TABLE users ADD KEY passport_idx (passport);

-- ������ ������
-- ALTER TABLE users DROP INDEX passport_unique;

-- ������ �������
ALTER TABLE users DROP COLUMN passport;

/*
 * 3. �������� ������� � �������� ������������, ����� �� ������� ��� ������ � ������� users
 * 
 * ��������: ���������� ������� ������ ���������� ������������� � ��������� �������.
 * 
 * ����� ������ ���������� ��� �����: ���, �������, ����������, �����, ������.
 * �� ��� ������� ������������ � ��� ������ �����������?
 * 
 * �� ����� ������� ��� � ������� ������ �� ������� users. �� ���� ������ �� �����������
 * ������������ � ������� users.
 *
 * ��������, � ���� id = 1 � ������� users. � ������� profiles �� ������ ������ � user_id = 1
 * � ����� �������������, ��� � ���� ������ ���������� ������ ���������� ����. �� ����, user_id = 1
 * ������� ��� � ���, ��� � ������ ���������� ���������� ������ ��� ������������ �� ������� users � 
 * id = 1 � �� ��� ���� �������.
 * 
 * ��� ����� ����� ��������� ��������� foreign key. �� �����������, ��� ��� ������� user_id ����������
 * id � ������� profiles. � ����� ��, ��� �� ���������� user_id, �������� �� ������������ ������� id � users.
 * CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users (id)
 * 
 * ������ ������������ ������������� ���� �������. ����� ���� � ������.
 * 
*/

-- 1:1 �����
CREATE TABLE profiles (
  user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
  gender ENUM('f', 'm', 'x') NOT NULL, -- CHAR(1)
  birthday DATE NOT NULL,
  photo_id INT UNSIGNED,
  user_status VARCHAR(30),
  city VARCHAR(130),
  country VARCHAR(130),
  CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users (id) -- ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE profiles;

-- �������� �������, ������� ������� ��� ��� ��������� ���� � ����
INSERT INTO profiles VALUES (1, 'm', '1997-12-01', NULL, NULL, 'Moscow', 'Russia'); -- ������� ����
INSERT INTO profiles VALUES (2, 'm', '1988-11-02', NULL, NULL, 'Moscow', 'Russia'); -- ������� ����

SELECT * FROM profiles;

/*
 * 4. �������� ������� � ����������� �������������.
 * 
 * ��������: ���� ���������� ���� ������ ���������.
 * 
 * ���� ����� �������� ��������� ����, ������, �����, � ���� ����� �������� ����� ��������� ����, ������, �����.
 * ��� ����� �� ������ (�������������) � ������ (�������������).
 * 
 * ��� ��� ���������� ������� ��� ���������? ����������� ���������, ���������� ���������, ����� ���������,
 * ���� � ����� �������� ��������� � ���� � ����� ���������� ���������. ����� ����� ������� ���������� � ���,
 * ��������� �� ���������.
 * 
 * ����������� ��������� - ��� ��� ����. ����� �� ������� �� ��������� � ��������� �� ����� ��� � ������� �����������.
 * ����� �� ��� ������� ��� � ������� ����������� � ������� ���������?
 * ���, ��� ���������� ��� �������� � ������� users, �� ��� ������������� �����������.
 * �� ����� ������� ������ �� ����������� ���������, ���� �� ������� users. �� ���� ��� id �� ������� users.
 * 
 * ��������� ����������� ��������� ����� from_user_id. ������, � from_user_id �� ������ 1, id ����.
 * � ���� 1 �� ������ ����� � ������� users, ����� ��� ������ � id = 1, � ������� ��� � ������� ����.
 * 
 * ���������� ��� ����, ������� ���� to_user_id - ������ �� ���������� ��������� �� ������� users.
 * ����� ������� � to_user_id 2, ����� - id ���� �� ������� users.
 * 
 * 
 * ��� ���������� ����������, ����� �� ��� ���� ��������� � ������ �������. �� ����, ����� �� ��� ���-�� ���������
 * ���������������� ������ ��������� �� ���� � ����, ����� �� ���� ������ ��������� ��������� ����, ����������
 * �� ��� ��������� ��� ���������?
 * ��, ����������.
 * ��������� id ��������� � ����-����������� � primary key.
 * 
 * ��� ����� ����������� ��������� � �������� users � ���������� ��������� � �������� users ������� ��� ������
 * FOREIGN KEY, ������� ���������� �� ���� � �� �� ������� users id.
 * ����������� ��������� � ���������� ����� ��� ���������, ��� � �� ��������� ��� ������ ���������. Foreign key
 * ��� ����� �� ������������.
 * 
 * ��� �������� ������ ���� ���������, ������� �������� ����������� ��������� � ���������� id (��������, ����
 * ��� ���������, ������� �������� ���� �� ����� id = 1) �������� ������
 * ��� from_user_id. �� ������������, ��� ��� ����������� ��������� ��� ��������� ����� ������ ���������,
 * �� ����� ����������� � ���������� ������ ������� ��� �����������.
 * 
 * ���������� ��� ���������� ���������, to_user_id, ����� ������ ������ ��� ���������, ������� �� �������.
 * (��������, ��� ���������, ������� ������� ����)
 * 
*/

CREATE TABLE messages (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  from_user_id BIGINT UNSIGNED NOT NULL,
  to_user_id BIGINT UNSIGNED NOT NULL,
  txt TEXT NOT NULL, -- txt = ������
  is_delivered BOOLEAN DEFAULT False,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- NOW()
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������",
  INDEX fk_messages_from_user_idx (from_user_id),
  INDEX fk_messages_to_user_idx (to_user_id),
  CONSTRAINT fk_messages_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  CONSTRAINT fk_messages_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
);

DESCRIBE messages;

-- ������� ��� ��������� �� ���� � ����, ���� ��������� �� ���� � ����
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hi!', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 1
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Vasya!', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 2
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hi, Petya', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 2

-- ������� �� ���������
SELECT * FROM messages;

/*
 * 5. �������� ������� �������� � ������.
 * 
 * ��������: ���� ����� �������� ���� � ������.
 * 
 * ���� ����� ��������� ������� �� ������ ����, ������, �����, ���� ����� ����� ��������� ������� ����, ������, �����.
 * ��� ����� �� ������ (�������������) � ������ (�������������).
 * 
 * ��� ��� ���������� ������� ��� �������� � ������? ����������� �������, ���������� �������,
 * ������ ������� (������ ��� ��������).
 * 
 * ����������� ��������, ������� �������� ��� �������� ������� messages.
 * �� �������� ������ ������ �� ����������� �������, from_user_id, � ���������� �������, to_user_id.
 * 
 * ��� ���������� ����������, ����� �� ��� ���� ������� �� ������ � ������ �������. 
 * �� ����, ���������� ����������, ����� �� ���� ������� ��������� �������� �� ������ ���� ������������?
 * ���, �� �����. ���� ����� ��������� ���� ������ ���� ������ �� ������. ������������� �� �����.
 * 
 * ������ ��� ����� ��������� ���������������� ���� ����������� ������� � ����������, ����� ���� �� ���
 * ��������� ��� ��������� ������ �� ������ ����.
 * ��� ����� �� ����� ������������ PRIMARY KEY �� ���� ��������, ��� ��� �� � ��� �� �����.
 * PRIMARY KEY ��� ����� �������������, ��� ���� (����, ����), ��� ���� - �����������, ���� - ����������,
 * ����� ����������� � ������� ����� ���� ���.
 * 
 * ���������� ������� messages ��������� foreign keys � �������.
 * 
*/

CREATE TABLE friend_requests (
  from_user_id BIGINT UNSIGNED NOT NULL,
  to_user_id BIGINT UNSIGNED NOT NULL,
  accepted BOOLEAN DEFAULT False,
  PRIMARY KEY(from_user_id, to_user_id),
  INDEX fk_friend_requests_from_user_idx (from_user_id),
  INDEX fk_friend_requests_to_user_idx (to_user_id),
  CONSTRAINT fk_friend_requests_users_1 FOREIGN KEY (from_user_id) REFERENCES users (id),
  CONSTRAINT fk_friend_requests_users_2 FOREIGN KEY (to_user_id) REFERENCES users (id)
);

-- ������� ������ �� ������ �� ���� � ����
INSERT INTO friend_requests VALUES (1, 2, 1);

SELECT * FROM friend_requests;

/*
 * 6. �������� ������� ���������.
 * 
 * ��������: ���� ������� ����������.
 * 
 * ���� ����� ������� ����� ���������, ������ � ���������� ����� ���� ������ ���� ���������.
 * ����� �� ������ (������������) � ������ (�����������).
 * 
 * ��� ��� ���������� ������� ��� ����������? ��� ����, ��������, ��������, ��������� ����������.
 * 
 * ��������� ���������� - ��� ������������. ������, �� ����������� �����, �� ����� ������� ������ �� ������������
 * �� ������� users. �� ���� id ������������ �� ������� users. ����� �� ������� � foreign key.
 * ���������� ���������, ��� ��� ����� �� ������ � ������ ������ � ������������� foreign key ���������
 * �� ������� ������, �� ���� ���������� � ������ ������.
 * 
 * ��������� ����� ������ �� ��������� ���������� (admin_id) ��� �������� ������ ���� ���������, � ������� ���������
 * ������������ � ���������� id.
 * 
*/

CREATE TABLE communities (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(145) NOT NULL,
  description VARCHAR(245) DEFAULT NULL,
  admin_id BIGINT UNSIGNED NOT NULL,
  INDEX communities_users_admin_idx (admin_id),
  CONSTRAINT fk_communities_users FOREIGN KEY (admin_id) REFERENCES users (id)
) ENGINE=InnoDB;

-- ������� ���������� � ���������� �����
INSERT INTO communities VALUES (DEFAULT, 'Number1', 'I am number one', 1);

SELECT * FROM communities;

/*
 * 7. �������� ������� ��� �������� ���������� ��� ���� ���������� ���� ���������.
 * 
 * ��������: ���� ������� � ���������� Number1.
 * 
 * ���� ����� �������� �� ����� ������ ���������, ��� ���� � ����� ���������� ����� ���� ����� ����������.
 * ����� �� ������ � ������.
 * 
 * ��� ��� ���������� �������? ������������, ����������, � ������� �� �������, ���� ���������� � ����������.
 * 
 * ��� ��� ���� ����� �������� � ���������� Number1 ������ ���� ���, ���������� ������������� ������ ��� �� ����� (id),
 * ���������� ������������ ������� friend_requests ��� ����� � ������� �� ��������.
*/

-- ������� ����� ������������� � ���������
CREATE TABLE communities_users (
  community_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (community_id, user_id),
  INDEX communities_users_comm_idx (community_id),
  INDEX communities_users_users_idx (user_id),
  CONSTRAINT fk_communities_users_comm FOREIGN KEY (community_id) REFERENCES communities (id),
  CONSTRAINT fk_communities_users_users FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;

-- ������� ������ ���� ���� �������� ���������� Number 1
INSERT INTO communities_users VALUES (1, 2, DEFAULT);

SELECT * FROM communities_users;

/*
 * 8. �������� ������� ��� �������� ����� ����� ������, ������� ����� ����������.
 * 
 * � �������-�������� ������ �� �������� ������ �� ������ �������.
 * � �������-�������� ������ �������� ������ ���� � ��������, � ������ ������ ���� ����
 * �����-����� � �������� �����-�����.
 * 
 * ����������� �������� ����� ������� ��� ������ �������, �����, ...
*/

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(45) NOT NULL UNIQUE -- �����������, ������, ��������
) ENGINE=InnoDB;

-- ������� ���� � �������
INSERT INTO media_types VALUES (DEFAULT, '�����������');
INSERT INTO media_types VALUES (DEFAULT, '������');
INSERT INTO media_types VALUES (DEFAULT, '��������');

SELECT * FROM media_types;


/*
 * 9. �������� ������� ���� �����������.
 * 
 * ��������: ���� ��������� ����������.
 * 
 * ���� ����� �������� ����� ��������� �����������, ������ � ���������� ����� ���� ������ ���� ����� 
 * (���, ��� ��� �������).
 * ����� �� ������ (������������) � ������ (�����������).
 * 
 * ��� ��� ���������� ������� ��� ����������? ��� ����, ���������, ���, ��������, ������, ���� ����������.
 * 
 * ������ �� ��������� (������������) ������� �� �������� � ����� ���������� ���������, ��������� ������ ���
 * �������� ������ ����������� ������������ � foreign key.
 * 
 * ����� ���������� ���-�� ������� ��� �����-�����. ����� ������� �������� ���� ����������, ��������, "�����������",
 * "������", "��������". ������, �������� ����� ����������� � ��� ��� �������� � ����� �������� media_types � ��� �����
 * ������������ ������. ��� �� ����� ������� �� �������� ����, � ������ �� �������� ���� � �������� (�� ���� id ���� 
 * ���������� �� ������� media_types).
 * 
 * � ������� ���� ���������� ����� ���� ��������� ����������� (��� "�����������" ����� ���� � ��������� �����������),
 * ������ � ���������� ����� ���� ������ ���� ��� (����������1 ����� ������ ���� ��� - "�����������").
 * ��� ��� ����� �� ������ (����) � ������ (�����������).
 * 
 * ������� ������� media_types_id, ��� ������ id ���� �� media_types. ������� foreign key �� media_types_id
 * � media_types (id). ������ �� �������, ��� ��� ����� ����������� ����� ����, � ������ ����� ����� ��������
 * �� ����� ������� � ����� �������������� ����������. 
 * 
 * ��� � ������ ������� � ��� ���������� ��� ������ ����� �� ������ � ������, ������� ��������� ����� �����.
*/

CREATE TABLE media (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- �������� 1
  user_id BIGINT UNSIGNED NOT NULL,
  media_types_id INT UNSIGNED NOT NULL, -- ����
  file_name VARCHAR(245) DEFAULT NULL COMMENT '/files/folder/img.png',
  file_size BIGINT UNSIGNED,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX media_media_types_idx (media_types_id),
  INDEX media_users_idx (user_id),
  CONSTRAINT fk_media_media_types FOREIGN KEY (media_types_id) REFERENCES media_types (id),
  CONSTRAINT fk_media_users FOREIGN KEY (user_id) REFERENCES users (id)
);

-- ������� ��� �����������, ������� ������� ����
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);
-- ������� ��������, ������� ������� ����
INSERT INTO media VALUES (DEFAULT, 2, 3, 'doc.docx', 1024, DEFAULT);

SELECT * FROM media;

-- ��������� 2-3 ������� ��� �� vk, ������� �� ������� �� ������� (� �������� �����, ��������� �������� � ������� ������). �������� ��������� � ���� ������� *.sql.

-- �����
CREATE TABLE posts (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  post_text VARCHAR(245) DEFAULT NULL, -- ����� �����
  media_id BIGINT UNSIGNED NOT NULL, -- id ��������
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- ���� ��������
  like_amount BIGINT DEFAULT 0, -- ���-�� ������
  share_amount BIGINT DEFAULT 0,
  INDEX posts_media_idx (media_id),
  INDEX posts_users_idx (user_id),
  CONSTRAINT fk_posts_media_post FOREIGN KEY (media_id) REFERENCES media (id),
  CONSTRAINT fk_posts_users FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO posts VALUES (DEFAULT, 1, 'hi', 1, DEFAULT, 10, 2);
INSERT INTO posts VALUES (DEFAULT, 2, 'hello!!!', 2, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM posts;


-- ������ ������
CREATE TABLE blacklists (
  user_id BIGINT UNSIGNED NOT NULL,
  blacklisted_user_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(user_id, blacklisted_user_id),
  INDEX blacklists_user_idx (user_id),
  INDEX blacklists_blacklisted_user_idx (blacklisted_user_id),
  CONSTRAINT fk_blacklists_user FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_blacklists_blacklisted_user FOREIGN KEY (blacklisted_user_id) REFERENCES users (id)
);

INSERT INTO blacklists VALUES (1, 2);

SELECT * FROM blacklists;








