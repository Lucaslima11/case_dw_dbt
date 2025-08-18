with core_transaction as (
    select
        fc.id_transaction,
        fc.cd_customer_id,
        fc.dt_transaction,
        fc.vl_transaction
    from {{ ref('tb_fact_core_transaction') }} as fc
    left join {{ ref('tb_dim_customer_info') }} as ci
        on ci.cd_customer_id = fc.cd_customer_id
    where ds_transaction_type = 'PIX ENVIADO'
),
pix_transaction as (
    select
        fc.id_transaction
    from {{ ref('tb_fact_pix_transaction') }} as fc
    join {{ ref('rel_core_account_pix') }} rp
        on rp.id_transaction = fc.id_transaction
    where rp.is_pix_done = 0
)

select
    ct.id_transaction,
    ct.cd_customer_id,
    ct.dt_transaction,
    ct.vl_transaction
from core_transaction as ct
left join pix_transaction as pt
    on ct.id_transaction = pt.id_transaction