{{ config(materialized='ephemeral') }}

with source as (
    select * from {{ source('sfa', 'cust_DistributionsDataMart') }}
),

renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("ASMMonthOfVisit") }},
        {{ adapter.quote("ASMYearOfVisit") }},
        {{ adapter.quote("Ol_id") }},
        {{ adapter.quote("OutletExternalCode") }},
        {{ adapter.quote("OutletName") }},
        {{ adapter.quote("OutletAddress") }},
        {{ adapter.quote("ASMOlCardId") }},
        {{ adapter.quote("SROlCardId") }},
        {{ adapter.quote("ASMName") }},
        {{ adapter.quote("ASMStaffName") }},
        {{ adapter.quote("SRName") }},
        {{ adapter.quote("SRStaffName") }},
        {{ adapter.quote("ASMDate") }},
        {{ adapter.quote("SRDate") }},
        {{ adapter.quote("ASMLastVisitInMonth") }},
        {{ adapter.quote("ASMQuestionExternalCode") }},
        {{ adapter.quote("SRQuestionExternalCode") }},
        {{ adapter.quote("ProdGroupName") }},
        {{ adapter.quote("ProductCode") }},
        {{ adapter.quote("ProductName") }},
        {{ adapter.quote("ASMCheck") }},
        {{ adapter.quote("ASMOOSReason") }},
        {{ adapter.quote("SRCheck") }},
        {{ adapter.quote("SROOSReason") }},
        {{ adapter.quote("MonthID") }},
        {{ adapter.quote("ASMCustId") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)

select * from renamed
