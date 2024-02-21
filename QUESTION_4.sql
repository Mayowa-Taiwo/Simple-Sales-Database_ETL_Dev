CREATE VIEW QUESTION_4
AS
SELECT TOP 5
    pd.payment_method,
    COUNT(DISTINCT od.id) AS total_unique_orders
FROM 
    Order_details AS od
JOIN 
    payment_detail AS pd ON od.payment_id = pd.id
WHERE 
    od.is_vaild = 1
    AND YEAR(od.order_date) = 2022
GROUP BY 
    pd.payment_method
ORDER BY 
    total_unique_orders DESC;