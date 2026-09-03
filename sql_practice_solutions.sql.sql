-- Section 1: Q1
create database company_store;

-- Q2
select name
from sys.databases;

-- Q3
use company_store;

-- Q4
if DB_ID('temp_test') is null
create database temp_test;

-- Q5
drop database temp_test;

-- Q6
select DB_NAME() as CurrentDatabase;

-- Q7
-- A database contains tables and other database objects. A table on the other hand, stores the actual data in rows and columns.
-------------------------------------------------------------------------------------------------------
-- Section 2: Q8
create table departments(department_id int identity(1,1) primary key,
department_name nvarchar(50) not null);

-- Q9
create table employees(employee_id int identity(1,1) primary key,
first_name nvarchar(50), 
last_name nvarchar(50),
email nvarchar(100),
hire_date Date,
salary decimal(10,2),
department_id int);

-- Q10
create table projects(project_id int identity(1,1) primary key,
project_name varchar(100),
start_date Date,
end_date Date,
department_id int);

alter table projects
alter column project_name nvarchar(100)

-- Q11
create table customers(customer_id int identity(1,1) primary key,
full_name nvarchar(100),
email nvarchar(100),
city nvarchar(50),
join_date Date);

-- Q12
create table products(product_id int identity(1,1) primary key,
product_name nvarchar(100),
category nvarchar(50),
price decimal(10,2),
stock_quantity int);

-- Q13
create table orders(order_id int identity(1,1) primary key,
customer_id int,
order_date Date,
status nvarchar(50));

-- Q14
create table order_items(order_item_id int identity(1,1) primary key,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,2));

-- Q15 
select name
from sys.tables;

-- Q16
exec sp_help 'employees';

-- Q17
-- department_id appers in both tables so each employee can be linked to the department they work in. In departments it is the primaryy key, and in employees it is used as a foreign key.

-- Section 3: Q18
alter table employees
add unique(email);

-- Q19
alter table employees
alter column hire_date Date not null;

-- Q20
alter table employees
add constraint check_emp_salary
check (salary > 0);

-- Q21
alter table employees
add foreign key (department_id) 
references departments(department_id);

-- Q22
alter table projects
add foreign key (department_id)
references departments(department_id);

-- Q23
alter table orders
add foreign key (customer_id)
references customers(customer_id);

-- Q24
alter table order_items
add foreign key (order_id)
references orders(order_id);

alter table order_items
add foreign key (product_id)
references products(product_id);

-- Q25
alter table orders
add constraint default_status
default 'pending' for status;

-- Q26
alter table customers
add constraint unique_email
unique(email);

-- Q27
-- A foreign key connects the main column (primary key) of a table to another.

-- Section 4: Q28
alter table employees
add phone_number nvarchar(50);

-- Q29
alter table employees
add is_manager Bit default(0);

-- Q30
exec sp_rename
'customers.full_name',
'customer_name',
'column';

-- Q31
alter table employees
alter column phone_number nvarchar(20);

-- Q32
alter table order_items
add discount decimal(5,2) default(0);

-- Q33
exec sp_help 'employees';

alter table employees
drop constraint DF__employees__is_ma__73BA3083;

alter table employees
drop column is_manager;

-- Q34
exec sp_rename
'order_items',
'order_line-items';

exec sp_rename
'order_line-items',
'order_items';

-- Q35
alter table projects
add budget decimal(12,2);

-- Q36
exec sp_help 'employees';

alter table employees
drop constraint check_emp_salary;

-- Q37
create table temp_test(id int,
name nvarchar(50));

truncate table temp_test;

-- Section 5: Q38
insert into departments (department_name)
values
('HR'),
('Sales'),
('IT'),
('Marketing');

