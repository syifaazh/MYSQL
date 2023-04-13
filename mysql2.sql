//mengisi data pada table kartu 

-- Cara 1 -- 
MariaDB [dbtoko]> INSERT INTO kartu VALUES
    -> ('','10111','Gold',20000,20000),
    -> ('','11012','Silver',15000,15000);
Query OK, 2 rows affected, 2 warnings (0.092 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 | 20000 |
|  2 | 11012 | Silver |  15000 | 15000 |
+----+-------+--------+--------+-------+
2 rows in set (0.005 sec)


--Cara 2 -- 
MariaDB [dbtoko]> INSERT INTO kartu (kode, nama, diskon, iuran ) VALUES
    -> ('10113', 'Perak', 10000, 1000);
Query OK, 1 row affected (0.005 sec)


// melihat isi table perkolom nya
MariaDB [dbtoko]> SELECT nama FROM kartu;
+--------+
| nama   |
+--------+
| Gold   |
| Silver |
| Perak  |
+--------+
3 rows in set (0.001 sec)

// Mengubah isi data menggunakan UPDATE dari 'perak' menjadi 'platinum'
MariaDB [dbtoko]> UPDATE kartu SET nama='platinum' WHERE id = 3;
Query OK, 1 row affected (0.015 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+----------+--------+-------+
| id | kode  | nama     | diskon | iuran |
+----+-------+----------+--------+-------+
|  1 | 10111 | Gold     |  20000 | 20000 |
|  2 | 11012 | Silver   |  15000 | 15000 |
|  3 | 10113 | platinum |  10000 |  1000 |
+----+-------+----------+--------+-------+
3 rows in set (0.001 sec)

//Menghapus row ke-3 dan Menambahkan data kembali
MariaDB [dbtoko]> DELETE FROM kartu WHERE id = 3;
Query OK, 1 row affected (0.006 sec)

MariaDB [dbtoko]> INSERT INTO kartu (kode, nama, diskon, iuran ) VALUES
    -> ('10113', 'Perak', 10000, 1000);
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko]> SELECT * FROM kartu;
+----+-------+--------+--------+-------+
| id | kode  | nama   | diskon | iuran |
+----+-------+--------+--------+-------+
|  1 | 10111 | Gold   |  20000 | 20000 |
|  2 | 11012 | Silver |  15000 | 15000 |
|  4 | 10113 | Perak  |  10000 |  1000 |
+----+-------+--------+--------+-------+
3 rows in set (0.000 sec)