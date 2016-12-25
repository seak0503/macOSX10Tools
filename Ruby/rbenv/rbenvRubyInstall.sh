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
brew install rbenv-gemset
brew install rbenv-gem-rehash

### 環境変数の設定
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.profile

### インストール完了のコメント
echo "インストールが完了しました。"
exit 0