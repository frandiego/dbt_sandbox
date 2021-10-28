{{
  config(
    materialized = "ephemeral"
  )
}}


SELECT 
	order_id, 
	count(distinct product_id) as n_products 

FROM {{ source('raw', 'order_products') }}

GROUP BY order_id

ORDER BY n_products DESC
