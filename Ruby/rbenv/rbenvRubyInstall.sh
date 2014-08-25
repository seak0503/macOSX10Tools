#!/bin/bash

# rbenvでRubyのインストールをするスクリプトです
# rubyを使いたいユーザにスイッチしてからこのスクリプトを実行して下さい。
# HomeBrewがインストールされていることを前提とします。


### rbenvをruby-buildのインストール
brew update
brew install rbenv ruby-build

### 環境変数の設定
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.profile

### インストール可能なRubyの一覧を確認
ruby_Versions=$(rbenv install --list)

### インストールするRubyユーザに確認する
echo "インストール可能なRubyの一覧を表示します。"
sleep 3
echo " "
for i in  $ruby_Versions; do
  echo $i
done
echo " "
echo -n "インストールするRubyのバージョンを指定して下さい。:"
read answer
grep -q $answer <(echo $ruby_Versions)
if [ $? -ne 0 ]; then
  echo "インストールできないバージョンが指定されました。"
  exit 1
fi

### Rubyのインストール
rbenv install $answer

### 再読み込み
rbenv rehash

### インストールされたRubyのバージョン確認
installed_ruby_virsion=$(rbenv versions)
echo "インストールされたRubyのバージョンは $installed_ruby_virsion です。"

### 環境全体のRubyバージョンを指定する
rbenv global $(echo $installed_ruby_virsion | awk '{print $1}')

### インストール完了のコメント
ruby_virsion=$(ruby -v)
echo "インストールが完了しました。"
echo "この環境で使用できるRubyのバージョンは $ruby_virsion です。"
exit 0
