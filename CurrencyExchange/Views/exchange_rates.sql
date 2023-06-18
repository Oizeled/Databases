-- View: public.exchange_rates

-- DROP VIEW public.exchange_rates;

CREATE OR REPLACE VIEW public.exchange_rates
 AS
 SELECT rate.collection_dt,
    rate.base,
    rate.currency,
    rate.rate,
        CASE
            WHEN hol.id IS NOT NULL THEN 1
            ELSE 0
        END AS is_holiday
   FROM ( SELECT s.upload_dt AS collection_dt,
            'USD'::text AS base,
            c.currency,
            c.rate::numeric(10,4) AS rate
           FROM source_data_usd s
             CROSS JOIN LATERAL jsonb_each_text(s.api_data::jsonb -> 'rates'::text) c(currency, rate)
        UNION ALL
         SELECT e.upload_dt AS collection_dt,
            'EUR'::text AS base,
            e.currency,
            e.rate
           FROM source_data_eur e) rate
     LEFT JOIN be_holidays hol ON rate.collection_dt::date = hol.event_date;

ALTER TABLE public.exchange_rates
    OWNER TO airflow;

