with source as (
    select *
    from
        {{ source('sfa', 'dbo_DocumentRules') }}
),

renamed as (
    select

        ----------  ids
        {{ adapter.quote("Rule_ID") }} as questionnare_rule_id,
        {{ adapter.quote("Object_ID") }} as questionnaire_question_id,
        {{ adapter.quote("StandartDocumentItemId") }} as questionnaire_question_standard_id,
        {{ convert_country_to_code("Country_Code") }} as country_id,

        ----------  strings
        {{ adapter.quote("RuleName") }},
        {{ adapter.quote("ExternalCode") }},
        {{ adapter.quote("CycleItem") }},

        ----------  numerics
        {{ adapter.quote("Type") }},
        {{ adapter.quote("RuleOperation") }},
        {{ adapter.quote("SortOrder") }},
        {{ adapter.quote("ULM") }},
        {{ adapter.quote("Status") }},

        ----------  booleans
        {{ adapter.quote("AllowBreakCycle") }},

        ----------  timestamps
        {{ adapter.quote("DLM") }},
        {{ adapter.quote("Valid_From") }},
        {{ adapter.quote("Valid_To") }}

        ----------  omited

    from
        source
)

select *
from
    renamed
