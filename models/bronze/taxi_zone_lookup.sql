select * 
from {{ source('nycdata', 'taxi_zone_lookup') }}