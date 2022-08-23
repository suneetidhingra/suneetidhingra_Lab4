-- Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT 
    product.PRO_NAME, `order`.*
FROM
    `order`,
    supplier_pricing,
    product
WHERE
    `order`.CUS_ID = 2
        AND `order`.PRICING_ID = supplier_pricing.PRICING_ID
        AND supplier_pricing.PRO_ID = product.PRO_ID;