USE example;
SELECT 
i.Invoice_id,
Customer_name,
Address_name,
Driver_name,
Date as "Delivery Date",
Group_name,
price,
product_name as "SKU name",
price*quantity as "Total amount",
quantity
 FROM invoives i
 INNER JOIN customers c ON i.customer_id=c.Customer_id
 INNER JOIN addresses a ON a.Customer_id = c.Customer_id
 INNER JOIN deliveries d ON d.Invoice_id = i.Invoice_id
 INNER JOIN sku  ON sku.product_id = i.product_id
 INNER JOIN group_id g ON sku.product_group_id =g.Group_id
 ORDER BY Date,Group_name,product_name,"Total amount" desc
  ;
/*select * from invoives;
