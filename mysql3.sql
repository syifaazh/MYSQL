// menambahkan data pada table pelanggan
MariaDB [dbtoko]> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id) VALUES
    -> ('011101', 'Agung', 'L', 'Bandung', '1997-09-06', 'agung@gmail.com', 'Bandung', 1);
Query OK, 1 row affected (0.110 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email           | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
|  1 | 011101 | Agung          | L    | Bandung   | 1997-09-06 | agung@gmail.com | Bandung |        1 |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
1 row in set (0.002 sec)

MariaDB [dbtoko]> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id) VALUES
    -> ('011102', 'Pandan Wangi', 'P', 'Yogyakarta', '1998-08-07', 'pandanwangi@gmail.com', 'Yogyakarta', 2),
    -> ('011103', 'Sekar', 'P', 'Kediri', '2001-09-08', 'sekar@gmail.com', 'Jakarta', 3);
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+

MariaDB [dbtoko]> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id) VALUES
    -> ('011104', 'Suandi', 'L', 'Kediri', '1997-09-08', 'suandi@gmail.com', 'Bandung', 1),
    -> ('011105', 'Pradana', 'L', 'Jakarta', '2001-08-01', 'pradana@gmail.com', 'Medan', 2),
    -> ('011106', 'Gayatri', 'P', 'Jakarta', '2002-09-01', 'gayatri@gmail.com', 'Yogyakarta', 1);
Query OK, 3 rows affected (0.005 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
6 rows in set (0.001 sec)

//menambahkan data pada table jenis_produk
MariaDB [dbtoko]> INSERT INTO jenis_produk (nama, ket) VALUES
    -> ('elektronika', 'tersedia'),
    -> ('makanan', 'tersedia'),
    -> ('minuman', 'tidak tersedia'),
    -> ('furniture', 'tersedia');
Query OK, 4 rows affected (0.005 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM jenis_produk;
+----+-------------+----------------+
| id | nama        | ket            |
+----+-------------+----------------+
|  1 | elektronika | tersedia       |
|  2 | makanan     | tersedia       |
|  3 | minuman     | tidak tersedia |
|  4 | furniture   | tersedia       |
+----+-------------+----------------+
4 rows in set (0.001 sec)

//melakukan edit data
--CARA 1 (dari nama gayatri menjadi gayatri putri)-- 
MariaDB [dbtoko]> UPDATE pelanggan SET nama_pelanggan='Gayatri Putri' WHERE id=6;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |
|  4 | 011104 | Suandi         | L    | Kediri     | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
6 rows in set (0.001 sec)

--CARA 2 (dari tmp_lahir Kediri menjadi jakarta pada data suandi)--
MariaDB [dbtoko]> UPDATE pelanggan SET tmp_lahir='Jakarta' WHERE nama_pelanggan='Suandi';
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+
6 rows in set (0.001 sec)

//mengisi data pada table produk 
MariaDB [dbtoko]> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
    -> ('1111', 'TV', 3000000, 4000000, 3, 2, 1),
    -> ('1112', 'TV 21 Inch', 2000000, 3000000, 10, 3, 1),
    -> ('1113', 'Kulkas', 4000000, 5000000, 10, 3, 1),
    -> ('1114', 'Meja Makan', 1000000, 2000000, 4, 3, 4),
    -> ('1115', 'Taro', 4000, 5000, 3, 2, 2);
Query OK, 5 rows affected (0.006 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | 1112 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | 1113 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | 1115 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.004 sec)

MariaDB [dbtoko]> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES
    -> ('1116', 'Teh Kotak', 3000, 4000, 2, 10, 3);
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | 1112 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | 1113 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | 1115 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | 1116 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

// melakukan edit pada kolom nama pada table produk 
MariaDB [dbtoko]> UPDATE produk SET kode = 'TV01' WHERE id=1;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'TV02' WHERE id=2;
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'K001' WHERE id=3;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'M001' WHERE id=4;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'T001' WHERE id=5;
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE produk SET kode = 'TK01' WHERE id=6;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.003 sec)

//menampilkan kolom yang dibutuhkan saja, semisal
MariaDB [dbtoko]> SELECT kode, nama_pelanggan, tmp_lahir FROM pelanggan;
+--------+----------------+------------+
| kode   | nama_pelanggan | tmp_lahir  |
+--------+----------------+------------+
| 011101 | Agung          | Bandung    |
| 011102 | Pandan Wangi   | Yogyakarta |
| 011103 | Sekar          | Kediri     |
| 011104 | Suandi         | Jakarta    |
| 011105 | Pradana        | Jakarta    |
| 011106 | Gayatri Putri  | Jakarta    |
+--------+----------------+------------+
6 rows in set (0.016 sec)

//menampilkan row 1 row pada table stok 
MariaDB [dbtoko]> SELECT * FROM produk where stok=4;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.007 sec)

//menampilkan  data yang sama ( tmp_lahir = Jakarta)
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  | Bandung    |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
3 rows in set (0.002 sec)

//mengurutkan tgl_lahir pada table pelanggan 
MariaDB [dbtoko]> SELECT kode,nama_pelanggan,tmp_lahir,tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;
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
6 rows in set (0.005 sec)

//menampilkan stok yang dibutuhkan (antara)
MariaDB [dbtoko]> SELECT * FROM produk WHERE stok=3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.004 sec)

//menampilkan data lebih / kurang dari 
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual >500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.000 sec)

//menampilkan data sesuai huruf yang dibutuhkan
MariaDB [dbtoko]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.008 sec)


//menampilkan 2 data terbawah
MariaDB [dbtoko]> SELECT * FROM pelanggan LIMIT 2 OFFSET 4;
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Medan      |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+------------+----------+
2 rows in set (0.003 sec)

//menampilakan data harga beli dari yang termahal
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 3;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.002 sec)