-- Q39
insert into employees
(first_name, last_name, email, hire_date, salary, department_id, phone_number)
values
('Ahmed','Ali','ahmed@gmail.com','2021-01-10',7000,1,'01011111111'),
('Sara','Mohamed','sara@gmail.com','2022-03-15',8500,2,'01022222222'),
('Omar','Hassan','omar@gmail.com','2020-06-20',9500,3,NULL),
('Mona','Adel','mona@gmail.com','2023-05-11',6000,4,NULL),
('Karim','Tarek','karim@gmail.com','2019-08-01',12000,3,'01033333333'),
('Hoda','Mostafa','hoda@gmail.com','2024-01-15',5500,1,NULL),
('Youssef','Samir','youssef@gmail.com','2022-07-09',8000,2,'01044444444'),
('Nour','Ahmed','nour@gmail.com','2021-11-21',11000,3,NULL),
('Aya','Khaled','aya@gmail.com','2023-09-01',6500,4,'01055555555'),
('Ali','Mahmoud','ali@gmail.com','2020-12-10',5000,2,NULL);

-- Q40
insert into employees
(first_name, last_name, email, hire_date, salary, department_id)
values
('Amr','Mostafa','amr@gmail.com','2024-02-01',5200,1),
('Omar', 'Hassan', 'omar.it@gmail.com', '2023-03-15', 7000, 3),
('Mariam', 'Ali', 'mariam.it@gmail.com', '2022-08-10', 8500, 3),
('Youssef', 'Ahmed', 'youssef.it@gmail.com', '2024-01-20', 6500, 3);

-- Q41
insert into projects
(project_name, start_date, end_date, department_id, budget)
values
('Recruitment System','2024-01-01',NULL,1,50000),
('Sales Dashboard','2023-02-01','2024-02-01',2,90000),
('Network Upgrade','2024-04-01',NULL,3,150000),
('Marketing Campaign','2023-05-01','2023-12-31',4,70000),
('Old System','2018-01-01','2019-05-01',3,30000);

-- Q42
insert into customers
(customer_name, email, city, join_date)
values
('Mohamed Ali','mohamed@gmail.com','Cairo','2023-01-10'),
('Sara Tarek','sarat@gmail.com','Alexandria','2023-04-15'),
('Omar Khaled','omark@gmail.com','Cairo','2022-08-20'),
('Mona Ahmed','monaa@gmail.com','Damietta','2024-01-10'),
('Karim Hassan','karimh@gmail.com','Giza','2023-11-22'),
('Hoda Adel','hodaa@gmail.com','Damietta','2022-05-18'),
('Youssef Ali','youssefa@gmail.com','Cairo','2024-02-11'),
('Nour Samir','nours@gmail.com','Alexandria','2023-06-01');

-- Q43
insert into products
(product_name, category, price, stock_quantity)
values
('Laptop Pro','Electronics',1000,20),
('Smartphone Pro','Electronics',800,30),
('Headphones','Electronics',100,40),
('Mouse','Electronics',30,0),
('Office Chair','Furniture',150,15),
('Desk','Furniture',300,10),
('T-Shirt','Clothing',25,50),
('Jeans','Clothing',60,30),
('Shoes','Clothing',80,25),
('Coffee Maker','Home',120,12);

-- Q44
insert into orders
(customer_id, order_date, status)
values
(1,'2024-01-05','delivered'),
(2,'2024-02-10','shipped'),
(3,'2024-03-01','pending'),
(4,'2024-03-20','delivered'),
(5,'2024-04-01','shipped'),
(6,'2024-04-15','cancelled');

-- Q45
insert into order_items
(order_id, product_id, quantity, unit_price)
values
(1,1,1,1000),
(1,3,2,100),
(2,2,1,800),
(2,5,2,150),
(3,7,4,25),
(3,8,2,60),
(4,1,1,1000),
(4,10,1,120),
(5,9,2,80),
(5,6,1,300),
(6,3,1,100),
(6,7,2,25);

-- Q46
insert into employees
(first_name,last_name,email,hire_date,salary,department_id)
values
('Test','Employee','ahmed@gmail.com','2024-01-01',5000,1);

-- Q47
insert into departments (department_name)
values
('Finance'),
('Legal');

-- Section 6: Q48
update employees
set salary = salary * 1.10
where department_id = 3;

-- Q49
update employees 
set email = 'newemail@gmail.com'
where employee_id = 1;

-- Q50
update orders
set status = 'completed'
where order_date < '2024-04-01';

-- Q51
update products
set stock_quantity = stock_quantity + 50
where product_id = 1;

-- Q52
update products
set price = price * 1.15
where category = 'Electronics';

-- Q53
select * from employees
update employees
set phone_number = '0106666666'
where phone_number is null;

