-- 总结
-- SQL Query 和 SQL Database 相关操作  MS SQL serve
-- https://www.w3schools.com/sql/sql_groupby.asp
-- Leetcode 用户名 JacksonWZM
-- hackerrank 用户名 Jackson WZM  z5140192
select  distinct() 去重
		MIN()   取最小值
        MAX()   取最大值
        COUNT() 计数
        AVG(列名) 取平均值
        SUM()   求和

from 表名

where not A =''  不包含
      A and B  
      A or B 
      A is NULL  A列为空
      A is NOT NULL  A列不为空
      A Like 'a%'   -- City column starts with the letter "a" 以a 开头的城市
      A Like '%a'   -- City column end with the letter "a" 以a结尾的城市
	  A Like '%a%'  -- 包含 a 的城市
      A Like 'a%b'  -- 以a开头以b 结尾的城市
      A NOT Like 'a%'   -- 不以a 开头的城市
	  A Like '_a%'  -- where the second letter of the City is an "a". 第二个字母是a
	  A Like '[acs]%'-- where the first letter of the City is an "a" or a "c" or an "s"
                     -- 以a c s 开头
      A Like '%[acs]' -- 以a c s 结尾
      A Like '[acs]%[acs]' -- 同时以a c s 开头和结尾    
      A not like '[aeiou]%' or A not like '%[aeiou]'  --  do not start with vowels or do not end with vowels.
	  A Like '[^acs]%' -- 不以 "a" or a "c" or an "s"开头
      A Like '[a-f]%'-- where the first letter of the City starts with anything from an "a" to an "f".
      
      A between 10 and 20 -- value of the Price column is between 10 and 20.
	  A not between 10 and 20  -- Price column 不在 10 and 20
      
group by... 分组

having...  

	后面跟列属性
    
order by ... limit...  排序
	order by city 按照city的字母顺序排序
    order by city desc 按照city的字母降序排序  字母倒序
    order by city asc  按照升序  字母升序
    order by city,country 先按照city排序然后再按照country排序
	order by SUBSTR(NAME,-3,3)  substr(str,pos,len) str是目标属性，pos 是开始位置，len 是选择的长度
             是按单词最后三位字母排序

Limit
	Limit 5 查看前5行
	-- get the second highest salary
    select salary as SecondHighestSalary
	from Employee
	order by Salary desc
	limit 1 Offset 1

insert into 插入操作
				  表名称    列属性名称
	INSERT INTO Customer(CustomerName, Address, City, PostalCode,Country)
    VALUES('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');
    注意 values 要和  列属性  一一对应好

update 更新   update set
	-- Update the City column of all records in the Customers table.
	update Customers set City = 'Oslo';
    如有相关的限制，添加 where 条件
    
	-- Update the City value and the Country value 需要更新两个的话，中间逗号隔开
    update Customers set City = 'Oslo', Country = 'Norway'
    WHERE CustomerID = 32;
	
    -- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally 不小心 entered in the actor table as GROUCHO WILLIAMS, 
	--    the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
	--          set 后面跟的是要更新 成 的内容
    update actor set first_name = 'GROUCHO'
    --  where 跟的是要更新的信息
    where first_name = 'HARPO' and last_name = 'WILLIAMS';


ADD 添加一列
	-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. 
    -- Hint: you will need to specify the data type.
	ALTER TABLE `sakila`.`actor` 
	ADD COLUMN `middle_name` VARCHAR(45) NULL AFTER `first_name`;


DELETE 删除     DELETE FROM 表名 where 条件
	-- Delete all the records from the Customers table where the Country value is 'Norway'.
    Delete FROM Customers
    where country = 'NOrway'
    
    -- 删除表中所有记录
    Delete from Customers

In 操作
	-- Use the IN operator to select all the records where Country is either "Norway" or "France".
    SELECT * FROM Customers
    where country in ('Norway','France');
    -- Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
    SELECT * FROM Customers
	where country not in ('Norway', 'France');

as 操作 Alias  假名 给列取一个 其他的名字
    --  make an ALIAS of the PostalCode column, the column should be called Pno instead.
    SELECT CustomerName, Address, PostalCode AS Pno
    FROM Customers;

   -- displaying the Customers table, refer to the table as Consumers instead of Customers
   SELECT *
   FROM Customers  AS Consumers;


Join 操作
	-- Insert the missing parts in the JOIN clause to join the two tables Orders 
    -- and Customers, using the CustomerID field in both tables as the relationship between the two tables.
	SELECT *
	FROM Orders
	LEFT JOIN Customers
    on Orders.CustomerID and Customers.CustomerID
    
    -- Choose the correct JOIN clause to select all records from the two tables where there is a match in both tables.
	SELECT *
	FROM Orders
	INNER JOIN Customers
	ON Orders.CustomerID=Customers.CustomerID;
    
    -- Choose the correct JOIN clause to select all the records from the Customers table plus all the matches in the Orders table.
    SELECT *
	FROM Orders
    RIGHT JOIN Customers
	ON Orders.CustomerID=Customers.CustomerID;

	join store using (store_id)  #表连接的方式 join ... using ...  也可以 join... on...
	join film using (film_id)

Group by 操作
	-- List the number of customers in each country.
    SELECT COUNT (CustomerID),
	Country
    FROM Customers
    group by country；

	-- List the number of customers in each country, ordered by the country with the most customers first.
	SELECT COUNT (CustomerID), Country
    FROM Customers
    GROUP BY Country
    ORDER BY COUNT(CustomerID) DESC


