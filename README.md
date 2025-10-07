## Project Background

GreenField Supplies is a wholesaler specialising in buying and selling outdoor products for equestrian, farming, and general outdoor purposes. Over the past year, the company has experienced fluctuating shipping costs, lead times, and stock performance, and in an effort to better understand customer demand and predict future trends, they commissioned a review of overall operational performance.

Recommendations are provided on the following key areas

• **Inbound Shipments:** An examination of the most recent sales trends and shipment performance.  
• **Lead Times:** An assessment of supplier performance regarding delivery timelines.  
• **Stock Levels & Reorder Points:** An analysis of current stock levels and reorder efficiency.  
• **OTIF (On-Time In-Full):** An evaluation of supplier delivery reliability, with comparisons across the products they provide.  

The Excel file used to inspect clean and analyse the data is [here](Excel/Issue_log.png). 

SQL queries used to export necessary tables you can find [here](SQL/SQL_Queries.sql).

## ERD, Data Structure and Initial Check

The database structure as seen below consist of five tables: Inventory, products, shipments, shipment_details and suppliers.  

<img width="500" height="480" alt="Screenshot 2025-10-04 at 10 34 48" src="https://github.com/user-attachments/assets/b3997689-f0c1-4868-97da-a94ba8453aa1" />   


<img width="919" height="251" alt="Screenshot 2025-10-04 at 10 38 33" src="https://github.com/user-attachments/assets/d95283a5-0c33-42e7-a9aa-f6ef9ffd7c65" />  



## Executive Summary  

#### Overview of Findings 

**GreenField Supplies** experienced uneven operational performance over the past year. AsiaPlast accounted for 20% of shipping   costs with a March 2025 spike, European lead times averaged 27 days, and Feed Buckets/Tubs saw 17.5% of orders below reorder points, with AsiaPlast   performing worst at 18.3%. UK Tools’ OTIF averaged just under 72%, dipping sharply in May 2025. These findings highlight cost, supply, and   reliability risks that warrant targeted sourcing and process improvements. 

All the charts that convey all this information can be found [here](Images).  

[DashBoard.pdf](https://github.com/user-attachments/files/22750377/DashBoard.pdf)


<img width="755" height="542" alt="Collage" src="https://github.com/user-attachments/assets/5af2c383-5811-4a9b-b30e-138a81c7a06d" />

#### Stock Levels & Reorder Points 

Feed Buckets / Feed Tubs have the worst performance, with **17.5% of all orders falling  below the designated reorder point**, compared to an average of **16.3% across all products.**  
This product is sourced from three suppliers (See bar chart):   
•	**AsiaPlast**: 18.3% stockouts.  
•	**BarnWare**: 16.4% stockouts (The average across all products).  
•	**EuroMat**: 17.7% stockouts.  
The line graph showing the stockout performance of **AsiaPlast and Euromat** over six months. The highest percentage of stockouts happened in March for both suppliers **20% and 28.6%** for **AsiaPlast and Euromat respectively**. **EuroMat** consistently **had higher stockouts** than **AsiaPlast** across most months, though both suppliers dropped back closer to the **average after March**. Notably, **AsiaPlast** maintained a lower overall stockout rate across the six months, indicating more stable performance.

<img width="937" height="529" alt="Screenshot 2025-09-20 at 20 19 02" src="https://github.com/user-attachments/assets/775d38c2-aad5-49cc-bee0-a40f6fd70c30" />  
 
  

## Recommendations 

• **Inbound Shipments:** It would be valuable to **analyse the high shipping costs in more detail**, identifying which products contribute most to these expenses and understanding why they are being purchased from AsiaPlast. Based on this analysis, a potential strategy could be to **source these products from alternative suppliers** where feasible, in order to optimize shipping costs.

• **Lead Times:** It would be beneficial to **identify the European products with the longest lead times** and investigate whether the same products are available from suppliers in other regions. If so, purchasing from those alternative suppliers could reduce lead times and improve stock availability.

• **Stock Levels & Reorder Points:** Review sales trends with seasonal demand in mind and adjust reorder points dynamically to maintain sufficient buffer stock during peak months. Prioritise suppliers with shorter lead times to minimise stockouts, while also investigating whether recurring shortages stem from supplier capacity constraints.

• **OTIF (On-Time In-Full):** To improve overall reliability, root cause analysis should be conducted to understand the drivers behind UK Tools’ OTIF fluctuations.

