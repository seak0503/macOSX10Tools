#!/bin/sh

### RictyフォントをMAC osXにインストールするスクリプトです。
### brewがインストールされていることが前提です。

### エラー関数定義
error() {
  echo ${1}
  exit 1
}

### Rictyフォントを生成する関数
ricty_gen() {
  sh ricty_generator.sh Inconsolata.otf migu-1m-bold.ttf migu-1m-regular.ttf
}

### Rictyフォントをシステムフォントとして登録する関数
ricty_install() {
  SYSTEM_FONTS_DIR=/Library/Fonts
  sudo cp Ricty*.ttf $SYSTEM_FONTS_DIR
}

### 必要なパッケージをインストールする
brew install fontforge

### 作業ディレクトリを作成する
WORK_DIR=~/.gen-ricty-3.2.2
test -d ${WORK_DIR} && error "作業ディレクトリが存在します。"
mkdir -p ${WORK_DIR}

### Rictyフォントを自動生成するスクリプトをダウンロードする
cd ${WORK_DIR}
git clone https://github.com/seak0503/Ricty.git
cd Ricty

### フォント生成とインストール用の関数呼び出し
ricty_gen; ricty_install
echo "ricty install success!"
exit 0