SQL 中的函数
1. Concat 函数用于将两个字符串连接为一个字符串 # SELECT CONCAT('FIRST ', 'SECOND')   结果为 FIRST SECOND
		 以及固定的语言文字输出
2. mod(id, 2) = 1  等于1 是奇数，等于0 是偶数
3. count() 计数
3. lower() 转为小写字母
4. substring(str,pos,len) str是目标属性，pos 是开始位置，len 是选择的长度
	  用于字符串截取，第一个，最后一个字母，后三位排序等等功能
5. distinct() 去重
6. AVG(列名) 取平均值, abs() 绝对值函数
7. SUM()   求和   
8. round(x)  向下取整 down to the nearest integer. Truncate your answer to 4 decimal places.
   round(x,y) 函数返回最接近于参数x的数，其值保留到小数点后面y位，若y为负值，则将保留x值到小数点左边y位。
   Ceiling()  向上取整 round it up to the next integer.
   FLOOR() - rounded down to the nearest integer 返回最大整数，使这个整数小于或等于指定数的数值运算。
9. replace(title,'w3cschool','hello')  数据库表所有title字段里的w3cschool字符串替换成hello
10. sqrt()平方根函数
11. Power(x,y) 函数返回x的y次乘方的结果值
12. SQUARE(x)函数返回指定浮点值x的平方
13. EXP(x)函数返回e的x乘方后的值。
14. SIGN(x)返回参数的符号，x的值为负、零或正时，返回结果依次为-1、0或1
15. median 中位数
	Oracle 有直接的median() 函数
	SELECT ROUND(MEDIAN(Lat_N), 4)
	FROM Station;
	但是Mysql 没有直接的中位数函数 需要自己做出来的中位数函数
	计算 中位数 模板
	select avg(c.s_score) 
	from(
		   select a.s_score 
		   from score a,score b  表复制一份
		   where a.c_id=b.c_id and a.c_id='02' 额外的条件，看具体情况进行删除
		   group by a.s_score
		   having sum(case when a.s_score=b.s_score then 1 else 0 end)
				  >= abs(sum(sign(a.s_score-b.s_score)))
		   )c;

16.
    
    
    
创建数据库
	-- Write the correct SQL statement to create a new database called testDB
    创建数据库
	CREATE DATABASE testDB
	
    
    -- Write the correct SQL statement to delete a database named testDB
	删除数据库
    Drop database testDB
	
    在数据库中创建表
    CREATE TABLE 表名称
    CREATE TABLE Persons(
	PersonID int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255) 
	);
    
    删除表
    Drop table Persons;
    
    -- Use the TRUNCATE statement 截断语句 to delete all data inside a table.
    TRUNCATE TABLE Persons;

	表中添加新的一列
	-- Add a column of type DATE called Birthday 在表中添加生日列，数据类型是Date
	ALTER TABLE Persons
	ADD Birthday DATE;
    
    表中删除一列
    ALTER TABLE Persons
	DROP COLUMN Birthday;


# 创建一个新的数据库
create database covid19;

# 怎么导入一份新的数据 

-- Go to database home_credit -> Table Data Import Wizard -> Browse to the table files -> Upload
# 1. 新创建的数据库点击， 右键找到 Table Data Import Wizard，找到数据位置，然后上传数据
# 2. 新的对话框，记得修改名称 -> next
# 3. Configure Import Setting 不要更改直接 -> next 完成数据导入和表设置


第二次班课作业练习
-- 1. Select all the products in product category 1. How many in total?
	SELECT count(ProductID) 
	FROM Products
	where CategoryID=1
-- Select all the customers from France. Out of those, how many are at Paris?
    SELECT count(CustomerId) 
	FROM [Customers]
	where Country = 'France' and City = 'Paris'
-- How many orders are placed during 1996-07-01 and 1996-07-31?
	SELECT count(OrderID) as count
	FROM [Orders]
	where OrderDate between '1996-07-01' and '1996-07-31'
-- Which employee graduated from University of Washington?
	SELECT * 
	FROM [Employees]
	where Notes like '%University of Washington%'
-- How many orders does each product ID have? 
		SELECT ProductID,count(OrderID) as count
		FROM [OrderDetails]
		group by(ProductID)
	-- What are the total quantity for each product? 
    SELECT ProductID, sum(Quantity)
	FROM [OrderDetails]
	group by ProductID
	having sum(Quantity)> 100
	order by sum(Quantity) desc
    -- What is the average quantity per order per product?
	SELECT ProductID, OrderID, AVG(Quantity) as AVG_Quantity
	FROM [OrderDetails]
	group by ProductID,OrderID
	having AVG(Quantity)>=20
	order by ProductID, AVG_Quantity desc;

-- How many different products are in each order? 
	select OrderID,count(distinct(ProductID)) as Count_Product 
	FROM [OrderDetails]
	group by OrderID
    having count(distinct ProductID) = 
		(
        select max(count_Product)
        from
        (select OrderID, count(distinct(ProductID)) as Count_Product
         from OrderDetails
         group by OrderID
         order by 2 desc)
        )
    

-- Which order has the most number of unique products?
	SELECT OrderID,count(ProductID) as Product_count
	FROM [OrderDetails]
	group by OrderID
	order by Product_count desc
    
-- Which products are sold in jars? 
	SELECT * 
	FROM [Products]
	Where Unit like "%jars"