-- Q54
update departments
set department_id = 2
where department_id = 1;

-- Q55
update order_items
set discount = 0.05
where quantity > 3;

-- Q56
begin transaction;

update employees
set salary = salary * 1.05;

select * from employees;

Rollback;
-- Updating a table without a WHERE clause is dangerous because every row in the table will be modified

-- Q57
select * from projects
update projects
set end_date = '2027-12-31'
where project_id = 1
and end_date is null;

-- Section 7: Q58
select * from customers
where customer_id not in(
select customer_id
from  orders);

delete from customers
where customer_id = 8;

-- Q59
delete products
where stock_quantity = 0;

-- Q60
delete from departments
where department_id = 3;
-- 'The DELETE statement conflicted with the REFERENCE constraint "FK__employees__depar__6C190EBB". The conflict occurred in database "company_store", table "dbo.employees", column 'department_id'.;

-- Q61
select * from orders
where status = 'cancelled'

-- Q62
delete from order_items
where order_id = 6;

-- Q63
delete from projects 
where end_date < '2020-01-01';

-- Section 8: Q64
select * from employees

-- Q65
select first_name, last_name, salary 
from employees;

-- Q66
select distinct city 
from customers;

-- Q67
select distinct category 
from products;

-- Q68
select product_name, price as unit_cost
from products;

-- Q69
select top 5 * from orders;

-- Q70
select first_name + ' ' + last_name as full_name
from employees;

-- Q71
select *,
price * 0.90 as price_after_discount
from products

-- Q72
select *,
salary * 12 as annual_salary
from employees;

-- Q73
select * from departments
order by department_name ASC;

-- Section 9: Q74
select * from employees
where salary > 5000;

-- Q75
select * from employees
where department_id = 2;

-- Q76
select * from products
where price between 20 and 100;

-- Q77
select * from customers
where city = 'Damietta';

-- Q78
select * from orders
where status IN ('pending', 'shipped')

-- Q79
select * from employees
where first_name LIKE 'A%'

-- Q80
select * from products
where product_name LIKE '%Pro%';

-- Q81
select * from employees
where employee_id <> 3;

-- Q82
select * from employees
where phone_number is null;

-- Q83
select * from employees
where phone_number is not null;

-- Q84
select * from orders
where order_date >= DateAdd(Day, -30, GetDate());

-- Q85
select * from products
where price > 50
and stock_quantity > 10;

-- Q86
select * from customers
where join_date LIKE '%2023%'
or city = 'Cairo';

select * from customers
where YEAR(join_date) = 2023
or city = 'Cairo';

-- Section 10: Q87
select * from employees
order by salary DESC;

-- Q88
select * from products 
order by category ASC, price ASC;

-- Q89
select top 3 * from employees
order by hire_date DESC;

-- Q90
select top 5 * from products
order by price ASC;

-- Q91
select * from customers
order by customer_id
offset 5 rows
fetch next 5 rows only;

-- Section 10B: Q92
select top  3 * from employees
order by salary DESC;

-- Q93
select top 5 * from products
order by price DESC;

-- Q94
select *,
row_number() over(order by salary desc) as row_num
from employees;

-- Q95
select *,
rank() over(partition by department_id
order by salary DESC) as salary_rank
from employees;

-- Q96
select *,
dense_rank() over(partition by department_id
order by salary DESC) as salary_rank
from employees;
--RANK() and DENSE_RANK() both give the same rank to employees with equal salaries.
--The difference is that RANK() leaves a gap after a tie, while DENSE_RANK() continues with the next consecutive rank without skipping a number.

-- Q97
with ranked_emp as(
select *,
rank() over(partition by department_id
order by salary DESC) as salary_rank
from employees)

select * from ranked_emp
where salary_rank = 1;

-- Q98
with ranked_products as(
select *,
row_number() over(partition by category
order by price DESC) as row_num
from products)

select * from ranked_products
where row_num <= 2;

-- Section 11: Q99
select count(*) as total_emp
from employees;

-- Q100
select department_id,
count(*) as emp_count
from employees
group by department_id

-- Q101
select AVG(salary) as avg_salary
from employees;

-- Q102
select department_id,
AVG(salary) as avg_salary_per_dep
from employees
group by department_id;

