##       SECTION B. Exploratory Data Analysis
## 1. Total number of products sold so far.* 
select count(productid) as 'Total Products Sold'
from order_details;

## 2. Total Revenue So far.* 
select round(sum(price*quantity)) as 'Total Revenue'
from products
join order_details on product_id = productid;

## 3. Total Unique Products sold based on category. 
select count(distinct categories_id) as 'Total Products Category Sold'
 from categories
 join products on categories_id = categeoryid;
 
## 4. Total Number of Purchase Transactions from customers.* 
select count(customerid) as "Total No of Purchase"
from orders;

## 5. Compare Orders made between 2021 – 2022 
select year(orderdate)as 'Year',count(order_id) as 'Orders'
from orders
where orderdate between '2022-01-01' and '2023-12-31'
group by year(orderdate);

## 6. What is total number of customers? Compare those that have made transaction and those that haven’t at all. 
select count(distinct customer_id) as 'Total Customers',count(distinct customerid)'Transacting Customer'
,count(distinct customer_id)-count(distinct customerid) as 'Non-transacting Customerrs'
from customers 
left join orders on customer_id = customerid;

## 7. Who are the Top 5 customers with the highest purchase value? 
select customer_name as "Top 5 Customers",count(order_id) as "Purchase Value"
from customers
join orders on customer_id = customerid
group by customer_id
order by count(order_id) desc
limit 5;

## 8. Top 5 best-selling products. 
select productname as 'Top 5 Products',count(productid) as 'Times Sold'
from products
join order_details on product_id = productid
group by product_id
order by count(productid) desc
limit 5;

## 9. What is the Transaction value per month?
select monthname(orderdate) as 'Month',round(sum(price*quantity)) as 'Monthly Revenue'
from products
join order_details on product_id = productid
join orders on orderid = order_id
group by monthname(orderdate)
order by 'Monthly Revenue' desc;

## 10. Best Selling Product Category?* 
select categories_name as 'Category Name',count(categeoryid) as 'Times Sold'
from categories
join products on categories_id = categeoryid
group by categories_id
order by count(categeoryid) desc
limit 5;

## 11. Buyers who have Transacted more than two times.* 
select customer_name as "Customers",customer_id,count(customerid) as 'Transactions'
from  customers
join orders on customer_id = customerid
group by customer_id
having count(customerid) > 2
order by count(customerid) desc;

## 12. Most Successful Employee.*
select concat(first_name,' ',last_name) as 'Employee Name',count(employeeid) as 'Times Successful'
from employees 
join orders on employees_id = employeeid
group by employeeid
order by count(employeeid) desc
limit 5;

## 13. Most used Shipper.
select shipper_name 'Shipper Name',count(shipperid)as 'Times Used'
from shippers
join orders on shipper_id = shipperid
group by shipper_id
order by count(shipperid) desc;

## 14. Most Used Supplier
select suppliers_name as 'Supplier',count(supplierid) as 'Times Used'
from suppliers
join products on suppliers_id = supplierid
group by suppliers_name
order by count(supplierid) desc
limit 5;