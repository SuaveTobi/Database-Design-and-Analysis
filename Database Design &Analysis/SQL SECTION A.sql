##1.Select customer name together with each order the customer made.
select c.customer_name, o.order_id
from customers as c
join orders as o on c.customer_id = o.customerid;

##2. Select order id together with name of employee who handled the order.
select o.order_id, e.first_name, e.last_name
from orders as o
join employees as e on o.employeeid = e.employees_id;

##3. Select customers who did not placed any order yet. 
select c.customer_id,c.customer_name,o.order_id
from customers as c
left join orders as o on c.customer_id = o.customerid
where o.order_id is null;

## 4. Select order id together with the name of products.
select o.orderid, p.productname
from order_details as o
join products as p on o.productid = p.product_id;

## 5. Select products that no one bought. 
select p.product_id,p.productname
from products as p
left join order_details as o on p.product_id = o.productid
where o.order_details_id is null;

## 6. Select customer together with the products that he bought. 
select c.customer_id,c.contact_name,p.productname, p.product_id
from customers as c
join orders as o on c.customer_id = o.customerid
join order_details as od on o.order_id = od.orderid
join products as p on od.productid = p.product_id;

## 7. Select product names together with the name of corresponding category. 
select p.productname, c.categories_name
from products as p
join categories as c on p.categeoryid = c.categories_id;

## 8. Select orders together with the name of the shipping company. 
select o.order_id,s.shipper_id,s.shipper_name
from orders as o
join shippers as s on o.shipperid = s.shipper_id;

## 9. Select customers with id greater than 50 together with each order they made. 
select c.customer_id,c.customer_name,o.order_id
from customers as c
join orders as o on c.customer_id = o.customerid
where o.order_id > 50;

## 10. Select employees together with orders with order id greater than 10400. 
select e.first_name,e.last_name,o.order_id
from employees as e
join orders as o on e.employees_id = o.employeeid
where o.order_id > 10400;

## 11. Select the most expensive product. 
select productname,price
from products
order by price desc
limit 1;

## 12. Select the second most expensive product.
select productname,price
from products
order by price desc
limit 1 offset 1;

## 13. Select name and price of each product, sort the result by price in decreasing order.
select productname,price
from products
order by price desc;

## 14. Select 5 most expensive products.
select productname,price
from products
order by price desc
limit 5;

## 15. Select 5 most expensive products without the most expensive (in final 4 products).
select productname,price
from products
order by price desc
limit 4 offset 1;

## 16. Select name of the cheapest product (only name) without using LIMIT and OFFSET. 
select productname
from products
where price = (select min(price) from products);

## 17. Select name of the cheapest product (only name) using subquery. 
select productname
from products
where price = (select min(price) from products);

## 18. Select number of employees with LastName that starts with 'D'.
select count(*)
from employees
where last_name like 'D%';

## 19. Select customer name together with the number of orders made by the corresponding 
##     customer, sort the result by number of orders in decreasing order.
select c.customer_name, count(o.order_id) as "Number of orders"
from customers as c
join orders as o on c.customer_id = o.customerid
group by c.customer_name
order by count(o.order_id) desc;

## 20. Add up the price of all products.
select sum(price)
from products;

## 21. Select orderID together with the total price of that Order, order the result by total 
##     price of order in increasing order.
select od.orderid,sum(p.price) as 'Total Price'
from order_details as od
join products as p on od.productid = p.product_id
group by od.orderid
order by sum(p.price) asc;

## 22. Select customer who spend the most money. 
select sum(p.price),od.orderid,c.customer_name
from customers as c
join orders as o on c.customer_id = o.customerid
join order_details as od on o.order_id = od.orderid
join products as p on od.productid = p.product_id
group by od.orderid
order by sum(p.price) desc
limit 1;

## 23. Select customer who spend the most money and lives in Canada.
select sum(p.price),c.customer_name,o.order_id,s.country
from customers as c
join orders as o on c.customer_id = o.customerid
join order_details as od on o.order_id = od.orderid
join products as p on od.productid = p.product_id
join suppliers as s on p.supplierid = s.suppliers_id
where s.country = "Canada"
group by od.orderid,s.country
order by s.country,sum(p.price) desc;

## 24. Select customer who spend the second most money. 
select sum(p.price),od.orderid,c.customer_name
from customers as c
join orders as o on c.customer_id = o.customerid
join order_details as od on o.order_id = od.orderid
join products as p on od.productid = p.product_id
group by od.orderid
order by sum(p.price) desc
limit 1 offset 1;

## 25. Select shipper together with the total price of proceed orders.
select sum(p.price),count(s.shipper_id),s.shipper_name
from products as p
join shippers as s on p.supplierid = s.shipper_id
group by s.shipper_name
order by sum(p.price) desc,count(s.shipper_id);
