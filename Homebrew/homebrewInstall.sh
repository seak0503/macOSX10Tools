#!/bin/bash

#######################################################################
# 解説
#   Homebrewをインストールをするスクリプトです
#
# 前提条件
#   条件1: Xcode Command line toolsがインストールされていること
#     Xcodeのインストール方法
#       1. AppStoreでXcodeをインストール
#       2. ターミナルで`xcode-select --install`を実行


### Homebrewをインストール
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

### インストール完了のコメント
echo "インストールが完了しました。"
exit 0