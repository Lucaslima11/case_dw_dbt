with pix as (
    select distinct
        id_transaction
    from {{ ref('core_pix') }}
),
core as (
    select distinct
        id_transaction
    from {{ ref('core_account') }}
    
)

select
    c.id_transaction,
    case when p.id_transaction is not null then 1 else 0 end is_pix_done
from core c
left join pix p on c.id_transaction = p.id_transaction