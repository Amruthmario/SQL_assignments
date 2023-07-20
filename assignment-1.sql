
CREATE DATABASE ASSIGNMENT;

USE ASSIGNMENT;

create table country(
	    Name_id varchar(100),
	population integer,
    capital varchar(100)       
       );
	-- insert  of following given data 
INSERT INTO country(  Name_id, population,capital )
			   Values (          'China',	    1382, 	      'Beijing' ),
					  (          'India',		1326,	 	    'Delhi' ),
					  (  'United States',		 324, 'Washington D.C.' ),
					  (      'Indonesia',		 260,	 	  'Jakarta' ),
					  (         'Brazil',		 209,	 	 'Brasilia' ),
					  (       'Pakistan',		 193,	 	'Islamabad' ),
					  (        'Nigeria',		 187,	 	    'Abuja' ),
					  (     'Bangladesh',		 163,	 	    'Dhaka' ),
					  (         'Russia',	   	 143,	 	   'Moscow' ),
					  (         'Mexico',		 128,	  'Mexico City' ),
					  (          'Japan',		 126, 	        'Tokyo' ),
					  (    'Philippines',		 102,	 	   'Manila' ),
					  (       'Ethiopia',		 101,	  'Addis Ababa' ),
					  (        'Vietnam', 		  94,	 	    'Hanoi' ),
					  (          'Egypt',		  93,	 	    'Cairo' ),
					  (        'Germany',	      81,	 	   'Berlin' ),
					  (           'Iran',		  80,	 	   'Tehran' ),
					  (         'Turkey',		  79,	 	   'Ankara' ),
					  (          'Congo',		  79,	 	 'Kinshasa' ),
				      (         'France',		  64,	 	    'Paris' ),
					  ( 'United Kingdom',	      65,	 	   'London' ),
					  (          'Italy',		  60,	 	     'Rome' ),
					  (   'South Africa',		  55,	 	 'Pretoria' ),
					  (        'Myanmar',		  54,	 	'Naypyidaw' );



--  Add a couple of countries of your choice
					
INSERT INTO country(     Name_id, population,   capital )
			   Values ( 'South Korea',	       51, 	 'Seoul' ),
					  (      'Uganda',		   45, 'Kampala' );
                      
Select * from country;

--  Change ‘Delhi' to ‘New Delhi'

Update country
	set capital = 'New Delhi'
		where Name_id regexp 'India';

Update country
	set capital = 'New Delhi'
		where Name_id='India';

-- Rename country to big_country
rename table country to big_country;
select * from big_country;

-- Create the following tables. Use auto increment wherever applicable
-- a. Product
-- product_id - primary key
-- product_name - cannot be null and only unique values are allowed description
-- supplier_id - foreign key of supplier table

create table product (
              product_id int primary key auto_increment,
              product_name varchar(100) unique not null,
              description varchar(100),
              supplier_id int 
              );

alter table product auto_increment=100;

-- b. Suppliers
-- supplier_id - primary key
-- supplier_name
-- location

create table Suppliers (
              supplier_id int primary key auto_increment,
              supplier_name varchar(20),
              location varchar(20)
              );
              
              alter table Suppliers auto_increment=200;

-- c. Stock
-- id - primary key
-- product_id - foreign key of product table
-- balance_stock
         
create table stock(
     id int primary key auto_increment,
     product_id int,
     balance_stock int,
     foreign key(product_id)
	 references product(product_id)
        on delete set null
	 );
Alter table stock auto_increment = 300;

Alter table product
	add foreign key (supplier_id)
		references suppliers(supplier_id)
        on delete cascade;
select * from product;
select * from Suppliers;


-- Enter some records into the three tables.

insert into product( product_name,description,supplier_id) values
				   ( 'Washing machine', 'Used for washing clothes', Null),
                   ( 'Phone', 'Helps in Communicate', 123),
                   ( 'Laptop', 'To do tasks as many as we can',456); 

insert into Suppliers(supplier_name,location)values
                     ( 'Samsung', 'Hyderbad'),
                     ( 'iphone', 'Chennai'),
                     ( 'Asus', 'Banglore');
                     
update product set supplier_id= 
                               case product_name
                               when 'Washing machine' then 1
                               when 'Phone' then 2
                               when  'Laptop' then 3
                               END
                               where product_name in ('Washing machine','Phone','Laptop');


-- Modify the supplier table to make supplier name unique and not null

alter table Suppliers modify supplier_name varchar(30) unique not null;

-- Modify the emp table as follows
-- a.	Add a column called deptno

CREATE TABLE  emp  (
   emp_no  int(11) NOT NULL,        -- This table is there in consolidated tables.
   birth_date  date NOT NULL,
   first_name  varchar(14) NOT NULL,
   last_name  varchar(16) NOT NULL,
   gender  enum('M','F') NOT NULL,
   hire_date  date NOT NULL,
   salary  float(8,2) DEFAULT 7850.00
) ;
select * from emp;
alter table emp 
        rename column emp_no to emp_id;
        
update emp set dep_no = 
                 case 
                 when emp_id % 2 then 20
                 when emp_id % 3 then 30
                 when emp_id % 4 then 40 
                 else 10 
				 end;
                 
-- Create a unique index on the emp_id column.

describe EMP_ID_UNIQemp;

CREATE UNIQUE INDEX EMP_ID_UNIQ
	ON emp ( emp_id );
    
-- Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
-- emp_no, first_name, last_name, salary

ALTER TABLE emp
	RENAME COLUMN emp_id to emp_no;

CREATE VIEW emp_sal as select emp_no, 
       CONCAT( first_name, ' ', last_name) as Employee,
       salary
	from emp
		order by salary desc;
select * from emp_sal;

