use TPCH;

start transaction;

insert into Customer (custkey, name, nationkey, acctbal)
values (290, '许舟', 11, 6000.00);

insert into Orders (orderkey, custkey, orderstatus, totalprice, orderdate)
values (1090, 290, 'O', 12.00, '2026-11-10');

insert into Lineitem (orderkey, partkey, suppkey, linenumber, quantity, extendedprice)
values (1090, 1, 101, 1, 1, 12.00);

select c.name as customer_name, o.orderkey, l.linenumber, p.name as part_name
from Customer c
join Orders o on o.custkey = c.custkey
join Lineitem l on l.orderkey = o.orderkey
join Part p on p.partkey = l.partkey
where c.custkey = 290;

rollback;
