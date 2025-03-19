with unq_2020 as ( select segment , count(distinct d.product_code) as unique_product_2020
from dim_product as d join fact_gross_price as f  on d.product_code = f.product_code 
where fiscal_year = 2020
group by segment) ,  unq_2021 as ( select segment, count(distinct d.product_code) as unique_product_2021
from dim_product as d join fact_gross_price as f  on d.product_code = f.product_code 
where fiscal_year = 2021
group by segment)

SELECT 
    unq_2020.segment,
    unique_product_2020,
    unique_product_2021,
    ((unq_2021.unique_product_2021) - (unq_2020.unique_product_2020)) AS difference
FROM
    unq_2020
        JOIN
    unq_2021 ON unq_2020.segment = unq_2021.segment
