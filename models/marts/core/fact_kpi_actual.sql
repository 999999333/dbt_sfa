with rankedkpi as (
    select
        country_code,
        kpiid,
        versionid,
        olcard_id,
        date,
        convert(
            int,
            format(
                dateadd(day, -1, dateadd(month, datediff(month, 0, date) + 1, 0)),
                'yyyyMMdd'
            )
        ) as period,
        ol_id,
        orgstructureid,
        fact,
        dlm,
        status,
        concat(kpiid, ':', ol_id, ':', country_code) as kpi_outlet_id,
        concat(kpiid, ':', country_code) as kpi_country_id,
        rank() over (
            partition by country_code, kpiid, ol_id, format(date, 'yyyyMM')
            order by fact desc
        ) as rankinmonth
    from l01_stage.sfa.ps_kpiexecutionfact_v
)

final as (
    select
        country_code,
        olcard_id as visit_id,
        date as fact_date,
        period,
        ol_id as outlet_id, isnull (fact, 0) as fact_value,
        dlm as last_modified,
        status,
        kpiid as kpi_id,
        orgstructureid as org_id,
        concat(kpiid, ':', ol_id, ':', country_code) as kpi_outlet_id,
        concat(kpiid, ':', country_code) as kpi_country_id
    from rankedkpi
    where rankinmonth = 1
)

select * from final