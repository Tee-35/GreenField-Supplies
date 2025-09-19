SELECT Supplier_Name, -- 1a.Average Cost per Shipment 
 ROUND
 (sum((Units_Ordered * Unit_Cost_GBP) + Freight_Cost_GBP) /
count(*) , 0)
 AS Average Cost per Shipment
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
WHERE Units_Ordered IS NOT NULL
AND Unit_Cost_GBP IS NOT NULL
AND Freight_Cost_GBP IS NOT NULL
Group by Supplier_Name
Order by  Average Cost per Shipment desc;
    
    SELECT Supplier_Name, Order_Month, -- 1a.Average Cost per Shipment 
 ROUND
 (sum((Units_Ordered * Unit_Cost_GBP) + Freight_Cost_GBP) /
count(*) , 0)
 AS Average Cost per Shipment
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
WHERE Units_Ordered IS NOT NULL
AND Unit_Cost_GBP IS NOT NULL
AND Freight_Cost_GBP IS NOT NULL
Group by Supplier_Name, Order_Month
Order by  Supplier_Name asc,
    CASE Order_Month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END asc;
    
    SELECT     -- 2.Average lead time to deliver by region 
  Region, Order_Month,
   ROUND(AVG(Time_To_Deliver), 0) AS Average_Lead_Time_To_Deliver
FROM suppliers s
JOIN shipments sh
    ON s.Supplier_id = sh.Supplier_id
    WHERE Time_To_Deliver IS NOT NULL 
	and Time_To_Deliver > 0 
    GROUP BY  Region, Order_Month
    ORDER BY  CASE Order_Month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END asc, Average_Lead_Time_To_Deliver DESC;
    
    SELECT -- 3.Stock Levels & Reorder Points with supplier name 
 Product_Name,
 Supplier_Name,
   SUM(CASE 
        WHEN Stock_On_Hand < Reorder_Point THEN 1 
        ELSE 0 
      END) AS Amount,
        COUNT(*) AS Total_Orders,
  ROUND(100 * SUM(CASE 
        WHEN Stock_On_Hand < Reorder_Point THEN 1 
        ELSE 0 
      END) /
COUNT(*), 1)  AS Percentage
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
JOIN products p
ON sh.Product_id = p.Product_id
GROUP BY  Product_Name, Supplier_Name
ORDER BY Product_Name asc, Supplier_Name asc;

   SELECT -- 3a.Stock Levels & Reorder Points product focused
 Product_Name,
   SUM(CASE 
        WHEN Stock_On_Hand < Reorder_Point THEN 1 
        ELSE 0 
      END) AS Amount,
        COUNT(*) AS Total_Orders,
  ROUND(100 * SUM(CASE 
        WHEN Stock_On_Hand < Reorder_Point THEN 1 
        ELSE 0 
      END) /
COUNT(*), 1)  AS Percentage
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
JOIN products p
ON sh.Product_id = p.Product_id
GROUP BY  Product_Name
ORDER BY Percentage desc;



SELECT -- 4. OTIF (On-Time In-Full) Performance
 Supplier_Name,
  COUNT(*) AS Total_Orders,
  COUNT(CASE 
          WHEN Delivery_Date <= Promised_Date 
           AND Units_Received = Units_Ordered 
         THEN 1 
       END) AS OTIF_Orders,   -- total deliveries from that supplier
  ROUND(
    COUNT(CASE 
            WHEN Delivery_Date <= Promised_Date 
             AND Units_Received = Units_Ordered 
           THEN 1 
         END) * 100.0 / COUNT(*), 1
  ) AS OTIF_Percentage
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
WHERE   -- ensure data exists
     Promised_Date IS NOT NULL
  AND Delivery_Date IS NOT NULL
  AND Units_Ordered IS NOT NULL
  AND Units_Received IS NOT NULL
GROUP BY Supplier_Name 
ORDER BY Supplier_Name asc;



SELECT -- 4a. OTIF (On-Time In-Full) Performance - uk tools
 Order_Month,
  COUNT(*) AS Total_Orders,
  COUNT(CASE 
          WHEN Delivery_Date <= Promised_Date 
           AND Units_Received = Units_Ordered 
         THEN 1 
       END) AS OTIF_Orders,   -- total deliveries from that supplier
  ROUND(
    COUNT(CASE 
            WHEN Delivery_Date <= Promised_Date 
             AND Units_Received = Units_Ordered 
           THEN 1 
         END) * 100.0 / COUNT(*), 1
  ) AS OTIF_Percentage
FROM shipments sh
JOIN suppliers s
ON sh.Supplier_id = s.Supplier_id
JOIN products p
ON sh.Product_id = p.Product_id
WHERE   -- ensure data exists
	Supplier_Name = 'UKTools'
  AND   Promised_Date IS NOT NULL
  AND Delivery_Date IS NOT NULL
  AND Units_Ordered IS NOT NULL
  AND Units_Received IS NOT NULL
GROUP BY   Order_Month
ORDER BY  
  CASE Order_Month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12
    END asc;




    
