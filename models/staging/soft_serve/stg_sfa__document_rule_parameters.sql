with source as (
    select * from {{ source('sfa', 'dbo_DocumentRuleParams') }}
),

renamed as (
    select
        {{ adapter.quote("Country_Code") }},
        {{ adapter.quote("Param_ID") }},
        {{ adapter.quote("Rule_ID") }},
        {{ adapter.quote("ValidationItem_ID") }},
        {{ adapter.quote("TableRow_ID") }},
        {{ adapter.quote("DisplayValue") }},
        {{ adapter.quote("ValidationValue") }},
        {{ adapter.quote("ReplacementType") }},
        {{ adapter.quote("SortOrder") }},
        {{ adapter.quote("ParamOperation") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Status") }},
        {{ adapter.quote("DisplayValueId") }},
        {{ adapter.quote("ValidationValueId") }},


        ----------  ids

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}
        
        ----------  omited

    from source
)

select * from renamed
