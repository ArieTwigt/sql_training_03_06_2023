-- SQLite
select sql
from sqlite_master
where type = 'view'
and name = 'cars_overview_hybrid'