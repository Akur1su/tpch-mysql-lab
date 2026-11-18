use TPCH;

start transaction;

insert into Region (regionkey, name, comment) values
    (1, 'ASIA', '亚洲'),
    (2, 'EUROPE', '欧洲'),
    (3, 'AMERICA', '美洲');

insert into Nation (nationkey, name, regionkey, comment) values
    (11, 'CHINA', 1, '中国'),
    (21, 'GERMANY', 2, '德国'),
    (31, 'CANADA', 3, '加拿大');

insert into Supplier (suppkey, name, address, nationkey, phone, acctbal) values
    (101, '华南零件', '广州', 11, '000-0000-0101', 32000.00),
    (102, '东海器件', '上海', 11, '000-0000-0102', 28000.00),
    (201, 'Rhein Components', '科隆', 21, '000-0000-0201', 45000.00),
    (301, 'Maple Supply', '多伦多', 31, '000-0000-0301', 22000.00);

insert into Part (partkey, name, mfgr, brand, type, size, container, retailprice) values
    (1, '轴承', '华南工厂', 'B1', '机械件', 10, 'BOX', 12.00),
    (2, '传感器', '莱茵工厂', 'B2', '电子件', 20, 'BOX', 25.00),
    (3, '阀门', '枫叶工厂', 'B3', '机械件', 30, 'CASE', 39.00),
    (4, '齿轮', '华南工厂', 'B1', '机械件', 15, 'BOX', 14.00);

insert into PartSupp (partkey, suppkey, availqty, supplycost) values
    (1, 101, 520, 8.00),
    (1, 102, 50, 10.00),
    (2, 201, 15, 20.00),
    (3, 301, 8, 30.00),
    (4, 101, 40, 12.00);

insert into Customer
    (custkey, name, address, nationkey, phone, acctbal, mktsegment)
values
    (201, '林可', '广州', 11, '000-0000-1201', 12000.00, 'BUILDING'),
    (202, '赵宁', '深圳', 11, '000-0000-1202', 8000.00, 'HOUSEHOLD'),
    (203, '梅雨', '上海', 11, '000-0000-1203', 10000.00, 'FURNITURE'),
    (204, 'Emil Weber', '科隆', 21, '000-0000-1204', 5000.00, 'BUILDING'),
    (205, 'Ava Chen', '多伦多', 31, '000-0000-1205', 9000.00, 'HOUSEHOLD');

insert into Orders
    (orderkey, custkey, orderstatus, totalprice, orderdate, orderpriority, clerk, shippriority)
values
    (1001, 201, 'F', 24.00, '2026-11-01', '1-URGENT', 'Clerk#01', 0),
    (1002, 201, 'F', 40.00, '2026-11-02', '2-HIGH', 'Clerk#01', 0),
    (1003, 202, 'F', 39.00, '2026-11-03', '3-MEDIUM', 'Clerk#02', 0),
    (1004, 204, 'F', 75.00, '2026-11-04', '2-HIGH', 'Clerk#02', 0);

insert into Lineitem
    (orderkey, partkey, suppkey, linenumber, quantity, extendedprice,
     discount, tax, returnflag, linestatus, shipdate, commitdate,
     receiptdate, shipinstruct, shipmode)
values
    (1001, 1, 101, 1, 2, 24.00, 0, 0, 'N', 'F', '2026-11-02', '2026-11-03',
     '2026-11-04', 'DELIVER IN PERSON', 'TRUCK'),
    (1002, 1, 102, 1, 1, 12.00, 0, 0, 'N', 'F', '2026-11-03', '2026-11-04',
     '2026-11-05', 'DELIVER IN PERSON', 'TRUCK'),
    (1002, 4, 101, 2, 2, 28.00, 0, 0, 'N', 'F', '2026-11-03', '2026-11-04',
     '2026-11-05', 'DELIVER IN PERSON', 'TRUCK'),
    (1003, 3, 301, 1, 1, 39.00, 0, 0, 'N', 'F', '2026-11-04', '2026-11-06',
     '2026-11-08', 'DELIVER IN PERSON', 'AIR'),
    (1004, 2, 201, 1, 3, 75.00, 0, 0, 'N', 'F', '2026-11-05', '2026-11-07',
     '2026-11-09', 'DELIVER IN PERSON', 'RAIL');

commit;

select * from PartSupp order by partkey, suppkey;
