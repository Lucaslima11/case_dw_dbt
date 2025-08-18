with core_account as (
    select *
    from {{ ref('tb_core_account') }} 
)

select
    id_transaction,
    dt_transaction,
    dt_month,
    {{ dbt_utils.generate_surrogate_key(['core_account.cd_account_customer']) }} as cd_customer_id,
    cd_account_customer,
    cd_seqlan,
    ds_transaction_type,
    vl_transaction
from core_account