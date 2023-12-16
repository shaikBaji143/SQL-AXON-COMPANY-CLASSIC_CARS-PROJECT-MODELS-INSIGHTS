use classicmodels;
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;
-- ------------------------------------------------
select CustomerNumber,concat_ws(" ",contactLastName,contactFirstName) as ContactName,
concat_ws(",",addressLine1,addressLine2,city,state) as address,
country,salesrepEmployeenumber,creditlimit from customers;

select employeenumber, concat_ws(" ",firstName,LastName) as Name,
officecode,reportsto,jobtitle from employees;

select officecode,city,country,
concat_ws(",",addressLine1,addressLine2,state) as address from offices;

select * from orderdetails;

select ordernumber,orderdate,requireddate,shippeddate,status,customernumber from orders;

select customernumber,sum(amount) as Total_amount from payments 
group by customernumber order by Total_amount;

select productline,textdescription from productlines;

select * from products;

-- --------------------------------------------
-- 1.Total Revenue Of Company
select "Total Revenue : ",sum(amount) as Total_Revenue from payments; 

-- 2. Top 10 Customers 
select a.customernumber,b.customername,sum(a.amount) as Total_amount
from payments a
inner join customers b 
on b.customernumber = a.customernumber
group by a.customernumber 
order by Total_amount desc limit 10;

-- 3.Top 10 Countries in Sales
select a.country,sum(b.amount) as Total_revenue
from customers a 
inner join payments b 
on b.customerNumber = a.customernumber
group by a.country order by Total_revenue desc;

-- 4.Total Employees Count 
select "Employees Count : ",
count(distinct(EmployeeNumber)) as Total_Employee_Count 
from employees;

-- 5.Total Distinct Product Available
select distinct(productline) as All_Products from products;

-- 6.All Offices Overall World 
select distinct(country) from customers;

-- 7.Top 10 Employees Made High Sales
select a.EmployeeNumber,sum(c.amount) as Total_Amount 
from employees a inner join customers b 
on a.EmployeeNumber=b.salesrepemployeenumber
inner join payments c on c.customernumber = b.customernumber
group by a.EmployeeNumber
order by Total_Amount desc limit 10;




