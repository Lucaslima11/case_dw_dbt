with pix as (
    select distinct
        id_transaction,
        cd_seqlan,
        dt_transaction,
        vl_transaction
    from {{ ref('core_pix') }}
),
core as (
    select distinct
        id_transaction,
        cd_seqlan,
        dt_transaction
    from {{ ref('core_account') }}
    
)

select
    c.id_transaction,
    c.cd_seqlan,
    c.dt_transaction,
    case when p.vl_transaction is not null then 1 else 0 end is_pix_done
from core c
left join pix p 
    on c.id_transaction = p.id_transaction
    and c.cd_seqlan = p.cd_seqlan
    and c.dt_transaction = p.dt_transaction