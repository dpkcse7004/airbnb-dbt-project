{{ config(materialized='view') }}
SELECT

    h.host_id,

    h.host_name,

    h.is_superhost,

    COUNT(b.booking_id) AS bookings,

    SUM(
        b.booking_amount
        + b.cleaning_fee
        + b.service_fee
    ) AS revenue

FROM {{ ref('stg_hosts') }} h

JOIN {{ ref('stg_listings') }} l

ON h.host_id = l.host_id

LEFT JOIN {{ ref('stg_bookings') }} b

ON l.listing_id = b.listing_id

GROUP BY

    h.host_id,
    h.host_name,
    h.is_superhost