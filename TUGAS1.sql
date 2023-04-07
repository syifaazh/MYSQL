*PRAKTIK*
// masuk kedalam mariadb dengan command prompt xampp
# mysql -u root -p

// untuk melihat seluruh database
MariaDB [(none)]> show databases;

// pemanggilan databases
MariaDB [(none)]> USE dbtoko;

// membuat table kartu
MariaDB [dbtoko]> CREATE TABLE kartu(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) NOT NULL,
    -> diskon double default 0,
    -> iuran double default 0);

// melihat table yang sudah dibuat
MariaDB [dbtoko]> SHOW TABLES;

// melihat isi table yang sudah dibuat
MariaDB [dbtoko]> DESC kartu;

//membuat table pelanggan
MariaDB [dbtoko1]> CREATE TABLE pelanggan(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> jk char(1),
    -> tmp_lahit varchar(20),
    -> tgl_lahir date,
    -> email varchar(30),
    -> kartu_id int NOT NULL references kartu(id)
    -> );

//membuat table pesanan
MariaDB [dbtoko1]> CREATE TABLE pesanan(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int NOT NULL REFERENCES pelanggan(id)
    -> );

//membuat table pembayaran
MariaDB [dbtoko1]> CREATE TABLE pembayaran(
    -> id int NOT NULL auto_increment primary key,
    -> no_kuitansi varchar(10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int,
    -> pesanan_id int NOT NULL REFERENCES pesanan(id)
    -> );

//membuat table jenis produk
MariaDB [dbtoko1]> CREATE TABLE jenis_produk(
    -> id int NOT NULL auto_increment primary key,
    -> nama varchar(20)
    -> );

//menambahkan kolom keterangan dibawah nama pada tabel jenis_produk
MariaDB [dbtoko]> ALTER TABLE jenis_produk
    -> ADD COLUMN keterangan varchar (30) AFTER nama;

//mengubah nama kolom keterangan menjadi ket
MariaDB [dbtoko]> ALTER TABLE jenis_produk
    -> CHANGE keterangan ket varchar (30);

//mengubah tipe data pada ket dari varchar(30) menjadi varchar(50)
MariaDB [dbtoko]> ALTER TABLE jenis_produk
    -> MODIFY ket varchar(50) AFTER nama;


*TUGAS 1*
// Membuat Table produk
MariaDB [dbtoko]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id)
    -> );

// Membuat table pesanan_item
MariaDB [dbtoko]> CREATE TABLE pesanan_item(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int,
    -> harga double
    -> );

// Membuat table vendor
MariaDB [dbtoko]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30)
    -> );

// Membuat table pembelian
MariaDB [dbtoko]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> nomor varchar(10),
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int NOT NULL REFERENCES vendor(id)
    -> );

// Menampilkan keseluruhan table
MariaDB [dbtoko]> SHOW TABLES;
+------------------+
| Tables_in_dbtoko |
+------------------+
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_item     |
| produk           |
| vendor           |
+------------------+

// Menambahkan kolom alamat pada pelanggan dengan tipe data varchar(40)
MariaDB [dbtoko]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(40) AFTER email;

// Mengubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);

// Mengedit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko]>  ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50) AFTER kode;

// Menampilkan table pelanggan
MariaDB [dbtoko]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+



