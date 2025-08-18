with src as (
  select *
  from {{ ref('core_account') }}
), core_account as (
  select
    id_transaction,
    {{ parse_date('dt_transaction') }} as dt_transaction,
    date_trunc('month', {{ parse_date('dt_month') }}) as dt_month,
    try_cast(surrogate_key as integer) as cd_account_customer,
    try_cast(cd_seqlan as integer) as cd_seqlan,
    upper(ds_transaction_type) as ds_transaction_type,
    vl_transaction,
    current_timestamp as updated_at
  from src
)
select * from core_account