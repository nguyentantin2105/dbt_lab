select
    customer_id,
    number_of_orders,
    {{ get_discount_eligibility('number_of_orders', 'total_amount_spent_usd') }} as is_eligible_for_discount,
    {{ calculate_discount('number_of_orders', 'total_amount_spent_usd') }} as discount_usd
from {{ ref('int_customers_orders_joined') }}
