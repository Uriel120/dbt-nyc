select 
 CASE VendorID
    WHEN 1 THEN "Creative Mobile Technologies, LLC"
    WHEN 2 THEN "Curb Mobility, LLC"
    WHEN 6 THEN "Myle Technologies Inc"
    WHEN 7 THEN "Helix"
    ELSE "unknow"
 END as vendorid,
  case 
    when tpep_dropoff_datetime < tpep_pickup_datetime 
    then tpep_dropoff_datetime
    else tpep_pickup_datetime
  end as tpep_pickup_datetime,
        
  case 
    when tpep_dropoff_datetime < tpep_pickup_datetime 
    then tpep_pickup_datetime
    else tpep_dropoff_datetime
  end as tpep_dropoff_datetime,

  case 
    when passenger_count IS NULL then 0.0 
    else passenger_count
  end as passenger_count,
  case RatecodeID
    WHEN 1 THEN "Standard rate"
    WHEN 2 THEN "JFK"
    WHEN 3 THEN "Newark"
    WHEN 4 THEN "Nassau or Westchester"
    WHEN 5 THEN "Negotiated fare"
    WHEN 6 THEN "Group ride"
    ELSE "unknown"
  END AS RatecodeID,
  COALESCE(trip_distance,0.0) as trip_distance,
  COALESCE(store_and_fwd_flag,"unknow") AS store_and_fwd_flag,
  PULocationID,
  DOLocationID,
  case payment_type
    WHEN 0 THEN "Flex Fare trip"
    WHEN 1 THEN "Credit card"
    WHEN 2 THEN "Cash"
    WHEN 3 THEN "No charge"
    WHEN 4 THEN "Dispute"
    WHEN 5 THEN "Unknown"
    WHEN 6 THEN "Voided trip"
    ELSE "unknown"
  END AS payment_type,
 COALESCE(fare_amount, 0.0) AS fare_amount,
 COALESCE(extra, 0.0) AS extra,
 COALESCE(mta_tax, 0.0) AS mta_tax,
 COALESCE(tip_amount, 0.0) AS tip_amount,
 COALESCE(tolls_amount, 0.0) AS tolls_amount,
 COALESCE(improvement_surcharge, 0.0) AS improvement_surcharge,
 COALESCE(total_amount, 0.0) AS total_amount,
 COALESCE(congestion_surcharge, 0.0) AS congestion_surcharge,
 COALESCE(airport_fee, 0.0) AS airport_fee,
 COALESCE(cbd_congestion_fee, 0.0) AS cbd_congestion_fee,
 current_datetime() as load_date

from {{ source('bronze', 'yellow_nyc_data') }}