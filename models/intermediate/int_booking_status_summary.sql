{{ config(materialized='view') }}
SELECT

    booking_status,

    COUNT(*) AS total_bookings,

    SUM(
        booking_amount
        + cleaning_fee
        + service_fee
    ) AS revenue

FROM {{ ref('stg_bookings') }}

GROUP BY booking_status