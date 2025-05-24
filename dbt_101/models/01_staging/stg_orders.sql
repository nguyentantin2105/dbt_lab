select
    cast(id as int) as id,
    cast(date as date) as date,
    cast(customer_id as int) as customer_id,
    cast(status as string) as status
from {{ source('grocery_store', 'orders') }}
