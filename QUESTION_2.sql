CREATE VIEW QUESTION_2
AS

SELECT 
    YEAR(od.order_date) AS Year,
	sd.category,
    SUM(od.after_discount) AS transaction_amount
    
FROM
    Order_details AS od
INNER JOIN
    sku_detail AS sd ON od.sku_id = sd.id
WHERE
    YEAR(od.order_date) = 2022
    AND od.is_vaild = 1
GROUP BY
    YEAR(od.order_date),
    sd.category;