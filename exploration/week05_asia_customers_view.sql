use TPCH;

create or replace view v_asia_customers as
select c.*
from Customer c
join Nation n on n.nationkey = c.nationkey
join Region r on r.regionkey = n.regionkey
where r.name = 'ASIA';

select custkey, name, nationkey, acctbal
from v_asia_customers
order by custkey;
