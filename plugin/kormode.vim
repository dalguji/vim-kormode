" Maintainer: Arseny Zarechnev <cyanidesign@gmail.com>
" Version: 0.3.1
" Last Modified: Apr 3, 2013
" License: Public domain.
" Url: http://www.vim.org/scripts/script.php?script_id=4493
" Description: Bind pressing Korean key in normal mode to toggle layout and
" repeat same key.

if exists('g:loaded_kormode') || &cp || version < 700
    finish
endif
let g:loaded_kormode = 1
let s:is_mac = substitute(system('uname'), "\n", "", "") ==? 'Darwin'

" Check if system is not MacOS
if !s:is_mac
    " Must have commands for get and set layout
    if !exists('g:kormode_get_layout_command')
        finish
    endif

    if !exists('g:kormode_set_layout_command')
        finish
    endif
endif

if s:is_mac
    let s:current_dir = expand("<sfile>:p:h")
    let g:kormode_get_layout_command = s:current_dir . '/../changeInput'
    let g:kormode_set_layout_command = g:kormode_get_layout_command
endif

if !exists('g:kormode_normal_layout')
    let g:kormode_normal_layout = 'U.S.'
endif


if !exists('g:kormode_autotoggle_insertleave')
    let g:kormode_autotoggle_insertleave = 0
endif

function s:ChangeLayout(key)
    let l:current_layout = substitute(system(g:kormode_get_layout_command), "\n", "", "")
    if l:current_layout ==? g:kormode_normal_layout
        if a:key ==? '/'
            return '.'
        elseif a:key ==? '?'
            return ','
        else
            return a:key
        endif
    endif
    call system(g:kormode_set_layout_command . ' ' . g:kormode_normal_layout)
    return a:key
endfunction

if g:kormode_autotoggle_insertleave
    autocmd InsertLeave * call s:ChangeLayout("\<ESC>")
endif

nmap <expr> <unique> ㅂ <SID>ChangeLayout('q')
nmap <expr> <unique> ㅈ <SID>ChangeLayout('w')
nmap <expr> <unique> ㄷ <SID>ChangeLayout('e')
nmap <expr> <unique> ㄱ <SID>ChangeLayout('r')
nmap <expr> <unique> ㅅ <SID>ChangeLayout('t')
nmap <expr> <unique> ㅛ <SID>ChangeLayout('y')
nmap <expr> <unique> ㅕ <SID>ChangeLayout('u')
nmap <expr> <unique> ㅑ <SID>ChangeLayout('i')
nmap <expr> <unique> ㅐ <SID>ChangeLayout('o')
nmap <expr> <unique> ㅔ <SID>ChangeLayout('p')
nmap <expr> <unique> ㅁ <SID>ChangeLayout('a')
nmap <expr> <unique> ㄴ <SID>ChangeLayout('s')
nmap <expr> <unique> ㅇ <SID>ChangeLayout('d')
nmap <expr> <unique> ㄹ <SID>ChangeLayout('f')
nmap <expr> <unique> ㅎ <SID>ChangeLayout('g')
nmap <expr> <unique> ㅗ <SID>ChangeLayout('h')
nmap <expr> <unique> ㅓ <SID>ChangeLayout('j')
nmap <expr> <unique> ㅏ <SID>ChangeLayout('k')
nmap <expr> <unique> ㅣ <SID>ChangeLayout('l')
nmap <expr> <unique> ㅋ <SID>ChangeLayout('z')
nmap <expr> <unique> ㅌ <SID>ChangeLayout('x')
nmap <expr> <unique> ㅊ <SID>ChangeLayout('c')
nmap <expr> <unique> ㅍ <SID>ChangeLayout('v')
nmap <expr> <unique> ㅠ <SID>ChangeLayout('b')
nmap <expr> <unique> ㅜ <SID>ChangeLayout('n')
nmap <expr> <unique> ㅡ <SID>ChangeLayout('m')
nmap <expr> <unique> ㅃ <SID>ChangeLayout('Q')
nmap <expr> <unique> ㅉ <SID>ChangeLayout('W')
nmap <expr> <unique> ㄸ <SID>ChangeLayout('E')
nmap <expr> <unique> ㄲ <SID>ChangeLayout('R')
nmap <expr> <unique> ㅆ <SID>ChangeLayout('T')
" nmap <expr> <unique> ㅛ <SID>ChangeLayout('Y')
" nmap <expr> <unique> ㅕ <SID>ChangeLayout('U')
" nmap <expr> <unique> ㅑ <SID>ChangeLayout('I')
nmap <expr> <unique> ㅒ <SID>ChangeLayout('O')
nmap <expr> <unique> ㅖ <SID>ChangeLayout('P')
" nmap <expr> <unique> ㅁ <SID>ChangeLayout('A')
" nmap <expr> <unique> ㄴ <SID>ChangeLayout('S')
" nmap <expr> <unique> ㅇ <SID>ChangeLayout('D')
" nmap <expr> <unique> ㄹ <SID>ChangeLayout('F')
" nmap <expr> <unique> ㅎ <SID>ChangeLayout('G')
" nmap <expr> <unique> ㅗ <SID>ChangeLayout('H')
" nmap <expr> <unique> ㅓ <SID>ChangeLayout('J')
" nmap <expr> <unique> ㅏ <SID>ChangeLayout('K')
" nmap <expr> <unique> ㅣ <SID>ChangeLayout('L')
" nmap <expr> <unique> ㅋ <SID>ChangeLayout('Z')
" nmap <expr> <unique> ㅌ <SID>ChangeLayout('X')
" nmap <expr> <unique> ㅊ <SID>ChangeLayout('C')
" nmap <expr> <unique> ㅍ <SID>ChangeLayout('V')
" nmap <expr> <unique> ㅠ <SID>ChangeLayout('B')
" nmap <expr> <unique> ㅜ <SID>ChangeLayout('N')
" nmap <expr> <unique> ㅡ <SID>ChangeLayout('M')
