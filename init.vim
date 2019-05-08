" setting dein
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# 'dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim', s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_lazy_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file)
    call dein#load_toml(s:toml_lazy_file, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
" ----setting init.vim -----"
syntax enable
colorscheme gotham256
set completeopt=menuone
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set hidden
set nowrap
set incsearch
set number
set showmatch
set smarttab
set whichwrap=b,s,<,>,[,]
set laststatus=2
set nobackup
set noswapfile
set background=dark
set wildoptions=pum
filetype plugin indent on

if has('mouse')
    set mouse=a
endif

if &compatible
    set nocompatible
endif

"shellの設定"
set sh=zsh

"shellのキーバインド設定"
tnoremap <silent> <ESC> <C-\><C-n>

"言語別にインデントを分ける"
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"goのsyntax強化
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

augroup END

"setting keymap
command! -nargs=* T split | terminal <args>

"スペース + tでターミナル起動"
let mapleader = "\<Space>"

nnoremap <Leader>t :T<CR>

nnoremap <leader>f :Denite file/rec<CR>

"スペース + v で垂直分割"
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>s :split<CR>

"ウインドウ移動ショートカットをswに当てる"
nnoremap sw <C-w>w

"Defxコマンドをスペース+dに当てる"
nnoremap <Leader>d :Defx<CR>