/* Nama : Syifa 'Azhima
Tugas 3 */

--SOAL 4-- 
//1. Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko]> SELECT tmp_lahir, COUNT(tmp_lahir) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                1 |
| Jakarta    |                3 |
| Kediri     |                1 |
| Yogyakarta |                1 |
+------------+------------------+
4 rows in set (0.004 sec)

//2. Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko]> SELECT jenis_produk_id, COUNT(jenis_produk_id) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |             3 |
|               2 |             1 |
|               3 |             1 |
|               4 |             1 |
+-----------------+---------------+
4 rows in set (0.002 sec)

//3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
--Rata-rata Umur-- 
MariaDB [dbtoko]> SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan;
+------------+
| rata2_usia |
+------------+
|    22.6667 |
+------------+
1 row in set (0.002 sec)
--data pelanggan-- 
MariaDB [dbtoko]> SELECT * ,  timestampdiff(year, tgl_lahir, curdate()) AS umur FROM pelanggan
    -> WHERE timestampdiff(year, tgl_lahir, curdate()) <  (SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan);
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id | umur |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   | Jakarta    |        3 |   21 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Medan      |        2 |   21 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |   20 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+------+
3 rows in set (0.012 sec)


//4. Tampilkan data produk yang harganya diatas rata-rata harga produk
--Rata-rata harga produk--
MariaDB [dbtoko]> SELECT AVG(harga_beli) AS rata2_harga FROM produk;
+--------------------+
| rata2_harga        |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.003 sec)
--Data produk-- 
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_beli > (SELECT AVG(harga_beli) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.006 sec)


//5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.iuran > 90000;
Empty set (0.029 sec)

//6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko]> SELECT AVG(harga_beli) AS rata2_harga_produk, COUNT(*) AS jumlah_produk FROM produk WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);
+--------------------+---------------+
| rata2_harga_produk | jumlah_produk |
+--------------------+---------------+
|  335666.6666666667 |             3 |
+--------------------+---------------+
1 row in set (0.001 sec)

//7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.diskon > 0.03;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+----+-------+--------+--------+-------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id | id | kode  | nama   | diskon | iuran |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+----+-------+--------+--------+-------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |  1 | 10111 | Gold   |  20000 | 20000 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |  2 | 11012 | Silver |  15000 | 15000 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |  1 | 10111 | Gold   |  20000 | 20000 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |  2 | 11012 | Silver |  15000 | 15000 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |  1 | 10111 | Gold   |  20000 | 20000 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+----+-------+--------+--------+-------+
5 rows in set (0.004 sec)