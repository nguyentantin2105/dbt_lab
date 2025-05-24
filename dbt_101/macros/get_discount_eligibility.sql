{% macro get_discount_eligibility(order_count, total_amount_spent) %}
    case
        when {{ order_count }} >= 3 OR {{ total_amount_spent }} >= 300 then TRUE
        else FALSE
    end
{% endmacro %}