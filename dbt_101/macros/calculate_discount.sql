{% macro calculate_discount(order_count, total_amount_spent, scale=2) %}
    case
        when {{ order_count }} <= 3 then (0.03 * {{ total_amount_spent }})::numeric(16, {{ scale }})
        else (0.05 * {{ total_amount_spent }})::numeric(16, {{ scale }})
    end
{% endmacro %}
