with transactions as (
    select
        fp.dt_transaction,
        fp.ds_transaction_type,
        count(fp.id_transaction) as num_transaction,
        sum(fp.vl_transaction) as sum_vl_transaction
    from {{ ref('tb_fact_pix_transaction') }} as fp
    group by
        1,2
)

select * from transactions