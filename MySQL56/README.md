# MySQL5.6インストール手順

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