select channel , gross_sales_mln , (gross_sales_mln/sum(gross_sales_mln) over())*100 as percentage
from (select channel , sum(sold_quantity*gross_price) as gross_sales_mln  
from dim_customer as d join fact_sales_monthly as fs on d.customer_code=fs.customer_code
join fact_gross_price as fg on fs.product_code=fg.product_code
where fs.fiscal_year = 2021
group by d.channel) as t