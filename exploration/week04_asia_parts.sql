use TPCH;

select p.name as part_name
from Part p
where p.partkey in (
    select ps.partkey
    from PartSupp ps
    join Supplier s on s.suppkey = ps.suppkey
    join Nation n on n.nationkey = s.nationkey
    join Region r on r.regionkey = n.regionkey
    where r.name = 'ASIA'
)
order by p.partkey;
