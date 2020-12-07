-- 总结
-- SQL Query 和 SQL Database 相关操作 
-- https://www.w3schools.com/sql/sql_groupby.asp
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
      A Like '[a-f]%'-- where the first letter of the City starts with anything from an "a" to an "f".
      A Like '[^acs]%' -- 不以 "a" or a "c" or an "s"开头
      A between 10 and 20 -- value of the Price column is between 10 and 20.
	  A not between 10 and 20  -- Price column 不在 10 and 20

group by... having...  分组

	后面跟列属性
    
order by ... limit...  排序
	order by city 按照city的字母顺序排序
    order by city desc 按照city的字母降序排序
    order by city asc  按照升序
    order by city,country 先按照city排序然后再按照country排序

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

排序 MYSQL实现排名函数RANK，DENSE_RANK和ROW_NUMBER
	图文链接： https://blog.csdn.net/u011726005/article/details/94592866
	RANK并列跳跃排名，并列即相同的值，相同的值保留重复名次，遇到下一个不同值时，跳跃到总共的排名。
    DENSE_RANK并列连续排序，并列即相同的值，相同的值保留重复名次，遇到下一个不同值时，依然按照连续数字排名。
    ROW_NUMBER连续排名，即使相同的值，依旧按照连续数字进行排名。
    
    不分组跑【排名
    连续排名
    SELECT score,
	ROW_NUMBER() OVER (ORDER BY score DESC) ranking
	FROM score;
    
    并列跳跃排名
	SELECT course_id, score,
	RANK() OVER(ORDER BY score DESC)
	FROM score;
    
    并列连续排名
    SELECT course_id, score,
	DENSE_RANK() OVER(ORDER BY score DESC) FROM score;

	分组排名
    
    
    
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


