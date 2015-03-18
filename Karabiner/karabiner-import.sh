#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.pc_style_copy_paste 1
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
$cli set remap.jis_yen2backslash 1
/bin/echo -n .
/bin/echo
