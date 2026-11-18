create database TPCH character set utf8mb4;
use TPCH;

create table Region (
    regionkey int,
    name char(25),
    comment varchar(152),
    constraint PK_Region primary key (regionkey)
);

create table Nation (
    nationkey int,
    name char(25),
    regionkey int,
    comment varchar(152),
    constraint PK_Nation primary key (nationkey),
    constraint FK_Nation_Region
        foreign key (regionkey) references Region (regionkey)
);

create table Supplier (
    suppkey int,
    name char(25),
    address varchar(40),
    nationkey int,
    phone char(15),
    acctbal decimal(10, 2),
    comment varchar(101),
    constraint PK_Supplier primary key (suppkey),
    constraint FK_Supplier_Nation
        foreign key (nationkey) references Nation (nationkey)
);

create table Part (
    partkey int,
    name varchar(55),
    mfgr char(25),
    brand char(10),
    type varchar(25),
    size int,
    container char(10),
    retailprice decimal(10, 2) not null,
    comment varchar(23),
    constraint PK_Part primary key (partkey),
    constraint CK_Part_Price check (retailprice > 0)
);

create table PartSupp (
    partkey int,
    suppkey int,
    availqty int not null,
    supplycost decimal(10, 2),
    comment varchar(199),
    constraint PK_PartSupp primary key (partkey, suppkey),
    constraint FK_PartSupp_Part
        foreign key (partkey) references Part (partkey),
    constraint FK_PartSupp_Supplier
        foreign key (suppkey) references Supplier (suppkey),
    constraint CK_PartSupp_AvailQty check (availqty >= 0)
);

create table Customer (
    custkey int,
    name varchar(25),
    address varchar(40),
    nationkey int,
    phone char(15),
    acctbal decimal(10, 2),
    mktsegment char(10),
    comment varchar(117),
    constraint PK_Customer primary key (custkey),
    constraint FK_Customer_Nation
        foreign key (nationkey) references Nation (nationkey)
);

create table Orders (
    orderkey int,
    custkey int,
    orderstatus char(1),
    totalprice decimal(10, 2),
    orderdate date,
    orderpriority char(15),
    clerk char(15),
    shippriority int,
    comment varchar(79),
    constraint PK_Orders primary key (orderkey),
    constraint FK_Orders_Customer
        foreign key (custkey) references Customer (custkey)
);

create table Lineitem (
    orderkey int,
    partkey int,
    suppkey int,
    linenumber int,
    quantity decimal(10, 2),
    extendedprice decimal(10, 2),
    discount decimal(10, 2),
    tax decimal(10, 2),
    returnflag char(1),
    linestatus char(1),
    shipdate date,
    commitdate date,
    receiptdate date,
    shipinstruct char(25),
    shipmode char(10),
    comment varchar(44),
    constraint PK_Lineitem primary key (orderkey, linenumber),
    constraint FK_Lineitem_Orders
        foreign key (orderkey) references Orders (orderkey),
    constraint FK_Lineitem_PartSupp
        foreign key (partkey, suppkey) references PartSupp (partkey, suppkey)
);

show tables;