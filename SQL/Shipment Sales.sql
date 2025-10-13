SELECT -- Highest Grossing -- Average Cost per Shipment - by supplier 
    s.supplier_id,
    COUNT(DISTINCT sh.shipment_id, sh.product_id) AS total_shipments,
    ROUND(SUM((sh.units_received * sh.unit_cost_GBP) + sh.freight_cost_GBP), 2) AS Total_Cost,
    ROUND(SUM((sh.units_received * sh.unit_cost_GBP) + sh.freight_cost_GBP) / COUNT(DISTINCT sh.shipment_id, sh.product_id), 0) AS Average_Cost_per_Shipment
FROM shipment_details sh
JOIN shipments s ON s.id = sh.shipment_id
WHERE supplier_id IS NOT NULL
AND delivery_date IS NOT NULL
AND time_to_deliver IS NOT NULL
AND order_date IS NOT NULL
AND promised_date IS NOT NULL
AND status NOT LIKE '%mis%'
GROUP BY s.supplier_id
ORDER BY s.supplier_id ASC, Average_Cost_per_Shipment DESC;

SELECT -- Highest Grossing -- Average Cost per Shipment by product 
    s.supplier_id, sh.product_id, 
    COUNT(DISTINCT sh.shipment_id, sh.product_id) AS total_shipments,
    ROUND(SUM((sh.units_received * sh.unit_cost_GBP) + sh.freight_cost_GBP), 2) AS Total_Cost,
    ROUND(SUM((sh.units_received * sh.unit_cost_GBP) + sh.freight_cost_GBP) / COUNT(DISTINCT sh.shipment_id, sh.product_id), 0) AS Average_Cost_per_Shipment
FROM shipment_details sh
JOIN shipments s ON s.id = sh.shipment_id
WHERE supplier_id IS NOT NULL
AND delivery_date IS NOT NULL
AND time_to_deliver IS NOT NULL
AND order_date IS NOT NULL
AND promised_date IS NOT NULL
AND status NOT LIKE '%mis%'
GROUP BY s.supplier_id, sh.product_id
ORDER BY s.supplier_id ASC, Average_Cost_per_Shipment DESC;