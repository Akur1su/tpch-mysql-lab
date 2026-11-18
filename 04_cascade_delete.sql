create database TPCH_CascadeDemo character set utf8mb4;
use TPCH_CascadeDemo;

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
        foreign key (regionkey) references Region (regionkey) on delete cascade
);

insert into Region (regionkey, name) values (1, 'ASIA'), (2, 'EUROPE');
insert into Nation (nationkey, name, regionkey) values
    (11, 'CHINA', 1), (12, 'JAPAN', 1), (21, 'GERMANY', 2);

select nationkey, name, regionkey from Nation order by nationkey;

delete from Region where regionkey = 1;

select nationkey, name, regionkey from Nation order by nationkey;
