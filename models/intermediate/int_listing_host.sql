{{ config(materialized='view') }}
SELECT

    l.listing_id,
    l.property_type,
    l.room_type,
    l.city,
    l.country,
    l.price_per_night,

    h.host_id,
    h.host_name,
    h.is_superhost,
    h.response_rate

FROM {{ ref('stg_listings') }} l

JOIN {{ ref('stg_hosts') }} h

ON l.host_id = h.host_id