{{ config(materialized='view') }}

SELECT

    booking_id,
    listing_id,
    booking_date,
    booking_status,
    booking_amount,
    cleaning_fee,
    service_fee,
    booking_amount + cleaning_fee + service_fee AS total_revenue

FROM {{ ref('stg_bookings') }}