with source as (
      select * from {{ source('sfa', 'dbo_MobileModuleUser_v') }}
),
renamed as (
    select

        ----------  ids

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "MobileModuleUserID"]) }} as mobile_user_id,
        {{ adapter.quote("MobileModuleUserID") }} as mobile_user_key,

        {{ dbt_utils.generate_surrogate_key(["Country_Code", "OrgStructureID"]) }} as organizational_structure_id,
        {{ adapter.quote("OrgStructureID") }} as organizational_structure_key,

        {{ convert_country_to_code("Country_Code") }} as country_id,
        {{ adapter.quote("Country_Code") }} as country_code


        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited
--        {{ adapter.quote("DeviceSerialNumber") }},
--        {{ adapter.quote("MerchStatus") }},
--        {{ adapter.quote("OLCardMinValue") }},
--        {{ adapter.quote("OLCardCurrentValue") }},
--        {{ adapter.quote("OLCardMaxValue") }},
--        {{ adapter.quote("OrderNoMinValue") }},
--        {{ adapter.quote("OrderNoCurrentvalue") }},
--        {{ adapter.quote("OrderNoMaxValue") }},
--        {{ adapter.quote("OutletMinValue") }},
--        {{ adapter.quote("OutletCurrentValue") }},
--        {{ adapter.quote("OutletMaxValue") }},
--        {{ adapter.quote("RouteMinValue") }},
--        {{ adapter.quote("RouteCurrentValue") }},
--        {{ adapter.quote("RouteMaxValue") }},
--        {{ adapter.quote("TaxFactureNoCurrentValue") }},
--        {{ adapter.quote("Prefix") }},
--        {{ adapter.quote("MobileVersion") }},
--        {{ adapter.quote("DevOsVersion") }},
--        {{ adapter.quote("DevModelName") }},
--        {{ adapter.quote("SyncDate") }},
--        {{ adapter.quote("DLM") }},
--        {{ adapter.quote("Status") }},
--        {{ adapter.quote("ULM") }},
--        {{ adapter.quote("Cust_id") }},
--        {{ adapter.quote("PinCode") }},
--        {{ adapter.quote("Password") }},
--        {{ adapter.quote("PasswordValidTo") }},
--        {{ adapter.quote("ReportsDenyAccess") }},
--        {{ adapter.quote("MobileModuleUserProfileID") }},
--        {{ adapter.quote("ChangePassword") }},
--        {{ adapter.quote("UseCustNumber") }},
--        {{ adapter.quote("StartCustNumber") }},
--        {{ adapter.quote("LastFivePasswordsHistory") }},
--        {{ adapter.quote("WOrderRequestMinValue") }},
--        {{ adapter.quote("WOrderRequestMaxValue") }},
--        {{ adapter.quote("WOrderRequestCurrentValue") }},
--        {{ adapter.quote("DeviceFcmToken") }},
--        {{ adapter.quote("MMAllowedVersion") }},
--        {{ adapter.quote("SyncType") }},
--        {{ adapter.quote("ShardId") }},
--        {{ adapter.quote("SyncVersion") }},
--        {{ adapter.quote("CPU_Info") }},
--        {{ adapter.quote("Camera") }},
--        {{ adapter.quote("GPS_Type") }},
--        {{ adapter.quote("RAM") }},
--        {{ adapter.quote("ROM") }},
--        {{ adapter.quote("TypeDevice") }},
--        {{ adapter.quote("DisplaySize") }}

    from source
)
select * from renamed
  