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