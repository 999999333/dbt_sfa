with source as (
    select * from {{ source("sfa", "dbo_OutLetCardH_v") }}
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

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Reason_ID"]) }} as inaccessibility_reason_id,
        {{ adapter.quote("Reason_ID") }} as inaccessibility_reason_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Route_id"]) }} as route_id,
        {{ adapter.quote("Route_id") }} as route_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as organizational_structure_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "Cust_id"]) }} as customer_id,
        {{ adapter.quote("Cust_id") }} as customer_key,

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
        cast({{ adapter.quote("OlCardDate") }} as date) as visit_date,
        cast({{ adapter.quote("BeginTime") }} as time) as visit_start_time,
        cast({{ adapter.quote("EndTime") }} as time) as visit_end_time,
        {{ adapter.quote("EndTimeChange") }} as visit_end_time_edit,
        {{ adapter.quote("DLM") }} as dlm
        
        ----------  omited
        -- {{ adapter.quote("OLCardType") }},
        -- {{ adapter.quote("DelegatedOrgStructureID") }},

    from source
)

select * from renamed
