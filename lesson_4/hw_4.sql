USE vk;

/* №2. Используя сервис http://filldb.info или другой по вашему желанию, сгенерировать тестовые данные для всех таблиц, 
используя vk-data.sql, учитывая логику связей. Для всех таблиц, где это имеет смысл, создать не менее 100 строк. 
Для media_types создать ровно 4 строки. Загрузить тестовые данные. Приложить к отчёту полученный дамп с данными.*/

SELECT * FROM users;
SELECT * FROM media_types;

/* №3. Написать запрос для переименования названий типов медиа (колонка name в media_types),
которые вы получили в пункте 3 в осмысленные (например, в "фото", "видео", ...).*/

UPDATE media_types SET name='Photo' WHERE id = 1;
UPDATE media_types SET name='Video' WHERE id = 2;
UPDATE media_types SET name='GIF' WHERE id = 3;
UPDATE media_types SET name='Music' WHERE id = 4;

SELECT * FROM media_types;
