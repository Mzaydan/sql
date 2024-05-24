--DROP TABLE IF EXISTS temp.dis_items;
--CREATE TEMP TABLE IF NOT EXISTS temp.dis_items AS
--SELECT DISTINCT vendor_id AS dis_vendor_id, product_id AS dis_product_id, original_price AS dis_or_price
--FROM vendor_inventory;

--DROP TABLE IF EXISTS temp.with_id;
--CREATE TEMP TABLE IF NOT EXISTS temp.with_id AS
--SELECT dis_vendor_id, dis_product_id, dis_or_price, dis_or_price*5 AS price_of_product_sold_five_times_to_one_customer
--FROM temp.dis_items;


--DROP TABLE IF EXISTS temp.number_of_customers;
--CREATE TEMP TABLE IF NOT EXISTS temp.number_of_customers AS
--SELECT COUNT(customer_id) AS total_customers
--FROM customer;

--DROP TABLE IF EXISTS temp.last_temp;
--CREATE TEMP TABLE IF NOT EXISTS temp.last_temp AS
--SELECT vendor_name, product_name, price_of_product_sold_five_times_to_one_customer
--FROM temp.with_id
--INNER JOIN vendor ON vendor_id=dis_vendor_id
--INNER JOIN product ON product_id=dis_product_id;


--SELECT vendor_name, product_name, price_of_product_sold_five_times_to_one_customer, total_customers, total_customers*price_of_product_sold_five_times_to_one_customer AS total_revenue
--FROM temp.last_temp
--CROSS JOIN temp.number_of_customers








--DROP TABLE IF EXISTS product_units;
--CREATE TABLE product_units AS 
--SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
--FROM product
--WHERE product_qty_type='unit';

--INSERT INTO product_units (product_id,product_name,product_size,product_category_id,product_qty_type,snapshot_timestamp)
--VALUES (24, 'Apple Pie', '10"', 3, 'unit', CURRENT_TIMESTAMP);

--SELECT *
--FROM product_units












--DELETE FROM product_units
--WHERE product_id=24



--DROP TABLE IF EXISTS product_units;
--CREATE TABLE product_units AS 
--SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
--FROM product
--WHERE product_qty_type='unit';

--ALTER TABLE product_units
--ADD current_quantity INT;



--DROP TABLE IF EXISTS temp.new_temp_table;
--CREATE TEMP TABLE IF NOT EXISTS temp.new_temp_table AS
--SELECT product_id, MAX(market_date) as last_date, quantity
--FROM vendor_inventory
--GROUP BY product_id;

--DROP TABLE IF EXISTS temp.new_temp_table_1;
--CREATE TEMP TABLE IF NOT EXISTS temp.new_temp_table_1 AS
--SELECT product_units.product_id, product_name, product_size,product_category_id,product_qty_type,snapshot_timestamp,current_quantity,quantity
--FROM product_units
--LEFT JOIN temp.new_temp_table  ON product_units.product_id=temp.new_temp_table.product_id;


--UPDATE temp.new_temp_table_1
--SET current_quantity = quantity;


--UPDATE product_units
--SET current_quantity = COALESCE(new_temp_table_1.current_quantity, 0)
--FROM new_temp_table_1
--WHERE product_units.product_id = new_temp_table_1.product_id;


--SELECT * 
--FROM product_units


