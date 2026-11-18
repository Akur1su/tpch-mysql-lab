use TPCH;

select c.name as customer_name, n.name as nation_name, c.acctbal
from Customer c
join Nation n on n.nationkey = c.nationkey
where c.acctbal > (
    select avg(peers.acctbal)
    from Customer peers
    where peers.nationkey = c.nationkey
)
order by c.custkey;

select c.custkey, c.name, c.acctbal
from Customer c
where not exists (
    select 1
    from Orders o
    where o.custkey = c.custkey
)
order by c.custkey;
