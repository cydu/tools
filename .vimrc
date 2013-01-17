set tags+=./tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags
set tags+=../../../../tags
set tags+=../../../../../tags

"Switch on syntax highlighting.
syntax enable
syntax on
filetype plugin on          " 自动识别文件类型，自动匹配对应的

" Setting TList => Tag List
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nmap tl :Tlist<cr>

" Setting winmanager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

" Setting minibufexpl && bufexplorer
let g:miniBufExplModSelTarget = 1
nmap be \be 
nmap mb \mb 

"grep config 
let Grep_Default_Filelist = '*.c *.cpp *.h Makefile'
let Grep_Skip_Dirs = 'CVS output prototype *bak *old'
let Grep_Skip_Files = '*.bak *~ *.o tags .svn'
let Grep_OpenQuickfixWindow = 1 
nmap gr :Grep -r <CR>
nmap bgr :Bgrep -r <CR>
nmap egr :Regrep <CR>

" If we have enabled control + vim direction key remapping
" then perform the remapping
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l
"
" If we have enabled control + arrow key remapping
" then perform the remapping
"
  noremap <C-Down>  <C-W>j
  noremap <C-Up>    <C-W>k
  noremap <C-Left>  <C-W>h
  noremap <C-Right> <C-W>l

" 设置自动补齐 函数折叠
filetype plugin indent on
set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码

colorscheme desert

" 编码相关设置
set langmenu=en_US.UTF-8
set encoding=utf-8
set termencoding=utf8
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936
set ambiwidth=double
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages en_US.UTF-8
 
set confirm                 " 用确认对话框（对于 gvim）或命令行选项（对于
                            " vim）来代替有未保存内容时的警告信息
set display=lastline        " 长行不能完全显示时显示当前屏幕能显示的部分。
                            " 默认值为空，长行不能完全显示时显示 @。
set formatoptions=tcqro     " 使得注释换行时自动加上前导的空格和星号
set hidden                  " 允许在有未保存的修改时切换缓冲区，
                            " 此时的修改由切换由 vim 负责保存
set history=1000              " 设置冒号命令和搜索命令的命令历史列表的长度为 100
set hlsearch                " 搜索时高亮显示被找到的文本
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时
                            " 仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果
set mouse=a                 " 设定在任何模式下鼠标都可用
set nocompatible            " 设定 gvim 运行在增强模式下
set noignorecase            " 默认区分大小写
set nolinebreak             " 在单词中间断行
set number                  " 显示行号
set ruler                   " 打开状态栏标尺
set scrolloff=5             " 设定光标离窗口上下边界 5 行时窗口自动滚动
set showcmd                 " 在状态栏显示目前所执行的指令，未完成的指令片段亦
                            " 会显示出来
set whichwrap=b,s,<,>,[,]   " 设定退格键、空格键以及左右方向键在行首行尾时的
                            " 行为，不影响 h 和 l 键
set nowrap                  " 自动换行显示
set sm                      " showmatch 显示括号匹配
"set paste                   " 设置粘贴模式


set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoindent cindent cinoptions=g0
                            " 打开自动缩进和 C 语言风格的缩进模式，
                            " 定制 C 语言缩进风格
set backspace=indent,eol,start
                            " 不设定的话在插入状态无法用退格键和 Delete
                            " 键删除回车符
set backupcopy=yes          " 设置备份时的行为为覆盖
set backup
set backupdir=~/.vim/backup
set lbr                     " linebreak 屏幕折行
set cin                     " cindent C语言indent模式
set fo+=mB                  " formatoptions 设置文档格式

"Markdown language syntax settings
augroup mkd
    autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

""""""""""""""""""""""""""""""
" vimgdb setting
""""""""""""""""""""""""""""""""
let g:vimgdb_can_loaded=1
let g:vimgdb_debug_file = ""

function! <SID>StartVIMGDB()
    if g:vimgdb_can_loaded
        let g:vimgdb_can_loaded= 0
        run macros/gdb_mappings.vim
    else 
        echo "the gdb is running...."
    endif
endfunction

nmap  db :call <SID>StartVIMGDB()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置命令行和状态栏

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r\ %{&fileformat}\ %{&fileencoding}\ \ \ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\]
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %{&fileencoding}
                            "       中文编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"

let g:solarized_termcolors=256
set guifont=Monaco:h20
set gfn=Monaco:h20

filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

autocmd FileType python setlocal et sta sw=4 sts=4
