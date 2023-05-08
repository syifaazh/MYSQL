-- Nama : Syifa 'Azhima
-- Tugas 8


-- Menambahkan kolom pembayaran
MariaDB [dbtoko]> ALTER TABLE pembayaran
    -> ADD COLUMN status_pembayaran varchar(15) DEFAULT 'belum lunas';
Query OK, 0 rows affected (0.093 sec)
Records: 0  Duplicates: 0  Warnings: 0

--TRIGGER
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER set_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE total_pembayaran double;
    -> DECLARE total_pesanan double
    -> ;
    -> SELECT SUM(jumlah) INTO total_pembayaran FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;
    -> IF total_pembayaran >= total_pesanan THEN
    -> UPDATE status_pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END
    -> $$
Query OK, 0 rows affected (0.028 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER set_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE total_pembayaran double;
    -> DECLARE total_pesanan double
    -> ;
    -> SELECT SUM(jumlah) INTO total_pembayaran FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;
    ->  IF total_pembayaran >= total_pesanan THEN
    -> UPDATE status_pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END
    ->  $$
Query OK, 0 rows affected (0.028 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> INSERT INTO pembayaran (no_kuitansi, tanggal, jumlah, ke, pesanan_id) VALUES
    ->  ('R001', '2023-05-12', 600000, 1, 1);
Query OK, 1 row affected (0.183 sec)

MariaDB [dbtoko]> select *from pembayaran;
+----+-------------+------------+--------+------+------------+-------------------+
| id | no_kuitansi | tanggal    | jumlah | ke   | pesanan_id | status_pembayaran |
+----+-------------+------------+--------+------+------------+-------------------+
|  1 | R001        | 2023-05-12 | 600000 |    1 |          1 | belum lunas       |
+----+-------------+------------+--------+------+------------+-------------------+
1 row in set (0.001 sec)

