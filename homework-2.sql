--SELECT * FROM customer

--SELECT * FROM customer
--ORDER BY customer_last_name,customer_first_name
--LIMIT 10


--SELECT * FROM customer_purchases
--WHERE product_id BETWEEN 4 AND 9;


--SELECT *,
--quantity * cost_to_customer_per_qty AS price
--FROM customer_purchases
--WHERE vendor_id >=8 AND vendor_id <=10


--SELECT *,
--quantity * cost_to_customer_per_qty AS price
--FROM customer_purchases
--WHERE vendor_id BETWEEN 8 AND 10


--SELECT product_id, product_name,
  --     CASE WHEN product_qty_type = "unit" THEN "unit"
	--   ELSE"bulk"
	  -- END AS prod_qty_type_condensed
--FROM product	
 
--Add a column to the previous query called pepper_flag that outputs a 1 if the product_name contains the word “pepper”
 --(regardless of capitalization), and otherwise outputs 0.
 
--SELECT product_id, product_name,
  --    CASE 
	   --   WHEN product_qty_type = "unit" THEN "unit"
	     -- ELSE"bulk"
	  --END AS prod_qty_type_condensed,
	 -- CASE 
	    --  WHEN  product_name LIKE '%pepper%' THEN 1
	  --    ELSE 0
	--  END AS pepper_flag
--FROM product	

FROM vendor
INNER JOINT vendor_booth_assignments ON vendor.vendor_id=vendor_booth_assignments.vendor_id
ORDER BY vendor_name, market_date