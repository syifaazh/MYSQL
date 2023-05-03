--menghitung statistic pada table produk--

//count
MariaDB [dbtoko]> SELECT COUNT(*) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|          6 |
+------------+
1 row in set (0.010 sec)

MariaDB [dbtoko]> SELECT COUNT(*) AS harga_beli FROM produk WHERE harga_beli > 4000;
+------------+
| harga_beli |
+------------+
|          4 |
+------------+
1 row in set (0.008 sec)

//max
MariaDB [dbtoko]> SELECT MAX(harga_beli) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|    4000000 |
+------------+
1 row in set (0.013 sec)

//min
MariaDB [dbtoko]> SELECT MIN(harga_beli) AS harga_beli FROM produk;
+------------+
| harga_beli |
+------------+
|       3000 |
+------------+
1 row in set (0.002 sec)

//avg
MariaDB [dbtoko]> SELECT AVG(harga_beli) AS harga_rata2 FROM produk;
+--------------------+
| harga_rata2        |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.001 sec)

//sum
MariaDB [dbtoko]> SELECT SUM(harga_beli) AS jumlah_harga_beli FROM produk;
+-------------------+
| jumlah_harga_beli |
+-------------------+
|          10007000 |
+-------------------+
1 row in set (0.001 sec)


--SELECT LANJUTAN--
//SUB QUERY (menampilkan 2 kondisi yaitu menampilkan keseluruhan kolom namun hanya pada jumlah stok terbanyak)
MariaDB [dbtoko]> SELECT * FROM produk WHERE stok = (SELECT MAX(stok) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.016 sec)

//KLAUSA DISTINCT (menghilangkan duplikat data hanya pada tampilan)
MariaDB [dbtoko]> SELECT DISTINCT stok FROM produk;
+------+
| stok |
+------+
|    3 |
|   10 |
|    4 |
|    2 |
+------+
4 rows in set (0.005 sec)

//KLAUSA CASE (menambahkan keterangan pada jumlah stok)
MariaDB [dbtoko]> SELECT kode, nama, stok,
    -> CASE
    -> WHEN stok >= 3 THEN 'cukup'
    -> ELSE 'kurang'
    -> END AS keterangan
    -> FROM produk;
+------+------------+------+------------+
| kode | nama       | stok | keterangan |
+------+------------+------+------------+
| TV01 | TV         |    3 | cukup      |
| TV02 | TV 21 Inch |   10 | cukup      |
| K001 | Kulkas     |   10 | cukup      |
| M001 | Meja Makan |    4 | cukup      |
| T001 | Taro       |    3 | cukup      |
| TK01 | Teh Kotak  |    2 | kurang     |
+------+------------+------+------------+
6 rows in set (0.003 sec)

//KLAUSA CASE (menjumlahkan total stok sesuai kategorinya)
MariaDB [dbtoko]> SELECT
    -> CASE
    -> WHEN jenis_produk_id = 1 THEN 'elektronik'
    -> WHEN jenis_produk_id = 2 THEN 'makanan'
    -> WHEN jenis_produk_id = 3 THEN 'minuman'
    -> WHEN jenis_produk_id = 4 THEN 'furniture'
    -> END AS kategori, SUM(stok) AS jumlah FROM produk GROUP BY jenis_produk_id;
+------------+--------+
| kategori   | jumlah |
+------------+--------+
| elektronik |     23 |
| makanan    |      3 |
| minuman    |      2 |
| furniture  |      4 |
+------------+--------+
4 rows in set (0.008 sec)

//KLAUSA GROUP BY
MariaDB [dbtoko]> SELECT jenis_produk_id, SUM(stok) AS total_stok FROM produk GROUP BY jenis_produk_id;
+-----------------+------------+
| jenis_produk_id | total_stok |
+-----------------+------------+
|               1 |         23 |
|               2 |          3 |
|               3 |          2 |
|               4 |          4 |
+-----------------+------------+
4 rows in set (0.001 sec)

//KLAUSA HAVING
MariaDB [dbtoko]> SELECT stok, SUM(stok) AS jml_stok FROM produk
    -> GROUP BY stok HAVING SUM(stok) > 2;
+------+----------+
| stok | jml_stok |
+------+----------+
|    3 |        6 |
|    4 |        4 |
|   10 |       20 |
+------+----------+
3 rows in set (0.004 sec)

