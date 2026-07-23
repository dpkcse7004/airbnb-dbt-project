{{ config(
    materialized='view'
) }}

SELECT

    -- Booking Details
    b.booking_id,
    b.listing_id,
    b.booking_date,
    b.nights_booked,
    b.booking_amount,
    b.cleaning_fee,
    b.service_fee,
    b.booking_status,

    -- Calculated Business Metric
    (
        b.booking_amount
        + b.cleaning_fee
        + b.service_fee
    ) AS total_revenue,

    -- Listing Details
    l.host_id,
    l.property_type,
    l.room_type,
    l.city,
    l.country,
    l.accommodates,
    l.bedrooms,
    l.bathrooms,
    l.price_per_night,

    -- Host Details
    h.host_name,
    h.host_since,
    h.is_superhost,
    h.response_rate

FROM {{ ref('stg_bookings') }} b

INNER JOIN {{ ref('stg_listings') }} l
    ON b.listing_id = l.listing_id

INNER JOIN {{ ref('stg_hosts') }} h
    ON l.host_id = h.host_id