-- What is the most expensive product that's sold in jars?
	SELECT ProductID, ProductName, max(Price)
	FROM [Products]
	where Unit like "%jars"

如果上面两个问题合在一起该怎么写

	SELECT * 
	FROM [Products]
	Where Unit like "%jars" and Price = 
    (  -- 下面的子查询是找到了price这有个值，所以直接等一下就可以
    select max(Price)
    from  -- 下面的子语句就是一个新表，嵌套了一下而已
    (SELECT * 
	FROM [Products]
	Where Unit like "%jars")
    )
    做这样的题 一步一步写，再结合起来
-- What are the product names are included in order ID 10250?
	第一种写法不用join 使用 subquery子查询的方式
    select * 
	from Products
    where ProductId in (
		Select ProductID
        From OrderDetails
        where OrderID = 10250
    )
    
    第二种解法
    SELECT ProductName
	FROM [OrderDetails] as a
	join Products as b
	on  a.ProductID = b.ProductID
	where OrderID =  10250
-- What products are contained in category 'Dairy Products'?
	第一种写法 join
    SELECT ProductID, ProductName, CategoryName
	FROM [Categories]
	join Products
	on Categories.CategoryID = Products.CategoryID
	where CategoryName = 'Dairy Products'

	第二种写法 subquery
    SELECT ProductID, ProductName
    from Products
    where CategoryID in 
		(
        select CategoryID
        from  Categories
        where CategoryName = 'Dairy Products'
		)



###############################################################
# 第一次班课作业练习
-- Lecture 1&2&3 homework
-- MySQL Sakila 解题训练 practice
-- Part 1
use sakila;
-- Which actors have the first name 'Scarlett'
select * 
from actor
where first_name = 'Scarlett';

-- Which actors have the last name 'Johansson'
select * 
from actor
where last_name = 'Johansson';

-- How many distinct actors last names are there?
select count(distinct last_name) as number_last_name
from actor;

-- Which last names are not repeated?
select last_name
from actor
group by last_name
having count(last_name) =1;

-- Which last names appear more than once?
select last_name
from actor
group by last_name
having count(last_name) > 1;

-- Which last names appear more than once?

-- How many total rentals occured in May?

-- How many staff processed rentals in May?

-- Which staff processed the most rentals in May?

-- Which customer paid the most rental in August?

-- A summary of rental total amount by month.

-- Which actor has appeared in the most films?


-- Which actor has appeared in the most films?
select * from actor;
select * from film_actor;
select b.actor_id,b.first_name,b.last_name,count(a.actor_id) as film_count
from film_actor a
join actor b
on a.actor_id = b.actor_id
group by a.actor_id
order by film_count desc
limit 1;

-- Is 'Academy Dinosaur' available for rent from Store 1?
-- Step 1: which copies are at Store 1?
select * from store;
select * from inventory;
select * from film;
select * from rental;

select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory 
join store using (store_id)  #表连接的方式 join ... using ...  也可以 join... on...
join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

-- Step 2: pick an inventory_id to rent:
select * from store;
select * from inventory;
select * from film;
select * from rental;

select inventory.inventory_id
from inventory 
join store using (store_id)
join film using (film_id)
join rental using (inventory_id)
where film.title = 'Academy Dinosaur'
	  and store.store_id = 1
      and not exists (select * from rental
                      where rental.inventory_id = inventory.inventory_id
                      and rental.return_date is null);
                      
-- Insert a record to represent Mary Smith renting 'Academy Dinosaur'
-- from Mike Hillyer at Store 1 today .
select * from rental;

insert into rental(rental_date,inventory_id, customer_id, staff_id)
values (Now(),1,1,1);
#讲解
-- 这道题，rental 表中的rental Id 是该表的primary key. insert values 不需要对primary key赋值，
-- 系统是会自动按顺序赋值的。now() 你可以理解。就是现在的时间.1，1，1,其实只是巧合 mary smith 的 custoer ID 是 1
-- acedemy dinasaur 的 invetory ID 也是 1

-- When is 'Academy Dinosaur' due?
-- Step 1: what is the rental duration?
select * from film;
select rental_duration 
from film
where title = 'Academy Dinosaur';

-- Step 2: Which rental are we referring to -- the last one.
#把最后一条 rental记录 选择出来
select * from rental;
select rental_id    
from rental
order by rental_id desc  #降序排序然后 把第一条选出来
limit 1;

use sakila;
-- Step 3: add the rental duration to the rental date.
#'Academy Dinosaur'  只做这一条记录的
select * from rental;
select * from film;
select * from inventory;
#在rental_date 上面加入 duration 的天数
select title,rental_date,rental_duration,rental_date + interval
                   (select rental_duration from film where film_id = 1) day
                   as due_date
from rental 
join inventory using (inventory_id)
join film using (film_id)
order by rental_id desc limit 1;

-- What is that average length of all the films in the sakila DB?
select * from film;
select avg(length) as avg_film
from film;

-- What is the average length of films by category?
select * from film;
select * from category;
select * from film_category;

select name,avg(length)
from film_category
join film using(film_id)
join category using(category_id)  #先把用到的所有的表直接进行表连接
group by name
order by avg(length);

-- Which film categories are long? Long = lengh is longer than the average film length
select * from film;
select * from category;
select * from film_category;

select category_id,name,length,avg(length)
from film_category
join film using(film_id)
join category using(category_id)  #先把用到的所有的表直接进行表连接
group by name
having  length> avg(length)
order by category_id desc
limit 1;

