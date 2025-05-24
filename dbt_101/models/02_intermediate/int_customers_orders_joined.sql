with customers as (
    select
        c.id as customer_id,
        o.id as order_id,
        c.first_name || ' ' || c.last_name as full_name,
        o.date as order_date,
        count(o.id) as number_of_orders
    from {{ ref('stg_customers') }} as c
    left join {{ ref('stg_orders') }} as o on c.id = o.customer_id
    where o.status not in ('cancelled', 'pending')
    group by 1, 2, 3, 4
),

orders_items as (
    select
        oi.order_id,
        sum(oi.quantity * p.price) as total_amount_spent_usd
    from {{ ref('stg_order_items') }} as oi
    left join {{ ref('stg_products') }} as p on oi.product_id = p.id
    group by 1
)

select
    c.customer_id,
    c.full_name,
    sum(c.number_of_orders) as number_of_orders,
    sum(oi.total_amount_spent_usd) as total_amount_spent_usd,
    max(c.order_date) as last_order_date,
    min(c.order_date) as first_order_date
from customers as c
left join orders_items as oi on c.order_id = oi.order_id
group by 1, 2
