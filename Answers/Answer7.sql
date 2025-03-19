	SELECT 
    EXTRACT(MONTH FROM fs.date) AS month,
    fs.fiscal_year,
    SUM(fs.sold_quantity * fg.gross_price) AS gross_sales_amount
FROM
    fact_sales_monthly AS fs
        JOIN
    dim_customer AS d ON fs.customer_code = d.customer_code
        JOIN
    fact_gross_price AS fg ON fg.product_code = fs.product_code
WHERE
    d.customer = 'Atliq Exclusive'
GROUP BY fs.fiscal_year , EXTRACT(MONTH FROM fs.date)
ORDER BY gross_sales_amount DESC
