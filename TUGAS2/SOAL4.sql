/* Nama : Syifa 'Azhima 
   TUGAS 2 Pertemua ketiga MYSQL */

~~ SOAL 4 ~~
//1. Tampilkan 2 data produk termahal
MariaDB [dbtoko]> SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)


//2. Tampilkan produk yang paling murah
MariaDB [dbtoko]> SELECT *FROM produk ORDER BY harga_beli LIMIT 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)


//3. Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko]> SELECT *FROM produk ORDER BY stok DESC LIMIT 1;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)


//4. Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko]> SELECT *FROM produk ORDER BY stok LIMIT 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)


//5. Tampilkan pelanggan yang paling muda
MariaDB [dbtoko]> SELECT *FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
1 row in set (0.001 sec)


//6. Tampilkan pelanggan yang paling tua
MariaDB [dbtoko]> SELECT *FROM pelanggan ORDER BY tgl_lahir LIMIT 1;
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email           | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
|  1 | 011101 | Agung          | L    | Bandung   | 1997-09-06 | agung@gmail.com | Bandung |        1 |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
1 row in set (0.002 sec)
