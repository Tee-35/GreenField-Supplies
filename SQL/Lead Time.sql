SELECT 
    s.supplier_name,
    s.region,
    s.mode,
    SUM(CASE 
            WHEN DATEDIFF(sh.delivery_date, sh.order_date) > 0 
            THEN DATEDIFF(sh.delivery_date, sh.order_date) 
            ELSE 0 
        END) AS Lead_Time,
    ROUND(
        AVG(CASE 
                WHEN DATEDIFF(sh.delivery_date, sh.order_date) > 0 
                THEN DATEDIFF(sh.delivery_date, sh.order_date) 
                ELSE 0 
            END), 
        0
    ) AS AVG_Lead_Time,
	COUNT(DISTINCT (sh.id)) AS total_shipments
FROM suppliers s
JOIN shipments sh 
    ON s.id = sh.supplier_id
WHERE 
    sh.supplier_id IS NOT NULL
    AND sh.delivery_date IS NOT NULL
    AND sh.order_date IS NOT NULL
    AND sh.promised_date IS NOT NULL
    AND sh.status NOT LIKE '%mis%'
GROUP BY 
    s.supplier_name, 
    s.region, 
    s.mode
ORDER BY 
   AVG_Lead_Time DESC;
