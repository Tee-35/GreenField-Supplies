SELECT -- 4. OTIF (On-Time In-Full) Performance
  s.supplier_id,
  COUNT(*) AS Total_Orders,
  COUNT(CASE 
          WHEN delivery_date <= promised_date
           AND units_received = units_ordered 
         THEN 1 
       END) AS OTIF_Orders,   -- total deliveries from that supplier
  ROUND(
    COUNT(CASE 
            WHEN delivery_date <= promised_date
             AND units_received = units_ordered 
           THEN 1 
         END) * 100.0 / COUNT(*), 1
  ) AS OTIF_Percentage
FROM shipment_details sh
JOIN shipments s
on s.id = sh.shipment_id 
WHERE supplier_id IS NOT NULL
  AND delivery_date IS NOT NULL
  AND promised_date IS NOT NULL
  AND units_received IS NOT NULL
   AND units_ordered  IS NOT NULL
GROUP BY s.supplier_id 
ORDER BY OTIF_Percentage DESC
;



