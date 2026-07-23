{{ config(materialized='view') }}


SELECT
    l.host_id,
    COUNT(b.booking_id) AS total_bookings,

    SUM( b.booking_amount + b.cleaning_fee + b.service_fee) AS total_revenue

FROM {{ ref('stg_bookings') }} b
JOIN {{ ref('stg_listings') }} l

ON b.listing_id = l.listing_id

GROUP BY l.host_id