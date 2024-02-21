CREATE VIEW QUESTION_1
AS

SELECT 
	MONTH(order_date) AS month_id, 
    DATENAME(month, order_date) AS month,
	YEAR(order_date) AS year,
    SUM(after_discount) AS total_transaction
FROM 
    Order_details
WHERE 
    is_vaild = 1 
	AND 
	YEAR(order_date) = 2021
GROUP BY 
    YEAR(order_date),
    MONTH(order_date),
    DATENAME(month, order_date)

