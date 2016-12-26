#!/bin/bash

#######################################################################
# 解説
#   Homebrewをインストールをするスクリプトです
#

### Command Line Tools for Xcodeのインストール
echo "Command Line Tools for Xcodeをインストールします"
echo "ポップアップが表示されたら インストール をクリックしてください"
sleep 5
xcode-select --install

### Homebrewをインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### brew doctorを実行
echo "brew doctorを実行します。"
echo "異常が見つかった場合は対処してください。"
sleep 5
brew doctor

### インストール完了のコメント
echo "インストールが完了しました。"
exit 0