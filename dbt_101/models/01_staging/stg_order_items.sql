select
    cast(order_id as int) as order_id,
    cast(order_item_id as int) as order_item_id,
    cast(product_id as int) as product_id,
    cast(quantity as int) as quantity
from {{ source('grocery_store', 'order_items') }}