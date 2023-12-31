-- Table: public.source_data_usd

-- DROP TABLE IF EXISTS public.source_data_usd;

CREATE TABLE IF NOT EXISTS public.source_data_usd
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    upload_dt timestamp without time zone NOT NULL,
    api_data json NOT NULL,
    CONSTRAINT "source_date_USD_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.source_data_usd
    OWNER to airflow;