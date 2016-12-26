# .zschrcにSublimeText用のaliasを設定

### キーバインド確認用のalias設定
comment="# SublimeTextに設定したキーバインドを見る"
alias_set="alias sublkey='less ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap'"
echo "" >> ~/.zshrc
echo $comment >> ~/.zshrc
echo $alias_set >> ~/.zshrc

### SublimeTextの設定ファイルがあるディレクトリへの移動用alias設定
comment="# SublimeTextの設定ファイルに移動する"
alias_set="alias cdSublime='cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User'"
echo "" >> ~/.zshrc
echo $comment >> ~/.zshrc
echo $alias_set >> ~/.zshrc

source ~/.zshrc
