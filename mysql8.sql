--membuat bagian ADMIN --

--membuat tabel baru
MariaDB [dbtoko]> CREATE TABLE member(
    -> id int primary key auto_increment,
    -> fullname varchar(30) NOT NULL,
    -> username varchar(30) NOT NULL unique,
    -> password varchar(30) NOT NULL,
    -> role enum('admin','manager','staff') NOT NULL,
    -> foto varchar(30)
    -> );
Query OK, 0 rows affected (0.059 sec)

--menambahkan data
MariaDB [dbtoko]> INSERT INTO member (fullname, username, password, role, foto) VALUES
    -> ('Admin','admin',SHA1(MD5('mimin')),'admin','admin.jpg'),
    -> ('Siti','siti',SHA1(MD5('siti')),'manager','manager.jpg'),
    -> ('Staff','staff',SHA1(MD5('staff')),'staff','staff.jpg');
Query OK, 3 rows affected, 3 warnings (0.024 sec)
Records: 3  Duplicates: 0  Warnings: 3

MariaDB [dbtoko]> SELECT *FROM member;
+----+----------+----------+--------------------------------+---------+-------------+
| id | fullname | username | password                       | role    | foto        |
+----+----------+----------+--------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0 | admin   | admin.jpg   |
|  2 | Siti     | siti     | b48d66e55c41b0abb8c540b518f2e2 | manager | manager.jpg |
|  3 | Staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3 | staff   | staff.jpg   |
+----+----------+----------+--------------------------------+---------+-------------+
3 rows in set (0.002 sec)