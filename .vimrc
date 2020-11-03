
" ---------------------------------------------------------------------
" 插件管理插件开始
call plug#begin('~/.vim/plugged')

" 快速对其 
Plug 'junegunn/vim-easy-align'

" 目录插件
Plug 'preservim/nerdtree'

" 安装主题
Plug 'dracula/vim', { 'as': 'dracula' }

" menu 插件
Plug 'skywind3000/vim-quickui'

" 文件format插件
Plug 'sbdchd/neoformat'

" 自动保存插件
Plug '907th/vim-auto-save'

" outline
Plug 'liuchengxu/vista.vim'

" 提示命令
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']  }

" 底部状态增强/美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 括号补全
Plug 'jiangmiao/auto-pairs'

" 文件模糊查找
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" 注释插件
Plug 'preservim/nerdcommenter'

" 安装自动补全
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

" start up page
Plug 'mhinz/vim-startify'

" 插件管理插件结束
call plug#end()

" ---------------------------------------------------------------------
" 进入就开启目录
autocmd vimenter * NERDTree
" NERDTree 
map <F10> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ---------------------------------------------------------------------
" neroformat
map <A-f> :Neoformat

" ---------------------------------------------------------------------
" 开启dracula主题
syntax enable
colorscheme dracula

" ---------------------------------------------------------------------
" vim-airline-themes主题插件配置
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:airline_theme='moloai'  " murmur配色不错

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" ---------------------------------------------------------------------
" 注释插件配置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**' , 'right': '*/' }} 

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ---------------------------------------------------------------------
" 设置自动补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" 设置目录自动补全
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" 设置python自动补全
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" 设置bash自动补全
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'whitelist': ['sh'],
        \ })
endif

" ---------------------------------------------------------------------
" 设置行号
set number
" 自动保存
set autowriteall
let g:auto_save = 3
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]

