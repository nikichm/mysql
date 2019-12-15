use shop;
-- оптимизация запросов
create table `logs` (
	tablename varchar(255), 
    extenal_id int, 
    name varchar(255),
    created_at datetime default current_timestamp);
    
    delimiter //
create trigger laitu after insert on users 
for each row begin
	insert into logs (tablename, extenal_id, name) values('users', new.id, new.name);
end//
    
create trigger laitc after insert on catalogs 
for each row begin
	insert into logs (tablename, extenal_id, name) values('catalogs', new.id, new.name);
end//

create trigger laitp after insert on products
for each row begin
	insert into logs (tablename, extenal_id, name) values(`users`, new.id, new.name);
end//
    
    
-- nosql
/*
1:
HINCRBY addresses '127.0.0.1' 1
2:
HSET emails 'alexandr' 'alexandr@gmail.com'
HSET users 'alexandr1' 'alexandr1@gmail.com' 'alexandr1' 
3:
use shop
db.createCollection('catalogs')
db.catalogs.insert({name:'Процессоры'})
db.products.insert(
	{
      name:'Intel',
      price:8000,
      catalog_id: new ObjectId('5b56c2aaf56c37b6c1006fd71')
	});

)


*/