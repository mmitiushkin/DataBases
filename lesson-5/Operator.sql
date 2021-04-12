/* ����������, ����������, ���������� � �����������. ��� ������� 1. */
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = '����������';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('��������', '1990-10-05', NULL, NULL),
  ('�������', '1984-11-12', NULL, NULL),
  ('���������', '1985-05-20', NULL, NULL),
  ('������', '1988-02-14', NULL, NULL),
  ('����', '1998-01-12', NULL, NULL),
  ('�����', '2006-08-29', NULL, NULL);


# ---------------------------------------------------------------------------------------------

/* 1. ����� � ������� users ���� created_at � updated_at ��������� ��������������. 
 * ��������� �� �������� ����� � ��������.
 */
UPDATE users
	SET created_at = NOW()
WHERE created_at is NULL;
UPDATE users
	SET updated_at = NOW()
WHERE updated_at is NULL;

SELECT * FROM users;

# ---------------------------------------------------------------------------------------------


/* ����������, ����������, ���������� � �����������. ��� ������� 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = '����������';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('��������', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('�������', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('���������', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('������', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('����', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('�����', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');

 
# ---------------------------------------------------------------------------------------------
 
/* 2. ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR
 * � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. ���������� ������������� ���� � ���� DATETIME, 
 * �������� �������� ����� ��������.
 */
ALTER TABLE users ADD created_at_dt DATETIME, ADD updated_at_dt DATETIME;
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;
SELECT * FROM users;
DESCRIBE users;

# ---------------------------------------------------------------------------------------------

 
/* ����������, ����������, ���������� � �����������. ��� ������� 3. */
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';

INSERT INTO
  storehouses_products (storehouse_id, product_id, value)
VALUES
  (1, 543, 0),
  (1, 789, 2500),
  (1, 3432, 0),
  (1, 826, 30),
  (1, 719, 500),
  (1, 638, 1);
 
# ---------------------------------------------------------------------------------------------
 
/*
 * 3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, 
 * ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
 * ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. 
 * ������ ������� ������ ������ ���������� � �����, ����� ���� �������.
 */
SELECT id, value FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN 1 ELSE 0 END, value;
  
# ---------------------------------------------------------------------------------------------



/* ����������, ����������, ���������� � �����������. ��� ������� 4. */
/* ���������� �������. ��� ������� 1, 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

INSERT INTO
  users (name, birthday_at)
VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-14'),
  ('����', '1998-01-12'),
  ('�����', '2006-08-29');

 
 
# ---------------------------------------------------------------------------------------------
/*
 * 4. (�� �������) �� ������� users ���������� ������� �������������, 
 * ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� (may, august)
 */
SELECT name, birthday_at,
	CASE 
		WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'May'
		WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'August'
	END AS 'month'
	FROM users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

# ---------------------------------------------------------------------------------------------


/* ����������, ����������, ���������� � �����������. ��� ������� 5. */
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '�������� �������',
  UNIQUE unique_name(name(10))
) COMMENT = '������� ��������-��������';

INSERT INTO catalogs VALUES
  (NULL, '����������'),
  (NULL, '����������� �����'),
  (NULL, '����������'),
  (NULL, '������� �����'),
  (NULL, '����������� ������');
 
 
 # ---------------------------------------------------------------------------------------------
 /*
  * 5. (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. 
  * SELECT * FROM catalogs WHERE id IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN.
  */
 
 SELECT * FROM catalogs WHERE id IN (5, 1, 2) 
 	ORDER BY CASE 
		WHEN id = 5 THEN 0
		WHEN id = 1 THEN 1
		WHEN id = 2 THEN 2
	END;

# ---------------------------------------------------------------------------------------------


