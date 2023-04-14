/* Nama : Syifa 'Azhima
Tugas 3 */

--SOAL 1-- 
//1. Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.108 sec)

//2. Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko]> SELECT SUM(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|       9 |
+---------+
1 row in set (0.009 sec)

//3. Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko]> SELECT sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.002 sec)

//4. Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   | Jakarta    |        3 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
3 rows in set (0.020 sec)

//5. Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
1 row in set (0.002 sec)

//6. Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
2 rows in set (0.003 sec)

//7. Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.002 sec)