{{ config(materialized='view') }}
SELECT

    l.listing_id,

    l.property_type,

    l.room_type,

    COUNT(b.booking_id) AS total_bookings,

    SUM(
        b.booking_amount
        + b.cleaning_fee
        + b.service_fee
    ) AS revenue

FROM {{ ref('stg_listings') }} l

LEFT JOIN {{ ref('stg_bookings') }} b

ON l.listing_id = b.listing_id

GROUP BY

    l.listing_id,
    l.property_type,
    l.room_type