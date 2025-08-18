with transactions as (
    select
        ci.uf,
        fp.dt_transaction,
        fp.ds_transaction_type,
        count(fp.id_transaction) as num_transaction,
        sum(fp.vl_transaction) as sum_vl_transaction
    from {{ ref('tb_fact_pix_transaction') }} as fp
    join {{ ref('tb_fact_core_transaction') }} as fc
        on fp.id_transaction = fc.id_transaction
    left join {{ ref('tb_dim_customer_info') }} as ci
        on ci.cd_account_customer = fc.cd_account_customer
    group by
        1,2,3
)

select * from transactions