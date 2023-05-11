-- menggunakan inner JOIN --
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.nama as jenis FROM jenis_produk INNER JOIN produk
    -> ON produk.jenis_produk_id = jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
5 rows in set (0.015 sec)

-- melakukan penyingkatan --
MariaDB [dbtoko]> SELECT p.*, j.nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
5 rows in set (0.004 sec) 

-- menggunakan view --
MariaDB [dbtoko]> CREATE VIEW detail_produk_vw AS
    -> SELECT p.*, j.nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id
    -> ;
Query OK, 0 rows affected (0.024 sec)

//bisa dipanggil kapan saja
MariaDB [dbtoko]> SELECT * FROM detail_produk_vw;
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
5 rows in set (0.011 sec)

-- menggunakan view untuk menampilkan nama produk --
MariaDB [dbtoko]> CREATE VIEW tampil_produk AS SELECT nama FROM produk;
Query OK, 0 rows affected (0.007 sec)

MariaDB [dbtoko]> SELECT * FROM tampil_produk;
+------------+
| nama       |
+------------+
| TV         |
| TV 21 Inch |
| Kulkas     |
| Meja Makan |
| Taro       |
+------------+
5 rows in set (0.002 sec)

-- melihat keseluruhan tabel dengan type nya --
MariaDB [dbtoko]> SHOW FULL TABLES;
+------------------+------------+
| Tables_in_dbtoko | Table_type |
+------------------+------------+
| detail_produk_vw | VIEW       |
| jenis_produk     | BASE TABLE |
| kartu            | BASE TABLE |
| pelanggan        | BASE TABLE |
| pembayaran       | BASE TABLE |
| pembelian        | BASE TABLE |
| pesanan          | BASE TABLE |
| pesanan_item     | BASE TABLE |
| produk           | BASE TABLE |
| tampil_produk    | VIEW       |
| vendor           | BASE TABLE |
+------------------+------------+
11 rows in set (0.101 sec)

-- Transaction --
MariaDB [dbtoko]> INSERT INTO pesanan(tanggal, total, pelanggan_id) VALUES
    -> (2023-02-01, 200000, 1);
Query OK, 1 row affected, 1 warning (0.018 sec)

//jika sudah di commit, maka data tidak bisa di ROLLBACK
MariaDB [dbtoko]> COMMIT;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.001 sec)

-- ROLLBACK -- (mengembalikann nilai sebelum di commit)
MariaDB [dbtoko]> START TRANSACTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pesanan;
Query OK, 1 row affected (0.007 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
Empty set (0.001 sec)

MariaDB [dbtoko]> ROLLBACK;
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+

-- SAVE POINT --
MariaDB [dbtoko]> START TRANSACTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbtoko]> SAVEPOINT update_tanggal;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> UPDATE pesanan SET tanggal='2023-03-03' WHERE id=1;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 0000-00-00 | 300000 |            2 |
+----+------------+--------+--------------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> COMMIT;
Query OK, 0 rows affected (0.004 sec)

-- PROCEDURE
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM produk;
    -> ;
    -> $$
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.020 sec)

//contoh 1
MariaDB [dbtoko]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT nama, harga_beli, harga_jual FROM produk;
    -> END
    -> $$
Query OK, 0 rows affected (0.063 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL showProduk();
+------------+------------+------------+
| nama       | harga_beli | harga_jual |
+------------+------------+------------+
| TV         |    3000000 |    4000000 |
| TV 21 Inch |    2000000 |    3000000 |
| Kulkas     |    4000000 |    5000000 |
| Meja Makan |    1000000 |    2000000 |
| Taro       |       4000 |       5000 |
+------------+------------+------------+
5 rows in set (0.013 sec)

Query OK, 0 rows affected (0.029 sec)

//contoh 2
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE addPesanan(tanggal date, total double, pelanggan_id int)
    -> BEGIN
    -> INSERT INTO pesanan (tanggal, total, pelanggan_id) VALUES (tanggal, total, pelanggan_id);
    -> END$$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL addPesanan('2022-02-02',30000,1);
Query OK, 1 row affected (0.013 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 0000-00-00 | 300000 |            2 |
|  3 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
3 rows in set (0.001 sec)

-- 
MariaDB [dbtoko]> SHOW PROCEDURE STATUS;
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db     | Name       | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| dbtoko | addPesanan | PROCEDURE | root@localhost | 2023-05-03 10:23:49 | 2023-05-03 10:23:49 | DEFINER       |         | utf8mb4              | utf8mb4_general_ci   | utf8mb4_general_ci |
| dbtoko | showProduk | PROCEDURE | root@localhost | 2023-05-03 10:15:45 | 2023-05-03 10:15:45 | DEFINER       |         | utf8mb4              | utf8mb4_general_ci   | utf8mb4_general_ci |
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
2 rows in set (0.026 sec)

//contoh 3
MariaDB [dbtoko]> CREATE PROCEDURE addJenis_produk(nama varchar(20), ket varchar(50))
    -> BEGIN
    -> INSERT INTO jenis_produk(nama, ket) VALUES(nama,ket);
    -> END$$
Query OK, 0 rows affected (0.007 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL addJenis_produk('Alat Kebersihan', 'Tersedia');
Query OK, 1 row affected (0.004 sec)

MariaDB [dbtoko]> SELECT * FROM jenis_produk;
+----+-----------------+----------------+
| id | nama            | ket            |
+----+-----------------+----------------+
|  1 | elektronika     | tersedia       |
|  2 | makanan         | tersedia       |
|  3 | minuman         | tidak tersedia |
|  4 | furniture       | tersedia       |
|  5 | Alat Kebersihan | Tersedia       |
+----+-----------------+----------------+
5 rows in set (0.001 sec)





