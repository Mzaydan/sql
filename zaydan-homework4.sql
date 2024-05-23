--SELECT 
--product_name || ', ' || COALESCE(product_size,' ')|| ' (' || COALESCE(product_qty_type,'unit') || ')'
--FROM product
--ORDER BY product_name



--SELECT customer_id, distinct_market_date, ROW_NUMBER() OVER (PARTITION BY customer_id  ORDER BY distinct_market_date)
--FROM (
--SELECT DISTINCT customer_id, market_date AS distinct_market_date
--FROM customer_purchases
--ORDER BY customer_id
--)





--SELECT customer_id, distinct_market_date AS first_market_visit
--FROM(
--SELECT customer_id, distinct_market_date, ROW_NUMBER() OVER (PARTITION BY customer_id  ORDER BY distinct_market_date DESC) AS ranking
--FROM (
--SELECT DISTINCT customer_id, market_date AS distinct_market_date
--FROM customer_purchases
--ORDER BY customer_id
--)
--)
--WHERE ranking=1




--SELECT DISTINCT product_id, customer_id, number_of_times_purchased
--FROM(
--SELECT customer_id, product_id, COUNT() OVER (PARTITION BY customer_id ORDER BY product_id) AS  number_of_times_purchased
--FROM customer_purchases
--)



--SELECT   
--CASE
  --      WHEN INSTR(product_name, '-') > 0 
	--	THEN RTRIM(product_name,SUBSTRING (product_name, INSTR(product_name,'-')))
		--ELSE product_name
	--END AS new_prodcut_name,
	
--CASE 
  --      WHEN INSTR(product_name, '-') > 0 
    --    THEN SUBSTRING (product_name, INSTR(product_name,'-')+2)
      --  ELSE NULL 
    --END AS description
--FROM product



 

--WITH sales_values AS
--(
  --  SELECT market_date, SUM(quantity * cost_to_customer_per_qty) AS total_sales
    --FROM customer_purchases
    --GROUP BY market_date
--)

--WITH max_and_min AS
--(
  --     SELECT market_date, total_sales, 
    --   CASE 
      --         WHEN total_sales = (SELECT MAX(total_sales) FROM sales_values) THEN 'best'
        --       WHEN total_sales = (SELECT MIN(total_sales) FROM sales_values) THEN 'worst'
          --     ELSE ''
            --END AS ranking
      --FROM sales_values
       --ORDER BY total_sales DESC
--)
--SELECT* 
--FROM max_and_min 
--WHERE ranking='best'
--UNION
--SELECT*
--FROM max_and_min 
--WHERE ranking='worst';
