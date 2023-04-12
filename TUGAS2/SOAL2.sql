/* Nama : Syifa 'Azhima 
   TUGAS 2 Pertemua ketiga MYSQL */

~~ SOAL 2 ~~
//1. Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko]> SELECT * from produk WHERE stok=3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)


//2. Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.004 sec)


//3.	Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)


//4. Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
6 rows in set (0.001 sec)


//5. Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
1 row in set (0.004 sec)


//6. Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko]> SELECT * from pelanggan WHERE id IN (2,4,6);
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
3 rows in set (0.007 sec)


//7. Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

