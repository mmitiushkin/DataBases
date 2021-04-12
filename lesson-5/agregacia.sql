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
/* ��������� ������
 * 1. ����������� ������� ������� ������������� � ������� users.*/

SELECT round( avg( YEAR(NOW()) - YEAR(birthday_at) ) ) FROM users;

# ---------------------------------------------------------------------------------------------

/* 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
 * ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.
*/


SELECT 
	dayname((concat(YEAR(now()), '-', SUBSTRING(birthday_at, 6, 10)))) AS day_name,
	count(dayname((concat(YEAR(now()), '-', SUBSTRING(birthday_at, 6, 10))))) AS amount_of_birthdays 
FROM users GROUP BY day_name; 

# ---------------------------------------------------------------------------------------------

/*3. (�� �������) ����������� ������������ ����� � ������� �������.
*/
DROP TABLE IF EXISTS x;
CREATE TABLE x (id INT PRIMARY KEY);

INSERT INTO x VALUES (1), (2), (3), (4), (5);

# ---------------------------------------------------------------------------------------------

SELECT round(EXP(sum(log(id))), 0) AS comp FROM x;



