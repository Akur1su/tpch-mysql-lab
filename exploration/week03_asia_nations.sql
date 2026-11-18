use TPCH;

select n.name as nation_name
from Nation n
join Region r on r.regionkey = n.regionkey
where r.name = 'ASIA'
order by n.name;
