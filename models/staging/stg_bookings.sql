{{
  config(materialized = 'view')
}}

SELECT 
booking_id,
listing_id,
booking_date,
nights_booked,
UPPER(TRIM(booking_status)) AS booking_status,
booking_amount,
created_at as booking_created_at,
cleaning_fee,
service_fee
 from {{ source('raw', 'raw_bookings') }}