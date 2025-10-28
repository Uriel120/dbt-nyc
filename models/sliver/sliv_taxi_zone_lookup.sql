select *,
current_datetime() as load_date
from {{ source('nycdata', 'taxi_zone_lookup') }}