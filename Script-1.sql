/* ���� 2 */

/* ������� # 2.
 * �������� ���� ������ example, ���������� � ��� ������� users, ��������� �� ���� ��������, ��������� id � ���������� name.
*/
DROP DATABASE example;
CREATE DATABASE example;
USE example;
CREATE TABLE users (id SERIAL, name VARCHAR(255));

/* ������� # 3.
 * �������� ���� ���� ������ example �� ����������� �������, ���������� ���������� ����� � ����� ���� ������ sample.
*/
mysql -u root -p
CREATE DATABASE sample;
EXIT

mysqldump -u root -p example > sample.sql
mysql -u root -p sample < sample.sql