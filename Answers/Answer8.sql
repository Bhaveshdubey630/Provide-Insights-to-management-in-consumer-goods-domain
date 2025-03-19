-- so in this question my approach will be to use case statement and using subqueries or with statement

-- so the year is 2020, and we need 4 quartes of 2020 and sales amount sorted in descending order.

-- with fact_sales_quarterly as (select *,extract(month from date),(case 
-- when extract(month from date) in (1,2,3) then "1"
-- when extract(month from date) in (4,5,6) then "2"
-- when extract(month from date) in (7,8,9) then "3"
-- when extract(month from date) in (10,11,12) then "4"
--  else 0
-- end) as Quarter
-- from fact_sales_monthly
-- where fiscal_year=2020)

-- SELECT 
--     Quarter, SUM(sold_quantity) AS total_sold_quantity
-- FROM
--     fact_sales_quarterly
-- GROUP BY Quarter
-- ORDER BY total_sold_quantity

-- now i would also love to see alternate solution of this question usng quarter function i guess



SELECT 
    QUARTER(date) AS Quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY QUARTER(date)
ORDER BY total_sold_quantity

-- Now the first method is the one in which i did not use the quarter function and you can see how lenghty it got
-- therefore i would keep the first answer but i would report the second answer as my final answer. 