use sakila;
-- 第二种写法
set @avg_length = (select avg(length) from film);
-- 这里的作用是设置一个变量，就不用每次进行单独的修改，更加的简单
select category.name, avg(length)
from film 
join film_category using (film_id) 
join category using (category_id)
group by category.name
having avg(length) > @avg_length
order by avg(length) desc;

-- Part 2 creat by Jackson 27-12-2019
-- 1a. Display the first and last names of all actors from the table actor.
select first_name,last_name
from actor;

-- 1b. Display the first and last name of each actor in a single column 
       #in upper case letters. Name the column Actor Name.
select CONCAT(first_name, ' ', last_name) as 'Actor Name'  #两列的连接  concat()
from actor;

-- 2a. You need to find the ID number, first name, and last name of an actor, 
		#of whom you know only the first name, "Joe." 
-- What is one query would you use to obtain this information?
select actor_id,first_name,last_name
from actor
where first_name = 'Joe';

-- 2b. Find all actors whose last name contain the letters GEN:
select *
from actor
where last_name like '%GEN%';

-- 2c. Find all actors whose last names contain the letters LI. 
      #This time, order the rows by last name and first name, in that order:
select *
from actor
where last_name like '%LI%'
order by last_name,first_name;

-- 2d. Using IN, display the country_id and country columns of the following countries:
	  #Afghanistan, Bangladesh, and China:

select country_id,country
from country
where country in ('Afghanistan', 'Bangladesh','China');

-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. 
      #Hint: you will need to specify the data type.
#添加列的操作
ALTER TABLE `sakila`.`actor` 
ADD COLUMN `middle_name` VARCHAR(45) NULL AFTER `first_name`;

-- 3b. You realize that some of these actors have tremendously long last names. 
--  Change the data type of the middle_name column to blobs.

-- 3c. Now delete the middle_name column. 删除操作

ALTER TABLE actor 
DROP middle_name;

-- 4a. List the last names of actors, as well as how many actors have that last name.
select last_name,count(last_name) as number_of_last_name
from actor
group by last_name
order by number_of_last_name desc;

-- 4b. List last names of actors and the number of actors who have that last name, 
--     but only for names that are shared by at least two actors
select last_name,count(last_name) as number_of_last_name
from actor
group by last_name
having number_of_last_name > 2
order by number_of_last_name desc;


-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
--     the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
#表格更新
UPDATE actor 
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' 
AND last_name = 'WILLIAMS';

-- 4d. Perhaps we were too hasty 仓促地 in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct 
-- name after all! 
-- In a single query, if the first name of the actor is currently HARPO, 
-- change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what 
-- the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR 
-- TO MUCHO GROUCHO, HOWEVER! 
-- (Hint: update the record using a unique identifier.)
# 表格更新  
UPDATE actor 
SET first_name = (
		CASE 
        WHEN first_name = 'HARPO'   # 多重选择语句 then  else
		THEN 'GROUCHO' 
		ELSE 'MUCHO GROUCHO'
        END
	)
 WHERE actor_id = 172;
 
-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?

DESCRIBE address;

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select * from staff;
select * from address;
#表连接
select first_name, last_name, address
from staff a
left join address b   #对于有相同的行数 可以使用 join  using  对于两个表行数不同，只能用 join  on 
on a.address_id = b.address_id;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
select * from staff;
select * from payment;

select a.staff_id,a.last_name,sum(b.amount)
from staff a
left join payment b
on a.staff_id = b.staff_id
where month(b.payment_date) = '08' and year(b.payment_date) = '2005'
group by a.staff_id;


-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select * from film;
select * from film_actor;

select a.film_id, a.title,count(b.actor_id) as number_actor
from film a
inner join film_actor b
on a.film_id = b.film_id
group by b.film_id;


-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
use sakila;
select * from inventory;
select * from film;

-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
--     List the customers alphabetically by last name:


-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, 
--  films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of
--  movies starting with the letters K and Q whose language is English.

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
-- 这道题先从最里面开始写
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id IN
	(SELECT actor_id 
    FROM film_actor 
    WHERE film_id = (SELECT film_id FROM  film WHERE title = 'Alone Trip')
    );

-- 第二种写法
select a.first_name, a.last_name
from actor a
join film_actor b on a.actor_id = b.actor_id
join film c on b.film_id = c.film_id
where title = 'Alone Trip';

-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and 
--     email addresses of all Canadian customers. 
--     Use joins to retrieve this information.

SELECT c.first_name, c.last_name, c.email
FROM customer c INNER JOIN address a ON c.address_id = a.address_id
	INNER JOIN city ci ON a.city_id = ci.city_id
    INNER JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
--  Identify all movies categorized as famiy films.

-- 7e. Display the most frequently rented movies in descending order.

-- 7f. Write a query to display how much business, in dollars, each store brought in.

SELECT SUM(p.amount), s.store_id
FROM payment p 
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN staff s ON r.staff_id = s.staff_id
INNER JOIN store st ON s.store_id = st.store_id
GROUP BY s.store_id;

-- 7g. Write a query to display for each store its store ID, city, and country.

-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
use sakila;
SELECT c.name as "Genre", SUM(p.amount)
FROM category c 
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY 1  # 1  2  指的是第  1 2  列
ORDER BY 2 DESC
LIMIT 5;

