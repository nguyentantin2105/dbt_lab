select
    cast(id as int) as id,
    cast(first_name as string) as first_name,
    cast(last_name as string) as last_name,
    cast(email as string) as email,
    cast(gender  as string) as gender,
    cast(date_of_birth as date) as date_of_birth
from {{ source('grocery_store', 'customers') }}