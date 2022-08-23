-- Display the Supplier details who can supply more than one product.

SELECT 
    *
FROM
    supplier
WHERE
    SUPP_ID IN (SELECT 
            supp_id
        FROM
            supplier_pricing
        GROUP BY supp_id
        HAVING COUNT(supp_id) > 1)