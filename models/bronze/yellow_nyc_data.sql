select *,
current_datetime() as load_date
from {{ source('nycdata', 'yellow_nyc_data') }}