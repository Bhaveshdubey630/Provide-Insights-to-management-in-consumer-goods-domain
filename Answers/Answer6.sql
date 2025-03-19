-- will also try asolving this usng all statement

SELECT 
    f.customer_code, customer, f.pre_invoice_discount_pct
FROM
    dim_customer AS d
        JOIN
    fact_pre_invoice_deductions AS f ON d.customer_code = f.customer_code
WHERE
    d.market = 'India'
        AND f.fiscal_year = 2021
order by f.pre_invoice_discount_pct desc
limit 5