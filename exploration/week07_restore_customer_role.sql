-- 第 7 周第 1 题，恢复 mike 的客户部职员角色。
-- 使用 root 连接，角色和账号须已按第 7 周讲义创建。

grant 'customer_employee' to 'mike'@'localhost';

show grants for 'mike'@'localhost';
