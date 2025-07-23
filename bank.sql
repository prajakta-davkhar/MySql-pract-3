mysql> use bank1;
ERROR 1049 (42000): Unknown database 'bank1'
mysql> create database bankdb;
Query OK, 1 row affected (0.01 sec)

mysql> use bankdb;
Database changed
mysql> create table customer(
    -> customerid INT NOT NULL PRIMARY KEY,
    -> Name VARCHAR(50) NOT NULL,
    -> Address VARCHAR(50) NOT NULL,
    -> contactno VARCHAR(15) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table account(
    -> Account_no INT NULL UNIQUE,
    -> Account_type VARCHAR(50) NOT NULL,
    -> Balance DECIMAL(10,2) NOT NULL,
    -> customerid INT NOT NULL,
    -> PRIMARY KEY (Account_no),
    -> FOREIGN KEY (customerid) REFERENCES customer(customerid)
    -> );

mysql> CREATE TABLE account (
    ->     Account_no INT NOT NULL UNIQUE,
    ->     Account_type VARCHAR(50) NOT NULL,
    ->     Balance DECIMAL(10,2) NOT NULL,
    ->     customerid INT NOT NULL,
    ->     PRIMARY KEY (Account_no),
    ->     FOREIGN KEY (customerid) REFERENCES customer(customerid)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table transaction(
    -> Transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    -> Account_no INT NOT NULL,
    -> Txn_Date DATE NOT NULL,
    -> Txn_Time TIME NOT NULL,
    -> Amount DECIMAL(10,2) NOT NULL,
    -> FOREIGN KEY (Account_no) REFERENCES account(Account_no)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE employee (
    ->     ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Name VARCHAR(50) NOT NULL,
    ->     Branch VARCHAR(50) NOT NULL,
    ->     Role VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+------------------+
| Tables_in_bankdb |
+------------------+
| account          |
| customer         |
| employee         |
| transaction      |
+------------------+
4 rows in set (0.02 sec)

mysql> desc students;
ERROR 1146 (42S02): Table 'bankdb.students' doesn't exist
mysql> desc account;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| Account_no   | int           | NO   | PRI | NULL    |       |
| Account_type | varchar(50)   | NO   |     | NULL    |       |
| Balance      | decimal(10,2) | NO   |     | NULL    |       |
| customerid   | int           | NO   | MUL | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerid | int         | NO   | PRI | NULL    |       |
| Name       | varchar(50) | NO   |     | NULL    |       |
| Address    | varchar(50) | NO   |     | NULL    |       |
| contactno  | varchar(15) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc employee;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| ID     | int         | NO   | PRI | NULL    | auto_increment |
| Name   | varchar(50) | NO   |     | NULL    |                |
| Branch | varchar(50) | NO   |     | NULL    |                |
| Role   | varchar(50) | NO   |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc transaction;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| Transaction_id | int           | NO   | PRI | NULL    | auto_increment |
| Account_no     | int           | NO   | MUL | NULL    |                |
| Txn_Date       | date          | NO   |     | NULL    |                |
| Txn_Time       | time          | NO   |     | NULL    |                |
| Amount         | decimal(10,2) | NO   |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> create user 'amit'@localhost identified by 'amit123';
ERROR 1396 (HY000): Operation CREATE USER failed for 'amit'@'localhost'
mysql> create user 'amit20'@localhost identified by 'amit20';
Query OK, 0 rows affected (0.02 sec)

mysql> grant select on bankdb.customer to 'amit20'@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> grant select on bankdb.account to 'amit20'@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> create user 'manager20'@loaclhost identified by 'manager20';
Query OK, 0 rows affected (0.01 sec)


mysql> create user 'manager10'@localhost identified by 'manager12';
Query OK, 0 rows affected (0.01 sec)

mysql> grant all privileges on bankdb.* to 'manager10'@localhost;
Query OK, 0 rows affected (0.01 sec)

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -h localhost -u manager10 -p
Enter password: *********

mysql> use bankdb;
Database changed
mysql> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerid | int         | NO   | PRI | NULL    |       |
| Name       | varchar(50) | NO   |     | NULL    |       |
| Address    | varchar(50) | NO   |     | NULL    |       |
| contactno  | varchar(15) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc account;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| Account_no   | int           | NO   | PRI | NULL    |       |
| Account_type | varchar(50)   | NO   |     | NULL    |       |
| Balance      | decimal(10,2) | NO   |     | NULL    |       |
| customerid   | int           | NO   | MUL | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc transaction;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| Transaction_id | int           | NO   | PRI | NULL    | auto_increment |
| Account_no     | int           | NO   | MUL | NULL    |                |
| Txn_Date       | date          | NO   |     | NULL    |                |
| Txn_Time       | time          | NO   |     | NULL    |                |
| Amount         | decimal(10,2) | NO   |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc employee;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| ID     | int         | NO   | PRI | NULL    | auto_increment |
| Name   | varchar(50) | NO   |     | NULL    |                |
| Branch | varchar(50) | NO   |     | NULL    |                |
| Role   | varchar(50) | NO   |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql>
