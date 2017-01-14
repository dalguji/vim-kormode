Kormode.vim
===========

**No windows support for now**

When you press Korean key in normal mode this script will change your system layout and repeat same key press in appropriate language.

Settings:

Set layout to switch to. Defaults to 'U.S.'.
```vimscript
let g:kormode_normal_layout='U.S.'
```
You can find out the name of layout by switching on it and running changeInput binary in plugin directory.

Automatically toggle to normal layout on leaving the insert mode. Defaults to 0.
```vimscript
let g:kormode_autotoggle_insertleave=1
```

Install
=======

Install with Vundle or Pathogen.

**Linux users** need to provide correct commands to get and set current layout:
```vimscript
let g:kormode_get_layout_command = 'setxkbmap -print | grep xkb_symbols | awk \'{split($0,arr,"+")} END{print arr[2]}\''
let g:kormode_set_layout_command = 'setxkbmap -option "grp:ctrl_shift_toggle,grp_led:scroll" -layout "us,ru"'
let g:kormode_normal_layout='us'
```
The following was tested under Ubuntu 12.10
