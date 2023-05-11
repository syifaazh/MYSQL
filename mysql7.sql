-- TRIGGER
MariaDB [dbtoko]> CREATE TRIGGER keranjang_pesanan_items BEFORE INSERT ON pesanan_item
    -> FOR EACH ROW
    -> BEGIN
    -> SET @stok = (SELECT stok FROM produk WHERE id = NEW.produk_id);
    -> SET @sisa = @stok - NEW.qty;
    -> IF @sisa < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
    -> END IF;
    -> UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
    -> END
    -> $$
Query OK, 0 rows affected (0.023 sec)

MariaDB [dbtoko]> INSERT INTO pesanan_item (produk_id, pesanan_id, qty, harga) VALUES
    -> (3,2,3,5000000);
Query OK, 1 row affected (0.035 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan_item;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         3 |          2 |    3 | 5000000 |
+----+-----------+------------+------+---------+
1 row in set (0.000 sec)

-- 
MariaDB [dbtoko]> CREATE TRIGGER transaksi_update_before BEFORE UPDATE ON pesanan_item
    -> FOR EACH ROW
    -> BEGIN
    -> IF OLD.id = NEW.produk_id THEN
    -> SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
    -> SET @sisa = (@stok + OLD.qty) - NEW.qty;
    -> IF @sisa < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
    -> END IF;
    -> UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
    -> ELSE
    -> SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
    -> SET @sisa_lama = (@stok_lama + OLD.qty);
    -> UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
    -> SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
    -> SET @sisa_baru = @stok_baru - NEW.qty;
    -> IF @sisa_baru < 0 THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak tersedia';
    -> END IF;
    -> UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.029 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
    -> $$
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |    7 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  7 | R001 | Rak piring |     600000 |     500000 |    8 |        5 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.005 sec)