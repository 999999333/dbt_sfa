with source as (
      select * from {{ source('sap', 'bad_with_cost_open_v') }}
),
renamed as (
    select
        {{ adapter.quote("document_id") }},
        {{ adapter.quote("document_type") }},
        {{ adapter.quote("document_number") }},
        {{ adapter.quote("document_item_number") }},
        {{ adapter.quote("country_id") }},
        {{ adapter.quote("document_date_id") }},
        {{ adapter.quote("sold_to_customer_id") }} as soldto_customer_id,
        {{ adapter.quote("sales_channel_level_1_code") }},
        {{ adapter.quote("sales_channel_level_1_name") }},
        {{ adapter.quote("sales_channel_level_2_code") }},
        {{ adapter.quote("sales_channel_level_2_name") }},
        {{ adapter.quote("sales_channel_level_3_code") }},
        {{ adapter.quote("sales_channel_level_3_name") }},
        {{ adapter.quote("sales_channel_level_4_code") }},
        {{ adapter.quote("sales_channel_level_4_name") }},
        {{ adapter.quote("ship_to_customer_id") }} as shipto_customer_id,
        {{ adapter.quote("bill_to_customer_id") }},
        {{ adapter.quote("payer_customer_id") }} as payer_id,
        {{ adapter.quote("sold_by_cr_id") }} as call_representative_id,
        {{ adapter.quote("sales_route_id") }},
        {{ adapter.quote("distributor_id") }},
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("material_type_code") }},
        {{ adapter.quote("currency_id") }},
        {{ adapter.quote("order_type_id") }},
        {{ adapter.quote("distribution_channel") }},
        {{ adapter.quote("payment_term") }},
        {{ adapter.quote("order_reason_id") }},
        {{ adapter.quote("payment_term_category_id") }},
        {{ adapter.quote("rrc_quantity") }},
        {{ adapter.quote("rrc_quantity_ord") }},
        {{ adapter.quote("rrc_quantity_del") }},
        {{ adapter.quote("rrc_quantity_inv") }},
        {{ adapter.quote("rc_quantity") }},
        {{ adapter.quote("rc_quantity_ord") }},
        {{ adapter.quote("rc_quantity_del") }},
        {{ adapter.quote("rc_quantity_inv") }},
        {{ adapter.quote("oz8_quantity") }},
        {{ adapter.quote("oz8_quantity_ord") }},
        {{ adapter.quote("oz8_quantity_del") }},
        {{ adapter.quote("oz8_quantity_inv") }},
        {{ adapter.quote("liter_quantity") }},
        {{ adapter.quote("liter_quantity_ord") }},
        {{ adapter.quote("liter_quantity_del") }},
        {{ adapter.quote("liter_quantity_inv") }},
        {{ adapter.quote("piece_quantity") }},
        {{ adapter.quote("piece_quantity_ord") }},
        {{ adapter.quote("piece_quantity_del") }},
        {{ adapter.quote("piece_quantity_inv") }},
        {{ adapter.quote("net_value_lc") }} as net_revenue_lc,
        {{ adapter.quote("net_value_ord_lc") }},
        {{ adapter.quote("net_value_del_lc") }},
        {{ adapter.quote("net_value_inv_lc") }},
        {{ adapter.quote("discount_value_lc") }},
        {{ adapter.quote("discount_value_ord_lc") }},
        {{ adapter.quote("discount_value_del_lc") }},
        {{ adapter.quote("discount_value_inv_lc") }},
        {{ adapter.quote("net_value_usd") }},
        {{ adapter.quote("net_value_ord_usd") }},
        {{ adapter.quote("net_value_del_usd") }},
        {{ adapter.quote("net_value_inv_usd") }},
        {{ adapter.quote("discount_value_usd") }},
        {{ adapter.quote("discount_value_ord_usd") }},
        {{ adapter.quote("discount_value_del_usd") }},
        {{ adapter.quote("discount_value_inv_usd") }},
        {{ adapter.quote("pvc_lc") }},
        {{ adapter.quote("pvc_ord_lc") }},
        {{ adapter.quote("pvc_del_lc") }},
        {{ adapter.quote("pvc_inv_lc") }},
        {{ adapter.quote("pvc_usd") }},
        {{ adapter.quote("pvc_ord_usd") }},
        {{ adapter.quote("pvc_del_usd") }},
        {{ adapter.quote("pvc_inv_usd") }},
        {{ adapter.quote("cda_lc") }},
        {{ adapter.quote("cda_ord_lc") }},
        {{ adapter.quote("cda_del_lc") }},
        {{ adapter.quote("cda_inv_lc") }},
        {{ adapter.quote("cda_usd") }},
        {{ adapter.quote("cda_ord_usd") }},
        {{ adapter.quote("cda_del_usd") }},
        {{ adapter.quote("cda_inv_usd") }},
        {{ adapter.quote("fmoh_lc") }},
        {{ adapter.quote("fmoh_ord_lc") }},
        {{ adapter.quote("fmoh_del_lc") }},
        {{ adapter.quote("fmoh_inv_lc") }},
        {{ adapter.quote("fmoh_usd") }},
        {{ adapter.quote("fmoh_ordusd") }},
        {{ adapter.quote("fmoh_del_usd") }},
        {{ adapter.quote("fmoh_inv_usd") }},
        {{ adapter.quote("pt_lc") }},
        {{ adapter.quote("pt_ord_lc") }},
        {{ adapter.quote("pt_del_lc") }},
        {{ adapter.quote("pt_inv_lc") }},
        {{ adapter.quote("pt_usd") }},
        {{ adapter.quote("pt_ord_usd") }},
        {{ adapter.quote("pt_del_usd") }},
        {{ adapter.quote("pt_inv_usd") }},
        {{ adapter.quote("mc_lc") }},
        {{ adapter.quote("mc_ord_lc") }},
        {{ adapter.quote("mc_del_lc") }},
        {{ adapter.quote("mc_inv_lc") }},
        {{ adapter.quote("mc_usd") }},
        {{ adapter.quote("mc_ord_usd") }},
        {{ adapter.quote("mc_del_usd") }},
        {{ adapter.quote("mc_inv_usd") }},
        {{ adapter.quote("gross_profit_lc") }},
        {{ adapter.quote("gross_profit_ord_lc") }},
        {{ adapter.quote("gross_profit_del_lc") }},
        {{ adapter.quote("gross_profit_inv_lc") }},
        {{ adapter.quote("gross_profit_usd") }},
        {{ adapter.quote("gross_profit_ord_usd") }},
        {{ adapter.quote("gross_profit_del_usd") }},
        {{ adapter.quote("gross_profit_inv_usd") }},
        {{ adapter.quote("cogs_lc") }},
        {{ adapter.quote("cogs_ord_lc") }},
        {{ adapter.quote("cogs_del_lc") }},
        {{ adapter.quote("cogs_inv_lc") }},
        {{ adapter.quote("cogs_usd") }},
        {{ adapter.quote("cogs_ord_usd") }},
        {{ adapter.quote("cogs_del_usd") }},
        {{ adapter.quote("cogs_inv_usd") }}

    from source
)
select * from renamed
  