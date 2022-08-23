-- Create a stored procedure to display supplier id, name, rating and Type_of_Service .
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
-- If rating >2 print “Average Service” else print “Poor Service”.

SELECT 
    SUPP_ID,
    SUPP_NAME,
    Average,
    CASE
        WHEN Average = 5 THEN 'EXCELLENT SERVICE'
        WHEN Average > 4 THEN 'GOOD SERVICE'
        WHEN Average > 2 THEN 'AVERAGE SERVICE'
        ELSE 'POOR SERVICE'
    END AS Type_of_Service
FROM
    (SELECT 
        supplier.SUPP_ID, SUPP_NAME, AVG(RAT_RATSTARS) AS Average
    FROM
        rating, `order`, supplier_pricing, supplier
    WHERE
        `order`.ORD_ID = rating.ORD_ID
            AND `order`.PRICING_ID = supplier_pricing.PRICING_ID
            AND supplier.SUPP_ID = supplier_pricing.SUPP_ID
    GROUP BY SUPP_ID) AS report
order by Average desc
