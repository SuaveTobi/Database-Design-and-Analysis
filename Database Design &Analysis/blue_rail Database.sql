-- creating database--
Create database blue_rail;

-- use database
use blue_rail;
-- creating Tables ffor my database
-- creating customers table
create table customers(
     customer_id int auto_increment primary key,
     customer_name varchar(150) not null,
     contact_name varchar(150) not null,
     address varchar(150) not null,
     city varchar(150) not null,
     postalcode varchar(150) not null,
     country varchar(150) not null
);
## DATA FOR CUSTOMERS TABLE WAS IMPORTED #
create table employees(
employees_id int auto_increment primary key,
first_name varchar(150) not null,
last_name varchar(150) not null,
birthdate date not null,
photo varchar(150) not null,
notes text
);
## DATA FOR EMPLOYEES TABLE WAS IMPORTED #

create table shippers(
   shipper_id int auto_increment primary key,
   shipper_name varchar(150) not null,
   phone varchar(150) not null
   );
   ## DATA FOR SHIPPERS TABLE WAS IMPORTED #
   
   create table suppliers(
     suppliers_id int auto_increment primary key,
     suppliers_name varchar(150) not null,
     contact_name varchar(150) not null,
     address varchar(150) not null,
     city varchar(150) not null,
     postal_code varchar(150) not null,
     country varchar(150) not null,
     phone varchar(150) not null
     );
     ## DATA FOR SUPPLIERS TABLE WAS IMPORTED #
     
     create table categories(
       categories_id int auto_increment primary key,
       categories_name varchar(150) not null,
       Description varchar(150) not null
       );
   
   ## DATA FOR SUPPLIERS TABLE WAS IMPORTED #
   create table products(
     product_id int auto_increment primary key,
     productname varchar(150) not null,
     supplierid int,
     categeoryid int,
     unit varchar(150),
     price double not null,
     
     -- add my foeign keys
     constraint supplier_fk foreign key (supplierid) references suppliers(suppliers_id),
     constraint category_fk foreign key (categeoryid) references categories(categories_id)
     );
   
   ## DATA FOR PRODUCTS TABLE WAS IMPORTED #
   
   create table orders(
     order_id int auto_increment primary key,
     customerid int,
     employeeid int,
     orderdate date,
     shipperid int,
     
     -- adding foreign keys
     constraint customer_fk foreign key (customerid) references customers(customer_id),
     constraint employee_fk foreign key (employeeid) references employees(employees_id),
     constraint shipper_fk foreign key (shipperid) references shippers(shipper_id)
   );
   
   
   ## DATA FOR ORDERS TABLE WAS IMPORTED #
   
   create table order_details(
     order_details_id int auto_increment primary key,
     orderid int,
     productid int,
     quantity int,
     -- adding foreign keys
     constraint order_fk foreign key (orderid) references orders(order_id),
     constraint product_fk foreign key (productid) references products(product_id)
   )
   ## DATA FOR ORDER DETAIL------- TABLE WAS IMPORTED #