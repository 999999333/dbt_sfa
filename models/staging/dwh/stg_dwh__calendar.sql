with source as (
      select * from {{ source('core', 'Calendar_v') }}
),
renamed as (
    select
        {{ adapter.quote("Calendar_Id") }},
        {{ adapter.quote("Calendar_Date") }},
        {{ adapter.quote("Calendar_Day") }},
        {{ adapter.quote("Calendar_Year") }},
        {{ adapter.quote("Calendar_Quarter") }},
        {{ adapter.quote("Calendar_Month") }},
        {{ adapter.quote("Calendar_Week") }},
        {{ adapter.quote("Day_Suffix") }},
        {{ adapter.quote("Day_Label") }},
        {{ adapter.quote("Day_Of_Week") }},
        {{ adapter.quote("Day_Of_Week_In_Month") }},
        {{ adapter.quote("Day_Of_Year") }},
        {{ adapter.quote("Is_Weekend") }},
        {{ adapter.quote("ISO_week") }},
        {{ adapter.quote("First_Of_Week") }},
        {{ adapter.quote("Last_Of_Week") }},
        {{ adapter.quote("Week_Of_Month") }},
        {{ adapter.quote("Month_Label") }},
        {{ adapter.quote("First_Of_Month") }},
        {{ adapter.quote("Last_Of_Month") }},
        {{ adapter.quote("First_Of_Next_Month") }},
        {{ adapter.quote("Last_Of_Next_Month") }},
        {{ adapter.quote("First_Of_Quarter") }},
        {{ adapter.quote("Last_Of_Quarter") }},
        {{ adapter.quote("ISO_Year") }},
        {{ adapter.quote("First_Of_Year") }},
        {{ adapter.quote("Last_Of_Year") }},
        {{ adapter.quote("Is_Leap_Year") }},
        {{ adapter.quote("Has_53_Weeks") }},
        {{ adapter.quote("Has_53_ISO_Weeks") }},
        {{ adapter.quote("MMYYYY") }},
        {{ adapter.quote("Style_101") }},
        {{ adapter.quote("Style_103") }},
        {{ adapter.quote("Style_112") }},
        {{ adapter.quote("Style_120") }},
        {{ adapter.quote("YYYYMM") }},
        {{ adapter.quote("Is_Last_Day_Of_Month") }}

    from source
)
select * from renamed
  