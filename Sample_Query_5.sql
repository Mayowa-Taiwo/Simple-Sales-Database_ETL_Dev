CREATE VIEW QUESTION_5
AS
SELECT top 5
    sd.sku_name,
    SUM(od.after_discount) AS total_transaction
FROM 
    Order_details AS od
JOIN 
    sku_detail AS sd ON od.sku_id = sd.id
WHERE 
    od.is_vaild = 1
    GROUP BY 
    sd.sku_name
ORDER BY 
    total_transaction DESC;
