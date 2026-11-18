use TPCH;

create table StockAlert_Log (
    alert_id int auto_increment,
    partkey int not null,
    suppkey int not null,
    alert_time timestamp default current_timestamp,
    constraint PK_StockAlert_Log primary key (alert_id)
);

create trigger trg_partsupp_lowstock
after update on PartSupp
for each row
insert into StockAlert_Log (partkey, suppkey)
select new.partkey, new.suppkey
where new.availqty < 10 and old.availqty >= 10;

select partkey, suppkey, availqty from PartSupp
where (partkey, suppkey) in ((1, 102), (2, 201))
order by partkey, suppkey;

start transaction;

update PartSupp set availqty = 5 where partkey = 1 and suppkey = 102;
select count(*) as alerts_after_50_to_5 from StockAlert_Log;

update PartSupp set availqty = 12 where partkey = 2 and suppkey = 201;
select count(*) as alerts_after_15_to_12 from StockAlert_Log;

select * from StockAlert_Log order by alert_id;

rollback;
