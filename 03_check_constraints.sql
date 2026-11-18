use TPCH;

start transaction;

-- 预期 1062，地区编号 1 已经存在。
insert into Region (regionkey, name) values (1, 'DUPLICATE');

-- 预期 1452，国家引用的地区 999 不存在。
insert into Nation (nationkey, name, regionkey) values (91, 'ORPHAN', 999);

-- 预期 1451，地区 90 有国家引用。
insert into Region (regionkey, name) values (90, 'TEST REGION');
insert into Nation (nationkey, name, regionkey) values (90, 'TEST NATION', 90);
delete from Region where regionkey = 90;

-- 预期 3819，零售价必须大于 0。
insert into Part (partkey, name, retailprice) values (90, '试验件', 0);

-- 预期 3819，两侧外键有效，但库存为负数。
insert into PartSupp (partkey, suppkey, availqty, supplycost)
values (2, 101, -1, 18.00);

rollback;
