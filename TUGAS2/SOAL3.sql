/* Nama : Syifa 'Azhima 
   TUGAS 2 Pertemua ketiga MYSQL */

~~ SOAL 3 ~~
//1. Tampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbtoko]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.006 sec)


//2. Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko]> SELECT * FROM produk WHERE nama NOT LIKE '%M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.001 sec)


//3. Tampilkan produk-produk televisi
MariaDB [dbtoko]> SELECT * FROM produk WHERE kode LIKE '%TV%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)


//4. Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir LIKE '%SA%';
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE email LIKE '%SA%';
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE alamat LIKE '%SA%';
Empty set (0.003 sec)
--Tidak ada data yang mengandung tulisan 'SA' / datanya kosong--


//5. Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir NOT LIKE '%Jakarta%' AND tmp_lahir LIKE '%yo%';
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
1 row in set (0.001 sec)


//6. Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
2 rows in set (0.001 sec)