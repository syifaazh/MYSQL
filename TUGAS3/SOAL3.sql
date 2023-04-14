/* Nama : Syifa 'Azhima
Tugas 3 */

--SOAL 3--
// 1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok <= min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS Informasi
    -> FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | Informasi      |
+----+------------+------+----------------+
|  1 | TV         |    3 | Stok Aman      |
|  2 | TV 21 Inch |   10 | Stok Aman      |
|  3 | Kulkas     |   10 | Stok Aman      |
|  4 | Meja Makan |    4 | Stok Aman      |
|  5 | Taro       |    3 | Stok Aman      |
|  6 | Teh Kotak  |    2 | Segera Belanja |
+----+------------+------+----------------+
6 rows in set (0.002 sec)

//2.Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko]> SELECT id, nama_pelanggan, timestampdiff(year, tgl_lahir, curdate()) AS umur,
    -> CASE
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) < 17 THEN 'Muda'
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) > 17 AND timestampdiff(year, tgl_lahir, curdate()) <= 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS 'Kategori Umur'
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | Kategori Umur |
+----+----------------+------+---------------+
|  1 | Agung          |   25 | Dewasa        |
|  2 | Pandan Wangi   |   24 | Dewasa        |
|  3 | Sekar          |   21 | Dewasa        |
|  4 | Suandi         |   25 | Dewasa        |
|  5 | Pradana        |   21 | Dewasa        |
|  6 | Gayatri Putri  |   20 | Dewasa        |
+----+----------------+------+---------------+
6 rows in set (0.009 sec)

//3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode = 'TV01' THEN 'DVD Player'
    -> WHEN kode='K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+
6 rows in set (0.002 sec)