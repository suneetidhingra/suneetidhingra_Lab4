-- Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT 
    product.PRO_ID, product.PRO_NAME
FROM
    product,
    `order`,
    supplier_pricing
WHERE
    `order`.ORD_DATE > '2021-10-05'
        AND `order`.PRICING_ID = supplier_pricing.PRICING_ID
        AND supplier_pricing.PRO_ID = product.PRO_ID