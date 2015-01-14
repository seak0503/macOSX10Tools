#!/bin/bash

#######################################################################
# 解説
#   gitの設定をするためのスクリプトです
#
# 前提条件
#   条件1: gitがインストールされていること

### ユーザへの各種質問
echo -n "アカウント名は何ですか?:"
read answer_account

echo -n "メールアドレスを入力して下さい:"
read answer_email

### アカウント設定
git config --global user.name "${answer_account}"
git config --global user.email "${answer_email}"

### カラー表示設定
git config --global color.ui auto

### gitコマンドのエイリアス設定
git config --global alias.co checkout
echo " "
echo "git checkoutコマンドのエイリアス設定をgit coにしました"
sleep 1

### コミットメッセージ入力エディタの指定
git config --global core.editor "subl -w"
echo " "
echo "コミットメッセージ入力エディタをSublimeTextに設定しました"
sleep 1

### 設定結果を表示
echo " "
echo "gitの設定が完了しました。設定内容は下記のとおりです"
echo " "
git config -l
exit 0