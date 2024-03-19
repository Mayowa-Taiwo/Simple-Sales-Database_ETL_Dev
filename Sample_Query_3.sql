SELECT 
    sd.category,
    SUM(CASE WHEN YEAR(od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS transaction_amount_2021,
    SUM(CASE WHEN YEAR(od.order_date) = 2022 THEN od.after_discount ELSE 0 END) AS transaction_amount_2022,
    SUM(CASE WHEN YEAR(od.order_date) = 2022 THEN od.after_discount ELSE 0 END) -
    SUM(CASE WHEN YEAR(od.order_date) = 2021 THEN od.after_discount ELSE 0 END) AS delta,
    CASE 
        WHEN SUM(CASE WHEN YEAR(od.order_date) = 2022 THEN od.after_discount ELSE 0 END) >
             SUM(CASE WHEN YEAR(od.order_date) = 2021 THEN od.after_discount ELSE 0 END) 
        THEN 'Increase'
        WHEN SUM(CASE WHEN YEAR(od.order_date) = 2022 THEN od.after_discount ELSE 0 END) <
             SUM(CASE WHEN YEAR(od.order_date) = 2021 THEN od.after_discount ELSE 0 END) 
        THEN 'Decrease'
        ELSE 'No change'
    END AS remark
FROM
    Order_details AS od
INNER JOIN
    sku_detail AS sd ON od.sku_id = sd.id
WHERE
    od.is_vaild = 1
    AND YEAR(od.order_date) IN (2021, 2022)
GROUP BY
    sd.category;
