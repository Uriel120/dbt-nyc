select *
from {{ source('nycdata', 'yellow_nyc_data') }}