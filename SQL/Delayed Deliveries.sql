SELECT supplier_id, COUNT(*) AS Total_Shipments,  -- Total_Shipments, Total_Delayed_Shipments, No_of_days_Delayed, Average_Delay_Per_Delayed_Shipment, Delayed_Shipments_Percentage
SUM(promised_date < delivery_date) AS Total_Delayed_Shipments,
SUM(CASE WHEN DATEDIFF(delivery_date, promised_date) > 0 
             THEN DATEDIFF(delivery_date, promised_date) 
             ELSE 0 END) AS No_of_days_Delayed,
ROUND(AVG(CASE WHEN DATEDIFF(delivery_date, promised_date) > 0 
                   THEN DATEDIFF(delivery_date, promised_date) 
                   ELSE NULL END), 2) AS Average_Delay_Per_Delayed_Shipment,       
ROUND(SUM(promised_date < delivery_date) / COUNT(*), 2) AS Delayed_Shipments_Percentage
FROM shipments
WHERE supplier_id IS NOT NULL
AND status <> '%mis%'
GROUP BY supplier_id
ORDER BY Total_Delayed_Shipments DESC
;


SELECT supplier_id, -- How many times each supplier's shipment was late. Catergorised by no of days 
    SUM(CASE WHEN DATEDIFF(delivery_date, promised_date) BETWEEN 1 AND 2 THEN 1 ELSE 0 END) AS Delayed_1_2_days,
    SUM(CASE WHEN DATEDIFF(delivery_date, promised_date) BETWEEN 3 AND 4 THEN 1 ELSE 0 END) AS Delayed_3_4_days,
    SUM(CASE WHEN DATEDIFF(delivery_date, promised_date) = 5 THEN 1 ELSE 0 END) AS Delayed_5_or_more_days, 
    COUNT(CASE WHEN DATEDIFF(delivery_date, promised_date) >= 1 THEN 1 END) AS Total_Delayed_Shipments
FROM shipments
WHERE supplier_id IS NOT NULL
group by supplier_id
ORDER BY Total_Delayed_Shipments DESC
; 

SELECT -- no of days each supplier's shipment was late per month
    supplier_id,
    MONTH(order_date) AS order_month,
    SUM(DATEDIFF(delivery_date, promised_date)) AS total_days_late
FROM shipments
WHERE delivery_date > promised_date
  AND supplier_id IS NOT NULL
GROUP BY supplier_id, status, YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)
;

SELECT -- no of days each supplier's shipment was late per month - shows the month in 'mmm' format 
    supplier_id,
    CASE MONTH(order_date)
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
    END AS order_month,
    SUM(DATEDIFF(delivery_date, promised_date)) AS total_days_late
FROM shipments
WHERE delivery_date > promised_date
  AND supplier_id IS NOT NULL
GROUP BY
    supplier_id,
    YEAR(order_date),
    MONTH(order_date),
    CASE MONTH(order_date)
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
    END
ORDER BY
    YEAR(order_date),
    MONTH(order_date),
    total_days_late DESC
    ;

