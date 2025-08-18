with src as (
  select *
  from {{ ref('customer') }}
), customer as (
  select
    try_cast(surrogate_key as integer) as cd_account_customer,
    {{ parse_date('entry_date') }} as entry_date,
    full_name,
    {{ parse_date('birth_date') }} as birth_date,
    uf_name,
    uf,
    street_name,
    current_timestamp as updated_at

  from src
)
select * from customer