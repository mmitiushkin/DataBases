USE vk;

/* �2. ��������� ������ http://filldb.info ��� ������ �� ������ �������, ������������� �������� ������ ��� ���� ������, 
��������� vk-data.sql, �������� ������ ������. ��� ���� ������, ��� ��� ����� �����, ������� �� ����� 100 �����. 
��� media_types ������� ����� 4 ������. ��������� �������� ������. ��������� � ������ ���������� ���� � �������.*/

SELECT * FROM users;
SELECT * FROM media_types;

/* �3. �������� ������ ��� �������������� �������� ����� ����� (������� name � media_types),
������� �� �������� � ������ 3 � ����������� (��������, � "����", "�����", ...).*/

UPDATE media_types SET name='Photo' WHERE id = 1;
UPDATE media_types SET name='Video' WHERE id = 2;
UPDATE media_types SET name='GIF' WHERE id = 3;
UPDATE media_types SET name='Music' WHERE id = 4;

SELECT * FROM media_types;
