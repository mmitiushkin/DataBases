DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name V\ARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at)
VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '2006-08-29');

# ---------------------------------------------------------------------------------------------
/* Агрегация данных
 * 1. Подсчитайте средний возраст пользователей в таблице users.*/

SELECT round( avg( YEAR(NOW()) - YEAR(birthday_at) ) ) FROM users;

# ---------------------------------------------------------------------------------------------

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/


SELECT 
	dayname((concat(YEAR(now()), '-', SUBSTRING(birthday_at, 6, 10)))) AS day_name,
	count(dayname((concat(YEAR(now()), '-', SUBSTRING(birthday_at, 6, 10))))) AS amount_of_birthdays 
FROM users GROUP BY day_name; 

# ---------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS x;
CREATE TABLE x (id INT PRIMARY KEY);

INSERT INTO x VALUES (1), (2), (3), (4), (5);

# ---------------------------------------------------------------------------------------------
/*3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.
*/
SELECT round(EXP(sum(log(id))), 0) AS comp FROM x;