-- Q103
select MAX(salary) as highest_salary,
MIN(salary) as lowest_salary
from employees;

-- Q104
select SUM(price * stock_quantity)
from products;

-- Q105
select customer_id,
count(order_id) as orders_placed
from orders
group by customer_id;

select customer_id,
count(*) as orders_placed
from orders
group by customer_id;

-- Q106
select product_id,
SUM(quantity * unit_price) as total_revenue
from order_items
group by product_id;

-- Q107
select category,
count(*) product_count
from products
group by category
having count(*) > 2;

-- Q108
select department_id,
avg(salary) as avg_emp_salary
from employees
group by department_id
having avg(salary) > 6000;

-- Q109
select status,
count(*) as order_count
from orders
group by status;

-- Q110
select
max(hire_date) as earliest_hire,
min(hire_date) as latest_hire
from employees;

-- Q111
select e.first_name, e.last_name, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id;

-- Q112
select e.first_name, e.last_name, d.department_name
from departments d
left join employees e
on e.department_id = d.department_id;

-- Q113
select c.customer_name,o.order_id, o.order_date, o.status
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- Q114
select c.customer_name,o.order_id, o.order_date, o.status
from orders o
inner join customers c
on c.customer_id = o.customer_id;

-- Q115
select o.order_id, p.product_name, i.quantity
from orders o
inner join order_items i
on i.order_id = o.order_id
inner join products p
on i.product_id = p.product_id;

-- Q116
select e.first_name, e.last_name, p.project_name
from employees e
inner join departments d
on e.department_id = d.department_id
inner join projects p
on d.department_id = p.department_id;

-- Q117
select c.customer_name, sum(i.quantity * i.unit_price) as total_spent
from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join order_items i
on c.customer_id = o.customer_id
group by c.customer_name;

-- Q118
select p.*
from products p
left join order_items i 
on p.product_id = i.product_id
where i.product_id is null;

-- Q119
select e.*
from employees e
left join projects p
on e.department_id = p.department_id
where p.project_id is null;

-- Q120
select e.department_id, e.first_name, e.last_name, e.salary
from employees e
inner join(
select department_id,
max(salary) as max_salary
from employees
group by department_id) m
on e.department_id = m.department_id;

-- Section 13: Q121
select * from employees
where salary > (
select AVG(salary)
from employees);

-- Q122
select p.*
from products p
where price > (select AVG(s.price)
from products s
where s.category = p.category);

-- Q123
select * from customers
where customer_id not in(
select customer_id from orders);

-- Q124
select top 1 department_id,
SUM(salary) as total_salary
from employees
group by department_id
order by total_salary DESC;

-- Q125
select top 1 product_id,
SUM(quantity) as total_quantity
from order_items
group by product_id
order by total_quantity DESC;

--- OR
select top 1 p.product_name,
SUM(i.quantity) as total_quantity
from order_items i 
inner join  products p
on i.product_id = p.product_id
group by p.product_name
order by total_quantity DESC;

-- Section 14: Q126
create view employee_department_view as
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id

-- Q127
select * from employee_department_view
where salary > 5000;

-- Q128
drop view employee_department_view

-- Q129
create index idx_customers_email
on customers(email);

-- Q130
-- An index helps the database find rows faster without scanning the entire table. 
--However, indexes should not be added to every column because they use extra storage and can slow down INSERT, UPDATE, and DELETE operations.

-- Q131
select c.customer_name,
COUNT(distinct o.order_id) as order_count,
SUM(i.quantity * i.unit_price) as total_spent,
MAX(o.order_date) as most_recent_order
from customers c
left join orders o
on c.customer_id = o.customer_id
left join order_items i
on o.order_id = i.order_id
group by c.customer_name
order by total_spent DESC;

-- Q132
select top 1 e.department_id,
SUM(e.salary) as total_value
from employees e
inner join projects p
on e.department_id = p.department_id
where p.end_date IS NULL
or p.end_date >= GETDATE()
group by e.department_id
order by total_value DESC;

-- Q133
create table reviews (
review_id int identity(1,1) primary key,
product_id int,
rating int,
review_text nvarchar(200),
foreign key (product_id)
references products(product_id));

