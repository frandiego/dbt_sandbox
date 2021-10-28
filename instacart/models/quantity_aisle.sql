{{
  config(
    materialized = "view"
  )
}}


SELECT 
	aisles.aisle_id, 
	aisles.aisle, 
	sum(quantity_product.quantity) as quantity

FROM {{ ref('quantity_product') }} quantity_product

JOIN {{ source('raw', 'aisles') }} aisles USING (aisle_id)

GROUP BY aisles.aisle_id, aisles.aisle

ORDER BY quantity DESC
