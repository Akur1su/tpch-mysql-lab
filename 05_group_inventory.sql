use TPCH;

select n.name as nation_name,
       count(distinct s.suppkey) as supplier_count,
       count(distinct ps.partkey) as part_count,
       sum(ps.availqty) as total_stock,
       avg(ps.supplycost) as avg_supply_cost
from Nation n
join Supplier s on s.nationkey = n.nationkey
left join PartSupp ps on ps.suppkey = s.suppkey
group by n.nationkey, n.name
having sum(ps.availqty) > 500
order by n.name;
