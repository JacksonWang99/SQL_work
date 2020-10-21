USE sakila; # 开始使用这个sakila数据库的时候 需要先声明 use sakila
describe  actor;  #查看这个表的所有数据格式  注意每一个查询结束 ； 结尾
# -- 用来注释
-- Sakila practice 练习题 lecture 3 
use saklia;
#第一题
# Which actors have the first name 'Scarlett'？
select * 
from actor 
where first_name = 'Scarlett';

#第二题
#.Which actors have the last name 'Johansson'
select * 
from actor 
where last_name like 'Johansson';

#第三题
#How many distinct actors last names are there?
-- 这里使用了 count() 计数 和 distinct 去重复

select count(distinct last_name) 
from actor;  # 选自 actor 这个表

#第四题
#Which last names appear more than once?
#group by 的用法 对于一个属性的计算和选择 group by ...  having ....
select last_name, count(last_name) as last_name_count
from actor
group by last_name 
having last_name_count > 1;  # count(*)  是对所有的last_name 进行计数

#第五题
#How many total rentals occured in May?
select count(*)
from rental
where month(rental_date) = 5;

#6.How many staff processed rentals in May?
select count(distinct staff_id) as staff_process_May
from rental
where month(rental_date) = 5;

#变形题How many rentals processed by each staff in May?
select staff_id,count(*)
from rental
where month(rental_date)= 5
group by staff_id;  #each city, each staff 就需要使用group by

select monthname(last_update) # 把月份的名称返回出来
from rental;

#第7题
#Which staff processed the most rentals in May?
select staff_id, count(*) as rental_count
from rental 
where month(rental_date)=5
group by staff_id;

#第8题
#Which customer paid the most rental in August?

#第9题
#A summary of rental total amount by month
select * from payment;
select * from rental;

select month(a.rental_date) as month_t, sum(b.amount) as amount_1
from rental a
left join payment b 
on a.rental_id = b.rental_id
group by month(a.rental_date)
order by month(a.rental_date);


#第10题 
#Which actor has appeared in the most films?
select * from film_actor;
select * from film;

select a.actor_id, 
	concat(b.first_name,'',b.last_name) as actor_name,
	count(distinct film_id) as count_movie
from film_actor a
join actor b
on a.actor_id = b.actor_id
group by actor_id
order by 3 desc;

#第11题
#Is ‘Academy Dinosaur’ available for rent from Store 1?
select * from rental;
select * from store;
select * from film;
select * from inventory;

select *
from inventory a
inner join film b
on a.film_id = b.film_id
where b.title = 'ACADEMY DINOSAUR' and a.store_id =1;  # 表示 Store 1

select distinct c.film_id, c.title, a.rental_date,a.return_date
from rental a
join inventory b
on a.inventory_id = b.inventory_id
join film c
on b.film_id = c.film_id
join store d
on b.store_id = d.store_id
where '2015-05-25' not between a.rental_date and a.return_date
and c.title='Academy Dinosaur'
and d.store_id = 1;

#第12题
#Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ 
#from Mike Hillyer at Store 1 today.



#第13题
#When is ‘Academy Dinosaur’ due?


#第14题
#14 What is that average running time of all the films in the sakila DB?



#第15题
#What is the average running time of films by category?


#第16题
#16Why does this query return the empty set? 
select * from film natural join inventory;

--------------------------------------------------------
# 高级用法
-- CASE is easy for multiple conditions 
-- CASE 的用法介绍

SELECT 
	UPPER(address),
	CASE 
		WHEN UPPER(address) like '%WAY' THEN 1 
        ELSE 0 
	END AS address_way                # 返回的 address_way  0 1  address 当中存在 way 返回 1 不存在返回 0
FROM address; 

SELECT 
    UPPER(address),
    IF(UPPER(address) LIKE '%WAY', 1, 0) AS address_way
FROM
    address;

# 当需要很多限制条件的时候 用case
select amount,
	case when amount between 0 and 5 then 1
		 when amount between 6 and 10 then 2
		 when amount between 11 and 20 then 3
		 else 4
		 end as amount_band
from payment;

## if 语句的用法 只能判断 是 or 否
-- IF is easy for two conditions with less coding 
SELECT UPPER(address),	 
	IF(UPPER(address) LIKE '%WAY', 1, 0) AS address_way 
FROM address;

# creat table 创建表
create temporary table temp as ( select * from address );

SELECT * FROM temp;

---------------------------
#WITH vs Sub query
select amount,
	case 
		when amount > 10 then 'high'
		else 'low'
	end as amount_band
from payment;

SELECT 
    COUNT(DISTINCT customer_id) AS cust_no,
    CASE
        WHEN amount > 10 THEN 'high'
        ELSE 'low'
    END AS amount_band
FROM
    payment
GROUP BY 2;

-- WITH vs Sub query  子查询
#######第一种做法 
WITH temp as   #临时创建的表
(select payment_id, 
		customer_id, 
		if(amount > 10, "high", "low") as amount_band from payment
)
SELECT amount_band, 
COUNT(DISTINCT customer_id) AS cust_no 
FROM temp 
GROUP BY amount_band;

##第二种做法  嵌套操作
SELECT amount_band, 
COUNT(DISTINCT customer_id) AS cust_no 
FROM (
	SELECT payment_id, 
		customer_id, 
		IF(amount > 10, 'high', 'low') AS amount_band 
    FROM payment)  a 
GROUP BY amount_band;

##################3
#  SET   相当于赋值操作
#Select all the payments where the amount is higher than average amount.
#set 就相当于 常见了一个县的量变量  @avg_amount  对其进行赋值

SET @avg_amount = (select avg(amount) from payment); 
SELECT * 
FROM payment 
WHERE amount > @avg_amount;   #这样当每次查询的时候 不需要每次都要更改

set @month_end = '2019-09-30'; # 相当于赋值操作，这样的话就不应进行全局的修改

#哪个客户消费最高
SET @avg_amount = (select max(amount) from payment);
select *
from payment
where amount = @month_end;


-- create a table called 'unit' and define column format alter
-- 创建表格
use sakila;
CREATE TABLE unit ( 
	amount FLOAT, 
    unit VARCHAR(10) 
); 

-- Insert values for columns 
#插入操作n  固定格式
INSERT into unit (amount, unit)
	values 
    (120, 'kgs'), 
    (11, 'jars'), 
    (23.45, 'kgs'), 
    (120, 'bottles') ; 
    
SELECT * FROM unit;

-- Alter the table, e.g. add a new column 
#更改表格  
#添加 label 这一列
ALTER table unit add label varchar(30); 
-- Update a table to udpate column values 
#更新表格 更新 label 这一列
UPDATE unit 
SET label = CONCAT(amount, ' ', unit);

######################
#创建数据库
create database home_credit;
#导入数据  小型的 csv文件导入
右键 home_credit ->  选择Table Data Import Wizard -> 然后出现新的界面 直接把csv表格 导入 ->
出现Select Destination 界面，会自动检测到哪个数据库  Creat new table  -> configure Import Settings 界面 自动识别表格数据格式




