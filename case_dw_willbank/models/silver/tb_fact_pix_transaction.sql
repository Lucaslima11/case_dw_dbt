with core_pix as (
    select *
    from {{ ref('tb_core_pix') }} 
),
core_account as (
    select id_transaction, cd_account_customer
    from {{ ref('tb_core_account') }} 
)

select
    cp.id_transaction,
    cp.dt_transaction,
    cp.dt_month,
    cp.cd_seqlan,
    cp.ds_transaction_type,
    {{ dbt_utils.generate_surrogate_key(['ca.cd_account_customer']) }} as cd_customer_id,
    ca.cd_account_customer,
    cp.vl_transaction
from core_pix cp
join core_account ca on cp.id_transaction = ca.id_transaction 