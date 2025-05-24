select
    cast(id as int) as id,
    cast(first_name as varchar) as first_name,
    cast(last_name as varchar) as last_name,
    cast(email as varchar) as email,
    cast(gender as varchar) as gender,
    cast(date_of_birth as date) as date_of_birth
from {{ source('grocery_store', 'customers') }}
