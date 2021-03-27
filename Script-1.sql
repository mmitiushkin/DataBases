/* Урок 2 */

/* Задание # 2.
 * Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/
DROP DATABASE example;
CREATE DATABASE example;
USE example;
CREATE TABLE users (id SERIAL, name VARCHAR(255));

/* Задание # 3.
 * Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/
mysql -u root -p
CREATE DATABASE sample;
EXIT

mysqldump -u root -p example > sample.sql
mysql -u root -p sample < sample.sql