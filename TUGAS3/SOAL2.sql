/* Nama : Syifa 'Azhima
Tugas 3 */

--SOAL 2-- 
//1. Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko]> SELECT COUNT(*) as tahun_1998 FROM pelanggan WHERE tgl_lahir LIKE '%1998%';
+------------+
| tahun_1998 |
+------------+
|          1 |
+------------+
1 row in set (0.001 sec)

//2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko]> SELECT COUNT(*) as perempuan_jakarta FROM pelanggan WHERE jk LIKE '%P%' AND tmp_lahir LIKE '%Jakarta%';
+-------------------+
| perempuan_jakarta |
+-------------------+
|                 1 |
+-------------------+
1 row in set (0.021 sec)

//3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko]> SELECT SUM(stok) as stok_dibawah10000 FROM produk WHERE harga_jual < 10000;
+-------------------+
| stok_dibawah10000 |
+-------------------+
|                 5 |
+-------------------+
1 row in set (0.004 sec)

//4. Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko]> SELECT COUNT(*) as kode_awal_K FROM produk WHERE kode LIKE 'K%';
+-------------+
| kode_awal_K |
+-------------+
|           1 |
+-------------+
1 row in set (0.000 sec)

//5. Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko]> SELECT AVG(harga_jual) AS harga_rata2 FROM produk WHERE harga_jual > 1000000;
+-------------+
| harga_rata2 |
+-------------+
|     3500000 |
+-------------+
1 row in set (0.001 sec)

//6. Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko]> SELECT MAX(stok) AS jumlah_stok_terbesar FROM produk;
+----------------------+
| jumlah_stok_terbesar |
+----------------------+
|                   10 |
+----------------------+
1 row in set (0.004 sec)


//7. Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok < min_stok;
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.001 sec)

//8. Berapa total asset dari keseluruhan produk
MariaDB [dbtoko]>  SELECT SUM(harga_beli * stok) AS "total asset" FROM produk;
+-------------+
| total asset |
+-------------+
|    73018000 |
+-------------+
1 row in set (0.002 sec)
