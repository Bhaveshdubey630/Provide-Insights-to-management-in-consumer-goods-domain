SELECT 
    dim_customer.market
FROM
    dim_customer
WHERE
    region = 'APAC'
        AND customer = 'Atliq Exclusive'