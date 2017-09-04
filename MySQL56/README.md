# MySQL5.6インストール手順

## MySQLのインストール

1. `mysql-5.6.37-macos10.12-x86_64.dmg`をクリックしてMySQLをインストール
2. `/etc/my.cnf`を作成して下記内容を保存

    ```
    [mysqld]
    # Basic Settings
    sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
    character-set-server = utf8
    skip-character-set-client-handshake
    lower_case_table_names = 1
    skip-name-resolve
    
    [client]
    default-character-set = utf8
    
    [mysqldump]
    default-character-set = utf8
    
    [mysql]
    default-character-set = utf8
    
    [mysqld_safe]
    log-error=/usr/local/log/mysqld.log
    timezone = UTC%
    ```
3. `.zshrc`に下記を追加

    ```
    # mysql
    export PATH=/usr/local/mysql/bin:$PATH
    ```

4. システム環境設定からMySQLを起動

## アドオン

### Mroongaのインストール

1. `mysql-5.6.37.tar.gz`を`tar zxvf mysql-5.6.37.tar.gz`で展開

2. 以下を実施してMySQLのソースを準備する

    ```
    $ sudo mkdir /usr/local/src

    $ sudo mv mysql-5.6.37 /usr/local/src
    ```

3. `https://packages.groonga.org/source/mroonga/mroonga-7.06.tar.gz`からMroongaをダウンロードする。

4. 以下を実施してMroongaをインストールする

* `--with-mysql-source` : tarでソースを展開したpath
* `--with-mysql-build` : MySQLがインストールされたpath
* `--with-mysql-config` : `MySQLがインストールされたpath/bin/mysql_config`

    ```
    $ tar zxvf mroonga-7.06.tar.gz

    $ cd mroonga-7.06

    $ ./configure --with-mysql-source=/usr/local/src/mysql-5.6.37 --with-mysql-build=/usr/local/mysql --with-mysql-config=/usr/local/mysql/bin/mysql_config

    $ sudo make

    $ sudo make install

    $ mysql -u root < /usr/local/share/mroonga/install.sql
    ```

5. `SHOW ENGINES SQL`を実行することでMroongaが正常にインストールされているかを確認できます。 Mroonga という行があればMroongaは正常にインストールされています

    ```
    mysql> SHOW ENGINES;
    +--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
    | Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
    +--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
    | FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
    | MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
    | MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
    | BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
    | CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
    | MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
    | Mroonga            | YES     | CJK-ready fulltext search, column store                        | NO           | NO   | NO         |
    | InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
    | PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
    | ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
    +--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
    ```