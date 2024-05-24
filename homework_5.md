# Homework 5: Expanding your Database

-  	Due on Friday, May 24 at 11:59pm
-  	Weight: 8% of total grade
-  	Upload one .sql file with your queries

# Cross Join
1. Suppose every vendor in the `vendor_inventory` table had 5 of each of their products to sell to **every** customer on record. How much money would each vendor make per product? Show this by vendor_name and product name, rather than using the IDs.

**HINT**: Be sure you select only relevant columns and rows. Remember, CROSS JOIN will explode your table rows, so CROSS JOIN should likely be a subquery. Think a bit about the row counts: how many distinct vendors, product names are there (x)? How many customers are there (y). Before your final group by you should have the product of those two queries (x\*y). 

DROP TABLE IF EXISTS temp.dis_items;
CREATE TEMP TABLE IF NOT EXISTS temp.dis_items AS
SELECT DISTINCT vendor_id AS dis_vendor_id, product_id AS dis_product_id, original_price AS dis_or_price
FROM vendor_inventory;

DROP TABLE IF EXISTS temp.with_id;
CREATE TEMP TABLE IF NOT EXISTS temp.with_id AS
SELECT dis_vendor_id, dis_product_id, dis_or_price, dis_or_price*5 AS price_of_product_sold_five_times_to_one_customer
FROM temp.dis_items;


DROP TABLE IF EXISTS temp.number_of_customers;
CREATE TEMP TABLE IF NOT EXISTS temp.number_of_customers AS
SELECT COUNT(customer_id) AS total_customers
FROM customer;

DROP TABLE IF EXISTS temp.last_temp;
CREATE TEMP TABLE IF NOT EXISTS temp.last_temp AS
SELECT vendor_name, product_name, price_of_product_sold_five_times_to_one_customer
FROM temp.with_id
INNER JOIN vendor ON vendor_id=dis_vendor_id
INNER JOIN product ON product_id=dis_product_id;


SELECT vendor_name, product_name, price_of_product_sold_five_times_to_one_customer, total_customers, total_customers*price_of_product_sold_five_times_to_one_customer AS total_revenue
FROM temp.last_temp
CROSS JOIN temp.number_of_customers











# INSERT
1. Create a new table "product_units". This table will contain only products where the `product_qty_type = 'unit'`. It should use all of the columns from the product table, as well as a new column for the `CURRENT_TIMESTAMP`.  Name the timestamp column `snapshot_timestamp`.

2. Using `INSERT`, add a new row to the table (with an updated timestamp). This can be any product you desire (e.g. add another record for Apple Pie). 



DROP TABLE IF EXISTS product_units;
CREATE TABLE product_units AS 
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE product_qty_type='unit';

INSERT INTO product_units (product_id,product_name,product_size,product_category_id,product_qty_type,snapshot_timestamp)
VALUES (24, 'Apple Pie', '10"', 3, 'unit', CURRENT_TIMESTAMP);

SELECT *
FROM product_units




# DELETE 
1. Delete the older record for the whatever product you added.

**HINT**: If you don't specify a WHERE clause, [you are going to have a bad time](h8iq872ttps://imgflip.com/i/).

DELETE FROM product_units
WHERE product_id = 24;


# UPDATE
1. We want to add the current_quantity to the product_units table. First, add a new column, `current_quantity` to the table using the following syntax.
```
ALTER TABLE product_units
ADD current_quantity INT;
```

Then, using `UPDATE`, change the current_quantity equal to the **last** `quantity` value from the vendor_inventory details. 


**HINT**: This one is pretty hard. First, determine how to get the "last" quantity per product. Second, coalesce null values to 0 (if you don't have null values, figure out how to rearrange your query so you do.) Third, `SET current_quantity = (...your select statement...)`, remembering that WHERE can only accommodate one column. Finally, make sure you have a WHERE statement to update the right row, you'll need to use `product_units.product_id` to refer to the correct row within the product_units table. When you have all of these components, you can run the update statement.


DROP TABLE IF EXISTS product_units;
CREATE TABLE product_units AS 
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE product_qty_type='unit';

ALTER TABLE product_units
ADD current_quantity INT;



DROP TABLE IF EXISTS temp.new_temp_table;
CREATE TEMP TABLE IF NOT EXISTS temp.new_temp_table AS
SELECT product_id, MAX(market_date) as last_date, quantity
FROM vendor_inventory
GROUP BY product_id;

DROP TABLE IF EXISTS temp.new_temp_table_1;
CREATE TEMP TABLE IF NOT EXISTS temp.new_temp_table_1 AS
SELECT product_units.product_id, product_name, product_size,product_category_id,product_qty_type,snapshot_timestamp,current_quantity,quantity
FROM product_units
LEFT JOIN temp.new_temp_table  ON product_units.product_id=temp.new_temp_table.product_id;


UPDATE temp.new_temp_table_1
SET current_quantity = quantity;


UPDATE product_units
SET current_quantity = COALESCE(new_temp_table_1.current_quantity, 0)
FROM new_temp_table_1
WHERE product_units.product_id = new_temp_table_1.product_id;


SELECT * 
FROM product_units




