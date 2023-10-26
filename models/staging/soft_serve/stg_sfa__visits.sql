with source as (
    select * from {{ ref('sfa__visits_snapshot') }}
),

renamed as (
    select

        ----------  ids
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OlCard_id"]) }} as visit_id,
        {{ adapter.quote("OlCard_id") }} as visit_key,
      
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Ol_id"]) }} as outlet_id,
        {{ adapter.quote("Ol_id") }} as outlet_key,
        
        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Merch_id"]) }} as merchant_id,
        {{ adapter.quote("Merch_id") }} as merchant_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Reason_ID") }} as inaccessibility_reason_id,
        {{ adapter.quote("Route_id") }} as route_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_id,
        {{ adapter.quote("Cust_id") }} as customer_id,

        ----------  strings
        {{ adapter.quote("Comments") }} as visit_comment,
        {{ adapter.quote("CompletionReasonTS") }},
        {{ adapter.quote("T1CommentTS") }},

        ----------  numerics
        {{ adapter.quote("OlCardYear") }} as visit_year,
        {{ adapter.quote("OlCardMonth") }} as visit_month,
        {{ adapter.quote("OlCardWeek") }} as visit_week,
        {{ adapter.quote("DistributionCaptureMode") }},
        {{ adapter.quote("CommentsDestination") }},
        {{ adapter.quote("VisitTimeSec") }},
        {{ adapter.quote("DistanceToOutlet") }} as visit_start_distance,
        {{ adapter.quote("DistanceToOutlet_End") }} as visit_end_distance,
        {{ adapter.quote("FacingCaptureMode") }},
        {{ adapter.quote("UserStepCount") }},
        {{ adapter.quote("Status") }},

        ----------  booleans
        {{ adapter.quote("Inaccessible") }},
        {{ adapter.quote("IsFromDDB") }},
        {{ adapter.quote("HasStartImage") }},
        {{ adapter.quote("HasEndImage") }},
        {{ adapter.quote("Incomplete") }},
        {{ adapter.quote("DocumentIsFilled") }},
        {{ adapter.quote("SyncWithDBF") }},
        {{ adapter.quote("SyncMainWithDBF") }},
        {{ adapter.quote("QuickOrder") }} as is_quick_order,

        ----------  timestamps
        {{ adapter.quote("OlCardDate") }} as visit_date,
        {{ adapter.quote("BeginTime") }} as visit_start_time,
        {{ adapter.quote("EndTime") }} as visit_end_time,
        {{ adapter.quote("EndTimeChange") }} as visit_end_time_edit,
        {{ adapter.quote("DLM") }} as dlm,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to

        
        ----------  omited
        -- {{ adapter.quote("OLCardType") }},
        -- {{ adapter.quote("DelegatedOrgStructureID") }},

    from source
)

select * from renamed
