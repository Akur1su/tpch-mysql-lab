use TPCH;

-- 在同一查询窗口逐条运行，或启用“错误时继续”。
start transaction;

set @test_suppkey = (select max(suppkey) + 1 from Supplier);

insert into Supplier (suppkey, name, nationkey)
values (@test_suppkey, '主键测试供应商', 11);

-- 零件 2 与新供应商的组合应插入成功。
insert into PartSupp (partkey, suppkey, availqty, supplycost)
values (2, @test_suppkey, 7, 18.00);

select partkey, suppkey
from PartSupp
where partkey = 2
order by suppkey;

-- 预期 1062，重复插入刚创建的整个主键。
insert into PartSupp (partkey, suppkey, availqty, supplycost)
values (2, @test_suppkey, 7, 18.00);

-- 预期 1048，复合主键的列不能为 null。
insert into PartSupp (partkey, suppkey, availqty, supplycost)
values (null, @test_suppkey, 7, 18.00);

rollback;
