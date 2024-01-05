with document as (
	select * from {{ ref('stg_sap__documents_open') }}
),

calendar as (
    select * from {{ ref('stg_dwh__calendar') }}
),

entity as (
    select * from {{ ref('stg_dwh__dim_entities') }}
), 

country as (
	select * from {{ ref('stg_dwh__dim_countries') }}
),

product as (
	select * from {{ ref('stg_sap__products') }}
),

customer as (
	select * from {{ ref('stg_dwh__dim_customers') }}
),

fx as (
    select * from {{ ref('stg_dwh__fx_rates') }}
),

call_representative as (
    select * from {{ ref('stg_dwh__dim_call_representatives') }}
),

final as (
	select
		calendar.last_of_month as calendar_id,
		country.country_id as country_id,
		entity.entity_id as entity_id,
		coalesce(document.soldto_customer_id, -1) as sold_to_id,
		coalesce(document.shipto_customer_id, -1) as ship_to_id,
		coalesce(document.payer_id, -1) as payer_id,
		coalesce(document.call_representative_id, -1) as call_representative_id,
		coalesce(product.local_sku_id, -1) as local_sku_id,
		sum(document.piece_quantity) as piece_quantity,
		sum(document.liter_quantity) as liter_quantity,
		sum(document.oz8_quantity) as oz8_quantity,
		sum(document.rrc_quantity) as rrc_quantity,
		sum(document.net_revenue_lc) as net_revenue_lc,
		coalesce(sum(document.net_revenue_lc * fx.fx_rate), 0) as net_revenue_czk
	
	from 
		document
	
		inner join calendar
			on document.document_date_id = calendar.calendar_id

		inner join entity
			on document.country_id = entity.country_id

		inner join country
			on document.country_id = country.country_id

		inner join product 
			on document.product_id = product.product_id

        left join call_representative
            on document.call_representative_id = call_representative.call_representative_id

		left join customer as sold_to
			on document.soldto_customer_id = sold_to.customer_id
		
		left join customer as ship_to
			on document.shipto_customer_id = ship_to.customer_id

		left join customer as payer
			on document.payer_id = payer.customer_id

        left join fx
            on document.document_date_id = fx.calendar_id
            and country.currency_id = fx.from_currency_id
            and 137 = fx.to_currency_id
            --and document.country_id = fx.country_id

	where
		product.material_type_code = 'FERT'
        and entity.entity_sap_code = 'PEPSI'
		and document.document_date_id >= 20220000

	group by 
		calendar.last_of_month,
		country.country_id,
		entity.entity_id,
		document.soldto_customer_id,
		document.shipto_customer_id,
		document.payer_id,
        document.call_representative_id,
		product.local_sku_id
)

select * from final 