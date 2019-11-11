use shop;

-- 1
select distinct user_id from orders where (select total from orders_products where order_id = id) >= 1 ;

-- 2 
select  distinct
	`name`,
	catalog_id
from  products;
-- 3

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` TEXT,
  `to` TEXT  
) ;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label TEXT,
  `name` TEXT  
) ;

insert into flights (`from`, `to`)
values 
('moskow','omsk'),
('novgorod','kazan'),
('irkutsk','moskow'),
('omsk','irkutsk'),
('moskow','kazan');

insert into cities (label, `name`)
values 
('moskow','Москва'),
('novgorod','Новгород'),
('irkutsk','Иркутск'),
('omsk','Омск'),
('kazan','Казань');

select 
	(select `name` from cities where `label` like `from`) as `from`,
    (select `name` from cities where `label` like `to`) as `to`
from flights


/*


DROP TABLE IF EXISTS users_buy;
CREATE TABLE users_buy(
	user_id SERIAL PRIMARY KEY,
    orders_id SERIAL PRIMARY KEY,
	total_sell INT UNSIGNED DEFAULT 1,
    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	foreign key (user_id) references orders(user_id),
    foreign key (orders_id) references orders(id),
    foreign key (user_id) references orders(user_id),
);

*/
