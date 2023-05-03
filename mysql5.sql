//inner join(memadukan 2 table)
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.* FROM produk INNER JOIN jenis_produk ON produk.jenis_produk_id=jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+----+-------------+----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | id | nama        | ket            |
+----+------+------------+------------+------------+------+----------+-----------------+----+-------------+----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |  1 | elektronika | tersedia       |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |  1 | elektronika | tersedia       |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |  1 | elektronika | tersedia       |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |  4 | furniture   | tersedia       |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |  2 | makanan     | tersedia       |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |  3 | minuman     | tidak tersedia |
+----+------+------------+------------+------------+------+----------+-----------------+----+-------------+----------------+
6 rows in set (0.168 sec)

//inner join (menggabungkan 1 kolom nama saja)
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.nama as jenis FROM produk INNER JOIN jenis_produk ON produk.jenis_produk_id=jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman     |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
6 rows in set (0.003 sec)

//left join (mengutamakan table sebelah kiri)
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.nama as jenis FROM produk LEFT JOIN jenis_produk ON produk.jenis_produk_id=jenis_produk.id;
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 | minuman     |
+----+------+------------+------------+------------+------+----------+-----------------+-------------+
6 rows in set (0.004 sec)

//right join(mengutamakan table sisi kanan)
MariaDB [dbtoko]> SELECT produk.*, jenis_produk.nama as jenis FROM produk RIGHT JOIN jenis_produk ON produk.jenis_produk_id=jenis_produk.id;
+------+------+------------+------------+------------+------+----------+-----------------+-------------+
| id   | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis       |
+------+------+------------+------------+------------+------+----------+-----------------+-------------+
|    1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 | elektronika |
|    2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 | elektronika |
|    3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 | elektronika |
|    4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 | furniture   |
|    5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 | makanan     |
| NULL | NULL | NULL       |       NULL |       NULL | NULL |     NULL |            NULL | minuman     |
+------+------+------------+------------+------------+------+----------+-----------------+-------------+
6 rows in set (0.001 sec)

//menampilkan total stok dengan blablabla
MariaDB [dbtoko]> SELECT jenis_produk.nama AS kategori, SUM(produk.stok) AS total_stok FROM jenis_produk
    -> LEFT JOIN produk ON jenis_produk.id = produk.jenis_produk_id;
+-------------+------------+
| kategori    | total_stok |
+-------------+------------+
| elektronika |         30 |
+-------------+------------+
1 row in set (0.006 sec)




