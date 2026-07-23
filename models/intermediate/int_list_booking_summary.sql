{{ config(materialized='view') }}
SELECT
    listing_id,

    COUNT(*) AS total_bookings,

    SUM( booking_amount + cleaning_fee + service_fee ) AS total_revenue,
    AVG(booking_amount) AS avg_booking_amount

FROM {{ ref('stg_bookings') }}

GROUP BY listing_id