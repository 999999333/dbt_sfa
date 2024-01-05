with document as (
	select * from {{ ref('stg_sap__documents_closed_kmv') }}
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

final as (
	select
		calendar.last_of_month as calendar_id,
		country.country_id as country_id,
		entity.entity_id as entity_id,
		coalesce(sold_to.customer_id, -1) as sold_to_id,
		coalesce(ship_to.customer_id, -1) as ship_to_id,
		coalesce(payer.customer_id, -1) as payer_id,
		-1 as call_representative_id,
		coalesce(product.local_sku_id, -1) as local_sku_id,
		sum(document.piece_quantity) as piece_quantity,
		sum(document.liter_quantity) as liter_quantity,
		sum(document.oz8_quantity) as oz8_quantity,
		sum(document.rrc_quantity) as rrc_quantity,
		sum(document.net_revenue_lc) as net_revenue_lc,
		sum(document.net_revenue_czk) as net_revenue_czk
	
	from 
		document
	
		inner join calendar
			on document.document_date_id = calendar.calendar_id

		inner join entity
			on document.country_id = entity.country_id
			and document.company_code = entity.entity_sap_code

		inner join country
			on document.country_id = country.country_id

		inner join product 
			on document.product_id = product.product_id

		left join customer as sold_to
			on document.soldto_customer_id = sold_to.customer_id
		
		left join customer as ship_to
			on document.shipto_customer_id = ship_to.customer_id

		left join customer as payer
			on document.shipto_customer_id = payer.customer_id

	where
		product.material_type_code = 'FERT'
		and document.document_date_id >= 20220000

	group by 
		calendar.last_of_month,
		country.country_id,
		entity.entity_id,
		sold_to.customer_id,
		ship_to.customer_id,
		payer.customer_id,
		product.local_sku_id
)

select * from final 

