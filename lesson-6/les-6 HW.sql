USE vk;

# ----------------------------------------------------------------------------------------
/* 1. Пусть задан некоторый пользователь.
 *Найдите человека, который больше всех общался с нашим пользователем, иначе, 
 *кто написал пользователю наибольшее число сообщений. (можете взять пользователя с любым id). */


 SELECT from_user_id FROM messages WHERE to_user_id = 1 GROUP BY to_user_id;
 

# ----------------------------------------------------------------------------------------
/*2. Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.*/


SELECT count(*) AS likes_under_18 FROM posts_likes WHERE like_type = 1 AND user_id in (SELECT user_id
											FROM profiles 
											WHERE ((YEAR(CURRENT_DATE) - YEAR(birthday)) - (RIGHT(CURRENT_DATE,5)<RIGHT(birthday,5))) < 18);


# ----------------------------------------------------------------------------------------
/*3. Определить, кто больше поставил лайков (всего) - мужчины или женщины?*/
	
										
SELECT 
	count(*) AS likes,
	(SELECT gender FROM profiles WHERE user_id = posts_likes.user_id) AS gender
FROM posts_likes WHERE
	like_type = 1 AND user_id in (SELECT user_id FROM profiles WHERE gender = 'f')

UNION

SELECT 
	count(*) AS likes,
	(SELECT gender FROM profiles WHERE user_id = posts_likes.user_id) AS gender
FROM posts_likes WHERE
	like_type = 1 AND user_id in (SELECT user_id FROM profiles WHERE gender = 'm');


