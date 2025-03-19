
select division,product,product_code,total_sold_quantity ,  rank() over (order by total_sold_quantity desc)
from (select division,product,fs.product_code ,sum(fs.sold_quantity) as total_sold_quantity , 
rank() over (partition by division  order by sum(fs.sold_quantity) desc)  as rn
from dim_product as d join fact_sales_monthly as fs on d.product_code = fs.product_code
where fiscal_year= 2021
group by division,product,fs.product_code) as t
where t.rn = 1