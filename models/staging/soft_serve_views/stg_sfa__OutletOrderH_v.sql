with source as (
      select * from {{ source('sfa', 'dbo_OutletOrderH_v') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("OlCard_id") }},
        {{ adapter.quote("OrderNo") }},
        {{ adapter.quote("OlOrderDate") }},
        {{ adapter.quote("OrderExecutionDate") }},
        {{ adapter.quote("PayForm_id") }},
        {{ adapter.quote("ResponsiblePerson") }},
        {{ adapter.quote("OLOrderAmount") }},
        {{ adapter.quote("Discount") }},
        {{ adapter.quote("Cust_id") }},
        {{ adapter.quote("ConsumerUnit") }},
        {{ adapter.quote("OrderYear") }},
        {{ adapter.quote("OrderMonth") }},
        {{ adapter.quote("OrderWeek") }},
        {{ adapter.quote("OlDeliveryAddress") }},
        {{ adapter.quote("VATCalcMode") }},
        {{ adapter.quote("VAT_Sum") }},
        {{ adapter.quote("ProxySeries") }},
        {{ adapter.quote("ProxyNumber") }},
        {{ adapter.quote("ProxyDate") }},
        {{ adapter.quote("TransportCost") }},
        {{ adapter.quote("Operation_id") }},
        {{ adapter.quote("W_id") }},
        {{ adapter.quote("Comments") }},
        {{ adapter.quote("IsReturn") }},
        {{ adapter.quote("TaxFactureNo") }},
        {{ adapter.quote("IsLocalProducts") }},
        {{ adapter.quote("HasUnboundPayments") }},
        {{ adapter.quote("SyncWithDBF") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("PayDate") }},
        {{ adapter.quote("IsConfirm") }},
        {{ adapter.quote("OrderInPackages") }},
        {{ adapter.quote("OrderingTime") }},
        {{ adapter.quote("Signature") }},
        {{ adapter.quote("PComp_id") }},
        {{ adapter.quote("CustNumber") }},
        {{ adapter.quote("PayFormType") }},
        {{ adapter.quote("InvestmentId") }},
        {{ adapter.quote("NextVisitDate") }},
        {{ adapter.quote("Postpay") }},
        {{ adapter.quote("SyncMMDate") }},
        {{ adapter.quote("PCDistr_id") }},
        {{ adapter.quote("DistributorEntity") }},
        {{ adapter.quote("IsPromoActivity") }},
        {{ adapter.quote("PromoActivities_ID") }},
        {{ adapter.quote("AcceptStatus") }},
        {{ adapter.quote("BaseOrderNo") }},
        {{ adapter.quote("AgreementId") }}
        --{{ adapter.quote("Valid_From") }},
       -- {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  