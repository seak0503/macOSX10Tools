#!/bin/bash

#######################################################################
# 解説
#   rbenvでRubyのインストールをするスクリプトです
#
# 注意事項
#   rubyを使いたいユーザにスイッチしてからこのスクリプトを実行して下さい。
#
# 前提条件
#   条件1: Xcode Command line toolsがインストールされていること
#     Xcodeのインストール方法
#       1. AppStoreでXcodeをインストール
#       2. ターミナルで`xcode-select --install`を実行
#   条件2: HomeBrewがインストールされていることを前提とします
#     HomeBrewのインストール方法
#       1. `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`を実行


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

### rbenv-gem-rehash(プラグイン)インストール
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

### rbenv-binstubs(プラグイン)インストール
git clone git://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs

### rbenv-gemset(プラグイン)インストール
git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset

### インストール完了のコメント
ruby_virsion=$(ruby -v)
echo "インストールが完了しました。"
echo "この環境で使用できるRubyのバージョンは $ruby_virsion です。"
exit 0