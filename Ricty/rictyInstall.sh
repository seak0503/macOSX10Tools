#!/bin/sh

### RictyフォントをMAC(yosemite)にインストールするスクリプトです。
### brewがインストールされていることが前提です。

brew install automake
brew install pkg-config

brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty

cp -f /usr/local/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
