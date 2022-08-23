SELECT 
  COUNT(t2.CUS_GENDER) AS NoOfCustomers, 
  t2.CUS_GENDER 
FROM 
  (
    SELECT 
      t1.CUS_ID, 
      t1.CUS_GENDER, 
      sum(t1.ORD_AMOUNT), 
      t1.CUS_NAME 
    FROM 
      (
        SELECT 
          `order`.*, 
          customer.CUS_GENDER, 
          customer.CUS_NAME 
        FROM 
          `order` 
          INNER JOIN customer 
        WHERE 
          `order`.CUS_ID = customer.CUS_ID 
        HAVING 
          `order`.ORD_AMOUNT >= 3000
      ) AS t1 
    GROUP BY 
      t1.CUS_ID
  ) AS t2 
GROUP BY 
  t2.CUS_GENDER;