-- 8a. In your new role as an executive, you would like to have an easy way of viewing 
--      the Top five genres by gross revenue. Use the solution from the problem above to create a view. 
--      If you haven't solved 7h, you can substitute another query to create a view.
-- view 只是建立一个连接，当操作结束的时候就会自动消失alter
-- table 一旦创建就存在
CREATE VIEW top_five_revenue_generating_genres AS   
	SELECT c.name as "Genre", SUM(p.amount)
	FROM category c 
	INNER JOIN film_category fc ON c.category_id = fc.category_id
	INNER JOIN film f ON fc.film_id = f.film_id
	INNER JOIN inventory i ON f.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 5;  
    
select top_five_revenue_generating_genres from category; 


-- 8b. How would you display the view that you created in 8a?

-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.



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
# 导入数据  小型的 csv文件导入
# 右键 home_credit ->  选择Table Data Import Wizard -> 然后出现新的界面 直接把csv表格 导入 ->
# 出现Select Destination 界面，会自动检测到哪个数据库  Creat new table  -> configure Import Settings 界面 自动识别表格数据格式


#####################
#####  Leetcode #####
#####################

# 一共有20道题  https://leetcode.com/problemset/database/?status=Solved



#######################
#####  HackerRank #####
#######################
# https://www.hackerrank.com/domains/sql
-- 1. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
	SELECT COUNT(CITY)- COUNT(DISTINCT(CITY))
	FROM STATION;
-- 2. Query the two cities in STATION with the shortest and longest CITY names
    # If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
	# 做两次选择
	select city, length(city) 
	from station
	order by length(city),city asc
	limit 1;
	select city, length(city) from station
	order by length(city) desc
	limit 1;

-- 3. case 用法
    # 判断三角形
	#  Equilateral: It's a triangle with  sides of equal length.
	# Isosceles: It's a triangle with  sides of equal length.
	# Scalene: It's a triangle with  sides of differing lengths.
	# Not A Triangle: The given values of A, B, and C don't form a triangle.
	
#CASE语句有两种形式：第一种评估一个或多个条件，并返回第一个符合条件的结果。 如果没有条件是符合的，则返回ELSE子句部分的结果，如果没有ELSE部分，则返回NULL：
# 注意 case...end   when..then..else 不要缺少关键词。
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

select case 
        when A + B > C and B + C > A and A + C > B then
            case
                when A=B and B = C then 'Equilateral'
                when A=B or A=C or B=C then 'Isosceles'
                else 'Scalene'
            end
		else 'Not A Triangle'
        end
from TRIANGLES

-- 4. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately 
	#followed by the first letter of each profession as a parenthetical 
    # (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
	# Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in 
    # ascending order, and output them in the following format:
	# There are a total of [occupation_count] [occupation]s.
	# where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS 
    # and [occupation] is the lowercase occupation name. If more than one Occupation has the 
    # same [occupation_count], they should be ordered alphabetically.
/*
	Sample Output

	Ashely(P)
	Christeen(P)
	Jane(A)
	Jenny(D)
	Julia(A)
	Ketty(P)
	Maria(A)
	Meera(S)
	Priya(S)
	Samantha(D)
	There are a total of 2 doctors.
	There are a total of 2 singers.
	There are a total of 3 actors.
	There are a total of 3 professors.
	'''
# CONCAT 函数用于将两个字符串连接为一个字符串
# SELECT CONCAT('FIRST ', 'SECOND') 结果为  FIRST SECOND
#  SELECT CONCAT(id, name, work_date)
   FROM employee_tbl;
# 结果为  1John2007-01-24 
*/

# 第一部分的输出
select concat(Name,'(',Substring(Occupation,1,1),')') as Name
from occupations
Order by Name 

#注意拼接时候，之间的空格和标点符号，字母大小
select concat('There are a total of',' ',count(occupation),' ',lower(occupation),'s.') as total
from occupations
group by occupation
order by total asc;

