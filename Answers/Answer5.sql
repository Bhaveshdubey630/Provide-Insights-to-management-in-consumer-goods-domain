SELECT 
    product,
    fact_manufacturing_cost.product_code,
    manufacturing_cost
FROM
    dim_product
        JOIN
    fact_manufacturing_cost ON dim_product.product_code = fact_manufacturing_cost.product_code
WHERE
    fact_manufacturing_cost.manufacturing_cost IN ((SELECT 
            MAX(manufacturing_cost)
        FROM
            fact_manufacturing_cost) , (SELECT 
                MIN(manufacturing_cost)
            FROM
                fact_manufacturing_cost))