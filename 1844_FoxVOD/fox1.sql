select * from
monthly_provider_views
where upper(provider) like '%FOX%'
order by viewmonth desc
;

select distinct provider
from
monthly_provider_views
where upper(provider) like '%FOX%'
;

select * from
calendar
;

select PROVIDER,
                avg(UniqueHH) unique_hh
from
(
SELECT c.year_month_of_year ViewMonth ,
    case when b.provider_name in ('FOX_ADS','FOX_ADS_HD') then 'FOX_ADS' ELSE 'FOX NETSHOWS' END AS PROVIDER,
       --b.PROVIDER_NAME,
       count(*) Views,
       count(distinct(a.ACCOUNT_SID)) UniqueHH,
       count(distinct(a.mac_address)) UniqueSTB,
       sum(a.VIEWING_SECS) TotalViewingSecs,
       sysdate created_date
from
vod_stream a
inner join vod_asset_title b
on (a.asset_sid = b.asset_sid)
inner join calendar c
on (a.calendar_sid = c.calendar_sid)

where
a.calendar_sid >= 20171201 and a.calendar_sid <= 20180228
and b.provider_name in (
'FOX_ADS',
'FOX_ADS_HD',
'FOX_NETSHOWS',
'FOX_NETSHOWS_C3',
'FOX_NETSHOWS_HD',
'FOX_NETSHOWS_HD_C3'
)
group by
c.year_month_of_year,
case when b.provider_name in ('FOX_ADS','FOX_ADS_HD') then 'FOX_ADS' ELSE 'FOX NETSHOWS' END,
sysdate
)
group by provider
;

select 
                avg(UniqueHH) unique_hh
from
(
SELECT c.year_month_of_year ViewMonth ,
       --b.PROVIDER_NAME,
       count(*) Views,
       count(distinct(a.ACCOUNT_SID)) UniqueHH,
       count(distinct(a.mac_address)) UniqueSTB,
       sum(a.VIEWING_SECS) TotalViewingSecs,
       sysdate created_date
from
vod_stream a
inner join vod_asset_title b
on (a.asset_sid = b.asset_sid)
inner join calendar c
on (a.calendar_sid = c.calendar_sid)

where
a.calendar_sid >= 20171201 and a.calendar_sid <= 20180228
and b.provider_name in (
'FOX_ADS',
'FOX_ADS_HD',
'FOX_NETSHOWS',
'FOX_NETSHOWS_C3',
'FOX_NETSHOWS_HD',
'FOX_NETSHOWS_HD_C3'
)
group by
c.year_month_of_year,
sysdate
)
;

select 
                avg(UniqueHH) unique_hh
from
(
SELECT c.year_month_of_year ViewMonth ,
       --b.PROVIDER_NAME,
       count(*) Views,
       count(distinct(a.ACCOUNT_SID)) UniqueHH,
       count(distinct(a.mac_address)) UniqueSTB,
       sum(a.VIEWING_SECS) TotalViewingSecs,
       sysdate created_date
from
vod_stream a
inner join vod_asset_title b
on (a.asset_sid = b.asset_sid)
inner join calendar c
on (a.calendar_sid = c.calendar_sid)

where
a.calendar_sid >= 20171201 and a.calendar_sid <= 20180228
and b.provider_name in (
'FOX_ADS',
'FOX_ADS_HD',
'FOX_NETSHOWS',
'FOX_NETSHOWS_C3',
'FOX_NETSHOWS_HD',
'FOX_NETSHOWS_HD_C3',
'FOXMOVIES'
)
group by
c.year_month_of_year,
sysdate
)
;