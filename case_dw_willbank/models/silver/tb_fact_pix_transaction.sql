with core_pix as (
    select *
    from {{ ref('tb_core_pix') }} 
)

select distinct
    cp.id_transaction,
    cp.dt_transaction,
    cp.dt_month,
    cp.cd_seqlan,
    cp.ds_transaction_type,
    cp.vl_transaction
from core_pix cp