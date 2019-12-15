-- транзакции переменные представления
use shop;
start transaction;
insert into sample.users select * from shop.users where id = 1;
delete from shop.users where id = 1;
commit;

create or replace view products_catalogs as
select p.name, c.name
from products as p
join catalogs as c
on 
p.catalog_id = c.id;

-- хранимые процедуры и тригеры

delimiter //
	
 create function get_hour ()
 returns int not deterministic
 begin
	return hour(now());
end//
create function hello()
returns tinytext not deterministic
begin
	declare hour int;
    set hour = hour(now());
    case
		when 0 < hour and hour < 5 then
			return 'доброй ночи';
		when 6 < hour and hour < 11 then
			return 'доброе утро';
         when 12 < hour and hour < 17 then
			return 'добрый день';   
		when 18 < hour and hour < 23 then
			return 'добрый вечер';
	end case;
end//

create trigger desc_insert before insert on products 
for each row begin
	if new.name is null and new.description is null then
		signal sqlstate '45000'
        set message_text = 'значения null';
	end if;
end//
