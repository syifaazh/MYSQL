/* Nama : Syifa 'Azhima 
   TUGAS 2 Pertemua ketiga MYSQL */

~~ SOAL 1 ~~
//1. Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_jual DESC;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.004 sec)


//2. Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko]> Select kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)


//3. Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko]> SELECT kode,nama, stok from produk WHERE stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.003 sec)


//4. Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko]> SELECT * from pelanggan WHERE tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  | Bandung    |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
3 rows in set (0.003 sec)


//5. Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

