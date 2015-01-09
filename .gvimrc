" 启用pathogen
call pathogen#infect()

"""""“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”
"               基本配置                    "
"""""""""""""""""""""""""""""""""""""""""""""
" 设置主题
colorscheme darkblue
" 开启语法高亮
syntax on
" 忽略输入错误的警告声
set noeb
" 按照文件类型自动缩进
set ts=4
set sw=4
filetype indent plugin on
" 搜索相关 忽略大小写 高亮
set ignorecase
set hlsearch
set incsearch
" 显示当前行号列号
set ruler
" 左侧显示行号
set number	
" 按F2显示/隐藏左侧行号显示
nnoremap <F2> : set nonumber!<CR>:set foldcolumn=0<CR>
"set background=dark

"自动补全
set completeopt+=longest
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
"上下左右选择补全
inoremap<expr><CR> pumvisible() ? "\<C-y>":"\<CR>"
inoremap<expr><Down> pumvisible() ? "\<C-n>":"\<Down>"
inoremap<expr><Up> pumvisible() ? "\<C-p>":"\<Up>"
inoremap<expr><PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>":"\<PageDown>"
inoremap<expr><PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>":"\<PageUp>"

" for nerocommentor
let g:mapleader=","

" 共享剪贴板
set clipboard+=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"					方便编译								"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileAbout()<CR>
func! CompileAbout()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"		            	python相关设置			     		"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将python tab改为四个空格
autocmd FileType python setlocal et sta sw=4 sts=4
" 以缩进为折叠依据
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

""" vim-flack8 设置
" 禁止PyFlakes使用QuickFix,这样在按下<F7>时会调用flack8 在代码编辑时仍有效
let g:pyflackes_use_quickfix=0
" 忽略部分错误
let g:flack8_ignore="E501"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						taglist设置							"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Auto_Open=1 " 自动打开taglist
let Tlist_Show_One_File=1 " 不同时显示多个文件的tag 只显示当前文件的
let Tlist_Exit_OnlyWindow=1 " 如果taglist窗口是最后一个窗口 则退出vim
let Tlist_Use_Right_Window=1 " 在右侧窗口显示taglist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						ctags								"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定Ctags路径
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" 自动加载当前目录tags文件
if has("ctags")
	if filereadable("tags")
		set tags=tags
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 						cscope								"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap ff :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap fi :cs find i <C-R>=expand("<cword>")<CR><CR>
nnoremap fd :cs find d <C-R>=expand("<cword>")<CR><CR>
" 自动加载当前目录下的cscope.out
if has("cscope")
	if filereadable("cscope.out")
		cs add ./cscope.out
	endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						winmanager设置						"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='BufExplorer|FileExplorer'
nmap wm : WMToggle<CR> " 打开winmanager的按键wm
let g:winManagerWidth = 35 " winmanager宽度 默认为25

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							插件A							"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap jp :A<CR>

" 关于中文显示
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
