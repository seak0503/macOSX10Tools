# .profileにalias	を設定し、sublime textに設定したキーバインドをlessします。

### 変数定義
comment="# sublime textに設定したキーバインドを見る"
alias_set="alias sublkey='less ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap'"

### .profileに設定を追加する
echo "" >> ~/.profile
echo $comment >> ~/.profile
echo $alias_set >> ~/.profile

source ~/.profile