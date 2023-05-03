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

