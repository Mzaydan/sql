
--SELECT vendor_id, COUNT(booth_number) AS number_of_rented_booth
--FROM vendor_booth_assignments
--GROUP BY vendor_id




--SELECT customer_last_name,customer_first_name,SUM(quantity * cost_to_customer_per_qty) AS spending
--FROM customer as c
--INNER JOIN customer_purchases as cp
--ON c.customer_id=cp.customer_id
--GROUP BY customer_last_name,customer_first_name
--HAVING spending >= 2000
--ORDER BY customer_last_name, customer_first_name

--DROP TABLE IF EXISTS temp.new_vendor;
--CREATE TEMPORARY TABLE temp.new_vendor AS 
--SELECT * FROM vendor;
--INSERT INTO temp.new_vendor (vendor_id,vendor_name,vendor_type,vendor_owner_first_name,vendor_owner_last_name) VALUES (10,'Thomass Superfood Store','Fresh focused Store','Thomas','Rosenthal')



--SELECT customer_id, quantity, cost_to_customer_per_qty,STRFTIME('%m', market_date) AS month, STRFTIME('%Y', market_date) AS year 
--FROM customer_purchases;


--SELECT cp.customer_id, SUM(cp.quantity *cp.cost_to_customer_per_qty) AS money_spent,STRFTIME('%m', cp.market_date) AS month, STRFTIME('%Y', cp.market_date) AS year 
--FROM customer_purchases as cp
--WHERE STRFTIME('%m', cp.market_date) = '05' AND STRFTIME('%Y', cp.market_date) = '2019'
--GROUP BY customer_id, month, year

