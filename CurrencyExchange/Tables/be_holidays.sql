-- Table: public.be_holidays

-- DROP TABLE IF EXISTS public.be_holidays;

CREATE TABLE IF NOT EXISTS public.be_holidays
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    event_date date NOT NULL,
    holiday_description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT be_holidays_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.be_holidays
    OWNER to airflow;