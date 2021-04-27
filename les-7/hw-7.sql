USE x;

/*1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

SELECT u.id AS user_id, u.name AS user_name, 
		op.order_id AS order_id, op.product_id AS product_id,
		(SELECT name FROM products WHERE id = op.product_id) AS product_name
FROM users AS u
RIGHT JOIN orders AS o ON u.id = o.user_id
RIGHT JOIN orders_products AS op ON o.id = op.order_id 
GROUP BY u.name
ORDER BY u.id;



/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/


SELECT p.id, p.name, p.price, p.catalog_id, c.name AS 'catalog'
FROM products AS p
left JOIN catalogs AS c ON c.id = p.catalog_id
GROUP BY p.id;
