{{ config(materialized='ephemeral') }}


with source as (
    select * from {{ source('sfa', 'cust_SurveyDataMart') }}
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
        {{ adapter.quote("UniqGroup") }},
        {{ adapter.quote("ASMDocument_ID") }},
        {{ adapter.quote("SRDocument_ID") }},
        {{ adapter.quote("QuestionExternalCodeRN") }},
        {{ adapter.quote("QKeyValue") }},
        {{ adapter.quote("OrderKey") }},
        {{ adapter.quote("QuestionExternalCode") }},
        {{ adapter.quote("Question") }},
        {{ adapter.quote("ASMResponse") }},
        {{ adapter.quote("SRResponse") }},
        {{ adapter.quote("MonthID") }},
        {{ adapter.quote("ASMCustId") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

    from source
)

select * from renamed
