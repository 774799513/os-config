"去掉vi的一致性"
set nocompatible
"显示行号"
set number
" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Monaco:h13         
syntax on   "开启语法高亮"
let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
set background=dark     "设置背景色"
"colorscheme darkblue
"set nowrap "设置不折行""
set fileformat=unix "设置以unix的格式保存文件"
set cindent     "设置C样式的缩进格式"
set tabstop=4   "设置table长度"
set shiftwidth=4        "同上"
set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
"set cursorcolumn        "突出显示当前列"
set wildmenu "vim命令自动补全"
set path=~/P




filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'luochen1990/rainbow'
"Plugin 'dense-analysis/ale'
Plugin 'majustsushi/tagbar'
call vundle#end()
filetype plugin indent on  

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}
"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1
"F8代码风格化
map <F8> :Autopep8<CR>
"设置leader
let mapleader=','
"F4添加注释
map <F4> <leader>ci<CR>
"F10退出
map <F10> ZZ <CR>
"<F3>开启tagbar
map <F3> :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_sort = 0
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1


"添加头部信息
autocmd BufNewFile *.py call SetTitle()
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
		call setline(1,"#import tensorflow as tf") 
		call append(line("."), "import numpy as np") 
		call append(line(".")+1, "#import pandas as pd") 
		call append(line(".")+2, "#import networkx as nx") 
		call append(line(".")+3, "#import matplotlib") 
		call append(line(".")+4, "#import matplotlib.pyplot as plt") 
		call append(line(".")+5, "#from mpl_toolkits.mplot3d import Axes3D") 
		call append(line(".")+6, "from pathlib import Path") 
		call append(line(".")+7, "#import random,math,sympy") 
		call append(line(".")+8, "#import re")
		call append(line(".")+9, "#from turtle import *")
		call append(line(".")+10, "#import time,datetime")
		call append(line(".")+11, "#import argparse")
		call append(line(".")+12, "#import logging") 
		call append(line(".")+13, "#logger = logging.getLogger()") 
		call append(line(".")+14, "#logger.setLevel(logging.INFO)") 
		call append(line(".")+15, "#logging.info('')")	
		call append(line(".")+16, "#model.summary")	
		call append(line(".")+17, "#keras.utils.plot_model(model,'model.png')")	
		call append(line(".")+18, "#keras.utils.plot_model(model,'model_info.png',show_shapes=True)")	
		call append(line(".")+19, "#from tensorflow import keras")	
		call append(line(".")+20, "#from tensorflow.keras import layers")	
		call append(line(".")+21, "#from sqlalchemy import create_engine")	
		call append(line(".")+22, "#from sqlinfo import DB_URI")	
		call append(line(".")+23, "p = Path('.')")	
		call append(line(".")+24, "#enumerate")	
		normal G
		normal o
		normal o
endfunc
"改建
nmap ll 0
nmap lr $
nmap <space> <c-d>
nmap <c-a> <c-w>

autocmd BufNewFile *.sh call SetTitle2()
""定义函数SetTitle，自动插入文件头 
func SetTitle2() 
		call setline(1,'#!/bin/bash')
		normal G
		normal o
endfunc

"set foldmethod=indent
"
"打开链接
function! OpenUrl() 
    let s:url = GetPatternAtCursor('\v(https?://|ftp://|file:/{3}|www\.)((\w|-)+\.)+(\w|-)+(:\d+)?(/(\w|[~@#$%^&+=/.?-])+)?') 
    "echo s:url 
    if s:url == "" 
        echohl WarningMsg 
        echomsg '在光标处未发现URL！' 
        echohl None 
    else 
        if GetSystem() == "windows" 
            call system("explorer " . s:url) 
        else 
            call system("firefox " . s:url . " &") 
        endif 
    endif 
    unlet s:url 
endfunction 
nmap <C-LeftMouse> :call OpenUrl()<CR> 
