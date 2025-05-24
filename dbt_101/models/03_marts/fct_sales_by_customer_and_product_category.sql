{% set category = ["FOOD", "BEVERAGES", "KITCHEN SUPPLIES", "HOUSEHOLD SUPPLIES"] %}
{% set status_order = ["completed", "pending", "new", "processing"] %}

select
    c.id as customer_id,
    {% for category in category %}
        sum(
            case
                when
                    upper(p.category) = '{{ category }}'
                    then oi.quantity
                else
                    0
            end
        )
            as {{ category | replace(' ', '_') }}_UNITS_SOLD,
        sum(
            case
                when
                    upper(p.category) = '{{ category }}'
                    then oi.quantity * p.price
                else 0
            end
        ) as AMOUNT_SPENT_{{ category | replace(' ', '_') }},
    {% endfor %}
from {{ ref('stg_customers') }} as c
left join {{ ref('stg_orders') }} as o on c.id = o.customer_id
left join {{ ref('stg_order_items') }} as oi on o.id = oi.order_id
left join {{ ref('stg_products') }} as p on oi.product_id = p.id
where
    o.status in (
        '{{ status_order | join("','") }}'
    )
group by 1
