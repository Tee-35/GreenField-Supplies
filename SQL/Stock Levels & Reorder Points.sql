SELECT product_id, Count(stock_on_hand)  As Count -- Stock Below reorder point 
FROM inventory 
WHERE stock_on_hand < (
	Select reorder_point
    FROM products
    Where products.id = inventory.product_id
)
GROUP BY product_id
ORDER BY Count DESC
;

SELECT product_id, recorded_at  -- 'Manure Scoops' 
FROM inventory 
WHERE stock_on_hand < (
	Select reorder_point
    FROM products
    Where products.id = inventory.product_id
)
AND product_id = 'Manure Scoops'
;


