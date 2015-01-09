#!/bin/bash

#######################################################################
# 解説
#   Ruby on Railsのインストールをするスクリプトです
#
# 前提条件
#   条件1: rbenvがインストールされていること
#   条件2: rbenvの拡張機能であるrbenv-gem-rehashがインストールされていること
#   条件3: rbenvの拡張機能であるrbenv-binstubsがインストールされていること
#   条件4: rbenvの拡張機能であるrbenv-gemsetがインストールされていること

### 作業環境のディレクトリをユーザに確認する
echo -n "作業環境ディレクトリを作成するフルパスを指定して下さい:"
read dir_answer
cd $dir_answer

### rbenvで利用可能なRubyの一覧を確認
ruby_Versions=$(rbenv install --list)

### 利用したいRubyのバージョンをユーザに確認する
echo "rbenvで利用可能なRubyの一覧を表示します。"
sleep 3
echo " "
for i in  $ruby_Versions; do
  echo $i
done
echo " "
echo -n "利用するRubyのバージョンを指定して下さい。:"
read ruby_answer
grep -q $ruby_answer <(echo $ruby_Versions)
if [ $? -ne 0 ]; then
  echo "利用できないバージョンが指定されました。"
  exit 1
fi


### 指定したRubyのバージョンがインストールされているか確認し
### なければインストールする
grep -q $ruby_answer <(rbenv versions)
if [ $? -ne 0 ]; then
  echo "指定したバージョンのRubyをインストールします。"
  rbenv install $ruby_answer
fi

### 環境全体のRubyバージョンを指定する
rbenv global $ruby_answer

### bundlerをインストール
gem install bundler

### 利用したいRailsのバージョンをユーザに確認する
echo " "
echo -n "インストールしたいRailsのバージョンを指定して下さい(X.X.X):"
read rails_answer
rails_dir_name=$(echo $rails_answer | tr . -)

### 指定したバージョンのRails用の作業環境を作成
mkdir -p rails_workspace/rails${rails_dir_name}
cd rails_workspace/rails${rails_dir_name}

### 作業環境のRubyバージョンを固定する
rbenv local $ruby_answer

### gemsetを作成して指定したRailsのバージョンを入れる
rbenv gemset create $ruby_answer rails${rails_dir_name}
echo >.rbenv-gemsets rails${rails_dir_name}
gem install rails --version $rails_answer

### Railsのプロジェクト名をユーザに確認する
echo " "
echo -n "Railsのプロジェクト名を指定して下さい:"
read rails_project_name_answer

### Railsプロジェクトの生成
rails new $rails_project_name_answer --skip-bundle

### # gemをディレクトリローカルにインストール、binstub用ディレクトリを指定
cd $rails_project_name_answer
bundle install --path=vendor/bundle --binstubs=vendor/bin

### インストール完了のコメント
rails_project_dir=$(pwd)
echo "Railsのインストールが完了しました。"
echo "Railsプロジェクトのディレクトリのパスは${rails_project_dir}です。"
exit 0