set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'funorpain/vim-cpplint'
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'sprsquish/thrift.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'uarun/vim-protobuf'
Plugin 'winmanager'
Bundle 'mileszs/ack.vim'
Plugin 'grep.vim'
Plugin 'Valloric/YouCompleteMe'

" Plugin 'bufexplorer.zip'
" Plugin 'fholgado/minibufexpl.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

set bg=dark
set ruler
set cindent
set nocompatible
set tags=tags;
set ts=2
set sw=2
set bs=2
set et
set hlsearch
set encoding=utf-8
" set term=xterm-256color
set foldmethod=syntax
set foldlevel=100 

syntax on

" vim-airline 
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'powerlineish'

" vimshell
let g:vimshell_prompt = 'vimshell $ '
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
nmap sh :set noautochdir<cr>:VimShell<cr>

syntax on

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Quick Hotkey
nmap sp :set paste<cr>
nmap sn :set nopaste<cr>
nmap sw :set wrap<cr>
nmap md :!kmd % > %".html"<cr>
nmap bl :buffers<cr>
nmap ls :Unite -start-insert file_rec/async:!<CR>

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
nmap gd :YcmCompleter GoTo<CR>
nmap <F7> :make<CR>:copen<CR><C-W><C-P>
nmap <F8> :call Cpplint()<CR>

" Grep
set grepprg=ack
let Grep_Default_Filelist = '*.c *.cc *.cpp *.h Makefile *'
let Grep_Skip_Dirs = 'CVS output prototype *bak *old .svn .git'
let Grep_Skip_Files = '*.bak *~ *.o tags .svn'
let Grep_OpenQuickfixWindow = 1 
let Grep_Path = 'ack'
nmap gr :Grep -r <CR>

" Setting minibufexpl && bufexplorer-zip
let g:miniBufExplModSelTarget = 1
nmap be \be 
nmap bv \bv 
nmap bs \bs 

" Create backup file when editing
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Setting winmanager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>
" If we have enabled control + vim direction key remapping then perform the remapping
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l

" If we have enabled control + arrow key remapping then perform the remapping
  noremap <C-Down>  <C-W>j
  noremap <C-Up>    <C-W>k
  noremap <C-Left>  <C-W>h
  noremap <C-Right> <C-W>l

set confirm                 " 用确认对话框（对于 gvim）或命令行选项（对于vim）来代替有未保存内容时的警告信息
set display=lastline        " 长行不能完全显示时显示当前屏幕能显示的部分. 默认值为空，长行不能完全显示时显示 @。
set formatoptions=tcqro     " 使得注释换行时自动加上前导的空格和星号
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由切换由 vim 负责保存
set history=1000              " 设置冒号命令和搜索命令的命令历史列表的长度为 100
set hlsearch                " 搜索时高亮显示被找到的文本
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时
                            " 仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果
set mouse=a                 " 设定在任何模式下鼠标都可用
set noignorecase            " 默认区分大小写
set nolinebreak             " 在单词中间断行
set number                  " 显示行号
set scrolloff=5             " 设定光标离窗口上下边界 5 行时窗口自动滚动
set showcmd                 " 在状态栏显示目前所执行的指令，未完成的指令片段亦会显示出来
set whichwrap=b,s,<,>,[,]   " 设定退格键、空格键以及左右方向键在行首行尾时的行为，不影响 h 和 l 键
set wrap                    " 自动换行显示
set sm                      " showmatch 显示括号匹配
set autoindent cindent cinoptions=g0
                            " 打开自动缩进和 C 语言风格的缩进模式，定制 C 语言缩进风格
set backspace=indent,eol,start
                            " 不设定的话在插入状态无法用退格键和 Delete 键删除回车符
set lbr                     " linebreak 屏幕折行
set cin                     " cindent C语言indent模式
set fo+=mB                  " formatoptions 设置文档格式

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set statusline=%F%m%r\ %{&fileformat}\ %{&fileencoding}\ \ \ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\]

set autochdir               " 自动切换当前目录为当前文件所在的目录

set guifont=Monaco:h20
set gfn=Monaco:h20