-- 5. 表格翻转，重新组合
/*
# Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
# and displayed underneath its corresponding Occupation. The output column headers 
# should be Doctor, Professor, Singer, and Actor, respectively.
# Note: Print NULL when there are no more names corresponding to an occupation.
# Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Output
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per 
occupation (in this case, the Professor and Actor columns) are filled with NULL values.
*/
SELECT 
    # 选择出对应的职位作为表头
	MIN(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
	MIN(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
	MIN(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
	MIN(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
	  SELECT a.Occupation, a.Name,
			 (SELECT COUNT(*) 
			  FROM Occupations AS b
			  WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
	  FROM Occupations as a
	 ) AS c
GROUP BY c.rank;

/* 分步解释如下
中间的子查询 创建出来了一个新的表
This query creates the ranking value, smaller values are in alphabetical order.
  SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
            # 创建了新的一列命名为 rank
  FROM Occupations AS a

这个新的表长这样
+------------+-----------+------+
| Occupation | Name      | rank |
+------------+-----------+------+
| Doctor     | Samantha  |    1 |
| Actor      | Julia     |    1 |
| Actor      | Maria     |    2 |
| Singer     | Meera     |    0 |

And then you can rotate row and column by this query
SELECT 
rank,
CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END AS Doctor,
CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END AS Professor,
CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END AS Singer,
CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END AS Actor
FROM (
  SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
  FROM Occupations AS a
) AS c

+------+----------+-----------+--------+-------+
| rank | Doctor   | Professor | Singer | Actor |
+------+----------+-----------+--------+-------+
|    1 | Samantha | NULL      | NULL   | NULL  |
|    1 | NULL     | NULL      | NULL   | Julia |
|    2 | NULL     | NULL      | NULL   | Maria |
|    0 | NULL     | NULL      | Meera  | NULL  |
|    0 | NULL     | Ashely    | NULL   | NULL  |

Doctor and other occupations columns contain only a single value for each ranks, 
so you can reduce null value by MAX or MIN aggregate function with group by rank value.

SELECT 
rank,
MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
  SELECT a.Occupation,
         a.Name,
         (SELECT COUNT(*) 
            FROM Occupations AS b
            WHERE a.Occupation = b.Occupation AND a.Name > b.Name) AS rank
  FROM Occupations AS a
) AS c
GROUP BY c.rank;

+------+----------+-----------+--------+-------+
| rank | Doctor   | Professor | Singer | Actor |
+------+----------+-----------+--------+-------+
|    0 | Jenny    | Ashely    | Meera  | Jane  |
|    1 | Samantha | Christeen | Priya  | Julia |
|    2 | NULL     | Ketty     | NULL   | Maria |
+------+----------+-----------+--------+-------+
*/




-- 6. Binary Tree Nodes 二进制树
# You are given a table, BST, containing two columns: N and P, where N represents the value of 
# a node in Binary Tree, and P is the parent of N.
# Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

# Root: If node is root node.
# Leaf: If node is leaf node.
# Inner: If node is neither root nor leaf node.
# Sample Output

# 1 Leaf
# 2 Inner
# 3 Leaf
# 5 Root
# 6 Leaf
# 8 Inner
# 9 Leaf
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM BST
ORDER BY N ASC

-- 7. New Companies
# Given the table schemas below, write a query to print the company_code, founder name, 
# total number of lead managers, total number of senior managers, total number of managers, 
# and total number of employees. Order your output by ascending company_code.

select c.company_code, c.founder, 
    count(distinct e.lead_manager_code), count(distinct e.senior_manager_code),
    count(distinct e.manager_code),count(distinct e.employee_code)
# 表连接没问题
from company c
inner join employee e on e.company_code = c.company_code
# 不太明白group by 为什么需要两个属性
group by c.company_code,c.founder
# 直接按照 company_code 进行排序
order by c.company_code;


-- 8.  New company
#We define an employee's total earnings to be their monthly  
# worked, and the maximum total earnings to be the maximum total 
# earnings for any employee in the Employee table. 
# Write a query to find the maximum total earnings for all employees 
# as well as the total number of employees who have maximum total earnings. 
# Then print these values as  space-separated integers.
# 创建了一个新的一列，然后按照earnings分组，排序 取第一个 
# count(*) 表示相同的有几个
select  salary * months AS earnings, count(*)
from employee
group by earnings
order by earnings desc
limit 1

-- 9. Weather Observation Station 18
/*
这题不难
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4  decimal places.

round() 函数用来四舍五入
round(x)  向下取整 down to the nearest integer. Truncate your answer to 4 decimal places.
round(x,y) 函数返回最接近于参数x的数，其值保留到小数点后面y位，若y为负值，则将保留x值到小数点左边y位。
Ceiling()  向上取整 round it up to the next integer.
FLOOR() - rounded down to the nearest integer 返回最大整数，使这个整数小于或等于指定数的数值运算。
Manhattan distance |x1 - x2| + |y1 - y2|.
*/

select round(abs(max(LAT_N)-min(LAT_N))+ abs(max(LONG_W)-min(LONG_W)),4)
from station

-- 10  Weather Observation Station 19
/*
Consider P1(a,c) and P2(b,d)  to be two points on a 2D plane where (a,b) are the 
respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the 
respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to 
display  decimal digits.

*/
/*
Enter your query here.
这个就是欧几里得距离
a，b,c,d 先在纸上写下来，一定要对应好
*/
select round( sqrt(power(min(LAT_N)-max(LAT_N),2) 
                +  power(min(LONG_W)-max(LONG_W),2) 
                  ),
           4)
from station

-- 11Weather Observation Station 20


/*
A median is defined as a number separating the higher half of a data set 
from the lower half. Query the median of the Northern Latitudes (LAT_N) 
from STATION and round your answer to 4 ecimal places.
*/

/*
Enter your query here.

Oracle 有直接的median() 函数
SELECT ROUND(MEDIAN(Lat_N), 4)
FROM Station;

但是Mysql 没有直接的中位数函数 需要自己做出来的中位数函数
下面是计算中位数的模板，对于新的题目，稍作修改就可以使用
select avg(c.s_score) 
from(
       select a.s_score 
       from score a,score b  表复制一份
       where a.c_id=b.c_id and a.c_id='02' 额外的条件
       group by a.s_score
       having sum(case when a.s_score=b.s_score then 1 else 0 end)
              >= abs(sum(sign(a.s_score-b.s_score)))
       )c;
*/

select round(avg(c.LAT_N),4)
from(
    select a.LAT_N 
    from station a,station b  
    group by a.LAT_N
    having sum(case when a.LAT_N=b.LAT_N then 1 else 0 end)
                  >= abs(sum(sign(a.LAT_N-b.LAT_N)))
)c; 

-- 12 The Report
/*
You are given two tables: Students and Grades. Students contains three 
columns ID, Name and Marks.
Grades contains the following data:
Ketty gives Eve a task to generate a report containing three columns:
 Name, Grade and Mark. Ketty doesn't want the NAMES of those students
 who received a grade lower than 8. The report must be in descending 
 order by grade -- i.e. higher grades are entered first. If there is 
 more than one student with the same grade (8-10) assigned to them, 
 order those particular students by their name alphabetically. 
 Finally, if the grade is lower than 8, use "NULL" as their name and 
 list them by their grades in descending order. If there is more than 
 one student with the same grade (1-7) assigned to them, order those particular
 students by their marks in ascending order.

Sample Output

Maria 10 99
Jane 9 81
Julia 9 88 
Scarlet 8 78
NULL 7 63
NULL 7 68
*/
/*
Enter your query here.
IF 条件的使用  
IF表达式
IF(expr1,expr2,expr3)

[如果 expr1 是TRUE (expr1 <> 0 and expr1 <> NULL)，则 IF()的返回值为expr2; 
否则返回值则为 expr3。IF() 的返回值为数字值或字符串值，具体情况视其所在语境而定。

select if(sva=1,"男","女") as ssva from taname where id = '111';


*/

SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS 
JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME

-- 13 Top Competitors

/*
Julia just finished conducting a coding contest, and she needs your 
help assembling the leaderboard! Write a query to print the respective
 hacker_id and name of hackers who achieved full scores for more than 
 one challenge. Order your output in descending order by the total number 
 of challenges in which the hacker earned a full score. If more than one 
 hacker received full scores in same number of challenges, then sort them 
 by ascending hacker_id.
*/
/*
Enter your query here.

select h.hacker_id, h.name
from submissions s
inner join challenges c
    on s.challenge_id = c.challenge_id
inner join difficulty d
    on c.difficulty_level = d.difficulty_level 
inner join hackers h
    on s.hacker_id = h.hacker_id
    
where s.score = d.score 
group by h.hacker_id, h.name
    having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, s.hacker_id asc

SELECT h.hacker_id, h.name
FROM submissions s

JOIN challenges c
        ON s.challenge_id = c.challenge_id
JOIN difficulty d
        ON c.difficulty_level = d.difficulty_level 
JOIN hackers h
        ON s.hacker_id = h.hacker_id
WHERE s.score = d.score 

GROUP BY h.hacker_id, h.name
        HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC
*/


SELECT h.hacker_id, h.name
FROM submissions s

JOIN challenges c
        ON s.challenge_id = c.challenge_id
JOIN difficulty d
        ON c.difficulty_level = d.difficulty_level 
JOIN hackers h
        ON s.hacker_id = h.hacker_id
WHERE s.score = d.score 

GROUP BY h.hacker_id, h.name
        HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC

-- 14  Ollivander's Inventory
/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing 
Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number 
of gold galleons needed to buy each non-evil wand of high power and age.
 Write a query to print the id, age, coins_needed, and power of the wands that
 Ron's interested in, sorted in order of descending power. If more than one wand 
 has same power, sort the result in order of descending age.

The following tables contain data on the wands in Ollivander's inventory:

*/

/*
Enter your query here.
# 难点： Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age
这个条件必须要有，也就是 得选出来花最少的钱卖的魔杖
*/
select id,age, coins_needed, a.power
from Wands a
join Wands_Property b
    on a.code = b.code 
where b.is_evil = 0 and 
      a.coins_needed = 
     (select min(coins_needed) 
      from Wands as a1 
      join Wands_Property as b1 
      on (a1.code = b1.code) 
      where a1.power = a.power and b1.age = b.age)
    
order by a.power desc, b.age desc

-- 15 Contest Leaderboard
/*
https://www.hackerrank.com/challenges/contest-leaderboard/problem
You did such a great job helping Julia with her last coding contest challenge that she 
wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the
 descending score. If more than one hacker achieved the same total score, then sort the 
 result by ascending hacker_id. Exclude all hackers with a total score of from your result.
*/
select h.hacker_id, name, sum(score) as total_score
from hackers as h 

inner join
    /* find max_score*/
    /*在join 表的时候就选择max score, 创建出来一个新只包含最大的分数*/
    (select hacker_id,  max(score) as score 
     from submissions 
     group by challenge_id, hacker_id) as max_score

on h.hacker_id=max_score.hacker_id
group by h.hacker_id, name

/* don't accept hackers with total_score=0 */
having total_score > 0

/* finally order as required */
order by total_score desc, h.hacker_id;

-- 16 Symmetric Pairs
/*
You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 ≤ Y1.
Sample Output

20 20
20 21
22 23
*/
/*
Enter your query here.
注意 查找出来的 symmetric pairs 是一对，但是只要输出(x1,x2)
第一次遇见这样的题 inner join 的条件也要注意，是直接按照题干要求来的
*/

SELECT f1.X, f1.Y 
FROM Functions f1
INNER JOIN Functions f2 
ON f1.X=f2.Y AND f1.Y=f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X 

-- 17 Challenges
/*
Julia asked her students to create some coding challenges. Write a query to 
print the hacker_id, name, and the total number of challenges created by each 
student. Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the 
result by hacker_id. If more than one student created the same number of challenges 
and the count is less than the maximum number of challenges created, then exclude 
those students from the result.
*/
# 不太会， 有点难
select a.hacker_id,a.name,count(b.hacker_id)    
from Hackers a, Challenges b
WHERE a.hacker_id = b.hacker_id
GROUP BY a.hacker_id,a.name
HAVING count(b.hacker_id) not in
    (select  distinct count(hacker_id) 
     from Challenges
     WHERE hacker_id <> a.hacker_id
     group by hacker_id
     having count(hacker_id) < 
                (select max(x.challenge_count) 
                 from 
                 (select count(b.challenge_id) as challenge_count                 
                  from Challenges b 
                  GROUP BY b.hacker_id) as x ))
ORDER BY count(b.hacker_id) desc, a.hacker_id 

-- 18  SQL Project Planning
/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date 
and End_Date. It is guaranteed that the difference between the End_Date and the 
Start_Date is equal to 1 day for each row in the table.
If the End_Date of the tasks are consecutive, then they are part of the same project. 
Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number 
of days it took to complete the project in ascending order. If there is more than 
one project that have the same number of completion days, then order by the start 
date of the project.
*/
/*
Enter your query here.
*/

SELECT Start_Date, MIN(End_Date)
FROM 
/* Choose start dates that are not end dates of other projects (if a start date is an end date, it is part of the samee project) */
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
/* Choose end dates that are not end dates of other projects */
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b
/* At this point, we should have a list of start dates and end dates that don't necessarily correspond with each other */
/* This makes sure we only choose end dates that fall after the start date, and choosing the MIN means for the particular start_date, we get the closest end date that does not coincide with the start of another task */
where start_date < end_date
GROUP BY start_date
ORDER BY datediff(start_date, MIN(end_date)) DESC, start_date

-- 19 Placements
/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID
 and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
 Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

*/

Select S.Name
From ( 
    /*Student 表和 Friends 表连接  使用ID 连接 */
    Students S join Friends F Using(ID)
    /*连接 packages 表 使用ID连接*/
    join Packages P1 on S.ID=P1.ID 
    /*这里注意，找friend的salary 的时候直接使用 Friend_ID = packages.ID*/
    join Packages P2 on F.Friend_ID=P2.ID)
Where P2.Salary > P1.Salary
Order By P2.Salary;




/**/
/**/
/**/
/**/
###########################################
################ 高阶用法 ##################  

-- 1. 高级排序 RANK，DENSE_RANK和ROW_NUMBER
     # https://blog.csdn.net/u011726005/article/details/94592866
use sakila;

# 创建表格
create table score(
  student_id varchar(10),
  course_id varchar(10),
  score decimal(18,1)
);

# 插入数据
insert into score values('01' , '01' , 80);
insert into score values('01' , '02' , 90);
insert into score values('01' , '03' , 99);
insert into score values('02' , '01' , 70);
insert into score values('02' , '02' , 60);
insert into score values('02' , '03' , 80);
insert into score values('03' , '01' , 80);
insert into score values('03' , '02' , 80);
insert into score values('03' , '03' , 80);
insert into score values('04' , '01' , 50);
insert into score values('04' , '02' , 30);
insert into score values('04' , '03' , 20);
insert into score values('05' , '01' , 76);
insert into score values('05' , '02' , 87);
insert into score values('06' , '01' , 31);
insert into score values('06' , '03' , 34);
insert into score values('07' , '02' , 89);
insert into score values('07' , '03' , 98);
insert into score values('08' , '02' , 89);
insert into score values('09' , '02' , 89);

select * from score;

	# RANK并列跳跃排名，并列即相同的值，相同的值保留重复名次，遇到下一个不同值时，跳跃到总共的排名。
    # DENSE_RANK并列连续排序，并列即相同的值，相同的值保留重复名次，遇到下一个不同值时，依然按照连续数字排名。
    # ROW_NUMBER连续排名，即使相同的值，依旧按照连续数字进行排名。
    
-- 不分组排名

    # 连续排名   使用ROW_NUMBER实现

    SELECT score,
	ROW_NUMBER() OVER (ORDER BY score DESC) ranking
	FROM score;
    
    # 并列跳跃排名 使用RANK实现
	SELECT course_id, score,
	RANK() OVER(ORDER BY score DESC)
	FROM score;
    
    # 并列连续排名  使用DENSE_RANK实现
    SELECT course_id, score,
	DENSE_RANK() OVER(ORDER BY score DESC) FROM score;

-- 分组排名
	# 分组连续排名  使用ROW_NUMBER实现
	SELECT course_id, score,
	ROW_NUMBER() OVER (PARTITION BY course_id ORDER BY score DESC) ranking FROM score;

	# 分组并列跳跃排名 使用RANK实现
	SELECT course_id, score,
	RANK() OVER(PARTITION BY course_id ORDER BY score DESC)
	FROM score;
    
    # 分组并列连续排名  使用DENSE_RANK实现
	SELECT course_id, score,
	DENSE_RANK() OVER(PARTITION BY course_id ORDER BY score DESC)
	FROM score;


-- 2. case 用法
    # 判断三角形
	#  Equilateral: It's a triangle with  sides of equal length.
	# Isosceles: It's a triangle with  sides of equal length.
	# Scalene: It's a triangle with  sides of differing lengths.
	# Not A Triangle: The given values of A, B, and C don't form a triangle.
	
#CASE语句有两种形式：第一种评估一个或多个条件，并返回第一个符合条件的结果。 如果没有条件是符合的，则返回ELSE子句部分的结果，如果没有ELSE部分，则返回NULL：
# 注意 case...end   when..then..else 不要缺少关键词。
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

select case 
        when A + B > C and B + C > A and A + C > B then
            case
                when A=B and B = C then 'Equilateral'
                when A=B or A=C or B=C then 'Isosceles'
                else 'Scalene'
            end
		else 'Not A Triangle'
        end
from TRIANGLES





















