{{
  config(
    materialized = "table"
  )
}}


SELECT 
	order_products.product_id, 
	products.aisle_id, 
	products.product_name, 
	count(*) as quantity

FROM {{ source('raw', 'order_products') }} order_products

JOIN {{ ref ('order_n_products') }} order_n_products USING (order_id)

JOIN {{ source('raw', 'products') }} products USING (product_id)

WHERE order_n_products.n_products > 10

GROUP BY order_products.product_id, products.aisle_id, products.product_name

ORDER BY quantity DESC
