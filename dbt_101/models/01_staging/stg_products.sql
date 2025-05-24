select
    cast(id as int) as id,
    cast(name as string) as name,
    cast(price as float) as price,
    cast(category as string) as category
from {{ source('grocery_store', 'products') }}
