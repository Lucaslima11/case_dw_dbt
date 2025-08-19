with pix_error_transaction as (
    select
        fc.id_transaction,
        fc.cd_seqlan,
        fc.dt_transaction,
        fc.cd_customer_id,
        fc.vl_transaction,
        rp.is_pix_done
    from {{ ref('tb_fact_core_transaction') }} as fc
    join {{ ref('rel_core_account_pix') }} rp
        on rp.id_transaction = fc.id_transaction
        and rp.cd_seqlan = fc.cd_seqlan
        and rp.dt_transaction = fc.dt_transaction
    where rp.is_pix_done = 0
)

select
    *
from pix_error_transaction as pt