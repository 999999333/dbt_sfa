{{ config(materialized='ephemeral') }}

with source as (
      select * from {{ source('sfa', 'cust_VisitKPIDataMart') }}
),
renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("VisitDate") }},
        {{ adapter.quote("Month") }},
        {{ adapter.quote("IsLastVisit") }},
        {{ adapter.quote("ClosedMonth") }},
        {{ adapter.quote("OlCard_id") }},
        {{ adapter.quote("Country") }},
        {{ adapter.quote("City") }},
        {{ adapter.quote("Area") }},
        {{ adapter.quote("Supervisor") }},
        {{ adapter.quote("ASM") }},
        {{ adapter.quote("SR") }},
        {{ adapter.quote("OutletGroups") }},
        {{ adapter.quote("OutletTypes") }},
        {{ adapter.quote("OLSubTypeName") }},
        {{ adapter.quote("Network") }},
        {{ adapter.quote("AtrernativeOutletClassification") }},
        {{ adapter.quote("OL_id") }},
        {{ adapter.quote("OLCode") }},
        {{ adapter.quote("OLName") }},
        {{ adapter.quote("OLAddress") }},
        {{ adapter.quote("Payer") }},
        {{ adapter.quote("VisitCycle") }},
        {{ adapter.quote("VisitDays") }},
        {{ adapter.quote("VisitFrequency") }},
        {{ adapter.quote("SGR") }},
        {{ adapter.quote("PricelistID") }},
        {{ adapter.quote("Listing") }},
        {{ adapter.quote("delinst") }},
        {{ adapter.quote("AdditionalName") }},
        {{ adapter.quote("VersionId") }},
        {{ adapter.quote("KpiId") }},
        {{ adapter.quote("KName0") }},
        {{ adapter.quote("KName1") }},
        {{ adapter.quote("KName2") }},
        {{ adapter.quote("KName3") }},
        {{ adapter.quote("KName4") }},
        {{ adapter.quote("KName5") }},
        {{ adapter.quote("KPISPTT") }},
        {{ adapter.quote("KPICalcStatus") }},
        {{ adapter.quote("KTypeName") }},
        {{ adapter.quote("KLevel") }},
        {{ adapter.quote("KExternalCode") }},
        {{ adapter.quote("KNameALL") }},
        {{ adapter.quote("Actual") }},
        {{ adapter.quote("TargetKPI") }},
        {{ adapter.quote("TargetSP") }},
        {{ adapter.quote("MonthID") }},
        {{ adapter.quote("Cust_id") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)
select * from renamed
  